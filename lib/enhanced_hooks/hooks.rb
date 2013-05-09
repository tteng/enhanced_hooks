require "pp"
require 'benchmark'

module EnhancedHooks 

  module Hooks
    
    EVENTS_DIR = "events"
    
    def self.included(base)
      class_eval <<-EOF 
        @@reporter_events = Array.new
      EOF
      base.class_eval <<-BCE 
        around_filter :reporter_around_filter
      BCE
    end
    
    protected
    
    def reporter_around_filter
      
      events_load_bm = Benchmark.measure do
        load_events if @@reporter_events.empty?
      end
      
      events = @@reporter_events.select {|e| e.match_event?(self.class, action_name)}
    
      # Calling all before actions for this controler and action
      events.each { |event| event.call_before(self) }
    
      # Calling original action
      yield
      
      # Calling all after actions for this controler and action
      events.each { |event| event.call_after(self) }
    end
    
    def for_action(controller, action, &block)
      @@reporter_events << EventMeta.new(controller, action, &block)
    end
    
    def for_actions(actions_array, &block)
      actions_array.each do |item|
        @@reporter_events << EventMeta.new(item[0], item[1], &block)
      end
    end
    
    def turn_off_for_action(controller, action, &block)
      for_action(controller, action, &block) if test?
    end
    
    def load_events
      return if test?
      Dir["#{Rails.root + EVENTS_DIR}/**/*event.rb"].collect do |file|
        load_event(file)
      end
    end
    
    def load_event(file)
      clear_events if test?
      code = File.new(file).readlines.join('')
      begin
        instance_eval code, __FILE__, __LINE__
      rescue => e
        logger.warn "FAILED!"
        logger.warn e.backtrace
      end
    end
    
    def clear_events
      @@reporter_events.clear
    end
    
    def reporter_events
      @@reporter_events
    end
    
    def test?
      ENV["RAILS_ENV"] == "test"
    end
    
    class EventMeta
    
      def initialize(controller_class, name, &block)
        @controller_class = controller_class
        @action = name
        self.instance_eval(&block)
      end
    
      def call_before(controller_instance)
        controller_instance.instance_eval(&@before) if @before
      end
      
      def call_after(controller_instance)
        controller_instance.instance_eval(&@after) if @after
      end
    
      def match_event?(clazz, action_name)
        @controller_class == clazz && @action.to_s == action_name.to_s
      end
      private
      
      def before(&block)
        @before = block
      end
    
      def after(&block)
        @after = block
      end
    
    end

  end
    
end

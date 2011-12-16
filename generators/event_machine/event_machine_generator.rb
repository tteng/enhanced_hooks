#coding: utf-8
require 'fileutils'

class EventMachineGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)

  argument :this_event_name, :type => :string
  argument :controller_name, :type => :string
  argument :action_name, :type => :string

  def generate_event
    template "event.rb", "events/#{parsed_event_name}_event.rb"
    template "functional_test.rb", "test/functional/events/#{parsed_event_name}_test.rb"
  end

  private

  def parsed_event_name
    this_event_name.underscore
  end

  def parsed_controller_name
    controller_name.camelize
  end

  def parsed_action_name 
    action_name.underscore
  end

end

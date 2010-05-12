class EventMachineGenerator < Rails::Generator::NamedBase

  def initialize(runtime_args, runtime_options = {})
    super
    @event_name = runtime_args.shift
    @controller_name = runtime_args.shift
    @controller_action = runtime_args.shift
    unless valid_options?
      puts "Invalid arguments!"
      puts banner
      exit
    end
  end

  def manifest
    record do |m|
      m.directory "app/events"
      m.directory "test/functional/events"
      m.template "event.rb",
        File.join('app/events', "#{@event_name}Event".underscore + ".rb"),
        :assigns => { :controller => @controller_name, :action => @controller_action }

      m.template "functional_test.rb",
        File.join('test/functional/events', "#{@event_name}Event".underscore + "_test.rb"),
          :assigns => { :controller => @controller_name,
                        :action => @controller_action,
                        :event => "#{@event_name}Event"
                      }
    end
  end

  def banner
    "Usage: #{$0} event EventName Controller Action"
    "Example: #{$0} event media_rated Admin::ContentController rate"
  end

  private

  def valid_options?
    [@event_name, @controller_name, @controller_action].all? { |v| !v.blank? }
  end

end

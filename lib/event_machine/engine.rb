module EventMachine
  class Engine < Rails::Engine

    initializer "event_machine.load_app_instance_data" do |app|
      EventMachine.setup do |config|
        config.app_root = app.root
      end
    end

    #initialize "event_machine.load_static_assets" do |app| 
    #  app.middleware.use ::ActionDispatc::Static, "#{root}/public"
    #end

    initializer "event_machine.application" do
      ActiveSupport.on_load :action_controller do
        include EventMachine::Hooks
      end
    end
   
  end
end

module EnhancedHooks
  class Engine < Rails::Engine

    initializer "enhanced_hooks.load_app_instance_data" do |app|
      EnhancedHooks.setup do |config|
        config.app_root = app.root
      end
    end

    #initialize "enhanced_hooks.load_static_assets" do |app| 
    #  app.middleware.use ::ActionDispatc::Static, "#{root}/public"
    #end

    initializer "enhanced_hooks.application" do
      ActiveSupport.on_load :action_controller do
        include EnhancedHooks::Hooks
      end
    end
   
  end
end

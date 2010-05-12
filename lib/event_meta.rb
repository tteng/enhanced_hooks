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
 

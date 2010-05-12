require File.dirname(__FILE__) + '/../../test_helper'
require File.dirname(__FILE__) + '/../../functional/events/events_base_test'
require '<%= controller.underscore -%>'

# Re-raise errors caught by the controller.
class <%= controller.classify -%>; def rescue_action(e) raise e end; end

class <%= event.classify -%>Test < EventBaseTest
  
  fixtures :users
  
  def setup
    @controller = <%= controller.classify -%>.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    
    prepare
    load_event "#{EVENTS_DIR}/<%= event.underscore -%>.rb"
    emulate_login
  end
  
  # Put actual tests here
  def test_true
    assert true
  end

end

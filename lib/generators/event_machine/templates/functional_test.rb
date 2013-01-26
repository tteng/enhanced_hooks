require File.dirname(__FILE__) + '/../../test_helper'
require File.dirname(__FILE__) + '/../../functional/events/events_base_test'
require '<%= parsed_controller_name.underscore -%>_controller'

# Re-raise errors caught by the controller.
class <%= parsed_controller_name -%>; def rescue_action(e) raise e end; end

class <%= parsed_event_name.camelize -%>Test < EventBaseTest
  
  fixtures :users
  
  def setup
    @controller = <%= parsed_controller_name.camelize-%>.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    
    prepare
    load_event "app/events/<%= parsed_event_name-%>_event.rb"
    emulate_login
  end
  
  # Put actual tests here
  def test_true
    assert true
  end

end

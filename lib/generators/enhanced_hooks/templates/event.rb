for_action <%= parsed_controller_name %>Controller, :<%= action_name %> do
  
  before do
    # This will be called before <%= parsed_controller_name %>#<%= parsed_action_name %>
  end
  
  after do
    # This will be called after <%= parsed_controller_name %>#<%= parsed_action_name %>
  end
  
end

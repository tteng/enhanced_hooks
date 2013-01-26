require "event_machine/version"
require "active_support/dependencies"

module EventMachine
  mattr_accessor :app_root

  def self.setup
    yield self
  end
end

require "event_machine/engine"
require "event_machine/hooks"

require "enhanced_hooks/version"
require "active_support/dependencies"

module EnhancedHooks

  mattr_accessor :app_root

  def self.setup
    yield self
  end

end

require "enhanced_hooks/engine"
require "enhanced_hooks/hooks"

module Proverbs
  module Contexts
    def self.included(caller)
      caller.instance_eval do
        alias :Background :before
        alias :Setup      :before
        alias :Teardown   :after

        alias :Feature   :context
        alias :Ability   :context
        alias :Story     :context
        alias :Workflow  :context
        alias :Component :context
      end
    end
  end
end

def self.Feature(*args, &block)
  describe(*args, &block)
end

def self.Ability(*args, &block)
  describe(*args, &block)
end

def self.Story(*args, &block)
  describe(*args, &block)
end

def self.Component(*args, &block)
  describe(*args, &block)
end

def self.Workflow(*args, &block)
  describe(*args, &block)
end

RSpec.configuration.include Proverbs::Contexts

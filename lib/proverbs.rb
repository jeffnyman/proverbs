require "rspec/core"
require "rspec/core/world"
require "rspec/core/reporter"
require "rspec/core/formatters"
require "rspec/core/example_group"
require "rspec/core/formatters/console_codes"
require "rspec/core/formatters/documentation_formatter"

require "proverbs/version"
require "proverbs/contexts"
require "proverbs/rspec/world"
require "proverbs/rspec/reporter"
require "proverbs/rspec/notification"
require "proverbs/rspec/example_group"
require "proverbs/rspec/documentation_formatter"

RSpec::Core::ExampleGroup.send :include, RSpec::Proverbs::ExampleGroup
RSpec::Core::Reporter.send     :include, RSpec::Proverbs::Reporter
RSpec::Core::World.send        :include, RSpec::Proverbs::World

RSpec::Core::Formatters::DocumentationFormatter.send :include, RSpec::Proverbs::DocumentationFormatter

RSpec::Core::ExampleGroup.define_example_method :Scenario,  with_steps: true
RSpec::Core::ExampleGroup.define_example_method :Behavior,  with_steps: true

RSpec::Core::ExampleGroup.define_example_method :steps, with_steps: true
RSpec::Core::ExampleGroup.define_example_method :rules, with_steps: true
RSpec::Core::ExampleGroup.define_example_method :tests, with_steps: true
RSpec::Core::ExampleGroup.define_example_method :facts, with_steps: true

formatter = RSpec.world.reporter.find_registered_formatter(RSpec::Core::Formatters::DocumentationFormatter)

if formatter
  RSpec.world.reporter.register_listener(
    formatter,
    :example_started,
    :example_step_passed,
    :example_step_pending,
    :example_step_failed
  )
end

require "proverbs/rspec/shared_steps"
include RSpec::Proverbs::SharedSteps

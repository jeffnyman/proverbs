module RSpec
  module Proverbs
    module DocumentationFormatter
      # The documentation formatter of RSpec is one that prints out the
      # descriptive information for each example group.
      def self.included(caller)
        caller.class_eval do
          include InstanceMethods

          alias_method :example_started_without_steps, :example_started
          alias_method :example_started, :example_started_with_steps

          alias_method :example_passed_without_steps, :example_passed
          alias_method :example_passed, :example_passed_with_steps
        end
      end

      module InstanceMethods
        def example_started(notification); end

        def example_step_passed(notification)
          no_keyword_display = %w(specify example it rule fact step test)
          keyword = notification.type.to_s

          full_message = "#{current_indentation}  #{keyword.capitalize} #{notification.message}" unless no_keyword_display.include?(keyword)
          full_message = "#{current_indentation}  #{notification.message}" if no_keyword_display.include?(keyword)

          output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :success)
        end

        def example_step_failed(notification)
          no_keyword_display = %w(specify example it rule fact step test)
          keyword = notification.type.to_s

          full_message = "#{current_indentation}  #{keyword.capitalize} #{notification.message} (FAILED)" unless no_keyword_display.include?(keyword)
          full_message = "#{current_indentation}  #{notification.message} (FAILED)" if no_keyword_display.include?(keyword)

          output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :failure)
        end

        def example_step_pending(notification)
          no_keyword_display = %w(specify example it rule fact step test)
          keyword = notification.type.to_s

          full_message = "#{current_indentation}  #{keyword.capitalize} #{notification.message}" unless no_keyword_display.include?(keyword)
          full_message = "#{current_indentation}  #{notification.message}" if no_keyword_display.include?(keyword)

          pending_check = notification.options[:pending] && notification.options[:pending]

          full_message << " (PENDING: #{notification.options[:pending]})" unless pending_check
          full_message << ' (PENDING)' if pending_check

          output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :pending)
        end

        def example_started_with_steps(notification)
          example_started_without_steps(notification)

          return unless notification.example.metadata[:with_steps]
          full_message = "#{current_indentation}#{notification.example.description}"
          output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :default)
        end

        def example_passed_with_steps(notification)
          example_passed_without_steps(notification) unless notification.example.metadata[:with_steps]
        end
      end
    end
  end
end

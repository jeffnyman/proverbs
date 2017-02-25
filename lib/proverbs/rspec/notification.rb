module RSpec
  module Proverbs
    # In RSpec, notifications are value objects that are passed to formatters
    # to provide those formatters with information about a particular event.
    Notification = Struct.new(:example, :type, :message, :options)
  end
end

shared_steps "push steps" do
  Given "empty pipe" do
    pipe.clear
  end

  When "push data" do
    pipe.push "testing"
  end

  Then "pipe should have data" do
    expect(pipe.items).to eq(["testing"])
  end
end

shared_steps "pull steps" do
  When "pull data" do
    pipe.pull
  end

  Then "pipe should be empty" do
    expect(pipe.items).to eq([])
  end
end

shared_steps "push with arguments steps" do |value|
  When "push data" do
    pipe.push value
  end
end

Story 'duplicate shared steps' do
  it 'will raise an error' do
    expect {
      shared_steps 'duplicate' do
      end

      shared_steps 'duplicate' do
      end
    }.to raise_error ArgumentError
  end
end

Feature "shared steps" do
  let(:pipe) do
    Class.new do
      def initialize
        @values = []
      end

      def items
        @values
      end

      def clear
        @values = []
      end

      def push(value)
        @values << value
      end

      def pull
        @values.shift
      end
    end.new
  end

  Scenario "push and pull steps" do
    include_steps "push steps"
    include_steps "pull steps"
  end

  Scenario "push, count and pull" do
    include_steps "push steps"

    Then "pipe should have 1 item" do
      expect(pipe.items.size).to eq(1)
    end

    include_steps "pull steps"
  end

  Scenario "push with arguments and pull" do
    include_steps "push with arguments steps", "testing"

    expect(pipe.items).to eq(["testing"])

    include_steps "pull steps"
  end
end

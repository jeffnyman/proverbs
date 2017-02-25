describe "example steps" do
  describe "Given/When/Then" do
    Scenario "should execute blocks" do
      Given "thing" do
        @context = "Given value"
      end

      When "action" do
        @action = "When value"
      end

      Then "result" do
        @result = "Then value"
      end

      And "and" do
        @connector = "And value"
      end

      But "but" do
        @qualifier = "But value"
      end

      expect(@context).to eq("Given value")
      expect(@action).to eq("When value")
      expect(@result).to eq("Then value")
      expect(@connector).to eq("And value")
      expect(@qualifier).to eq("But value")
    end
  end

  describe "Scenario without blocks" do
    Scenario "they should be pending" do
      Given "step without block"
      Then "step without block"
      When "step without block"
    end
  end

  describe "Scenario with :pending option" do
    Scenario "they should be pending when pending: true" do
      Given "step with :pending option", pending: true do
        raise "Should not be evaluated"
      end

      When "step with :pending option", pending: true do
        raise "Should not be evaluated"
      end

      Then "step with :pending option", pending: true do
        raise "Should not be evaluated"
      end

      And "and step with :pending option", pending: true do
        raise "Should not be evaluated"
      end

      But "and step with :pending option", pending: true do
        raise "Should not be evaluated"
      end
    end

    Scenario "they should be pending when pending: STRING" do
      Given "step with :pending option", pending: "WIP" do
        raise "Should not be evaluated"
      end

      When "step with :pending option", pending: "POSTPONED" do
        raise "Should not be evaluated"
      end

      Then "step with :pending option", pending: "DELAYED" do
        raise "Should not be evaluated"
      end
    end

    Scenario "they should NOT be pending when pending: false" do
      Given "step with :pending option", pending: false do
      end

      When "step with :pending option", pending: false do
      end

      Then "step with :pending option", pending: false do
      end

      And "step with :pending option", pending: false do
      end

      But "step with :pending option", pending: false do
      end
    end
  end
end

Feature 'feature level' do
  Workflow 'workflow level' do
    Setup 'setup level' do
    end

    Background 'background level' do
    end

    Teardown 'teardown level' do
    end

    Scenario 'scenario level' do
      Given 'given level' do
      end

      When 'when level' do
      end

      Then 'then level' do
      end

      And 'and level' do
      end

      But 'but level' do
      end
    end

    Behavior 'behavior level' do
      it 'it level' do
      end

      specify 'specify level' do
      end

      example 'example level' do
      end
    end

    steps 'steps level' do
      step 'step level' do
      end
    end

    tests 'tests level' do
      test 'test level' do
      end
    end

    rules 'rules level' do
      rule 'rule level' do
      end
    end

    facts 'facts level' do
      fact 'fact level' do
      end
    end
  end
end

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
end

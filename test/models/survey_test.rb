require "test_helper"

class SurveyTest < ActiveSupport::TestCase
  setup { @survey = surveys(:heat_isolation) }

  test "#to_partial_path prefers a survey specific view over default partial" do
    assert_equal @survey.to_partial_path, "surveys/heat_isolation"
    assert_equal Survey.new(name: 'Lesbian Poetry').to_partial_path, "surveys/survey"
  end
end

require "test_helper"

class CustomFieldTest < ActiveSupport::TestCase
  test "normalizes choice values before storing them" do
    field = CustomField.new(name: "languages", variant: "multiple", choices: "English, French , Hebrew,", account: accounts(:acme))
    assert_equal "English,French,Hebrew", field.choices
  end

  test "persists choices" do
    field = custom_fields(:multiple)
    field.update!(choices: %w(italian french))

    assert_equal "italian,french", field.choices
  end
end

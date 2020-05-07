class Survey < ApplicationRecord
  include Accountable

  def render(surveyee:)
    Liquid::Template.parse(template).render(surveyee.attributes).html_safe
  end
end

class Survey < ApplicationRecord
  include Accountable, Partials

  def render(surveyee:, contact_form:, properties_form:)
    ApplicationController.renderer.render partial: to_partial_path, locals: {
      surveyee: surveyee, contact_form: contact_form, properties_form: properties_form
    }
  end
end

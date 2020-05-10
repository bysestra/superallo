class Survey < ApplicationRecord
  include Accountable

  def render(surveyee:, contact_form:, properties_form:)
    # Liquid::Template.register_tag("custom_field", Tags::CustomField)
    # Liquid::Template.parse(template).render(
    #   surveyee.attributes.merge({
    #     'account_gid'  => account.to_global_id.to_s,
    #     'surveyee_gid' => surveyee.to_global_id.to_s
    #   })
    # ).html_safe

    ApplicationController.renderer.render partial: to_partial_path, locals: {
      surveyee: surveyee, contact_form: contact_form, properties_form: properties_form
    }
  end

  def to_partial_path
    "surveys/#{name.parameterize.underscore}"
  end
end

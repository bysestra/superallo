module SurveysHelper
  def render_survey_field(name, builder, label)
    if field = Current.account.custom_fields.find_by(name: name)
      ApplicationController.renderer.render partial: "custom_fields/#{field.variant}", \
      locals: { field: field, label: label, form: builder }
    end
  end
end

class Survey
  class Tags::CustomField < Liquid::Tag
    def initialize(tag_name, field_name, tokens)
      super
      @field_name = field_name.strip
    end
    
    def render(context)
      account = GlobalID::Locator.locate(context["account_gid"])
      surveyee = GlobalID::Locator.locate(context["surveyee_gid"])
      field = account.custom_fields.find_by(name: @field_name)

      ApplicationController.renderer.render(partial: field, locals: { field: field, resource: surveyee })
    end
  end
end

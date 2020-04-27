module ApplicationHelper
  include Pagy::Frontend

  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def render_person_name(person, skip_title: true)
    render person.name.to_partial_path, person: person, skip_title: skip_title
  end
end

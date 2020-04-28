module PeopleHelper
  def render_person_name(person, skip_title: true)
    if person.first_name.present?
      render person.name.to_partial_path, person: person, skip_title: skip_title
    end
  end
end

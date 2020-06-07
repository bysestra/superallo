module CallsHelper
  def last_contact_call_date(contact, blank: '—')
    call = contact.calls.order(created_at: :asc).last
    call.presence ? call.created_at.to_date.to_s(:long) : blank
  end

  def event_to_sentence(event)
    string = case event
      when Call then t(".called", creator: event_creator_name(event), callee: event.callee.name.full)
      when Comment then t(".commented", creator: event_creator_name(event), commentable: event.commentable.name.full)
      else ''
    end

    string.html_safe
  end

  def event_creator_name(event)
    Current.user == event.creator ? t(".you") : event.creator.name.familiar
  end

  def follow_up_color(date)
    return 'primary' unless date
    return 'danger' if date.past?
    return 'success' if date.future?

    'primary'
  end
end

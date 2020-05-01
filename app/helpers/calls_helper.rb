module CallsHelper
  def last_contact_call_date(contact, blank: '—')
    call = contact.calls.order(created_at: :asc).last
    call.presence ? call.created_at.to_date.to_s(:long) : blank
  end

  def event_to_sentence(event)
    string = case event
      when Call then "#{event.creator.name.familiar} <strong>called</strong> #{event.callee.name.full}"
      when Comment then "#{event.creator.name.familiar} <strong>commented</strong> about #{event.commentable.name.full}"
      else ''
    end

    string.html_safe
  end
end

module CallsHelper
  def last_contact_call_date(contact, blank: '—')
    call = contact.calls.order(created_at: :asc).last
    call.presence ? call.created_at.to_date.to_s(:long) : blank
  end

  def event_to_sentence(event)
    string = case event
      when Call then "#{event.creator.name.familiar} #{link_to("called #{event.callee.name.full}", event)}"
      when Comment then "#{event.creator.name.familiar} #{link_to("commented about #{event.commentable.name.full}", event)}"
      else ''
    end

    string.html_safe
  end
end

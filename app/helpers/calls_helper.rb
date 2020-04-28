module CallsHelper
  def last_contact_call_date(contact, blank: '—')
    call = contact.calls.order(created_at: :asc).last
    call.presence ? call.created_at.to_date.to_s(:long) : blank
  end

  def call_to_sentence(call)
    "#{call.creator.name.familiar} #{link_to("called #{call.callee.name.full}", call)}".html_safe
  end
end

module ContactsHelper
  def contacts_index_heading(params)
    params.fetch(:q, false).presence ? t(".results_for", q: params[:q].html_safe) : t(".all_contacts")
  end

  def any_follow_ups_today?
    Current.account.contacts.follow_up_today.exists?
  end

  def today_follow_ups_title(collection = Current.account.contacts.follow_up_today)
    count = if collection.size.zero?
      t(".no_follow_ups")
    else
      collection.size
    end

    [
      count,
      "follow-up".pluralize(collection.size),
      "today"
    ].join(" ")
  end

  def searching(&block)
    yield if params.fetch(:q, false).present?
  end

  def term_description_tags(label, content)
    if content.present?
      tag.span do
        "#{tag.dt(label)} #{tag.dd(content)}".html_safe
      end
    end
  end
end

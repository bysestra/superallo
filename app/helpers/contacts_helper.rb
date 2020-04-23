module ContactsHelper
  def contacts_index_heading(params)
    params.fetch(:q, false).presence ? "Results for “#{params[:q].html_safe}”" : 'All Contacts'
  end
end

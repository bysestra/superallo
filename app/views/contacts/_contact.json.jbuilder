json.extract! contact, :id, :first_name, :last_name, :title, :company_name, :phone_number, :email_address, :account_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)

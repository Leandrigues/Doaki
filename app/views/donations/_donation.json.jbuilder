json.extract! donation, :id, :title, :description, :street, :detail, :zip, :phone, :email, :created_at, :updated_at
json.url donation_url(donation, format: :json)

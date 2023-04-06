json.extract! reservation, :id, :reservation_date, :appointment_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)

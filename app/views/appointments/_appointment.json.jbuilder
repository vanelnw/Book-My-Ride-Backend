json.extract! appointment, :id, :appointment_date, :user_id, :car_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

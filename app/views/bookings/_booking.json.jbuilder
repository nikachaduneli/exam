json.extract! booking, :id, :user_id, :room_id, :code, :date_start, :date_end, :created_at, :updated_at
json.url booking_url(booking, format: :json)

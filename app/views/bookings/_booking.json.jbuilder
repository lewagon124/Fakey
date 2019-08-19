json.extract! booking, :id, :start, :end, :user_id, :product_id, :totalcost, :created_at, :updated_at
json.url booking_url(booking, format: :json)

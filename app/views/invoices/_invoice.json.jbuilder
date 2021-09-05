json.extract! invoice, :id, :title, :number, :date, :due, :notes, :user_id, :client_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)

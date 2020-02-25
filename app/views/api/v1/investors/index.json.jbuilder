investor_fields = %i[
  id first_name last_name institution_title institution_type_title status
  phone email last_active_at geo_region created_at updated_at
]
json.rows @investors do |investor|
  json.extract! investor, *investor_fields
end
json.extract! @investors, :total_count

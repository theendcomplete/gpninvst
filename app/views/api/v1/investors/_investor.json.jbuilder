fields = %i[
  id first_name last_name
  institution_title institution_type_title
  side_title asset_class_title job_function_title
  status phone email last_active_at
  geo_region country city address
]
json.extract! investor, *fields

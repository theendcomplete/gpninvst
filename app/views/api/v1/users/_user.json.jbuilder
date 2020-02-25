fields = ViewFields.new params[:fields]

json.extract! user, *fields.filter(
  %i[
    id login email role_code status_code created_at updated_at
    archived_at first_name last_name
  ]
)

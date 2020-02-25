json.extract! @user, :login, :email, :role_code, :status_code, :first_name, :last_name
json.photo url_for_file(@user.photo)

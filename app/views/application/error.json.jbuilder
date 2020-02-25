json.error_code @error.code
json.error_text @error.message
json.error_backtrace @error.backtrace if Rails.env.development?

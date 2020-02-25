class GraphqlController < ApplicationController
  before_action :authorize_apikey

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
        user: current_user,
        request: current_request
    }

    result = InvestApiSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue Error::Unauthorized => _e
    head :unauthorized
  rescue Error::Forbidden => _e
    head :forbidden
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  def current_user
    token = request.headers[:token]
    User.with_token(token).first if token.present?
  end

  def current_request
    {
        remote_addr: request.env['HTTP_X_FORWARDED_FOR'] || request.remote_ip,
        user_agent: request.headers['HTTP_USER_AGENT']
    }
  end

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash
      ambiguous_param
    when ActionController::Parameters
      ambiguous_param.permit!.to_h
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(err)
    logger.error err.message
    logger.error err.backtrace.join("\n")

    render json: { error: { message: err.message, class_name: err.class.name, backtrace: err.backtrace }, data: {} }, status: :internal_server_error
  end
end

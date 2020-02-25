module Mutations::Users
  class CreateAuthMutation < Mutations::BaseMutation
    TOKENS_ITERATIONS_LIMIT = 10
    TOKENS_PER_USER_LIMIT = 5

    type Types::Users::UserTokenType

    argument :login, String, required: true
    argument :password, String, required: true

    def resolve(login:, password:)
      user = User.where('email = ? OR login = ?', login, login).first
      raise Error::BadRequest, code: 'AUTH_USER_NOT_FOUND' if user.blank? || user.auth_blocked_until&.future?

      unless user.authenticate(password)
        user.check_auth_attempt! context[:request]
        raise Error::BadRequest, code: 'AUTH_USER_NOT_FOUND'
      end
      raise Error::BadRequest, code: 'AUTH_USER_BLOCKED' if user.blocked?

      user_tokens = user.user_tokens.order(updated_at: :asc)
      user_tokens.first.destroy if user_tokens.size > TOKENS_PER_USER_LIMIT

      token_coincidence_count = 0
      user_token = nil
      until user_token.present?
        begin
          user_token = UserToken.create!(
            user: user,
            http_remote_addr: context[:request][:remote_addr],
            http_user_agent: context[:request][:user_agent]
          )
        rescue ActiveRecord::RecordNotUnique
          token_coincidence_count += 1
          raise Error::InternalServerError, code: 'TOKEN_NOT_CREATED' if token_coincidence_count > TOKENS_ITERATIONS_LIMIT
        end
      end

      user_token
    end
  end
end

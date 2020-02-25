module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = current_user
    end

    private

    def current_user
      token = request.params[:token].to_s
      user = User.with_token(token).first if token.present?
      raise Error::Forbidden if user.blank?

      user
    end
  end
end

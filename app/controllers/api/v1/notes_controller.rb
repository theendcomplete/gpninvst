module Api::V1
  class NotesController < ApiController
    before_action -> { authorize_user [UserRole::Admin, UserRole::Client] }

    CREATE_PARAMS = %i[title text investor_id].freeze
    UPDATE_PARAMS = %i[title text].freeze
    bootstrap :notes

    private

    def filter_notes(notes)
      # NOTE: Filter params
      notes = notes.where(investor_id: params[:investor_id]) if params[:investor_id].present?
      notes = notes.where(user_id: params[:user_id]) if params[:user_id].present?
      # NOTE: Access control
      notes.accessible(Session.user)
    end
  end
end

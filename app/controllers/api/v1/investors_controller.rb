module Api::V1
  class InvestorsController < ApiController
    before_action -> { authorize_user [UserRole::Admin, UserRole::Client] }
    before_action -> { authorize_user [UserRole::Admin] }, only: %i[destroy]

    CREATE_PARAMS = %i[
      first_name last_name email phone geo_region country city address status last_active_at
      institution_title institution_type_title side_title asset_class_title job_function_title
    ].freeze
    UPDATE_PARAMS = CREATE_PARAMS.freeze
    bootstrap :investors

    def import
      Investor.create_or_update_from_csv(params[:file])
      head :created
    end

    def values
      raise Error::BadRequest, code: 'WRONG_FIELD_NAME' if params[:field].blank?

      @values = Investor.distinct.order(params[:field] => :asc).pluck(Investor.connection.quote_table_name(params[:field])).compact
    end

    private

    def filter_investors(investors)
      # NOTE: Filter params
      # teams = teams.joins(:player_teams).where(player_teams: { player_id: params[:player_id] }) if params[:player_id].present?
      # NOTE: Access control
      investors.accessible(Session.user)
    end
  end
end

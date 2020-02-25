module Types
  class MutationType < Types::BaseObject
    field :create_auth, mutation: Mutations::Users::CreateAuthMutation

    field :create_user, mutation: Mutations::Users::CreateUserMutation
    field :update_user, mutation: Mutations::Users::UpdateUserMutation
    field :destroy_user, mutation: Mutations::Users::DestroyUserMutation

    field :update_profile, mutation: Mutations::Users::UpdateProfileMutation
    field :destroy_profile, mutation: Mutations::Users::DestroyProfileMutation

    field :create_investor, mutation: Mutations::Investors::CreateInvestorMutation
    field :update_investor, mutation: Mutations::Investors::UpdateInvestorMutation
    field :destroy_investor, mutation: Mutations::Investors::DestroyInvestorMutation

    field :create_note, mutation: Mutations::Notes::CreateNoteMutation
    field :update_note, mutation: Mutations::Notes::UpdateNoteMutation
    field :destroy_note, mutation: Mutations::Notes::DestroyNoteMutation

    field :create_event, mutation: Mutations::Events::CreateEventMutation
    field :update_event, mutation: Mutations::Events::UpdateEventMutation
    field :destroy_event, mutation: Mutations::Events::DestroyEventMutation

    field :create_tag, mutation: Mutations::Tags::CreateTagMutation
    field :update_tag, mutation: Mutations::Tags::UpdateTagMutation
    field :destroy_tag, mutation: Mutations::Tags::DestroyTagMutation
  end
end

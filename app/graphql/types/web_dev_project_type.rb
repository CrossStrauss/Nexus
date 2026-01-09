module Types
  class WebDevProjectType < Types::BaseObject
    field :id, ID, null: false
    field :github_url, String, null: true
    field :live_url, String, null: true
    field :tech_stack, String, null: true
  end
end

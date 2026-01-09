module Types
  class MobileAppProjectType < Types::BaseObject
    field :id, ID, null: false
    field :store_link, String, null: true
    field :os, String, null: true
    field :tech_used, String, null: true
  end
end

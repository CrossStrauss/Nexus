module Types
  class UnrealProjectType < Types::BaseObject
    field :id, ID, null: false
    field :engine_version, String, null: true
    field :download_url, String, null: true
    field :platform, String, null: true
  end
end

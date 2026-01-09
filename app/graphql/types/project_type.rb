# app/graphql/types/project_type.rb
module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :thumbnail, String, null: true

    # Polymorphic association
    field :projectable, Types::ProjectableType, null: false

    def projectable
      object.projectable
    end
  end
end

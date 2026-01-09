# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Project Queries

    field :projects, [ Types::ProjectType ], null: false,
      description: "Fetch all projects with their polymorphic data"

    def projects
      Project.all
    end

    field :mobile_app_projects, [ Types::ProjectType ], null: false,
      description: "Fetch only Mobile App projects"
    def mobile_app_projects
      Project.where(projectable_type: "MobileAppProject").includes(:projectable)
    end

    field :unreal_projects, [ Types::ProjectType ], null: false,
          description: "Fetch only Unreal projects"
    def unreal_projects
      Project.where(projectable_type: "UnrealProject").includes(:projectable)
    end

    field :web_dev_projects, [ Types::ProjectType ], null: false,
      description: "Fetch only Web Dev projects"
    def web_dev_projects
      Project.where(projectable_type: "WebDevProject").includes(:projectable)
    end

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end

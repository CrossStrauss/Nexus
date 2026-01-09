# app/graphql/types/project_type.rb
module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :thumbnail, String, null: true

    field :thumbnail_url, String, null: true
    field :thumbnail_small_url, String, null: true

    def thumbnail_url
      return unless object.thumbnail.attached?
      Rails.application.routes.url_helpers.rails_blob_url(
        object.thumbnail,
        host: "http://localhost:3000"
        ) if object.thumbnail.attached?
    end

    def thumbnail_small_url
      return unless object.thumbnail.attached?
      if object.thumbnail.attached?
        Rails.application.routes.url_helpers.rails_blob_url(
          object.thumbnail.variant(resize_to_limit: [ 300, 300 ]).processed, host: "http://localhost:3000"
        )
      end
    end

    # Polymorphic association
    field :projectable, Types::ProjectableType, null: false

    def projectable
      object.projectable
    end
  end
end

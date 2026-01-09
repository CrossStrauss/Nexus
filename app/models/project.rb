class Project < ApplicationRecord
  belongs_to :projectable, polymorphic: true

  has_one_attached :thumbnail

  after_commit :process_thumbnail_variant, on: [ :create, :update ]

  private

  def process_thumbnail_variant
    return unless thumbnail.attached?

    thumbnail.variant(resize_to_limit: [ 300, 300 ]).processed
  end
end

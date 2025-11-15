class Project < ApplicationRecord
  belongs_to :projectable, polymorphic: true
end

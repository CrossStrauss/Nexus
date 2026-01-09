# app/graphql/types/projectable_type.rb
module Types
  class ProjectableType < Types::BaseUnion
    description "Polymorphic projectable types"

    possible_types Types::MobileAppProjectType, Types::WebDevProjectType, Types::UnrealProjectType

    def self.resolve_type(object, _context)
      case object
      when MobileAppProject
        Types::MobileAppProjectType
      when WebDevProject
        Types::WebDevProjectType
      when UnrealProject
        Types::UnrealProjectType
      else
        raise("Unknown projectable type: #{object.class}")
      end
    end
  end
end

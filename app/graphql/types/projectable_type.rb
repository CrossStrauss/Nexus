# app/graphql/types/projectable_type.rb
module Types
  class ProjectableType < Types::BaseUnion
    description "The underlying type of a Project"
    possible_types Types::MobileAppProjectType,
                   Types::UnrealProjectType,
                   Types::WebDevProjectType

    def self.resolve_type(object, _context)
      case object
      when MobileAppProject
        Types::MobileAppProjectType
      when UnrealProject
        Types::UnrealProjectType
      when WebDevProject
        Types::WebDevProjectType
      else
        raise "Unexpected Projectable: #{object.inspect}"
      end
    end
  end
end

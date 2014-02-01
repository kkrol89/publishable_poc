module Mongoid::History
  module SoftUndo
    # this is clone of undo! method without save at the end
    def undo(modifier = nil, options_or_version = nil)
      versions = get_versions_criteria(options_or_version).to_a
      versions.sort! { |v1, v2| v2.version <=> v1.version }

      versions.each do |v|
        undo_attr = v.undo_attr(modifier)
        attributes.merge!(undo_attr)
      end
    end
  end
end

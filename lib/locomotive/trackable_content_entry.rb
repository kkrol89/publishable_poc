Locomotive::ContentEntry.class_eval do
  include Mongoid::History::Trackable
  include Mongoid::History::SoftUndo
  include Mongoid::History::Publishable

  track_history   :on => :all,       # track title and body fields only, default is :all
                  :except => [:created_at, :updated_at, :published_version],
                  :modifier_field => :modifier, # adds "belongs_to :modifier" to track who made the change, default is :modifier
                  :modifier_field_inverse_of => :nil, # adds an ":inverse_of" option to the "belongs_to :modifier" relation, default is not set
                  :version_field => :version,   # adds "field :version, :type => Integer" to track current version, default is :version
                  :track_create   =>  false,    # track document creation, default is false
                  :track_update   =>  true,     # track document updates, default is true
                  :track_destroy  =>  false     # track document destruction, default is false
end

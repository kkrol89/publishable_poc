module Mongoid::History
  class UntrackedError < StandardError
  end

  class UnpublishedError < StandardError    
  end

  module Publishable
    extend ActiveSupport::Concern
    included do
      field :published_version, type: Integer
    end

    def publish!
      update_attribute(:published_version, self.version)
    end

    def published
      raise Mongoid::History::UntrackedError.new("This document is not tracked") unless self.version.present?
      raise Mongoid::History::UnpublishedError.new("This document is not published yet") unless self.published_version.present?

      self.undo nil, :from => self.version, :to => self.published_version
      self
    end
  end
end

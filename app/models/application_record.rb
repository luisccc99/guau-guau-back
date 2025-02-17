class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
    require "securerandom"
  after_initialize :generate_uuid

  protected
  def generate_uuid
    self.id = SecureRandom.uuid unless self.id
  end
end

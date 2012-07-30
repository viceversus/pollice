class Poll < ActiveRecord::Base
  require 'base64'
  
  attr_accessible             :author, :encrypted_url, :title
  
  validates_presence_of       :author, :title
  validates_uniqueness_of     :encrypted_url
  
  after_create                :add_encrypted_url

  private
    def add_encrypted_url
      update_attributes!(:encrypted_url => SecureRandom.urlsafe_base64(15))
    end
end

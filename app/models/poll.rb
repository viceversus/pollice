class Poll < ActiveRecord::Base
  require 'base64'
  
  attr_accessible                 :author, :encrypted_url, :title, :questions_attributes
  
  validates_presence_of           :author, :title
  validates_uniqueness_of         :encrypted_url
  
  before_create                   :add_encrypted_url
  
  has_many                        :questions, :dependent => :destroy, :inverse_of => :poll
  has_many                        :responses, :dependent => :destroy
  
  accepts_nested_attributes_for   :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  private
    def add_encrypted_url
      self.encrypted_url = SecureRandom.urlsafe_base64(15)
    end
end

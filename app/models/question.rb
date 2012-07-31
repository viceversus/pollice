class Question < ActiveRecord::Base
  attr_accessible           :content
  
  validates_presence_of     :content, :poll
  
  belongs_to                :poll
  has_many                  :responses, :dependent => :destroy
end

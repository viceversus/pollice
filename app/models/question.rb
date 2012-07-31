class Question < ActiveRecord::Base
  attr_accessible           :content, :poll
  
  validates_presence_of     :content, :poll
  
  belongs_to                :poll, :inverse_of => :questions
  has_many                  :answers, :dependent => :destroy
end

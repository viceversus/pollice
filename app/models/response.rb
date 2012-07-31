class Response < ActiveRecord::Base
  attr_accessible                 :responder, :answers_attributes, :poll
  
  validates_presence_of           :poll, :responder
  
  belongs_to                      :poll
  has_many                        :answers, :dependent => :destroy, :inverse_of => :response
  
  accepts_nested_attributes_for   :answers
end
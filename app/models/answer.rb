class Answer < ActiveRecord::Base
  attr_accessible         :body, :question, :response, :question_id
  
  belongs_to              :response, :inverse_of => :answers
  belongs_to              :question
  
  validates_presence_of   :response
end

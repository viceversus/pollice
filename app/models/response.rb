class Response < ActiveRecord::Base
  attr_accessible         :body, :poll_id, :question_id, :responder
  
  validates_presence_of   :poll_id, :question, :responder, :body
  
  belongs_to              :question
  
  before_validation       :set_poll_id
  
  def poll
    question.poll
  end
  
  private
    def set_poll_id
      self.poll_id = question.poll_id
    end
end

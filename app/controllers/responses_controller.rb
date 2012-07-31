class ResponsesController < ApplicationController
  def new
    @response = Response.new
  end

  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.build(params[:response])
    if @response.save
      flash[:success] = "Your response was added!"
      redirect_to question_path(@question)
    else
      raise @response.inspect
      flash[:error] = "Could not add new response!"
      render 'questions#show'
    end
  end
end

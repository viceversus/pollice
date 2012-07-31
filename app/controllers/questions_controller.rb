class QuestionsController < ApplicationController
  before_filter :find_resource, :except => [:new, :create]
  
  def new
    @question = Question.new
  end
  
  def create
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.build(params[:question])
    if @question.save
      flash[:success] = "New question added!"
      redirect_to poll_edit_path(@poll.encrypted_url)
    else
      flash[:error] = "Could not add new question!"
      render 'polls#edit'
    end
  end
  
  def edit
  end
  
  def update
    if @question.update_attributes(params[:question])
      flash[:success] = "Question updated!"
      redirect_to poll_edit_path(@question.poll.encrypted_url)
    else
      flash[:error] = "Could not edit question!"
      render 'edit'
    end
  end
  
  def destroy
    @poll = @question.poll
    if @question.destroy
      flash[:success] = "Question deleted!"
      redirect_to poll_edit_path(@poll.encrypted_url)
    else
      flash[:error] = "Could not delete question!"
      render 'edit'
    end
  end
  
  def show
    @response = Response.new
    @responses = @question.responses
  end
end

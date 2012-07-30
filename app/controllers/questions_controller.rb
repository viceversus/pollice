class QuestionsController < ApplicationController
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
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:success] = "Question updated!"
      redirect_to poll_edit_path(@question.poll.encrypted_url)
    else
      flash[:error] = "Could not edit question!"
      render 'edit'
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @poll = @question.poll
    if @question.destroy
      flash[:success] = "Question deleted!"
      redirect_to poll_edit_path(@poll.encrypted_url)
    else
      flash[:error] = "Could not delete question!"
      render 'edit'
    end
  end
end

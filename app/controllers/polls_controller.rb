class PollsController < ApplicationController
  before_filter :find_resource, :except => [:new, :create, :edit]
  
  def new
    @poll = Poll.new(params[:poll])
  end
  
  def show
    @questions = @poll.questions
    @responses = @poll.responses
  end
  
  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      flash[:success] = "Your poll has been created at #{root_url}#{@poll.id}! Use #{root_url}#{@poll.encrypted_url} to edit!"
      redirect_to poll_edit_path(@poll.encrypted_url)
    else
      flash[:error] = "Title and author are required."
      render 'new'
    end
  end
  
  def edit
    @poll = Poll.find_by_encrypted_url(params[:encrypted_url])
    @questions = @poll.questions
    @question = Question.new
  end
  
  def update
    if @poll.update_attributes(:title => params[:poll][:title], :author => params[:poll][:author])
      flash[:success] = "Your poll (#{root_url}#{@poll.id}) has been updated!"
      redirect_to poll_edit_path(@poll.encrypted_url)
    else
      flash[:error] = "Error in updating your poll."
      render 'edit'
    end
  end
  
  def destroy
    if @poll.destroy
      flash[:success] = "Your poll has been deleted!"
      redirect_to root_path
    else
      flash[:error] = "Error in deleting your poll."
      render 'edit'
    end
  end
end

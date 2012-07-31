class ResponsesController < ApplicationController
  def new
    @response = Response.new
    @poll = Poll.find(params[:poll_id])
    @response.answers.build
  end
  
  def create
    @poll = Poll.find(params[:poll_id])
    @response = @poll.responses.build(params[:response])
    if @response.save
      flash[:success] = "New response added!"
      redirect_to poll_path(@poll)
    else
      flash[:error] = "Could not add new response!"
      render 'new'
    end
  end
  
  def show
    @response = Response.find(params[:id])
    @poll = @response.poll
  end
end

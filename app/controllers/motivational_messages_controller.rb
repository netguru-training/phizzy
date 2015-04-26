class MotivationalMessagesController < ApplicationController

  def show
    motivational_message=MotivationalMessage.all.sample
    respond_to do |format| 
       format.json { 
        render json: motivational_message
      }
    end
  end
end

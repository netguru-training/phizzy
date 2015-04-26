class ExercisesController < ApplicationController
  	
  	expose(:exercise)
    expose(:exercises)
    
    def index
    end

    def new      
  	end

  	def edit
  	end

  	def create
  	  self.exercise = Exercise.new(exercise_params)

      if exercise.save
        redirect_to exercises, notice: 'Exercise was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if exercise.update(exercise_params)
        redirect_to exercise, notice: 'Exercise was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      exercise.destroy
      redirect_to exercises_url, notice: 'Exercise was successfully destroyed.'
    end

	private
      def exercise_params
        params.require(:exercise).permit(:name, :description)
      end
end

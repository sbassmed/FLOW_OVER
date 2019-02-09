class QuestionsController < ApplicationController


  def new
    @question = Question.new
  end

  def create
  @question = Question.create(questions_params)
  @question.user = current_user
  if @question.save
   flash[:success] = "Pregunta publicada exitosamente"
      redirect_to questions_path
    else
       flash[:danger] = "Debes llenar todos los datos"
       redirect_to new_question_path
     end
   end

end

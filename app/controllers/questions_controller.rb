class QuestionsController < ApplicationController

before_action :authenticate_user!, :except => [:show, :index]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
  @question = Question.create(questions_params)
  @question.user = current_user
  if @question.save
   flash[:success] = "Pregunta publicada exitosamente"
      redirect_to questions_path(@question)
    else
       flash[:danger] = "#{@question.errors.messages}"
       redirect_to new_question_path
     end
   end

   def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      flash[:notice] = "Tu pregunta ha sido modificada"
        redirect_to questions_path(@question)
    else
      flash[:danger] = "#{@question.errors.messages}"
        render :edit
    end
  end

   def destroy
      question =Question.find(params[:id])
      question.destroy

       redirect_to questions_path
  end


 private

   def questions_params
     params.require(:question).permit(:title, :description, :id)
   end

end

class QuestionsController < ApplicationController

before_action :authenticate_user!, :except => [:show, :index]

  def index
    @questions = Question.order("updated_at DESC")
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @answer = Answer.new
    @vote = Vote.new
  end

  def create
  @question = Question.create(questions_params)
  @question.user = current_user
  if @question.save
   flash[:success] = "Pregunta publicada"
      redirect_to questions_path(@question)
    else
       flash[:danger] = "#{@question.errors.messages}"
       redirect_to new_question_path
     end
   end

   def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      flash[:warning] = "Tu pregunta ha sido modificada"
        redirect_to questions_path(@question)
    else
      flash[:danger] = "#{@question.errors.messages}"
        render :edit
    end
  end

   def destroy
      question = Question.find(params[:id])
      question.destroy

       redirect_to questions_path
  end

# VOTOSSSS

def voteup
  question = Question.find(params[:id])
  question.votes.create(user: current_user)

  flash[:success] = "Gracias #{current_user.email} por votar!"
    redirect_to question_path

  end


def votedown
  question = Question.find(params[:id])
  question.votes.where(user: current_user).take.try(:destroy)

  flash[:danger] = "Vote eliminado!"
    redirect_to question_path

end

 private

   def questions_params
     params.require(:question).permit(:title, :description, :id)
   end

end

module QuestionsHelper
  def form_title
    @question.new_record? ? "Hacer Pregunta" : "Modificar Pregunta"
  end
end

class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:success] = "Thanks for signing up, #{@student.name}"
      redirect_to student_path(@student)
    else
      flash[:error] = "There was an error creating your profile"
      render "new"
    end
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end
  private

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end
end

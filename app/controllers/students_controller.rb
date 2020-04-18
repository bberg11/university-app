class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :show, :update]

  def index
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:success] = "Thanks for signing up, #{@student.name}"
      session[:user_id] = @student.id
      redirect_to student_path(@student)
    else
      flash[:error] = "There was an error creating your profile. <br/> #{errors_string}"
      render "new"
    end
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def show
  end

  def update
    if @student.update(student_params)
      flash[:success] = "#{@student.name}'s profile has been updated"
      redirect_to student_path(@student)
    else
      flash[:error] = "There was an error updating your profile. <br/> #{errors_string}"
      render "edit"
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def errors_string
    @student.errors.full_messages.join(", and ")
  end

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end
end

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
      errors = @student.errors.full_messages.join(", and ")
      flash[:error] = "There was an error creating your profile. <br/> #{errors}"
      render "new"
    end
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:success] = "#{@student.name}'s profile has been updated"
      redirect_to student_path(@student)
    else
      errors = @student.errors.full_messages.join(", and ")
      flash[:error] = "There was an error updating your profile. <br/> #{errors}"
      render "edit"
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end
end

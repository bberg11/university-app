class StudentCoursesController < ApplicationController
  def create
    course_to_add = Course.find(params[:course_id])

    unless current_user.courses.include?(course_to_add)
      current_user.courses << course_to_add
      flash[:success] = "You are now enrolled in #{course_to_add.short_name}: #{course_to_add.name}"
      redirect_to student_path(current_user)
    else
      flash[:error] = "We were not able to enroll you in #{course_to_add.name}"
      redirect_to root_path
    end
  end
end

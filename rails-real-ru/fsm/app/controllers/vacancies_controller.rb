# frozen_string_literal: true

class VacanciesController < ApplicationController
  def index
    @on_moderate = Vacancy.on_moderate
    @published = Vacancy.published
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      redirect_to vacancies_path, notice: 'Vacancy was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # BEGIN
  def publish
    @vacancy = Vacancy.find(params[:id])
    @on_moderate = Vacancy.on_moderate
    @published = Vacancy.published

    unless @vacancy.may_publish?
      redirect_to vacancies_path, status: :moved_permanently
      return
    end    
    @vacancy.publish
    @vacancy.save
    redirect_to vacancies_path
  end

  def archive
    @vacancy = Vacancy.find(params[:id])
    @vacancy.archive
    @vacancy.save
    redirect_to vacancies_path
  end  
  # END

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :description)
  end
end

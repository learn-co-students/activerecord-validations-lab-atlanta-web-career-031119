class AuthorsController < ApplicationController
  def index
    @author = Author.all
  end

  def new
  end

  def create
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end
end

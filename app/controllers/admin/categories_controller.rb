class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end
end

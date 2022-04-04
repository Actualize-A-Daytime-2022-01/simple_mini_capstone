class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def create
    @product = Product.new(
                           name: params[:name],
                           price: params[:price],
                           description: params[:description],
                           image_url: params[:image_url]
                          )

    if @product.save
      render :show
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url

    if @product.save
      render :show
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Successfully Destroyed Product"}
  end
end

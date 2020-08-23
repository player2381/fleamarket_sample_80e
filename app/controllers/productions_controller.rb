class ProductionsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @productions = Production.includes(:images).order('created_at DESC').limit(5)
  end

  def show
    @production = Production.find(params[:id])
  end

  def new
    @production = Production.new
    @production.images.new
    @category = Category.where(ancestry: "")
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @production = Production.new(production_params)
    if @production.save!
      redirect_to root_path(@production.user_id)
    else
      render :new
    end
  end

  def edit
    @production = Production.find(params[:id])
    @category = Category.where(ancestry: "")
  end

  def update
    @production = Production.find(params[:id])
    @production.update(production_params)
    if production_params[:images_attributes].nil?
      flash.now[:alert] = '更新できませんでした 【画像を１枚以上入れてください】'
      render :edit
    else
      exit_ids = []
      production_params[:images_attributes].each do |a,b|
      exit_ids << production_params[:images_attributes].dig(:"#{a}",:id).to_i
    end
      ids = Image.where(production_id: params[:id]).map{|image| image.id }
      delete__db = ids - exit_ids
      Image.where(id:delete__db).destroy_all
      @production.touch
      if @production.update(production_params)
        redirect_to  root_path
      else
        flash.now[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end

  # def update
  #   if @production.update(product_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end


  def destroy
    production = Production.find(params[:id])
    if production.user_id == current_user.id
      production.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end


  private


  def production_params
    params.require(:production).permit(
    :category_id,
    :name,
    :price,
    :introduction,
    :size,
    :shipping_charge,
    :prefecture_code,
    :detail_date,
    :trading_status,
    images_attributes: [:src, :_destroy, :id])
    .merge(user_id: current_user.id)
  end
end



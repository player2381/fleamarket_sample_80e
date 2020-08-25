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
    if @production.save
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
    if @production.update(production_params)
      redirect_to root_path
      flash[:sucess] = "商品情報変更しました"
    else
      render :edit
      flash[:sucess] = "必須事項を入力してください"
    end
  end


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



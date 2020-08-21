class ProductionsController < ApplicationController


  def index
    @productions = Production.includes(:images).order('created_at DESC')
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

  def update
    if @production.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  

  def edit
    @production = Production.find(params[:id])
    @images = Image.where(id: params[:id]) 
    grandchild_category = @production.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
    
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



  # def category_parent_array
  #   @category_parent_array = Category.where(ancestry: nil).each do |parent|
  #   end
  # end

  # def show_all_instance
  #   @user = User.find(@item.user_id)
  #   @images = Image.where(item_id: params[:id])
  #   @images_first = Image.where(item_id: params[:id]).first
  #   @category_id = @item.category_id
  #   @category_parent = Category.find(@category_id).parent.parent
  #   @category_child = Category.find(@category_id).parent
  #   @category_grandchild = Category.find(@category_id)
  # end

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



class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy,:show,:checkout]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "新增商品完成"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "商品更新成功"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "商品已刪除"
  end

  def show
    @client_token = Braintree::ClientToken.generate
  end
#產生一個 @client_token 的實體變數，準備給 View 使用。

  def checkout
    if @product
      nonce = params[:payment_method_nonce]

      result = Braintree::Transaction.sale(
        amount: @product.price,
        payment_method_nonce: nonce
      )

      if result
        redirect_to products_path, notice: "刷卡成功"
      else
        # 錯誤處理
      end
    else
      # 錯誤處理
    end
  end
  
  private
  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to products_path, notice: "無此商品" unless @product
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end

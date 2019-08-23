class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :add_to_cart, :remove_from_cart]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def add_to_cart
     user = current_user
     user.cart << @product.id unless current_user.cart.include?(@product)
     user.save!
     @booking = Booking.new(product_id: @product.id, user_id: user.id, start: Date.today, end: Date.today + 30.days)
     @booking.totalcost = ((@booking.end.to_date-@booking.start.to_date).to_i)*@product.cost
     @booking.save
     redirect_to request.referrer
   end

   def remove_from_cart
     user = current_user
     user.cart.delete(@product.id.to_s)
     user.save!
     @booking = Booking.find_by(product_id:params[:id])
     @booking.delete

     redirect_to request.referrer
   end

   def add_to_fav
      product = params[:id]
      user = current_user
      user.fav << product unless current_user.fav.include?(product)
      user.save
      redirect_to request.referrer
      # raise
    end

    def remove_from_fav
      product = params[:id]
      user = current_user
      user.fav.delete(product)
      user.save
      redirect_to request.referrer
    end

    def fav
      @user = current_user
      # raise
    end

  # GET /products/new
  def new
    if user_signed_in?
       @product = Product.new
    else
      redirect_to user_session_path, notice: 'Please log in, my friend.'
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search

      if params[:search].present?
        sql_query = "name ILIKE :query"
        @products = Product.where(sql_query, query: "%#{params[:search]}%")

        #, :status => 200, :content_type => 'text/html'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :cost, :desc, :image, :image_cache, :user_id)
    end

end

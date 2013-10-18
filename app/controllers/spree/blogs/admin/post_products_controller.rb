class Spree::Blogs::Admin::PostProductsController < Spree::Admin::BaseController
  
  before_filter :load_data
  
  def create
    position = @post.products.count
    @product = Spree::Product.find_by_name(params[:name]) || Spree::Variant.find_by_sku(params[:name]).try(:product)
    Spree::PostProduct.create(:post_id => @post.id, :product_id => @product.id, :position => position)
    render :partial => "spree/blogs/admin/post_products/related_products_table", :locals => { :post => @post }, :layout => false
  end
    
  def destroy
    @related = Spree::PostProduct.find(params[:id])
    if @related.destroy
      render_js_for_destroy
    end
  end
    
  private
  
    def load_data
	  	@post = Spree::Post.find_by_path(params[:post_id])
    end

end
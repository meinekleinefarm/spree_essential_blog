class Spree::PossibleBlog
  def self.matches?(request)
    return false if request.fullpath =~ Spree::Blog::RESERVED_PATHS
    permalink = request.path.gsub(/(^\/+)/, "").split('/').first
    blog = Spree::Blog.find_by_permalink!(permalink) rescue nil
    blog.present?
  end
end

Spree::Core::Engine.routes.draw do
  scope(:module => "blogs") do
    namespace :admin do
      resources :blogs, :constraints => { :id => /[a-z0-9\-\_\/]{3,}/ }

      resources :posts do
        resources :images, :controller => "post_images" do
          collection do
            post :update_positions
          end
        end
        resources :products, :controller => "post_products"
        resources :categories, :controller => "post_categories"
      end

      resource :disqus_settings

    end

    # PLZ is there a better way to do this?!
    constraints Spree::PossibleBlog do
      constraints(
        :year  => /\d{4}/,
        :month => /\d{1,2}/,
        :day   => /\d{1,2}/
      ) do
        get ":blog_id/:year(/:month(/:day))" => "posts#index", :as => :post_date
        get ":blog_id/:id" => "posts#show",  :as => :full_post
      end
      get ":blog_id/category/:id"   => "post_categories#show", :as => :post_category, :constraints => { :id => /.*/ }
      get ":blog_id/search/:query"  => "posts#search",         :as => :search_posts, :query => /.*/
      get ":blog_id/archive"        => "posts#archive",        :as => :archive_posts
      get ":blog_id"                => "posts#index",          :as => :blog_posts
    end
  end
end
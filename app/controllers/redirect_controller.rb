class RedirectController < ApplicationController
  def index
    if Rails.env.development? || Rails.env.test?
      product = Product.where('name LIKE ?', "#{params[:path].first}%").first
    elsif Rails.env.production?
      product = Product.where('name ILIKE ?', "#{params[:path].first}%").first
    end
    redirect_to product_path(product)
  end
end

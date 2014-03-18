046 Catch All Routes
====================

Followed along with Railscast 046 Catch All Route

[Blog Post](http://patrickperey.com/railscast-046-catch-all-route) @ [PatrickPerey.com](http://patrickperey.com)

```ruby
get '*path' => 'redirect#index'
```

```ruby
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
```

module Admin::ProductsHelper
  
    def converting_to_jpy(price)
    price.to_s(:delimited)
  end
end

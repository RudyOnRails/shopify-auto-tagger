class OrdersController < ApplicationController
  
  # before_filter :verify_webhook, :except => 'verify_webhook'
    
  def auto_tag
    customer = ShopifyAPI::Customer.find(params["customer"]["id"])
    params["line_items"].each do |l|
      ShopifyAPI::SmartCollection.find(:all, :params => { :product_id => l["product_id"] }).each do |sc|
        sc_title = sc.title
        customer.update_attribute("tags", "#{customer.tags}, #{sc_title}") unless customer.tags.include?(sc_title)
      end
    end
    head :ok
  end

  # private

  # def verify_webhook
  #   data = request.body.read.to_s
  #   hmac_header = request.headers['HTTP_X_SHOPIFY_HMAC_SHA256']
  #   digest  = OpenSSL::Digest::Digest.new('sha256')
  #   calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, OtaboAutoTagger::Application.config.shopify.secret, data)).strip
  #   unless calculated_hmac == hmac_header
  #     head :unauthorized
  #   end
  #   request.body.rewind
  # end

end

class ShopifyHookOrdersController < ApplicationController
  
  # before_filter :verify_webhook, :except => 'verify_webhook'

  def create

    shopify_hook_order = ShopifyHookOrder.new
    shopify_hook_order.customerid = params["customer"]["id"]
    if shopify_hook_order.save
      head :ok
    else
      render :status => 666
    end

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

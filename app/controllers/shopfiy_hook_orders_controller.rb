class ShopifyHookOrdersController < ApplicationController
  
  before_filter :verify_webhook, :except => 'verify_webhook'

  def create

    @incoming_order = ShopifyHookOrder.create(:customerid => params[:order[:customer[:id]]])
  
  end

  def verify_webhook
    data = request.body.read.to_s
    hmac_header = request.headers['HTTP_X_SHOPIFY_HMAC_SHA256']
    digest  = OpenSSL::Digest::Digest.new('sha256')
    calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, SyncApp::Application.config.shopify.secret, data)).strip
    unless calculated_hmac == hmac_header
      head :unauthorized
    end
    request.body.rewind
  end

end

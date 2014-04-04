require 'spec_helper'

describe AbandonedCartsEndpoint do
  let(:message) {
    Factories.cart_new_payload.merge({'parameters' => Factories.config})
  }

  def app; AbandonedCartsEndpoint; end

  context "/add_cart" do
    it "saves a cart" do
      expect {
        post '/add_cart', message.to_json, auth
      }.to change(Cart, :count).by(1)

      last_response.status.should eq(200)
      expect(json_response[:summary]).to match("Successfully created a cart")
    end

    it "returns error notification when cart won't save" do
      # Nil-ing out updated_at field to fail Cart validations at save
      message['cart']['updated_at'] = nil

      expect {
        post '/add_cart', message.to_json, auth
      }.not_to change(Cart, :count)

      last_response.status.should eq(500)

      last_response.body.should match("Error: Unable to save a cart")
      last_response.body.should match("last_activity_at") 
      last_response.body.should match("can't be blank") 
    end

    it "raises InvalidParameters when cart hash is missed" do
      message.delete('cart')
      post '/add_cart', message.to_json, auth

      last_response.status.should eq(500)
      last_response.body.should match("'cart' hash must be present in the payload") 
    end
  end

  context "/match_cart" do
    let(:cart) { Fabricate(:cart) }

    it "should destroy matching cart" do
      cart.save
      Fabricate(:cart)
      message = Factories.order_new_payload(cart.number).merge({'parameters' => Factories.config})

      expect {
        post '/match_cart', message.to_json, auth
      }.to change(Cart, :count).by(-1)

      last_response.status.should eq(200)
      last_response.body.should match("Successfully matched the new order to the cart")
    end

    it "should not destroy any carts" do
      cart.save
      Fabricate(:cart)
      message = Factories.order_new_payload.merge({'parameters' => Factories.config})

      expect {
        post '/match_cart', message.to_json, auth
      }.to_not change(Cart, :count)

      last_response.status.should eq(500)
      last_response.body.should match("Error: Unable to match the new order to a cart")
    end    
  end

  context "/poll" do
    it "should abandon carts" do
      abandoned_cart = Fabricate(:cart, {last_activity_at: (Time.now.utc - 7200)}) # abandoned
      abandoned_cart.abandoned_at.should be_nil
      
      post '/poll', message.to_json, auth
      last_response.status.should eq(200)

      last_response.body.should match("messages") 
      last_response.body.should match("cart:abandoned")
      last_response.body.should match(abandoned_cart.payload['cart']['number'])
      Cart.find(abandoned_cart.id).abandoned_at.should_not be_nil
    end
  end
end

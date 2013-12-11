require 'spec_helper'

describe AbandonedCartsEndpoint do
  let(:message) {
    {
      'store_id' => '123229227575e4645c000001',
      'message_id' => '123229227575e4645c000002',
      'payload' => Factories.cart_new_payload.merge({'parameters' => Factories.config})
    }
  }

  def app
    AbandonedCartsEndpoint
  end

  def auth
    {'HTTP_X_AUGURY_TOKEN' => 'x123', "CONTENT_TYPE" => "application/json"}
  end

  context "/save_cart" do
    it 'saves a cart' do
      expect {
        post '/save_cart', message.to_json, auth
      }.to change(Cart, :count).by(1)

      last_response.status.should eq(200)

      last_response.body.should match("message_id")
      last_response.body.should match("notifications")
      last_response.body.should match("Successfully saved a cart")
    end

    it "returns error notification when cart won't save" do
      # Nil-ing out updated_at field to fail Cart validations at save
      message['payload']['cart']['updated_at'] = nil

      expect {
        post '/save_cart', message.to_json, auth
      }.not_to change(Cart, :count)

      last_response.status.should eq(500)
      last_response.body.should match("error") 
      last_response.body.should match("Error: Unable to save a cart")
      last_response.body.should match("last_activity_at") 
      last_response.body.should match("can't be blank") 
    end
  end

  context "/match_cart"
  context "/abandon_carts"
end

require 'spec_helper'

describe AbandonedCartsEndpoint do
  let(:message) {
    {
      'store_id' => '123229227575e4645c000001',
      'message_id' => 'abc',
      'payload' => Factories.payload({'parameters' => Factories.config})
    }
  }

  def app
    AbandonedCartsEndpoint
  end

  def auth
    {'HTTP_X_AUGURY_TOKEN' => 'x123', "CONTENT_TYPE" => "application/json"}
  end

  # it '/send_shipment succeeds with existing products' do
  #   VCR.use_cassette('dotcom_order_success') do
  #     post '/send_shipment', message.to_json, auth

  #     last_response.status.should eq(200)
  #     last_response.body.should match("message_id")
  #     last_response.body.should match("notifications")
  #     last_response.body.should match("Successfully sent")
  #   end
  # end

  # it '/send_shipment fails with non-existing products' do
  #   VCR.use_cassette('dotcom_order_fail') do
  #     # Replacing valid items with non-existent ones
  #     message['payload'] = Factories.payload({'parameters' => Factories.config}, Factories.non_existent_items)

  #     post '/send_shipment', message.to_json, auth

  #     last_response.status.should eq(500)
  #     last_response.body.should match("message_id")
  #     last_response.body.should match("notifications")
  #     last_response.body.should match("Invalid Item.")
  #   end
  # end

  # it '/send_shipment fails with non-existing products' do
  #   VCR.use_cassette('dotcom_shipment_success') do
  #     Time.stub(:now => (Time.new 2013,10,24,18,29,05,'-04:00'))
  #     # Replacing valid items with non-existent ones
  #     post '/tracking', message.to_json, auth

  #     last_response.status.should eq(200)
  #     last_response.body.should match("message_id")
  #     last_response.body.should match("messages")
  #     last_response.body.should match("parameters")
  #   end
  # end
end

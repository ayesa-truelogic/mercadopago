# encoding: utf-8

require 'minitest/autorun'
require 'mercadopago'

class TestMercadoPago < MiniTest::Unit::TestCase

  #
  # Valid credentials to be used in the tests.
  #
  CREDENTIALS = { :client_id => '6157672666509627', :client_secret => '6eLnz3mT8WZzEJDAuXFMzRIjP0PYbRFO' }

  #
  # Example payment request.
  #
  PAYMENT_REQUEST = {
    :external_reference => 'OPERATION-ID-1234',
    :items => [
      {
        :id =>          'Código 123',
        :title =>       'Example T-Shirt',
        :description => 'Red XL T-Shirt',
        :quantity =>    1,
        :unit_price =>  0.50,
        :currency_id => 'ARS',
        :picture_url => 'http://s3.amazonaws.com/ombu_store_production/images/products/1375/product/l-idiot-savant-rare-device-tee.jpeg'
      }
    ],
    :payer => {
      :name =>    'John',
      :surname => 'Mikel',
      :email =>   'buyer@email.com'
    },
    :back_urls => {
      :pending => 'https://www.site.com/pending',
      :success => 'http://www.site.com/success',
      :failure => 'http://www.site.com/failure'
    }
  }

  # With a valid client id and secret (test account)
#  def test_that_authentication_returns_access_token
#    response = MercadoPago::Authentication.access_token(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])
#    assert response['access_token']
#  end
#
#  # Using fake client id and client secret
#  def test_that_authentication_fails_with_wrong_parameters
#    response = MercadoPago::Authentication.access_token('fake_client_id', 'fake_client_secret')
#    assert_nil response['access_token']
#    assert_equal "invalid_client", response['error']
#  end
#
#  def test_that_refresh_token_works
#    auth = MercadoPago::Authentication.access_token(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])
#    refresh = MercadoPago::Authentication.refresh_access_token(CREDENTIALS[:client_id], CREDENTIALS[:client_secret], auth['refresh_token'])
#
#    assert refresh['access_token']
#    assert refresh['refresh_token']
#    assert refresh['access_token'] != auth['access_token']
#    assert refresh['refresh_token'] != auth['refresh_token']
#  end
#
#  # Using fake token
#  def test_that_request_fails_with_wrong_token
#    response = MercadoPago::Checkout.create_preference('fake_token', {})
#    assert_equal 'Malformed access_token: fake_token', response['message']
#    assert_equal 'bad_request', response['error']
#  end
#
#  def test_that_client_initializes_okay_with_valid_details
#    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])
#    assert mp_client.access_token
#  end
#
#  def test_that_client_fails_with_wrong_details
#    assert_raises(MercadoPago::AccessError) do
#      mp_client = MercadoPago::Client.new('fake_client_id', 'fake_client_secret')
#    end
#  end
#
#  def test_that_client_can_create_payment_preference
#    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])
#    response = mp_client.create_preference(PAYMENT_REQUEST)
#    assert response['init_point']
#  end
#
#  def test_that_client_can_get_preference
#    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])
#
#    response = mp_client.create_preference(PAYMENT_REQUEST)
#    assert pref_id = response['id']
#
#    response = mp_client.get_preference(pref_id)
#    assert_equal "https://www.mercadopago.com/mlb/checkout/pay?pref_id=#{pref_id}", response['init_point']
#  end
#
#  def test_that_client_can_get_notification
#    payment_id = 460494008
#    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])
#
#    response = mp_client.notification(payment_id)
#    assert_equal payment_id, response['collection']['id']
#  end
#
#  def test_that_client_can_search
#    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])
#    response = mp_client.search(:status => :pending)
#
#    assert response.has_key?('results')
#
#    external_reference = 'OPERATION-ID-1234'
#    response = mp_client.search(:external_reference => :external_reference)
#    results = response['results']
#
#    assert_equal 1, results.length
#    assert_equal external_reference, results[0]['collection']['external_reference']
#  end
#
#  def test_that_client_can_create_payment_preference_in_sandbox
#    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret], true)
#    response = mp_client.create_preference(PAYMENT_REQUEST)
#    assert response['init_point'].include? 'sandbox'
#  end
#
#  def test_that_client_can_get_preference_in_sandbox
#    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret], true)
#
#    response = mp_client.create_preference(PAYMENT_REQUEST)
#    assert pref_id = response['id']
#
#    response = mp_client.get_preference(pref_id)
#    assert_equal "https://www.mercadopago.com/sandbox/checkout/pay?pref_id=#{pref_id}", response['init_point']
#  end
#
  def test_that_client_can_get_cancel_payment
    payment_id = 1367610831 
    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])

    response = mp_client.cancel_payment(payment_id)
  end

  def test_that_client_can_get_refund_payment
    payment_id = 1367610831 
    mp_client = MercadoPago::Client.new(CREDENTIALS[:client_id], CREDENTIALS[:client_secret])

    response = mp_client.refund_payment(payment_id)
  end


end

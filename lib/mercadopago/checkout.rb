module MercadoPago

  module Checkout

    #
    # Allows you to configure the checkout process.
    # Receives an access_token and a prefereces hash and creates a new checkout preference.
    # Once you have created the checkout preference, you can use the init_point URL
    # to start the payment flow.
    #
    # - access_token: the MercadoPago account associated with this access_token will
    #                 receive the money from the payment of this checkout preference.
    # - data: a hash of preferences that will be trasmitted to checkout API.
    #
    def self.create_preference(access_token, data, sandbox=false)
      payload = JSON.generate(data)
      headers = { :content_type => 'application/json', :accept => 'application/json' }

      MercadoPago::Request.wrap_post("/checkout/preferences?access_token=#{access_token}", payload, headers, sandbox)
    end

    # Returns the hash with the details of certain payment preference.
    #
    # - access_token: the MercadoPago account access token
    # - preference_id: the payment preference ID
    #
    def self.get_preference(access_token, preference_id, sandbox=false)
      headers = {:content_type => 'application/json', :accept => 'application/json' }
      MercadoPago::Request.wrap_get("/checkout/preferences/#{preference_id}?access_token=#{access_token}", headers,  sandbox)
    end

    def self.update_preference(access_token, preference_id, data, sandbox=false)
      payload = JSON.generate(data)
      headers = { :content_type => 'application/json', :accept => 'application/json' }

      MercadoPago::Request.wrap_put("/checkout/preferences/#{preference_id}?access_token=#{access_token}", payload, headers, sandbox)
    end

  end

end

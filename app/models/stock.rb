class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_publishable],
      secret_token: Rails.application.credentials.iex_client[:sandbox_secret],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    return client.price(ticker_symbol)
  end

end

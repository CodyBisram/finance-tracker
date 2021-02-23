class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  before_save :make_uppercase
  validates :name, :ticker, presence: true

  def make_uppercase
    self.ticker.upcase!
  end

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_publishable],
      secret_token: Rails.application.credentials.iex_client[:sandbox_secret],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    rescue => exception
      return nil 
    end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

end

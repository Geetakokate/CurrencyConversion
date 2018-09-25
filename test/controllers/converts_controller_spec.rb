require 'rails_helper'

RSpec.describe Api::V1::AdvertiserAccessRequestsController, type: :controller do
  def setup
    stub_request(:get, "https://api.exchangeratesapi.io/latest?base='USD'").
      to_return({
    "base": "USD",
    "rates": {
        "CAD": 1.2937229253,
        "DKK": 6.3362779241,
        "AUD": 1.3749256774,
        "EUR": 0.8494011722,
        "HUF": 274.7727851864,
        "JPY": 112.5966193833,
        "HKD": 7.8094793171,
        "NOK": 8.1281746369,
        "ILS": 3.5741951924,
        "HRK": 6.3080778051,
        "ISK": 110.2522721481,
        "TRY": 6.2085279878,
        "MYR": 4.1290240381,
        "SGD": 1.3642232226,
        "CNY": 6.8571307228,
        "USD": 1,
        "INR": 72.6802853988,
        "BGN": 1.6612588125,
        "IDR": 14875.0021235029,
        "CHF": 0.9589739234,
        "SEK": 8.7966533594,
        "CZK": 21.7574110252,
        "BRL": 4.0620062856,
        "PHP": 54.2257708316,
        "MXN": 18.8441348849,
        "ZAR": 14.2351991846,
        "PLN": 3.6531895014,
        "NZD": 1.499278009,
        "KRW": 1117.064469549,
        "RON": 3.9564257199,
        "THB": 32.3953113055,
        "RUB": 65.8924658116,
        "GBP": 0.7598573006
    },
    "date": "2018-09-24"
})
  end

  context 'create' do
    it 'should return converted amount' do
      post :create, { currency_code: 'USD', currency_code_to_convert: 'INR', amount: 10 }
    end
  end
end

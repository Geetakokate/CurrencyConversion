class ConvertsController < ApplicationController
	require 'net/http'

  def exchange
    
  end

  def create    
    response = Net::HTTP.get(URI("https://api.exchangeratesapi.io/latest?base=#{params[:converts][:currency_code]}"))
    result = JSON.parse(response)
    rate = result['rates'][params[:converts][:currency_code_to_convert]]
    @converted_amount = rate * params[:converts][:amount].to_i
    render 'exchange_result.js'
  end

end

class ConvertController < ApplicationController
	
  def new

  end

  def create
    response = Net::HTTP.get(URI("https://api.exchangeratesapi.io/latest?base=#{params[:currency_code]}"))
    result = JSON.parse(response)
    rate = result['rates'][params[:currency_code_to_convert]]
    converted_amount = rate * params[:amount].to_i
  end


end

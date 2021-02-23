class StocksController < ApplicationController

  def search
    if params[:stock].present?
      params[:stock].upcase!
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end 
      else
        respond_to do |format| 
          flash.now[:alert] = "Please enter a valid ticker to search!"
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format| 
        flash.now[:alert] = "Please enter a ticker to search!"
        format.js { render partial: 'users/result' }
      end
    end
  end

end
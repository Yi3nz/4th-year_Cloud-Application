class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private
    def search_params
      params.require(:search).permit(:keywords, :date_of_birth, :address, :phone_no,
                                      :infection, :injury, :min_consultation, :max_consultation)
    end

end

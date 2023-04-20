class Meneger::StoresController < ApplicationController
  def index
    @store = Store.all    
  end  
end


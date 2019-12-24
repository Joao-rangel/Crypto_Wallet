class WelcomeController < ApplicationController
  def index
    @nome_usuario = params[:nome]
  end
end

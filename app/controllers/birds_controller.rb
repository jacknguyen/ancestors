# frozen_string_literal: true

class BirdsController < ApplicationController
  def index
    if params[:q]
      render json: Bird.find_by_ancestors(params[:q])
    else
      head :ok
    end
  end
end

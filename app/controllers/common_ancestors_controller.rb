# frozen_string_literal: true

class CommonAncestorsController < ApplicationController
  def index
    if params[:a] && params[:b]
      a = CommonAncestor.nodes(params[:a])
      b = CommonAncestor.nodes(params[:b])

      render json: LowestCommonAncestor.call(a, b)
    else
      head :ok
    end
  end
end

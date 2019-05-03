# frozen_string_literal: true

class Api::MagesController < ApplicationController
  respond_to :json

  def index
    respond_with Mage.order(mage_date: :DESC)
  end

  def show
    respond_with Mage.find(params[:id])
  end

  def create
    respond_with :api, Mage.create(mage_params)
  end

  def destroy
    respond_with Mage.destroy(params[:id])
  end

  def update
    mage = Mage.find(params['id'])
    mage.update(mage_params)
    respond_with Mage, json: mage
  end

  private

    def mage_params
      params.require(:mage).permit(
        :name
      )
    end
end

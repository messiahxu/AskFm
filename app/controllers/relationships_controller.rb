class RelationshipsController < ApplicationController
  before_action :signed_in_user?, only: [:create, :destroy]

  def create
    @user = User.find(params[:user_id])
    respond_to do |format|
      if current_user.follow!(@user)
        format.js
        format.json { render json: {'relationship-id' => relationship_id(@user) } }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])

    respond_to do |format|
      if current_user.unfollow!(@user)
        format.json { render json: {}}
      else
        format.json { render json: {}}
      end
    end
  end
end

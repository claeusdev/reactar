module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorized, only: [:auto_login]
      
      def create
        @user = User.create(user_params)
        if @user.save
          render json: UserSerializer.new(@user).serialized_json
        else
          render json: {error: @user.errors.messages}, status: 422
        end
      end

      def login
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
          render json: UserSerializer.new(@user).serializable_hash
        else
          render json: {error: "Invalid username or password"}, status: 422
        end
      end

      def auto_login
        render json: @user
      end


      private

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end

    end
  end
end
class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show, :edit]

	def index
	    # (params[:q])に検索パラメーターが入り、Productテーブルを検索する@qオブジェクトを生成
	    @search = User.ransack(params[:q])
	    # 検索結果を表示
	    @results = @search.result.page(params[:page]).reverse_order.per(10)
	end

	def show
		@user = User.find(params[:id])
		@post_images = @user.post_images.page(params[:page]).reverse_order
		@post_comment = PostComment.new
	end

  def following
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end



	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to root_path
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	def destroy
	    @user = User.find(params[:id])
    	@user.destroy
    	redirect_to user_path(@user.id)
	end

	private
	def user_params
		params.require(:user).permit(:name ,:fav_manga ,:fav_illust, :profile_image)
	end
end

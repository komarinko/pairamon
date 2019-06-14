class UsersController < ApplicationController
	def index
	    # (params[:q])に検索パラメーターが入り、Productテーブルを検索する@qオブジェクトを生成
	    @search = User.ransack(params[:q])
	    # 検索結果を表示
	    @results = @search.result.page(params[:page]).reverse_order.per(20)
	end

	def show
		@user = User.find(params[:id])
		@post_images = @user.post_images.page(params[:page]).reverse_order
		@post_comment = PostComment.new
	end

	def edit
		@user = User.find(params[:id])
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
    	redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:name ,:fav_manga ,:fav_illust, :profile_image)
	end
end

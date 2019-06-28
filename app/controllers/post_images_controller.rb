class PostImagesController < ApplicationController
	def top
	end

	def new
		@post_image = PostImage.new
	end

	def create
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		if @post_image.save
		redirect_to user_path(current_user.id)
		else
          render :new
        end
	end

	def index
	    # (params[:q])に検索パラメーターが入り、Productテーブルを検索する@qオブジェクトを生成
	    @search = PostImage.ransack(params[:q])
	    # 検索結果を表示
	    @results = @search.result.page(params[:page]).reverse_order.per(30)
	end

	def show
		@post_image = PostImage.find(params[:id])
		if @post_image.user.id != current_user.id
			redirect_to root_path
		end
	end

	def destroy
		@post_image = PostImage.find(params[:id])
		@post_image.destroy
		redirect_to user_path(current_user.id)
	end

	private
    def post_image_params
        params.require(:post_image).permit(:image, :caption)
    end

end

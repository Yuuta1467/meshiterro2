class Public::LikesController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @post_comment = PostComment.find(params[:post_comment_id])
    @like = Like.create(user_id: current_user.id, post_image_id: @post_image.id, post_comment_id: @post_comment.id)
    #redirect_back(fallback_location: root_path)
    #redirect_to post_path(@post_comment.post)
    #非同期通信のためコメントアウト
  end


  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    @post_comment = PostComment.find(params[:post_comment_id])
    Like.find_by(user_id: current_user.id, post_image_id: @post_image.id, post_comment_id: @post_comment.id).destroy
    #redirect_back(fallback_location: root_path)
    #redirect_to post_path(@post_comment.post)
    #非同期通信のためコメントアウト
  end

end

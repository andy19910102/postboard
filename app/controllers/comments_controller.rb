class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    #post_id means to find out that which is this post in the db.
    @comment = @post.comments.build(params.require(:comment).permit(:content))
    @comment.user = current_user
    #for who make the comments
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end
end
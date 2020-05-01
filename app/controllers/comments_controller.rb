class CommentsController < ApplicationController
  def create
    @comment = Current.account.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.any(:html, :js)
      else
        format.html { render action: :new }
        format.js { render head: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :creator_id, :commentable_id)
  end
end

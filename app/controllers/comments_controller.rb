class CommentsController < InheritedResources::Base

  private

    def comment_params
      params.require(:comment).permit(:user_name, :body, :photo_id)
    end
end


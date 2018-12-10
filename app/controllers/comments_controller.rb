class CommentsController < InheritedResources::Base
  before_action :authenticate_user!

  def edit
  end


  private

    def comment_params
      params.require(:comment).permit(:user_name, :body, :photo_id)
    end
end

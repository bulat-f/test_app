module PostsHelper

  def admin_user
    unless current_user.admin?
      redirect_to posts_path
    end
  end
end

module PostsHelper
  def post_created_at(post)
    post.created_at.strftime("%d-%m-%y").to_s.split[0]
  end

  def post_category(post)
    return unless post.category.present?
    raw '<span class="text-'+post.category.color+'"><i class="fa '+post.category.icon+'"></i> '+post.category.name.capitalize+'</span>'
  end

  def post_public(post)
    post.public ? 'Public' : 'Private'
  end
end

get "/tag/:tag_name" do
  @posts = Tag.find_by_name(params[:tag_name]).posts.map {|post| post.id}

  erb :list
end


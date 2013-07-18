get "/tag/:tag_name" do
  @posts = Tag.find_by_name(params[:tag_name]).posts.map {|post| post.id}

  erb :list
end


# <% if @posts.any? %>
# <% @posts.each do |post| %>
#   <div id=""><%= post %> </div>
#   <% end %>

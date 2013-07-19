class Post < ActiveRecord::Base
	validates :title, :presence => true
	validates :body, :presence => true

	has_many :post_tags
	has_many :tags, through: :post_tags

	def tags=(tag_array)
		tag_array.each do |id, tag_params|
			tag = self.tags.build(:name => tag[:name])
		end
	end
end

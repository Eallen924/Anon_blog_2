class Post < ActiveRecord::Base
	validates :title, :presence => true
	validates :body, :presence => true

	has_many :post_tags
	has_many :tags, through: :post_tags
	belongs_to :user

	def tags=(tag_array)
		tag_array.each do |id, tag_params|
			tag = self.tags.build(:name => tag[:name])
		end
	end

	def self.postify(hash)
		author = User.find(hash[:user_id])

		self.create(author: author.name ,
								title: hash[:title],
								body: hash[:body],
								user_id: hash[:user_id])
	end
end

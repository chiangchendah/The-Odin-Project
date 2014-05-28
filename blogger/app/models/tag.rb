class Tag < ActiveRecord::Base
	has_many :taggings
	# allows for `tag.articles`
	has_many :articles, through: :taggings

	# delegate attribute `name` when using the `join` method on `tags`
	# def to_s
	#   name
	# end
end

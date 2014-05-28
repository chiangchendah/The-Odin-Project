class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	# express a has_many relationship through a has_many relationship
	# allows `article.tags`
	has_many :tags, through: :taggings

	# article method for form filling
	# converts all tag object per article instance into an array
	def tag_list
		# for an instance of Article, do this
		# invoke the given block once for each element of `self`
		self.tags.collect do |tag|
			tag.name
		end.join(", ")

		# tags.join(", ")
		# the `join` method converts each element in the array to a string, 
		# separated by the given `separator`. But it calls the `to_s` method on our object `tags`
	end

	# virtual attributes `tag_list=` takes a parameter `tags_string`
	# `tag_string` is the string of text entered in the text_field 
	# allows the form to set `tag_list` to an article instance
	def tag_list=(tags_string)
		# splits array, strips non-meaningful whitespace, case insensitive, no duplicates
		tag_names = tags_string.split(",").collect{ |s| s.strip.downcase }.uniq
		
		# find or create tag with cleaned up names from array string
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		
		# assign tags to article instance
		self.tags = new_or_found_tags 	
	end
end

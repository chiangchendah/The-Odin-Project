class ArticlesController < ApplicationController
	# helper method for strong parameters
	include ArticlesHelper
	
	# default main page
	def index
		@articles = Article.all
	end

	# display processed data
	def show
		@article = Article.find(params[:id])
	end

	# display form 
	def new
		# reflection technique to tell object attributes
		@article = Article.new
	end

	# process data from client
	def create
		# pull out form data
		@article = Article.new(article_params)
			
			# redundant. input hash has same structure as output
			#title: params[:article][:title],
			#body: params[:article][:title])
		
		# alternate syntax
		#@article.title = params[:article][:title]
		#@article.body = params[:article][:body]
		
		@article.save

		#flash
		flash.notice = "Article '#{@article.title}' Created!"

		# don't want a view template for this action, redirect to show
		redirect_to article_path(@article)
	end

	def destroy
		# find the article
		@article = Article.find(params[:id])
		@article.destroy

		

		#flash
		flash.notice = "Article '#{@article.title}' Deleted!"

		# redirects to index page
		redirect_to articles_path
		fail
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		# update automatically saves the changes

		#flash
		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end

end

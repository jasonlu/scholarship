class ProfileController < ApplicationController
	
	before_filter :authenticate_user!

	def index

		@user = current_user

	end

	def update

		@post = Post.new(params[:post])
    @user = current_user
    @user = @post
    @user.save
    
		respond_to do |format|
			if @post.save
				format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
				format.xml  { render :xml => @post, :status => :created, :location => @post }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
			end
		end

	end

end

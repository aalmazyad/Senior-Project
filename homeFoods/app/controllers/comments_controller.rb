class CommentsController < ApplicationController
	  def create
	    @comment_hash = params[:comment]
	    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
	    # Not implemented: check to see whether the user has permission to create a comment on this object
	    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
	    if @comment.save
	      render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
	    else
	      render :js => "alert('error saving comment');"
	    end
	  end
	end

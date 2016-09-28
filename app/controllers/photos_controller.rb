class PhotosController < ApplicationController
	def create
		@place = Place.find(params[:place_id])
		@place.comments.create(comments_params.merge(user:current_user))
		redirect_to place_path(@place)
	end
end

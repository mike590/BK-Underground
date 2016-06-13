class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	# For every action in the system check that the user is signed in
	# skip this check on devise and RailsAdmin to grant the user access to sign in page
	# before_filter :authenticate_user!, unless: :is_utility_controller?
	# This method finds out if the current controller is a devise or rails admin controller.
	# if its one of them we will skip the :authenticate_user! before filter
	def is_utility_controller?
		!!(self.class.name =~ /^(RailsAdmin|Devise)::/)
	end


end

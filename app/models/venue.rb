class Venue
	include Mongoid::Document
	include Mongoid::Timestamps
	# including Dynamic will allow you to set fields not defined below
	# include Mongoid::Attributes::Dynamic

	# include ActiveModel::Validation


	field :name, type: String
	field :address, type: String
	field :phone_number, type: String
	field :website_url, type: String
	field :neighborhood, type: String
	field :twitter_url, type: String
	field :facebook_url, type: String
	field :instagram_url, type: String
	field :email, type: String
	field :other, type: String

end
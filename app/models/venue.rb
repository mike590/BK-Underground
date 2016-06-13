class Venue
	include Mongoid::Document
	# include ActiveModel::Validation

	field :name, type: String
	field :address, type: String

end
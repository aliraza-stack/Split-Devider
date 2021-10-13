class Group < ApplicationRecord
	belongs_to :user
	has_many :entries
	has_many :members
	accepts_nested_attributes_for :entries
end

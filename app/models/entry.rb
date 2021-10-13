class Entry < ApplicationRecord
	belongs_to :user
	belongs_to :group, optional: true
	validates_presence_of :name,:description,:price
end

module ApplicationHelper
	def sum_of_prices(group)
		group.entries.sum(:price)
	end
end

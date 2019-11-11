class CheckOut
  attr_accessor :rate_list, :cart

	def initialize(rates)
		@rate_list = Hash.new 
		@cart = Hash.new 
    rules = rates
    
    rules.each do |rule|
			rule = rule.split(" ")
			
			rule.delete("for")
			rule.delete("or")

			# Item Name
			rate_list[rule[0]] = {} 
			
			rule.each_with_index do |element, index|
				if index == 1
					rate_list[rule[0]][index] = rule[index].to_i # Saving price of 1 unit 
				elsif index > 1 && index%2 == 0
					rate_list[rule[0]][rule[index].to_i] = rule[index+1].to_i
				end
			end

			rate_list[rule[0]] = rate_list[rule[0]].sort_by { |key, value| key }.reverse.to_h
		end

	end

	def scan(item)
		return if item.nil?

		cart[item].nil? ? cart[item] = 1 : cart[item] += 1		
	end

	def total
		price = 0
		cart.each do |item, quantity|
			price = price + get_cost(item, quantity)
		end
		price
	end
	
	private

	def get_cost(item, quantity)
		item_cost = 0
		
		rate_list[item].each do |q, cost| # q = Rule Quantity of an Item
			if quantity > 0 && quantity / q >= 1
				nos = quantity / q
				item_cost = item_cost + (cost * nos) 
				quantity = quantity % q
			end
		end
		item_cost
	end
end

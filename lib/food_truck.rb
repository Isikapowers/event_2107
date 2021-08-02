class FoodTruck

   attr_reader :name,
               :inventory

  def initialize(name)
    @name = name
    @inventory = {}

  end

  def check_stock(item, amount=0)
    total = 0
    @inventory.each do |item, amount|
      total += amount
    end
    total
  end

  def stock(item, amount)
    if inventory[item].nil?
      inventory[item] = amount
    elsif !inventory[item].nil?
      inventory[item] += amount
    end
  end

  def potential_revenue
    @inventory.sum do |item, amount|
        amount * item.price
    end
  end

end

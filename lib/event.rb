class Event

  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.map do |food_truck|
       food_truck.inventory.map do |item, amount|
          if item == item && amount != 0
            food_truck
          end
       end
     end.flatten
  end

  def total_inventory
    total = 0
    trucks = []
    hash = {}

    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        if hash[item].nil?
          total = amount
          trucks << food_truck
        elsif !hash[item].nil?
          total += amount
          trucks << food_truck
        end
        hash[item] = {quantity: total, food_trucks: trucks}
      end
    end
    hash
  end

  def overstocked_items
    total_inventory.find_all do |item, i|
      item if i[:quantity] > 50 && i[:food_trucks].length > 1
    end.flatten
  end

  def sorted_item_list
    sort = []
    total_inventory.each do |item, i|
      sort << item.name.sort
    end
    sort.uniq
  end


end

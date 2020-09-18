class Waiter
attr_accessor :name, :year_experience
@@all = []

def initialize(name, year_experience)
    @name = name 
    @year_experience = year_experience
    @@all << self
end 

def self.all 
    @@all
end 

def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
end 

def meals
    Meal.all.find_all {|meal| meal.waiter == self}
end 

def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
    end
      best_tipped_meal.customer
    end

end
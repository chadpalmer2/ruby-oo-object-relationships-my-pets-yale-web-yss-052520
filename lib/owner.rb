class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  def pick_pets(klass)
    klass.all.select {|pet| pet.owner == self}
  end

  def cats
    pick_pets(Cat)
  end

  def dogs
    pick_pets(Dog)
  end

  def buy_animal(klass, name)
    klass.new(name, self)
  end

  def buy_cat(name)
    buy_animal(Cat, name)
  end

  def buy_dog(name)
    buy_animal(Dog, name)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

# helpers

  def sell_dogs
    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def sell_cats
    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end
  end 

# end

  def sell_pets
    sell_dogs && sell_cats
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
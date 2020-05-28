class Owner
  attr_accessor
  attr_reader :name, :species
  attr_writer

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
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
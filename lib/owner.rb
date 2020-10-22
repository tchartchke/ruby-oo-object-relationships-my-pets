class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a #{species}."
  end

  def cats
    Cat.all.select{ |pet| pet.owner == self }
  end

  def dogs
    Dog.all.select{ |pet| pet.owner == self }
  end

  def buy_cat(pet_name)
    Cat.new(pet_name, self)
  end

  def buy_dog(pet_name)
    Dog.new(pet_name, self)
  end

  def walk_dogs
    dogs.map{ |pet| pet.mood = "happy"}
  end

  def feed_cats
    cats.map{ |pet| pet.mood = "happy"}
  end

  def sell_pets
    dogs.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end

    cats.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end

end
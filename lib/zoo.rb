require_relative "cage"

class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :season_opening_date, :season_closing_date, :cages, :employees

  def initialize(name, opening_date, closing_date)
    @name = name
    @season_opening_date = opening_date
    @season_closing_date = closing_date
    @employees = []
    @cages = []
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(employee)
    @employees << employee
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        return cage.animal = animal
      end
    end
    raise ZooAtCapacity
  end

  def visit
    message = ""
    @cages.each do |cage|
      unless cage.empty?
        message << "#{cage.animal.speak}\n"
      end
    end
    @employees.each do |employee|
      message << "#{employee.name} waved hello!\n"
    end
    message
  end

  def open?(date)
    (date < @season_closing_date) && (date > @season_opening_date)
  end
end

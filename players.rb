class Player

  attr_reader :name, :lives
  attr_writer :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

end
class Player
  attr_accessor :current 
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
  end
end
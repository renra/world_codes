require_relative 'array'

# A Trivialized Life of a Human
class Human

  attr_reader :consciousness

  def initialize(karma_from_past_lives = 1)
    # + values represent leaning towards Unselfish Love
    # - values represent leaning towards selfishness
    self.consciousness = karma_from_past_lives
    @to_be_interpreted = []
  end

  def live
    while @consciousness > -100 && @consciousness < 100
      print_state

      gain_experience
      interpret_experience
    end
  end

  def print_state
    case @consciousness
    when (80..100)
      puts "Really close to Enlightenment"
    when (50...80)
      puts "Living a very good life. Suffering no longer takes effect"
    when (0...50)
      puts "Growing in the light"
    when (-50..0)
      puts "Getting negative"
    when (-80...-50)
      puts "Became a very selfish person"
    when (-100...-80)
      puts "Hardened in darkness"
    end
  end

  # + good things happen
  # - bad things happen
  def gain_experience
    enqueue_experience(Random.rand(10) - 4.5)
  end

  def enqueue_experience(experience)
    @to_be_interpreted.unshift(experience)
  end

  def interpret_experience
    while !@to_be_interpreted.empty?
      self.consciousness += @to_be_interpreted.pop
    end
  end

  def consciousness=(_consciousness)
    @consciousness = _consciousness

    if @consciousness == 0
      @consciousness = [-1, 1].rand
    end

    puts "Current level of consciousness: #{@consciousness}"
  end
end

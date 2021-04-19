class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    if pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
      return true
    else 
      false
    end
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map { |peg| peg.upcase }
    else
      raise "Invalid pegs"
    end
  end

  def self.random(num)
    pegs = []
    num.times { pegs << POSSIBLE_PEGS.to_a.sample[0] }
    Code.new(pegs)
  end

  def self.from_string(peg_string)
    pegs = peg_string.split("")
    Code.new(pegs)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    matches = 0
    @pegs.each.with_index { |peg, i| matches += 1 if peg == guess[i] }
    matches
  end

  def num_near_matches(guess)
    matches = 0
    not_exact_pegs = []
    not_exact_guess = []
    @pegs.each.with_index do |peg, i| 
      if peg != guess[i]
        not_exact_pegs << peg
        not_exact_guess << guess[i]
      end
    end
    not_exact_guess.each { |ele| matches += 1 if not_exact_pegs.include?(ele) }
    matches

  end

  def ==(other_code)
    return false if self.length != other_code.length
    self.pegs == other_code.pegs
  end
end

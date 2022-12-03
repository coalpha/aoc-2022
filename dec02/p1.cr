enum Shape : UInt8
   Rock
   Paper
   Scissors

   def self.new(c : Char)
      case c
      when 'A', 'X' then Shape::Rock
      when 'B', 'Y' then Shape::Paper
      when 'C', 'Z' then Shape::Scissors
      else
         raise Exception.new("Unknown character #{c}!")
      end
   end
end

struct Game
   property you, opponent

   @you : Shape
   @opponent : Shape

   def initialize(s : String)
      opponent, _, you = s.chars
      @you = Shape.new you
      @opponent = Shape.new opponent
   end

   alias Score = UInt32

   def play: Score
      case @you
      in Shape::Rock
         case @opponent
         in Shape::Rock     then 4_u32
         in Shape::Paper    then 1_u32
         in Shape::Scissors then 7_u32
         end
      in Shape::Paper
         case @opponent
         in Shape::Rock     then 8_u32
         in Shape::Paper    then 5_u32
         in Shape::Scissors then 2_u32
         end
      in Shape::Scissors
         case @opponent
         in Shape::Rock     then 3_u32
         in Shape::Paper    then 9_u32
         in Shape::Scissors then 6_u32
         end
      end
   end
end

class Plan < Array(Game)
   def initialize(filename : String)
      super()
      File.each_line(filename) do |line|
         self << Game.new line
      end
   end
end


def get_total_score(p)
   p.map {|game| game.play}.sum
end

example_total = get_total_score(Plan.new "example.txt")

if example_total != 12
   raise Exception.new("Expected the example total to be 12 intead of #{example_total}")
end

# puts get_total_score(Plan.new "input.txt")

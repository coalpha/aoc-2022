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

enum Shape : UInt8
   Rock     = 65
   Paper    = 66
   Scissors = 67
end

enum Outcome : UInt8
   Lose = 88
   Draw = 89
   Win  = 90
end

struct Game
   def initialize(line : String)
      left, _, right = line.chars.map(&.bytes[0])
      initialize Shape.new(left), Outcome.new(right)
   end

   def initialize(@opponent : Shape, @outcome : Outcome)
   end

   alias Score = UInt32

   def play: Score
      case @opponent
      in Shape::Rock
         case @outcome
         in Outcome::Lose   then 3_u32
         in Outcome::Draw   then 4_u32
         in Outcome::Win    then 8_u32
         end
      in Shape::Paper
         case @outcome
         in Outcome::Lose   then 1_u32
         in Outcome::Draw   then 5_u32
         in Outcome::Win    then 9_u32
         end
      in Shape::Scissors
         case @outcome
         in Outcome::Lose   then 2_u32
         in Outcome::Draw   then 6_u32
         in Outcome::Win    then 7_u32
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

   def tally
      self.map {|game| game.play}.sum
   end
end

puts Plan.new("input.txt").tally

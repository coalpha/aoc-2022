require "./shared"

def get_total_score(p)
   p.map {|game| game.play}.sum
end

example_total = get_total_score(Plan.new "example.txt")

if example_total != 15
   raise Exception.new("Expected the example total to be 15 intead of #{example_total}")
end

puts get_total_score(Plan.new "input.txt")

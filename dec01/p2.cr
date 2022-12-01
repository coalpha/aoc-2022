top = [0_u32, 0_u32, 0_u32]

acc: UInt32 = 0

by_line = ->(line : String) {
   if line.empty?
      top << acc
      top.unstable_sort! { |x, y| y <=> x }
      top.truncate(0..2)
      acc = 0
   else
      acc += UInt32.new(line)
   end
}

File.read_lines("input.txt").each &by_line

by_line.call ""

puts "The top 3 elves carry #{top.sum} calories all together"

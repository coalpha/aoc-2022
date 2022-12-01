big_elf: UInt32 = 0
acc: UInt32 = 0

File.each_line "input.txt" do |line|
   if line.empty?
      if acc > big_elf
         big_elf = acc
      end

      acc = 0
      next
   end

   acc += UInt32.new(line)
end

puts "The elf carrying the most calories has #{big_elf} calories!"

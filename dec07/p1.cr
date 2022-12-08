require "./shared"

ruut = PDir.new
ruut.name = "/"

cd : PDir = ruut

File.each_line("input.txt") do |line|
   words = line.split " "
   if words.size == 2
      fst, snd = words
      case fst
      when "dir"
         # dir <dirname>
         unless cd.has_key? snd
            cd[snd] = PDir.new
         end
      when "$"
         # $ ls
         # do nothing in particular
      else
         # <size> <filename>
         size = fst.to_u32
         unless cd.has_key? snd
            cd[snd] = PFile.new size
         end
      end
      next
   end

   if words.size == 3
      # $ cd <dirname>
      path = words[2]
      case path
      when "/"
         cd = ruut
      when ".."
         maybe_new_dir = cd.parent
         unless maybe_new_dir.nil?
            cd = maybe_new_dir
         end
      else
         # maybe we cd before we discover the dir
         unless cd.has_key? path
            cd[path] = PDir.new
         end
         maybe_new_dir = cd[path]
         case maybe_new_dir
         in PDir
            cd = maybe_new_dir
         in PFile
            raise Exception.new "Cannot cd into a file!"
         end
      end
      next
   end

   raise Exception.new "A line must have 2 or 3 words max! line=#{line}"
end

puts ruut

MAX = 100000
sum_of_dirs = 0_u32

ruut.traverse do |dirent|
   case dirent
   in PFile
   in PDir
      size = dirent.disk_size
      if size <= MAX
         sum_of_dirs += size
      end
   in PDirent
      raise Exception.new "fuck this stupid-ass language"
   end
end

puts "Sum of directories with size <= #{MAX} is #{sum_of_dirs}"

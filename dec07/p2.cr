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

used_dick = 0_u32
ruut.traverse do |fuckingbitch|
   case fuckingbitch
   in PDir
   in PFile
      used_dick += fuckingbitch.disk_size
   in PDirent
      raise Exception.new "FUCK YOU YOU MISERABLE PIECE OF GARBAGE AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
   end
end

# if you comment this out it won't link
# puts ruut

TOTAL_DICK = 70000000
MINIMUM_DICK = 30000000

free_disk = TOTAL_DICK - used_dick
neededick = MINIMUM_DICK - free_disk

small_large_AAAAAAAAAAAAAAA = TOTAL_DICK
ruut.traverse do |pineapplepen|
   case pineapplepen
   in PFile
   in PDir
      sz = pineapplepen.disk_size
      if sz >= neededick
         if sz < small_large_AAAAAAAAAAAAAAA
            small_large_AAAAAAAAAAAAAAA = sz
         end
      end
   in PDirent
      raise Exception.new "I AM GOING TO fucking e"
   end
end

puts small_large_AAAAAAAAAAAAAAA

require "../crutils"

struct PFile
   @name : String
   property name;

   def initialize(@disk_size : UInt32)
      @name = "???"
   end

   getter disk_size;
   def to_s(io : IO)
      io.puts "- #{@name} (file, size=#{@disk_size})"
   end

   def []=(k, v)
      raise Exception.new "Cannot set dirent on file!"
   end
end

class PDirGeneric(T) < Hash(String, T)
   @name : String
   property name;
   @parent : PDirGeneric(T) | Nil
   property parent;

   def initialize
      @name = "???"
      super()
   end

   def to_s(io : IO)
      io.puts "- #{@name} (dir, size=#{disk_size})"
      sub_io = IIO.new(io, 2)
      each_value do |dirent|
         dirent.to_s sub_io
      end
   end

   def []=(k : String, v : PFile)
      v.name = k
      super(k, v)
   end

   def []=(k : String, v : PDirGeneric)
      v.name = k
      v.parent = self
      super(k, v)
   end

   def disk_size: UInt32
      map(&.last).map(&.disk_size).sum()
   end

   def traverse(&block : T ->) : Nil
      each do |(k, v)|
         yield v
         case v
         in PFile
            next
         in PDirGeneric(T)
            v.traverse(&block)
         end
      end
   end
end

alias PDirent = PFile | PDirGeneric(PDirent)
alias PDir = PDirGeneric(PDirent)

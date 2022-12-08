require "../crutils"

struct PFile
   @name : String
   setter name;

   def initialize(@size : UInt32)
      @name = "???"
   end

   def to_s(io : IO)
      io.puts "- #{@name} (file, size=#{@size})"
   end

   def []=(k, v)
      raise Exception.new "Cannot set dirent on file!"
   end
end

class PDirGeneric(T) < Hash(String, T)
   @name : String
   setter name;
   @parent : PDirGeneric(T) | Nil
   property parent;

   def initialize
      @name = "???"
      super()
   end

   def to_s(io : IO)
      io.puts "- #{@name} (dir)"
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
end

alias PDirent = PFile | PDirGeneric(PDirent)
alias PDir = PDirGeneric(PDirent)

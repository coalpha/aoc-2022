# cruddy utils
class IIO < IO
   def initialize(@pio : IO, @indent : UInt32)
   end

   def read(slice : Bytes)
      @pio.read slice
   end

   def write(slice : Bytes) : Nil
      @pio.write slice
   end

   def puts(s : String)
      @pio.puts "#{" " * @indent}#{s}"
   end
end

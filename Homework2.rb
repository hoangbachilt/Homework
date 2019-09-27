class Prime
  def initialize(max_range,dest)
    @hash = {}
    @dest = dest
    (2..max_range).each do |i|
      @hash[i] = i
    end
  end
  def solution
    index = 0
    item = 2
    result = 0
    loop do
      i = 0
      @hash.each{|k, v|
        i += item
        @hash.delete(i) if @hash[i]
      }
      return result if index == @dest
      return "Not found in 2..range #{max_range}" if @hash.empty?
      item = @hash.first[0]
      index += 1
      result = item
    end
  end
end

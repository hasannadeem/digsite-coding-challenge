class Code4
  attr_accessor :strs

  def initialize
    @strs = [
      "1ab2345cd -- 67 e f --g --- - 89",
      "12-34 56--78 90",
      "00-44 48 5555 8361",
      "0 - 22 1985--324",
      "blah1--",
      "1234567",
      "123bcxcv456wqw78",
      "123bcxcv456wqw78a0",
      "1234"
    ]
  end

  def solution(str)
    str = str.tr('^0-9', '')

    if str.length <= 1
      return "*ERROR* not enough digits"
    elsif str.length > 100
      return "*ERROR* too many digits"
    end

    if str.length % 3 == 1
      str = str.scan(/.{1,3}/).join("-")
      str[str.length - 3], str[str.length - 2] = str[str.length - 2], str[str.length - 3]
    else
      str = str.scan(/.{2,3}/).join("-")
    end

    str
  end

  def driverMethod
    @strs.each do |str|
      puts "- RESULT: #{solution(str)}"
    end
  end
end

testVar = Code4.new
testVar.driverMethod

require 'benchmark/ips'

class Code1
  def initialize
    @arrs = [ [-5, -3, 0, 1, 3], [6,5,1,2,4], [1,3,2,6,3,5,4], [-5,0,-3], [1,2,3], [3,2,1], [1,3,4], [4,1,3], [-1,-5],
    [3,4,4,6,3], [-1,0,-1,0,1,0], (-1000..1000).to_a, (-10..100).to_a + (102..150).to_a ]
  
  end

  def smallest_absent_int(array)
    array = array.select{ |element| element > 0 }.sort.uniq
    counter = 1
    
    array.each do |element|
      break if counter < element

      counter += 1
    end
    
    counter
  end

  def smallest_absent_int_2(array)  
    counter = 1
    hash = Hash.new
  
    array.each do |element|
      if counter < element
        hash[element] = 1

      elsif counter == element
        counter += 1
        unless hash[counter].nil?
          hash.delete(counter) 
          counter += 1
        end

      end
    end

    counter += 1 if array.include?(counter)
   
    counter
  end 

  def driverMethod
    @arrs.each do |arr|

      Benchmark.ips do |x|
        x.report('smallest absent with sorting') { smallest_absent_int(arr) }
        x.report('smallest absent with hash') { smallest_absent_int_2(arr) }
        x.compare!
      end
  
    end 

  end

end

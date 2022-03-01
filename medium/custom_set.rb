require "pry"
=begin
  - create a custom set type
      - we will define our own data structure
      - assume all elements of a set must be numbers
      - do not use the built-in implementation for Set        

At instantiation we can optionally pass an array 
   - set set to default empty array

Method: Instance method Subset
input: CustomSet object
output: boolean

- takes a CustomSet object as an argument
- checks if the calling object contains the set passed as an argument
   as a subset 
- need to iterate over the set, return true if there's a matching subset

Method: disjoint?
input: CustomSet object
output: boolean

- takes a CustomSet object as an argument
- checks if the calling object and the argument have overlapping elements
    - return true if not, false, otherwise
- empty array are valid
    - two empty array should return true 

Method: eql?
input: CustomSet
output: bool

- check if the argument object array contains the same elmeents as the calling object array
    - matching duplicate elements do not matter 
    - return true for two empty arrays

- check the sizes
    - iterate over the longer array
        - if every element matches return true     

Method: add
input: integer
output: object

push the argument to the arr


Method: self.intersection
input: object
output: new CustomSet with array of intersecting elements


Checking for intersecting elements?
- if either the argument or caller are empty, return object with empty array
- if there are intersecting elments, return an object with an array of intersecting elements


- determine the longer array 
   - iterate over it 
       - check if the element matches the elements in another array
            - if it does, add it to a new array
  - ruturn a new CustomSet object with the array as the argument at instantiation

Method: Difference
input: CustomSet object
output: CustomSet object

- return an array of differing elements between the caller and the argument objects

- if the caller is empty, return an empty array
- if the argumnet is empty, return the calling array

- iterate over the calling array
    - if the shorter array does not conain an element add it to a return array
- return a new CustomSet with the return array as the argument 

Method:union
input: CustomSet object
output: CustomSet object

- return new array if caller and argument are both empty
- return new array with the caller and argument arrays joined
    if either array contains any elements
- return array must contain uniq elements  
     - sorted 


=end

class CustomSet
  attr_reader :arr

  def initialize(arr=[])
    @arr = arr
  end

  def empty?
    arr.empty?
  end

  def contains?(int)
    arr.include?(int)
  end

  def subset?(subset)
    return true if empty?
    (0...subset.arr.size).each do |strt|
      (0...subset.arr.size).each do |stp|
        return true if subset.arr[strt..stp] == arr
      end
    end
    false
  end

  def disjoint?(other_set)
    return true if empty? && other_set.empty?
    long, short = detrmine_longer_arr(arr, other_set.arr)

    long.each do |el1|
      short.each do |el2|
        return false if el1 == el2
      end
    end
    true
  end

  def eql?(other_set)
    return true if empty? && other_set.empty?
    iterator, comparator = detrmine_longer_arr(arr, other_set.arr)
      
    iterator.each do |el|
      return false unless comparator.include?(el)
    end
    true
  end
  
  def add(int)
    arr.push(int) unless contains?(int)
    self
  end

  def ==(other)
    arr == other.arr
  end

  def intersection(set)
    return CustomSet.new if arr.empty? || set.arr.empty?
    long, short = detrmine_longer_arr(arr, set.arr)
    return_array = []

    long.each do |el1|
      short.each do |el2|
        return_array << el1 if el1 == el2
      end
    end

    CustomSet.new(return_array)
  end

  def difference(set)
    return CustomSet.new if arr.empty?
    return CustomSet.new(arr) if set.arr.empty? 
    return_array = []
  
    arr.each do |el|
      return_array << el unless set.arr.include?(el)
    end

    CustomSet.new(return_array)
  end


  def union(set)
    return_array = (arr | set.arr).sort
    CustomSet.new(return_array)
  end

  protected

  def detrmine_longer_arr(arr1, arr2)
    if arr1.size >= arr2.size
      iterator = arr
      comparator = arr2
    else
      iterator = arr2
      comparator = arr
    end
    [iterator, comparator]
  end
end

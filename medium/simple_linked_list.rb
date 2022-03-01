=begin
Problem: Write a singly linked list - used to represent a LIFO stack
    - "Last in first out"

each element in the list contains data an da "next" field pointing to the next element in the list of elements
    - elements may contain a range of data such as numbers 1-10
    - provide functions to reverse the linked list, and convert linked list to and from an array

Unclear:
 linked list - linear colleciton of data elements
      - not organized by index
    nodes contain data and a regerence to the next node in the sequence
       - a node can be represented by a tuple

classes/methods:
Element class
datum instance method
tail? instance method
next instance method
   - this is how we advance to the next node
constructor
- 1st arg is an integer
- 2nd arg is the next element

SimpleLinkedList class
size instance method
empty? instance method
peek instance method
push instance method 
head instance method 
    - returns an Element instance
pop instance method
from_a class method
     - takes an object 
     - returns a range
to_a

Method: Initialize for Element
intput: integer, object
output: none

takes an integer to represent the data point for a node
takes an optional second argument
     - the link to the next node

Method: datum
returns the value of @data for the object

Method: tail?
returns boolean
- checking if the current object is the last node? ("the tail" of the linked list?)
- if the next node is nil, then the current node is the tail

Method: next
returns the next node
the next node points to the previously pushed element in an array
- returns an object 


unlcear?
Currently, the Element class has no knowledge of SimpleLinkedList
   - how do we reference the next object?
        - the second argument at instantiation should contain the reference to the next node, however, how does this work with SimpleLinkedList#push ?


=end


class Element
  def initialize(data, next_node=nil)
    @data = data
    @next_node = next_node
  end

  def datum
    @data
  end

  def tail?
    @next_node == nil
  end

  def next
    @next_node
  end
end

=begin

Method: Constructor
- initializes empty array

Method: size
returns the size of the @list array

Method: empty?
checks if the @list array contains any values

Method: push
input: integer
pushes new Element object onto list

if the list is empty? then push a new object onto the list
    - later elements initialize the next node to the previoud element in the list (or stack)
   - if the list is empty, pass one argument for the object at instantiation
       - if the list is not empty
            - pass the head element as the second argument


Method: peek
"peeks" at the data point of the last value of the @list array

Method: head
returns Element collaborator object
   - last object in the list

Method: pop
removes the top element from the list
- returns the data point of the popped element

Method: from_a
input: array object
output: array

rules:
 - explicit:
     - takes an array object
     - if input is empty array or nil
          - return SimpleLinkedList object
     
[1, 2]          
[1, [2, 1]]




=end



class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(int)
    if empty?
      @list << Element.new(int)
    else
      @list << Element.new(int, head)
    end
  end

  def peek
    return nil if empty?
    head.datum
  end

  def head
    @list.last
  end

  def pop
    @list.pop.datum
  end

  def self.from_a(collection)
    simple = SimpleLinkedList.new
    return simple if collection.nil? || collection.empty?
    
    collection.each do |el|
      simple.list.push(el)
    end
  end

  def to_a; end
end


list = SimpleLinkedList.new
p SimpleLinkedList.from_a([1, 2])


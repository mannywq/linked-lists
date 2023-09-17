class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize(value = 0)
    node = Node.new(value)
    @head = node
    @tail = node
    @index = 0
    @size = 1
  end

  def append(value)
    node = Node.new(value)
    @tail.next = node
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = Node.new(value)
    node.next = @head

    @head = node

    @size += 1
  end

  def at(index)
    return @head if index.zero?

    i = 0
    node = @head

    loop do
      node = node.next
      i += 1

      break if i == index
    end
    node
  end

  def pop
    node = @head

    loop do
      node = node.next

      if node.next == @tail
        node.next = nil
        @tail = node
      end
    end
  end

  def contains?(value)
    return true if @head == value

    node = @head

    loop do
      node = node.next
      return true if node.value == value
    end

    false
  end

  def find(value)
    node = @head
    i = 0

    loop do
      node = node.next
      i += 1

      return i if node.value == value
    end
  end

  def to_s
    node = @head
    loop do
      print "#{node.value} -> "

      node = node.next

      break if node.next.nil?
    end
    puts 'nil'
  end
end

list = LinkedList.new

puts 'Filling the linked list with 20 nodes of random numbers'
20.times do
  list.append(rand(1..50))
end

puts 'Listing all nodes in list: '
list.to_s

puts 'Listing value at index 7'
puts list.at(7).value

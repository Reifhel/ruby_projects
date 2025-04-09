require_relative "node"

# A linked list is a linear collection of data elements called nodes that “point” to the next node by means of a pointer
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    # adds a new node containing value to the end of the list
    return begin_list(value) if head.nil?

    tail.next_node = create_node(value)
  end

  def prepend(value)
    # adds a new node containing value to the start of the list
    return begin_list(value) if head.nil?

    new_head = create_node(value, head)
    self.head = new_head
  end

  def size
    # returns the total number of nodes in the list
    size = 0
    aux = head
    until aux.nil?
      size += 1
      aux = aux.next_node
    end

    size
  end

  def at(index, node = head, aux_counter = 0)
    # returns the node at the given index
    return head if index.zero?
    return node if aux_counter == index
    return nil if node.nil? || node.next_node.nil?

    at(index, node.next_node, aux_counter + 1)
  end

  def pop(node = head)
    # removes the last element from the list
    return self.head = nil if head.nil? || head.next_node.nil?
    return node.next_node = nil if last_node?(node.next_node)

    pop(node.next_node)
  end

  def tail(node = head)
    # returns the last node in the list
    return node if last_node?(node)

    tail(node.next_node)
  end

  def find(value, node = head, index = 0)
    # returns the index of the node containing value, or nil if not found.
    return index if value == node.value
    return nil if last_node?(node)

    find(value, node.next_node, index + 1)
  end

  def insert_at(value, index)
    return "Unreachable index!" if at(index).nil?
    return prepend(value) if index.zero?

    at(index - 1).next_node = create_node(value, at(index))
  end

  def remove_at(index)
    return "Unreachable index!" if at(index).nil?
    return self.head = at(1) if index.zero?

    at(index - 1).next_node = at(index + 1)
  end

  def contains?(value, node = head)
    # returns true if the passed in value is in the list and otherwise returns false.
    return true if value == node.value
    return false if last_node?(node)

    contains?(value, node.next_node)
  end

  def last_node?(node)
    # Verify if it is the last node or no
    return true if node.next_node.nil?

    false
  end

  def create_node(value = nil, next_node = nil)
    # Create a node
    Node.new(value, next_node)
  end

  def begin_list(value)
    self.head = create_node(value)
  end

  def to_s
    # represent your LinkedList objects as strings
    string = ""
    aux = head
    until aux.nil?
      string += "( #{aux.value} ) -> #{aux.next_node.nil? ? 'nil' : ''}"
      aux = aux.next_node
    end

    string
  end
end

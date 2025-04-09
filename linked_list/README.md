# Linked List

A *linked list* is a linear collection of data elements called nodes that “point” to the next node by means of a pointer. Each node holds a single element of data and a link or pointer to the next node in the list.

A head node is the first node in the list, a tail node is the last node in the list. Below is a basic representation of a linked list:

`[ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil`

## Methods of Linked List

1. `#append(value)` adds a new node containing `value` to the end of the list
2. `#prepend(value)` adds a new node containing `value` to the start of the list
3. `#size` returns the total number of nodes in the list
4. `#head` returns the first node in the list
5. `#tail` returns the last node in the list
6. `#at(index)` returns the node at the given `index`
7. `#pop` removes the last element from the list
8. `#contains?(value)` returns true if the passed in value is in the list and otherwise returns false.
9. `#find(value)` returns the index of the node containing value, or nil if not found.
10. `#to_s` represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: `( value ) -> ( value ) -> ( value ) -> nil`
11. `#last_node?` Verify if the node is the last or has a next
12. `#create_node` Create a node with value and next nil as default
13. `#begin_list` adds a new head node containing value
14. `#insert_at(value, index)` that inserts a new node with the provided `value` at the given `index`.
15. `#remove_at(index)` that removes the node at the given `index`.

## What is used

For this is project i used Ruby, recursion, yaml to save the game, OOP basics, rubocop to validate the code

## Knowledge acquired

* OOP
* Recursion
* Rubocop to code quality

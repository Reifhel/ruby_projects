require_relative "lib/linked_list"

list = LinkedList.new
list.append("dog") # ( dog ) ->
list.append("cat") # ( dog ) -> ( cat ) ->
list.append("parrot") # ( dog ) -> ( cat ) -> ( parrot ) ->
list.append("hamster") # ( bat ) -> ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) ->
list.append("snake") # ( bat ) -> ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) ->
list.prepend("bat") # ( bat ) -> ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) ->
list.append("turtle") # ( bat ) -> ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) ->

puts list
puts list.size # 7
p list.pop # ( bat ) -> ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) ->
puts list
puts list.find("solid") # nil
puts list.find("snake") # 5
list.remove_at(0) # ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> nil
puts list

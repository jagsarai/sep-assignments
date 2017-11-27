require 'benchmark'
require_relative 'linked_list'
require_relative 'node'

list = LinkedList.new
array = Array.new

10000.times do 
    array.push("a")
end

10000.times do
    list.add_to_tail(Node.new("a"))
end

n = list.find_node(5000);

puts Benchmark.measure {
    10000.times do 
        array.push("a")
    end
};

puts Benchmark.measure {
    10000.times do
        list.add_to_tail(Node.new("a"))
    end
}

puts Benchmark.measure {
    array[4999]
}

puts Benchmark.measure {
    list.find_node(5000)
}

puts Benchmark.measure {
    array.delete_at(4999)
}


puts Benchmark.measure {
    list.delete(n)
}
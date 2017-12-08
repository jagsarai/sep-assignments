require_relative 'node'

class MinHeap
    def initialize(heap)
        @heap = Array.new(1)
        @heap.push(heap)
    end

    def [](num)
        @heap[num]
    end

    def length
        @heap.size
    end

    def insert(node)
        @heap.push(node)
        if @heap.size > 2
            index = @heap.size - 1
            while @heap[index].rating < @heap[(index/2).floor].rating
                if index >= 1
                    swap((index/2).floor, index)
                    if (index/2).floor > 1
                        index = (index/2).floor
                    else
                        break
                    end
                end
            end
        end
    end
    
    def find(data)
        @heap.find_index {|node| node != nil and node.title == data}
    end

    def delete()
        smallest = @heap[1]
        if @heap.size > 2
            @heap[1] = @heap[@heap.size - 1]
            @heap.slice!(@heap.size - 1)
            if @heap.length == 3
                if @heap[1].rating > @heap[2].rating
                    swap(1, 2)
                end
                return @heap
            end
            i = 1
            left = 2 * i
            right = 2 * i + 1
            if @heap[left] == nil || @heap[right] == nil
                return @heap
            end
            while @heap[i].rating >= @heap[left].rating || @heap[i].rating >= @heap[right].rating
                if @heap[left].rating < @heap[right].rating
                    swap(i, left)
                    i = 2 * i
                else
                    swap(i, right)
                    i = 2 * i + 1
                end
                left = 2 * i
                right = 2 * i + 1
                if @heap[left] == undefined || @heap[right] == undefined
                    break
                end
            end
        elsif @heap.size == 2
            @heap.slice!(1)
        else
            return nil
        end
        @heap
    end

    def print()
        output = ''
        @heap.each do |node|
            if node != nil
                output += node.title.to_s + ": " + node.rating.to_s + "\n"
            end
        end 
        output
    end

    private 
    def swap(parent_index, child_index)
        temp = @heap[parent_index]
        @heap[parent_index]  = @heap[child_index]
        @heap[child_index] = temp
    end
end
def bubble_sort(array)
    unsorted_array = array.dup
    (unsorted_array.length - 1).downto(0) do |i|
        0.upto( i - 1) do |x|
            if unsorted_array[x] > unsorted_array[x + 1]
                temp = unsorted_array[x]
                unsorted_array[x] = unsorted_array[x + 1]
                unsorted_array[x + 1] = temp
            end 
        end
    end
    p unsorted_array
end

bubble_sort([78,5,0,2])
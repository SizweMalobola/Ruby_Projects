def stock_picker(stocks_array)
    profit = 0
    best_days = []
stocks_array.each_with_index do |buylow,index|
    (index+1).upto(stocks_array.length-1) do |current_index|
        if buylow < stocks_array[current_index]
            if stocks_array[current_index] - buylow > profit
                profit = stocks_array[current_index] - buylow
                best_days = [] 
                best_days.push(index,current_index)
            end
        end
    end
end  
p best_days  
end

stock_picker([17,3,6,9,2,15,8,6,1])
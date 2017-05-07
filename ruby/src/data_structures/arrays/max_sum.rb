# Max sum of non-negative numbers. In case of tie, return array with max len
class Solution
    # param a : array of integers
    # return a array of integers
    def maxset(a)
        return [] if a.nil? || a.size == 0
        sum_so_far = max_sum = 0
        len = max_len = 0
        start_index = max_start_index = 0
        for i in 0..a.size-1
            if (a[i] < 0)
               sum_so_far = 0
               len = 0
               start_index = i+1 if i+1 <= a.size-1
               next
            end
            sum_so_far += a[i]
            len += 1
           
            next if (sum_so_far < max_sum)
            next if  ((sum_so_far == max_sum) && (max_start_index != start_index) && (len<=max_len))
            max_len = len
            max_sum = sum_so_far
            max_start_index = start_index
        end

        (max_len > 0) ? a[max_start_index..(max_start_index+max_len-1)] : []
    end
end

puts '--',Solution.new.maxset([ -1, -1, -1, -1, -1 ])
puts '--',Solution.new.maxset([ 0, 0, -1, 0])
puts '--',Solution.new.maxset([ 0, 0, 0, 0])
puts '--',Solution.new.maxset([ 3, 2, -1, 5])
puts '--',Solution.new.maxset([ 3, 2, -1, 1,1,3])

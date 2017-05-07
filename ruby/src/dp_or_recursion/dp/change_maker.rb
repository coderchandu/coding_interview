#Find minimum number of coins required for a currency

#With coins 1,10,25 => 31 can be made using 25,1,1,1,1,1 or 10,10,10,1 => So choose 2nd option

# Can be solved with DP.

#Store an array which calculate minimum coins required for currencies from 1 till given number

# We know for one, we need one coin. For two, check array 0, and 1. For 3, check from 0 to 2 to see
#what is the minimum

COINS = [1, 5, 10, 25]
def minimum_coins(n)
  min_arr = [0]
  coins_used = []

  for cents in 1..n
    coins_used[cents] = 1
    min_arr[cents] = cents #Initialize with all minimum denomination We know 10 can be formed with 10 one cent coins
    COINS.each do |coin_amount|
      next if coin_amount > cents

      minimum_required_with_this_coin = min_arr[cents - coin_amount] + 1 if cents - coin_amount >= 0
      if minimum_required_with_this_coin && minimum_required_with_this_coin < min_arr[cents]
        min_arr[cents] = minimum_required_with_this_coin 
        coins_used[cents] = coin_amount
      end
    end
  end
  i = n
  while (i>0)
    print coins_used[i], " "
    i -= coins_used[i]
  end
  puts
  min_arr[n]
end


def minimum_coins_custom_coins(n, coins)
  puts "n=#{n}, coins = #{coins}"
  coins.sort!
  
  return nil if coins[0] > n

  coins_used = Array.new(n+1)
  min_arr = Array.new(n+1, n+1) #Initialize with big value which is not possible 
  coins.each do |coin_amount|
    if coin_amount <= n
      min_arr[coin_amount] = 1 
      coins_used[coin_amount] = coin_amount
    end
  end 
  for cents in coins[0]..n
    coins.each do |coin_amount|
      next if coin_amount > cents || min_arr[cents-coin_amount] == n+1
 
      minimum_required_with_this_coin = min_arr[cents-coin_amount] + 1 if cents - coin_amount >= 0
      if minimum_required_with_this_coin && minimum_required_with_this_coin < min_arr[cents]
        min_arr[cents] = minimum_required_with_this_coin
        coins_used[cents] = coin_amount
      end
    end
  end
  i = n
  while (i>0 && min_arr[i] != n+1)
    print coins_used[i], " "
    i -= coins_used[i]
  end
  puts
  
  return min_arr[n] if i == 0
end

puts minimum_coins_custom_coins(49, [1,5,10])
puts minimum_coins_custom_coins(49, [10,5])
puts minimum_coins_custom_coins(49, [50, 100])
puts minimum_coins_custom_coins(1,[1,5,10])
puts minimum_coins_custom_coins(55, [5,10])
puts minimum_coins_custom_coins(49, [5,7,6])

puts "-----------"
puts "49",minimum_coins(49)
puts "51",minimum_coins(51)
puts "21",minimum_coins(21)
puts "1",minimum_coins(1)
puts "0",minimum_coins(0)

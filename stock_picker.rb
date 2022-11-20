def stock_picker(stock_prices)
  # number_of_days = stock_prices.length
  results = []
  stock_prices[...-1].each_with_index do |buy, idx|
    # Make a nested array with the calculated values each day - last day
    results << stock_prices[idx..].map do |sell|
                 sell - buy
               end
  end

  best_profit_per_day = results.map { |day| day.max }

  buy_day = best_profit_per_day.index(best_profit_per_day.max)
  sell_day = results[buy_day].index(best_profit_per_day.max) + buy_day

  profit = [buy_day, sell_day]
end

p stock_picker([17,3,6,9,15,8,6,1,10]) ## => [1,4]
p stock_picker([17,3,6,9,15,8,6,20,12,14,2,9,18,5]) ## => [1,7]

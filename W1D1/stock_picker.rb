def stock_picker(prices)
  best_days = [ 0, 0]

  i = 0
  while i < prices.count - 1
    j = i + 1
    while j < prices.count
      if (prices[j] - prices[i]) > (prices[best_days[1]] - prices[best_days[0]])
        best_days = [ i, j]
      end
      j += 1
    end
    i += 1
  end

  best_days
end

prices = [ 3, 4, 67, 43, 10, 44, 65, 35, 5, 75]

p stock_picker(prices)

def stock_picker(stocks)
  best_profit = 0
  best_buy_sell_days = Array.new()
  
  stocks.each_with_index do |price_buy, index1|
    stocks.each_with_index do |price_sell, index2|

        profit = price_sell - price_buy

        if profit > best_profit && index1 < index2
            best_profit = profit
            best_buy_sell_days = [index1, index2]
        end
      end
  end

  p best_buy_sell_days
  best_buy_sell_days
end

stock_picker([20,17,15,12,11,8,6,3,1])
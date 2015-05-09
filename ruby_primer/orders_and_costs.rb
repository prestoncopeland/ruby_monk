=begin
Problem Statement
May 9, 2015

A restaurant has incoming orders for which you need to compute the costs based on the menu.

You might get multiple orders at times.

Examples:
if the order is {:rice => 1, :noodles => 1}, and the menu is {:rice => 3, :noodles => 2}, then the cost is 5.

If the orders are {:rice => 1, :noodles => 1} and {:rice => 2, :noodles => 2} and the menu is {:rice => 3, :noodles => 2}, then the cost is 15.
=end

#my solution

class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    totals = orders.inject{|memo, el| memo.merge(el){|k, old_v,    new_v| old_v + new_v}}
    costs = totals.merge!(@menu) {|key, order_total, price| order_total*price}
    total_cost = costs.values.inject(:+)
  end
end

#site solution

class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    orders.inject(0) do |total_cost, order|
      total_cost + order.keys.inject(0) {|cost, key| cost + @menu[key]*order[key] }
    end
  end
end

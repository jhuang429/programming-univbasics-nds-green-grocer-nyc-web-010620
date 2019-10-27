test1 = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
]

test2 = [{:item => "AVOCADO", :num => 2, :cost => 5.00}]


def apply_coupons(cart, coupons)
  item_count = 0
  result = []
  while item_count < cart.length do
    coupon_count = 0
    item = cart[item_count][:item]
    while coupon_count < coupons.length do
      if item == coupon[coupon_count][:name] #does cart item match any coupons?
        coupon_qty = cart[item_count][:num]
        if cart[item_count][:num] >= coupon_qty
          new_price = coupon[coupon_count][:price] / coupon_qty
          result.push({item: "#{item} W/COUPON", price: new_price, clearance: cart[item_count][:clearance], count: 0})
          while cart[item_count][:count] >= coupon_qty do #does qty match requirments?
            result[-1][:count] += coupon_qty
            cart[item_count][:count] - coupon_qty
          end

        if cart[item_count] > 0
          result.push(cart[item_count]) #push remaining qtys into results
          cart.delete_at(item_count)
        end

        if cart[item_count] == 0
          cart.delete_at(item_count)

        end
      end #if coupon match name end statement

      coupons += 1
    end

    item_count += 1
  end
  result.push(cart)
  result
end

puts apply_coupons(test1, test2)

test1 = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "CHEESE", :price => 6.50, :clearance => false, :count => 4},
]

test2 = [{:item => "AVOCADO", :num => 2, :cost => 5.00},
{:item => "CHEESE", :num => 3, :cost => 15.00}
]


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

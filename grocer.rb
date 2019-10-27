def find_item_by_name_in_collection(name, collection)
  item_count = 0
  while item_count < collection.length do
    if name == collection[item_count][:item]
      result = collection[item_count]
    end
    item_count += 1
  end
  result
end

def consolidate_cart(cart)
  item_count = 0
  result = {}

  while item_count < cart.length do
    item = cart[item_count][:item]
    result[item] => {count: 0}
    item_count += 1
  end

  item_count = 0
  while item_count < cart.length do
    item = cart[item_count][:item]
    result[item][:count] += 1
    result[item][:clearance] = cart[item_count][:clearance]
    result[item][:price] = cart[item_count][:price]
    item_count += 1
  end

  result

end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

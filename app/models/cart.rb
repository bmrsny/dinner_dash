class Cart
  attr_reader :data
  def initialize(input_data)
    @data = input_data || Hash.new
  end

  def add_item(item)
    data[item.id.to_s] ||= 0
    data[item.id.to_s] += 1
  end

  def count_of(item)
    data[item.id.to_s]
  end

  def count_total
    data.values.sum
  end

  def line_items
    data.keys.map do |item_id|
      item = Item.find(item_id)
      quantity = data[item_id]
      subtotal = (item.price * quantity).to_f / 100.00
      [item, quantity, subtotal]
    end
  end

  def delete_item(item_id)
    data.delete(item_id.to_s)
    data
  end

  def total
    unless data.empty?
      data.keys.map do |item_id|
        item = Item.find(item_id)
        item.price * data[item_id] # data[item_id] = quantity
      end.reduce(:+).to_f / 100.00
    end
  end

  def update_qty(params)
    if data.keys.any? { |key| key == params[:item_id] }
      data[params[:item_id]] = params[:qty].to_i
      line_items
    end
  end
end

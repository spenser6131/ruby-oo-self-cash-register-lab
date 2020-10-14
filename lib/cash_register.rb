class CashRegister
  attr_accessor :total, :previous_total, :items, :previous_items, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(product, price, quantity=1)
    @previous_total = total
    @previous_items = items
    @total += price * quantity
    quantity.times {items << product}
  end

  def apply_discount
    if discount != 0
      @total -= total * discount / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = previous_total
    @items = previous_items
  end
end

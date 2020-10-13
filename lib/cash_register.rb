class CashRegister
  attr_accessor :total, :previous_total, :basket, :previous_basket, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @basket = []
  end

  def add_item(product, price, quantity=1)
    @previous_total = @total
    @total += price * quantity
    @previous_basket = @basket
    quantity.times {@basket << product}
  end

  def apply_discount
    if discount != 0
      self.total -= @total * @discount / 100 if @discount != 0
      "After the discount, the total comes to $#{@total}."
    elsif @discount = 0
      "There is no discount to apply."
    end
  end

  def items
    @basket
  end

  def void_last_transaction
    @total = @previous_total
    @basket = @previous_basket
  end
end

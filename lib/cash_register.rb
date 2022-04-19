require "pry"

class CashRegister
  attr_reader :discount, :items
  attr_accessor :total, :last_price

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times do
      self.items << title
    end
    self.last_price = price * quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      self.total -= (self.total * @discount / 100)
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_price
  end
# maybe use something that removes from the last element of an array

end

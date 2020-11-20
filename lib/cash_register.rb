require 'pry'
class CashRegister
    attr_reader :discount
    attr_accessor :total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times {@items << title}
        @prices << price*quantity
        @total += price * quantity
    end

    def apply_discount
        if @discount > 0
            @total = @total - @total*(@discount/100.0)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @prices.pop
    end

end
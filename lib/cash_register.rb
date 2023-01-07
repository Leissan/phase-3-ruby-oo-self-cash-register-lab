class CashRegister 
    attr_reader :discount, :items
    attr_accessor :total, :last_item_price

    def initialize( value_discount = 0) # why we dont put total etc in () - because we are only passing in a value for discount and not anything else
        @total = 0
        @discount = value_discount
        @items = []
        @last_item_price = 0
    end

    def add_item (title, price, quantity = 1) #where do title and price come from if we never used reader or writer - local variables specific to this one methd only
        self.total += price * quantity
        self.last_item_price = price * quantity #works with self and @
        quantity.times do
             self.items << title
        end
    end
 
    def apply_discount 
        if self.discount == 0 #works with @ and self
            "There is no discount to apply."
        else
            self.total -= (self.total * @discount.to_f / 100)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end
    
   # def items 
        #@items
    #end

    def void_last_transaction
        self.total -= @last_item_price
    end
end
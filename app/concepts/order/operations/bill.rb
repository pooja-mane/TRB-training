module Order::Operation
  class Bill < Trailblazer::Operation

    DELIVERY_CHARGES_IN_PERCENTAGE = 5
    DELIVERY_CHARGES = DELIVERY_CHARGES_IN_PERCENTAGE/100.to_f

    step :is_valid?
    step :calculate_total

    def is_valid?(ctx, **)
      true
    end

    def calculate_total(ctx, **)
      total = ctx[:order_items].map{ |item| item[:price] }.sum
      ctx[:bill_amount] = ctx[:self_pickup] ? total : total + (total * DELIVERY_CHARGES)
    end
  end
end
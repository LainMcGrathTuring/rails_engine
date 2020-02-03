class MerchantRevenueSerializer
  include FastJsonapi::ObjectSerializer

  attributes :revenue do | merchant |
    merchant.total_revenue.to_s
  end
end

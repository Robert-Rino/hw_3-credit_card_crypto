require_relative './credit_card'

card = CreditCard.new(79927398713, nil, nil, nil)
puts card.validate_checksum

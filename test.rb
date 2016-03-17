require_relative './credit_card'
require_relative './substitution_cipher'

# card = CreditCard.new(79927398713, nil, nil, nil)
# puts card.validate_checksum

#Casear Cipher test
# enc = SubstitutionCipher::Caesar.encrypt("hello im RINO", 261)
# puts enc
# dec = SubstitutionCipher::Caesar.decrypt(enc, 261)
# puts dec

#Permutation Cipher test
enc = SubstitutionCipher::Permutation.encrypt("hello im RINO", 1)
puts enc.to_s
dec = SubstitutionCipher::Permutation.decrypt(enc, 1)
puts dec.to_s

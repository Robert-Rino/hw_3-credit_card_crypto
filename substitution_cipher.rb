module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      char_arr = document.to_s.chars #turn input into string
      char_arr.each_with_index do |c,index|
        char_arr[index] = shift_char(c.ord+key)
      end
      return char_arr.join
    end
    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      char_arr = document.chars
      char_arr.each_with_index do |c,index|
        char_arr[index] = shift_char(c.ord-key)
      end
      return char_arr.join
    end

    #turn ascii number to charactor
    def self.shift_char(new_order)
      if new_order > 126
        offset = new_order - 32
        offset = offset%95 # every 95 charactor will repeat
        new_ascii = 32+offset
        puts new_ascii
        return new_ascii.chr
      elsif new_order < 32 then
        offset = 126 - new_order
        offset = offset%95
        new_ascii = 126 - offset
        return new_ascii.chr
      end
      puts new_order
      return new_order.chr
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
    end
  end
end

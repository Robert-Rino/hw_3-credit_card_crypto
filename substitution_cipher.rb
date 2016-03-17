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
        # puts new_ascii
        return new_ascii.chr
      elsif new_order < 32 then
        offset = 126 - new_order
        offset = offset%95
        new_ascii = 126 - offset
        return new_ascii.chr
      end
      # puts new_order
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
      map_table = []
      for ascii in 0..127
        map_table << ascii
      end
      map_table = map_table.shuffle(random: Random.new(key)) #shuffled map_table

      str_arr = document.to_s.chars
      str_arr.each_with_index do |c,index|
        replaced_ascii = map_table[c.ord]
        replaced_char = replaced_ascii.to_i.chr
        str_arr[index] = replaced_char
      end

      return str_arr.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      map_table = []
      for ascii in 0..127
        map_table << ascii
      end
      map_table = map_table.shuffle(random: Random.new(key)) #shuffled map_table
      reverse_hash = Hash[map_table.map.with_index.to_a]

      str_arr = document.to_s.chars
      str_arr.each_with_index do |c,index|
        ori_ascii = reverse_hash[c.ord]
        ori_char = ori_ascii.to_i.chr
        str_arr[index] = ori_char
      end
      return str_arr.join
    end
  end
end

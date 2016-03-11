module Encryption
	@top = 'A'.ord
	@side = 'Z'.ord - @top + 1

	def encrypt(words, key)
		return crypt(words, key, :+)

	end

	def decrypt(words, key)
		return crypt(words, key, :-)
	end

	def crypt(words, key, direction)
		words = words.upcase.gsub(/[^A-Z]/, '')
		keyscan = key.upcase.gsub(/[^A-Z]/, '').chars.map{|x| x.ord - @top}.cycle
		words.each_char.inject('') do |ciphertext, char|
			scramble = keyscan.next
			ciphertext << ((char.ord - @top).send(direction, scramble) % @side + @top).chr
		end
	end
end

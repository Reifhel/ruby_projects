=begin
This is caesar cipher with right rotation, character goes to right direction (a -> b ->...).
if you want to a left rotation (... <- z <- a) you can use the following code:
  rotation = (((letter.ord - base) - shift_factor) % 26) + base 
=end

def caesar_cipher(text, shift_factor = 1)
  cipher = text.chars.map do |letter|
    base = letter.ord < 91 ? 65 : 97
      # Get only values between a..z or A..Z
      if letter.ord.between?(65, 90) || letter.ord.between?(97, 122)
        rotation = (((letter.ord - base) + shift_factor) % 26) + base # Right Rotation
        letter = rotation.chr
      else
        letter
      end
  end.join()
end

puts caesar_cipher("What a string!", 5)
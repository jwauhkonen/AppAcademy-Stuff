def cipher(string, shift)
  letters = string.split("")
  letters.map! { |char| (char.ord + shift).chr }
  letters.map! { |char| char.ord > 122 ? (char.ord - 26).chr : char }

  letters.join("")
end

p cipher("hello", 3)
p cipher("zwords", 12)

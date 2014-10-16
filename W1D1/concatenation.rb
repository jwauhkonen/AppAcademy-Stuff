def concatenate(strings)
  strings.inject("") { |accum, str| accum += str }
end

p concatenate(["Yay ", "for ", "strings!"])

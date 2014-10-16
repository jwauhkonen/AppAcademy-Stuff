@layout = [
  ["O", ".", "."],
  [".", ".", "X"],
  [".", "D", "."]
]


columns = [ [], [], [] ]

@layout.each do |row|
  row.each_index do |i|
    columns[i] << row[i]
  end
end

p columns
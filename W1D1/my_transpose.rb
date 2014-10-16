def my_transpose(matrix)
  new_matrix = []
  matrix[0].each do |row|
    new_matrix << []
  end

  matrix.each_index do |row|
    matrix[row].each_index do |column|
      new_matrix[column][row] = matrix[row][column]
    end
  end

  new_matrix
end

rows = [
  [0,1,2],
  [3,4,5],
  [6,7,8]
]

p my_transpose(rows)

more_rows = [
  [1, 2],
  [3, 4],
  [5, 6],
  [7, 8]
]

p my_transpose(more_rows)

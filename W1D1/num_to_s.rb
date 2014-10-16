def num_to_s(num, base)
  hex = { 0=>'0',
          1=>'1',
          2=>'2',
          3=>'3',
          4=>'4',
          5=>'5',
          6=>'6',
          7=>'7',
          8=>'8',
          9=>'9',
          10=>'A',
          11=>'B',
          12=>'C',
          13=>'D',
          14=>'E',
          15=>'F'}

  output = ''
  pow = 0
  while base**pow < num
    digit = (num / base**pow) % base
    output += hex[digit]
    pow += 1
  end
  output.reverse
end
p num_to_s(5, 10) #=> "5"
p num_to_s(5, 2)  #=> "101"
p num_to_s(5, 16)
p num_to_s(234, 10)
p num_to_s(234, 2)
p num_to_s(234, 16)

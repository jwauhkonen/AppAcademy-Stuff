class Fixnum

  def in_words
    nums = {
        0  => 'zero',
        1  => 'one',
        2  => 'two',
        3  => 'three',
        4  => 'four',
        5  => 'five',
        6  => 'six',
        7  => 'seven',
        8  => 'eight',
        9  => 'nine',
        10 => 'ten',
        11 => 'eleven',
        12 => 'twelve',
        13 => 'thirteen',
        14 => 'fourteen',
        15 => 'fifteen',
        16 => 'sixteen',
        17 => 'seventeen',
        18 => 'eighteen',
        19 => 'nineteen',
        20 => 'twenty',
        30 => 'thirty',
        40 => 'forty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety'}

    output = ""
    remaining = self
    if remaining == 0
      output = nums[0]
    end

    while remaining > 0
      if remaining < 20
        return output += nums[remaining]
      elsif remaining < 100
        output += nums[remaining-(remaining%10)] + " "
        remaining %= 10
      elsif remaining < 1000
        output += (remaining / 100).in_words + " hundred "
        remaining %= 100
      elsif remaining < 1_000_000
        output += (remaining / 1000).in_words + " thousand "
        # output += nums[remaining / 1000] + " thousand "
        remaining %= 1000
      elsif remaining < 1_000_000_000
        output += (remaining / 1000000).in_words + " million "
        remaining %= 1000000
      elsif remaining < 1_000_000_000_000
        output += (remaining / 1000000000).in_words + " billion "
        remaining %= 1000000000
      elsif remaining < 1_000_000_000_000_000
        output += (remaining / 1_000_000_000_000).in_words + " trillion "
        remaining %= 1000000000000
      end

    end
    output[-1] == " " ? output[0..-2] : output
  end
end

p 100.in_words #.should == 'one hundred'
p 1_000_000_000_000.in_words #.should == 'one trillion'
p 1_000_000_000_001.in_words # .should == 'one trillion one'
p 1_888_259_040_036.in_words

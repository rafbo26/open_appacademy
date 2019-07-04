def average(num1, num2)
  avg = (num1 + num2) / 2.0
  "%g" % avg
end

p average(4, 8)
p average(5, 10)


def average_array(array)
  avg = (array.sum / array.length.to_f)
  "%g" % avg
end

p average_array([2, 4, 6])
p average_array([3, -4, 21, 8])
p average_array([5, 10])


def repeat(str, num)
  str * num
end

p repeat("happy", 2)
p repeat("Work", 5)
p repeat("whoa", 0)


def yell(str)
  str.upcase + "!"
end

p yell("hello")
p yell("goodBYE")


def alternating_case(sent)
  sent = sent.split(" ")
  sent.map!.with_index do |ele, i|
    if i.even?
      ele.upcase
    else
      ele.downcase
    end
  end
  sent.join(" ")
end

p alternating_case("code never lies, comments sometimes do.")
p alternating_case("HEY PROGRAMMERS")
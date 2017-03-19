#cat a.in | ruby a.rb
IMP = "impossible"

def pairs(str)
  str.split(' ').map(&:to_i)
end

def go(p00, p01, p10, p11)
  return IMP if (p01 - p10).abs > 1
  return IMP if p01 == 0 && p10 == 0 && p00 > 0 && p11 > 0

  mono_strs = ["0" * p00, "1" * p11]

  if p01 == 0 && p10 == 0
    return mono_strs[0] + "0" if p00 > 0
    return mono_strs[1] + "1" if p11 > 0
  end

  if p01 > p10
    str = "01" * p01
  elsif p01 < p10
    str = "10" * p10
  elsif p01 == p10 && p01 > 0
    str = "0" + "10" * p10
  else
    str = ""
  end

  str = str.insert(1, mono_strs[str[1].to_i])
  str = str.insert(0, mono_strs[str[0].to_i])

  return str
end

$stdin.gets.to_i.times do |_|
  $stdout.puts(
    go(*pairs($stdin.gets))
  )
end

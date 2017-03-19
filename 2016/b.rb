def n_m(str)
  str.split(' ').map(&:to_i)
end

def wagons(str)
  str.split(' ').map(&:to_i)
end

def lights(str)
  str.split(' ').map{|item| item.to_i == 1 ? true : false}
end

def wagons_groups (n, wagons, lights)
  wagons_groups = [];
  current_group = -1
  first_wagon_in_group = true

  n.times do |index|
    unless lights[index]
      if first_wagon_in_group
        current_group += 1
        wagons_groups << []
        first_wagon_in_group = false
      end
      wagons_groups[current_group] << wagons[index]
    else
      first_wagon_in_group = true
    end
  end

  wagons_groups
end

def lights_in_group(m, group)
  length = 0
  group.reduce(0) do |memo, wagon_length|
    length += wagon_length
    if length >= m
      memo += 1
      length = 0
    end
    memo
  end
end

def go(n, m, wagons, lights)
  lights_cnt = 0

  unless lights[0] then lights[0] = true; lights_cnt += 1; end
  unless lights[n-1] then lights[n-1] = true; lights_cnt += 1; end

  wagons_groups(n, wagons, lights).each do |group|
    lights_cnt += lights_in_group(m, group)
  end

  $stdout.puts lights_cnt
end

$stdin.gets.to_i.times do |_|
  n, m = *n_m($stdin.gets)
  wagons = wagons($stdin.gets)
  lights = lights($stdin.gets)

  go(n, m, wagons, lights)
end

require 'prime.rb'

enumerator = Prime.each

prime = enumerator.next
res = []
while prime <= Math.sqrt(10**9)
  res << prime
  prime = enumerator.next
end

p res.size

class Integer
  def factors
    return [] if self == 0 || self == 1
    primes, powers = self.prime_division.transpose
    exponents = powers.map{|i| (0..i).to_a}
    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
    end
    divisors.sort #.map{|div| [div, self / div]}
  end
end



#p (10**9).factors


p (10**9).times.max_by{|num| num.factors.size}

#p 2.factors.size
#p 1.prime_division
#p 2.prime_division

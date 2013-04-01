def approximate(g1, g2):
  subperiod = gcd(g1.period, g2.period)
  max1 = ceil(g1.n / (g1.period / subperiod))
  max2 = ceil(g2.n / (g2.period / subperiod))
  return {period=subperiod, n=max1+max2, 
          sons=[(g1, max1), (g2, max2)]}


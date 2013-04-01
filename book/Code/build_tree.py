def build_tree(groups):
  subperiods = priority_queue(
      lambda (g1, g2): gcd(g1.period, g2.period))
  for g1, g2 in cross_product(groups, groups):
    subperiods.add((g1, g2))
  while len(groups) > 1:
    g1, g2 = subperiods.popmax()
    groups -= [g1, g2]
    ng = approximate(g1, g2)
    for g in groups:
      subperiods.remove((g1, g))
      subperiods.remove((g2, g))
      subperiods.add((ng, g))
    groups += [ng]
  return groups[0]

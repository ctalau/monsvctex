def build_tree(groups):
  while len(groups) > 1:
    g1, g2 = choose(groups, 2)
    groups -= [g1, g2]
    groups += [approximate(g1, g2)]
  return groups[0]

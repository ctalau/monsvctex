def assign(g, offsets):
  if len(g.sons):
    (g1, max1), (g2, max2) = g.sons
    assign(g1, expand(offsets[:max1], g.period, g1.period))
    assign(g2, expand(offsets[max1:], g.period, g2.period))
  else:
    g.offset = offsets


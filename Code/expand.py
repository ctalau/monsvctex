def expand(offsets, subperiod, period):
  subperiods = period / subperiod
  return [o + k*subperiod for o in offsets for k in range(subperiods)]


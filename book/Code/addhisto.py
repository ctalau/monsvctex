def add(histo):
  for node in tree if histo.period % node.period == 0:
    histo.offset = node.supply.pull()
    if histo.offset:
      break


class OffsetSupply:
  def pull():
    if len(self.buf) == 0 and self.parent is not None:
      self.poff = self.parent.pull()
      subperiod = self.parent.period
      subperiods = self.period / subperiod
      buf = [self.poff + k*subperiod for k in range(subperiods)]
      return buf.pop()


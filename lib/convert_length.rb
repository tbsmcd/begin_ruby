UNITS = {m: 1.0, ft: 3.28, in: 39.37}

def convert_length(length, unit_from, unit_to)
  (length / UNITS[unit_from] * UNITS[unit_to]).round(2)
end
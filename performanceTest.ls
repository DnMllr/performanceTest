{maximum, minimum, mean} = require \prelude-ls

performanceTest = (times, cb, ...args) ->
  | args.length > 0
    start = performance.now!
    laps = [];
    for i from 0 to times
      lap-start = performance.now!
      cb.apply @, args
      laps.push performance.now! - lap-start
    finished = performance.now! - start
    """
      It took #finished milliseconds to run the function #times times.
      The longest run was #{maximum laps}, while the shortest run was #{minimum laps}.
      The average run was #{mean laps}.
      The function was called with these arguments: #{args}
    """
  | _
    start = performance.now!
    laps = [];
    for i from 0 to times
      lap-start = performance.now!
      cb!
      laps.push performance.now! - lap-start
    finished = performance.now! - start
    """
      It took #finished milliseconds to run the function #times times.
      The longest run was #{maximum laps}, while the shortest run was #{minimum laps}.
      The average run was #{mean laps}.
    """
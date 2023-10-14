module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes numberOfLayers numberOfMinutes =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes =
            numberOfLayers * 2
    in
    expectedMinutesInOven + (preparationTimeInMinutes - numberOfMinutes)

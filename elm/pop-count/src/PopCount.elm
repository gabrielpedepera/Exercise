module PopCount exposing (eggCount)


toBinaryAndCountOnes : Int -> ( List Int, Int )
toBinaryAndCountOnes n =
    if n == 0 then
        ( [ 0 ], 0 )

    else
        let
            convertAndCount x acc count =
                if x == 0 then
                    ( acc, count )

                else
                    let
                        bit =
                            x |> modBy 2

                        newCount =
                            if bit == 1 then
                                count + 1

                            else
                                count
                    in
                    convertAndCount (x // 2) (bit :: acc) newCount
        in
        convertAndCount n [] 0


eggCount : Int -> Int
eggCount n =
    let
        ( _, onesCount ) =
            toBinaryAndCountOnes n
    in
    onesCount

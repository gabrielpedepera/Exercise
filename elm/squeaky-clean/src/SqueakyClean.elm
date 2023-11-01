module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)

import Char exposing (isDigit, toCode, toUpper)
import String exposing (concat, cons, filter, replace, split, uncons)


clean1 : String -> String
clean1 str =
    replace " " "_" str


clean2 : String -> String
clean2 str =
    str
        |> clean1
        |> replace "\n" "[CTRL]"
        |> replace "\u{000D}" "[CTRL]"
        |> replace "\t" "[CTRL]"


clean3 : String -> String
clean3 str =
    str
        |> clean2
        |> split "-"
        |> List.indexedMap
            (\i word ->
                case uncons word of
                    Nothing ->
                        ""

                    Just ( firstChar, restOfString ) ->
                        if i > 0 then
                            cons (toUpper firstChar) restOfString

                        else
                            word
            )
        |> concat


clean4 : String -> String
clean4 str =
    str
        |> clean3
        |> filter (\char -> not (isDigit char))


isGreekLetter : Char -> Bool
isGreekLetter char =
    let
        code =
            toCode char
    in
    code >= 0x03B1 && code <= 0x03C9


clean : String -> String
clean str =
    str
        |> clean4
        |> filter (\char -> not (isGreekLetter char))

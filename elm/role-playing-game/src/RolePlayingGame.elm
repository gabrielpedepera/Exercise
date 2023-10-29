module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Nothing ->
            "Mighty Magician"

        Just justName ->
            justName


revive : Player -> Maybe Player
revive player =
    case player.health of
        0 ->
            if player.level >= 10 then
                Just { player | health = 100, mana = Just 100 }

            else
                Just { player | health = 100, mana = Nothing }

        _ ->
            Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Just mana ->
            if mana > manaCost then
                ( { player | mana = Just (mana - manaCost) }, manaCost * 2 )

            else
                ( player, 0 )

        Nothing ->
            let
                healthDamage =
                    player.health - manaCost

                newHealth =
                    if healthDamage < 0 then
                        0

                    else
                        healthDamage
            in
            ( { player | health = newHealth }, 0 )

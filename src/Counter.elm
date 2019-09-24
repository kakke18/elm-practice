module Counter exposing (main)

import Browser
import Html
import Html.Events as Events



-- Model


type alias Model =
    Int



-- Update

type Msg
    = Increment
    | Decrement



update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- View


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.div []
            [ Html.text "Counter App" ]
        , Html.div []
            [ Html.text (String.fromInt model) ]
        , Html.button
            [ Events.onClick Increment ]
            [ Html.text "inc" ]
        , Html.button
            [ Events.onClick Decrement ]
            [ Html.text "dec" ]
        ]



-- Main


init: Model
init =
    0


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }

module Todo exposing (..)

import Browser
import Html
import Html.Attributes as Attr
import Html.Events as Events



-- Model


type alias Model =
    { todos : List String
    , newTodoText : String
    }



-- Update


type Msg
    = AddNewTodo
    | UpdateNewTodoText String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddNewTodo ->
            { newTodoText = ""
            , todos =
                model.todos
                    ++ [model.newTodoText]
            }

        UpdateNewTodoText text ->
            { model | newTodoText = text }



-- View


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.div []
            [ Html.input
                [ Events.onInput UpdateNewTodoText
                , Attr.value model.newTodoText
                ]
                []
            , Html.button
                [ Events.onMouseUp AddNewTodo ]
                [ Html.text "Add" ]
            ]
        , Html.div []
            (List.map
                (\todo -> Html.div [] [ Html.text todo ])
                model.todos
            )
        ]



-- Main


init : Model
init =
    { todos = []
    , newTodoText = ""
    }


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }

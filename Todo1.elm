import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { todos : List Todo
  }


type alias Todo =
  { text : String
  }


model : Model
model =
  Model []


-- UPDATE

type Msg
  = Add

update : Msg -> Model -> Model
update msg model =
  case msg of
    Add ->
      { model | todos = model.todos ++ [ Todo "hi2" ] }


-- VIEW

view : Model -> Html Msg
view model =
  div []
  [ ul [] (List.map todoItem model.todos)
  , button [ onClick Add ] [ text "ADD" ]
  ]


todoItem : Todo -> Html Msg
todoItem todo =
  li [] [ text todo.text ]

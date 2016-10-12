import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { todos : List Todo
  , field : String
  }


type alias Todo =
  { text : String
  }


model : Model
model =
  Model [] ""


-- UPDATE

type Msg
  = Add
  | UpdateField String
  | Remove String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Add ->
      { model
        | todos = model.todos ++ [ Todo model.field ]
        , field = ""
      }

    UpdateField text ->
      { model | field = text }

    Remove text ->
      { model | todos = List.filter (\t -> t.text /= text) model.todos }


-- VIEW

view : Model -> Html Msg
view model =
  div []
  [ ul [] (List.map todoItem model.todos)
  , input [ onInput UpdateField, value model.field ] []
  , button [ onClick Add ] [ text "ADD" ]
  ]

todoItem : Todo -> Html Msg
todoItem todo =
  li []
    [ span [] [ text todo.text ]
    , button [ onClick (Remove todo.text) ] [ text "X" ]
    ]

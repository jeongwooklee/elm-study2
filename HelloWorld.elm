import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { content : String
  -- , foo : Int
  -- , bar : List
  }


-- model : { content : String }
model : Model
model =
  Model ""
  -- { content = "" }

  -- Model "" "foo" "bar"
  -- { content = "", foo = "foo", bar = "bar" }



-- UPDATE

type Msg
  = HelloWorld
  -- | FooMsg
  -- | BarMsg

update : Msg -> Model -> Model
update msg model =
  case msg of
    HelloWorld ->
      Model "Hello world!"
      -- { content = "Hello world!" }

    -- FooMsg ->
    --   Model "foo"
    --
    -- BarMsg ->
    --   Model "bar"


-- VIEW

view : Model -> Html Msg
view model =
  -- div [ list of attributes ] [ list of child nodes ]
  div []
    [ h1 [] [ text model.content ]
    , button [ onClick HelloWorld ] [ text "Say hello to world" ]
    ]

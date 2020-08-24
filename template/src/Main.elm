module Main exposing (main)

{-
   #
   # name: Main.elm
   # date:
   # prog: pr
   # desc:
   # sorc:
   #
-}

import Browser
import Html



-- CONST
-- MAIN


main : Program Flags Model Msg
main =
    Browser.Document
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- TYPES


type Page
    = InputPage


type Msg
    = NoOp


type alias Flags =
    ()



-- MODEL


type alias Model =
    { currPage : Page
    }



-- FUNCS
-- INIT


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( { currPage = InputPage
      }
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view _ =
    { title = "INSERT_TITLE_HERE"
    , body = []
    }



{- eof -}

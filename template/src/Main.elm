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

import Browser exposing (..)
import Html exposing (..)



-- CONST
-- MAIN


main : Program Flags Model Msg
main =
    Browser.document
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


init : () -> ( Model, Cmd Msg )
init flags =
    ( { currPage = InputPage }
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Document Msg
view _ =
    { title = "INSERT_TITLE_HERE"
    , body = []
    }



{- eof -}

module Tools exposing
    ( getTimeHere
    , getTimePosix
    , getTimeUtc
    , getTimeZoneAusMelbourne
    , getZoneName
    , monthToInt
    , monthToStr
    , posixToDate
    , posixToDateAndTime
    , posixToTime
    )

{-
   #
   # name: Tools.elm
   # date: 2020SEP25
   # prog: pr
   # desc: Lets create a new Toolbox
   #       time tools see SUCCESS/elm-datetime/README
   # sorc: SUCCESS/elm-datetime
   #
-}

import Time
    exposing
        ( toHour
        , toMinute
        , toSecond
        , utc
        )
import TimeZone exposing (..)



-- CONST
-- MAIN
-- TYPES
-- MODEL


type alias Model =
    -- require these and a bit more bootstrap to use
    -- see SUCCESS/elm-datetime/README
    { posix : Maybe Time.Posix
    , zone : Maybe Time.Zone
    , zoneName : Maybe Time.ZoneName
    }



-- UPDATE
-- VIEW
-- FUNCS


getZoneName : Maybe Time.ZoneName -> String
getZoneName maybeZoneName =
    case maybeZoneName of
        Just zn ->
            case zn of
                Time.Name name ->
                    name

                Time.Offset offset ->
                    String.fromInt offset

        Nothing ->
            "No timezone found"


getTimePosix : Model -> String
getTimePosix model =
    -- TODO fix so we don't need the model defn
    case model.posix of
        Just p ->
            String.fromInt <| Time.posixToMillis p

        Nothing ->
            "Waiting"



--getTimeUtc : Time.ZoneName -> Time.Posix -> String


getTimeUtc model =
    -- TODO fix so we don't need the model defn
    let
        zone =
            getZoneName model.zoneName
    in
    case model.posix of
        Just p ->
            posixToDateAndTime (TimeZone.australia__melbourne ()) p

        Nothing ->
            "Waiting"


getTimeZoneAusMelbourne : Time.Posix -> String
getTimeZoneAusMelbourne posix =
    posixToDateAndTime (TimeZone.australia__melbourne ()) posix


getTimeHere : Time.Posix -> Time.Zone -> String
getTimeHere posix zone =
    posixToDateAndTime zone posix



-- FUNCS.time


posixToTime : Time.Zone -> Time.Posix -> String
posixToTime zone posix =
    (String.padLeft 2 '0' <| String.fromInt <| Time.toHour zone posix)
        ++ ":"
        ++ (String.padLeft 2 '0' <| String.fromInt <| Time.toMinute zone posix)
        ++ ":"
        ++ (String.padLeft 2 '0' <| String.fromInt <| Time.toSecond zone posix)


monthToInt : Time.Month -> Int
monthToInt month =
    case month of
        Time.Jan ->
            1

        Time.Feb ->
            2

        Time.Mar ->
            3

        Time.Apr ->
            4

        Time.May ->
            5

        Time.Jun ->
            6

        Time.Jul ->
            7

        Time.Aug ->
            8

        Time.Sep ->
            9

        Time.Oct ->
            10

        Time.Nov ->
            11

        Time.Dec ->
            12


monthToStr : Time.Month -> String
monthToStr month =
    case month of
        Time.Jan ->
            "JAN"

        Time.Feb ->
            "FEB"

        Time.Mar ->
            "MAR"

        Time.Apr ->
            "APR"

        Time.May ->
            "MAY"

        Time.Jun ->
            "JUN"

        Time.Jul ->
            "JUL"

        Time.Aug ->
            "AUG"

        Time.Sep ->
            "SEP"

        Time.Oct ->
            "OCT"

        Time.Nov ->
            "NOV"

        Time.Dec ->
            "DEC"


posixToDate : Time.Zone -> Time.Posix -> String
posixToDate zone posix =
    (String.padLeft 4 '0' <| String.fromInt <| Time.toYear zone posix)
        ++ ""
        ++ (String.padLeft 2 '0' <| monthToStr (Time.toMonth zone posix))
        ++ ""
        ++ (String.padLeft 2 '0' <| String.fromInt <| Time.toDay zone posix)


posixToDateAndTime : Time.Zone -> Time.Posix -> String
posixToDateAndTime zone posix =
    posixToDate zone posix ++ " " ++ posixToTime zone posix



-- INIT
-- SUBSCRIPTIONS
{- eof -}

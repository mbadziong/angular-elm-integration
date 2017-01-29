port module Main exposing (..)

import Html exposing (Html, div, text, program, input, button, br)
import Html.Events exposing (onClick, onInput)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { name : String
    , email : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "" "", Cmd.none )



-- UPDATE


type Msg
    = ChangeRequest String
    | ChangeResponse String


port check : String -> Cmd msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeRequest name ->
            ( Model name "", check name )

        ChangeResponse emailFromAPI ->
            { model | email = emailFromAPI } ! []



-- SUBSCRIPTIONS


port emailResponse : (String -> msg) -> Sub msg


port nameResponse : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ emailResponse ChangeResponse
        , nameResponse ChangeRequest
        ]



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text "Elm input : "
        , input [ onInput ChangeRequest ] []
        , br [] []
        , text ("Elm model : " ++ (toString model))
        , br [] []
        , br [] []
        , br [] []
        , text "Value computed by ports : "
        , text (model.email)
        ]

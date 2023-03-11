module Grid exposing 
  ( Attribute
  , Alignment(..) 
  , make
  , templateAreas
  , templateCols
  , templateRows
  , autoCols
  , autoRows
  , placeItems
  , justifyItems
  , justifySelf
  , alignItems
  , height
  , width
  , class
  , id
  , htmlAttr
  )

{-|
# Description

`elm-grid` is intended to ease the creation of css-grid containers in Elm.

# Making a container

@docs make

# Templates and Autos

@docs templateCols, templateRows, templateAreas

@docs autoRows, autoCols

# Alignment

@docs Alignment, placeItems, alignItems, justifyItems, justifySelf

# Practical

@docs id, class, height, width, htmlAttr

# Internal

@docs Attribute

-}

import Html
import Html.Attributes as Attrs

-- Internal


{-| Internal Attribute msg.
Can be circumvented by using `htmlAttr`, for flexibility.
-}
type Attribute msg = Attribute (Html.Attribute msg)


-- Make


{-| Make a new grid container. -}
make : List (Attribute msg) -> List (Html.Html msg) -> Html.Html msg
make gridAttrs elems =
  let htmlAttrs = List.map (\(Attribute value) -> value) gridAttrs in
  Html.div (Attrs.style "display" "grid"::htmlAttrs) elems


-- Templates


{-| -}
templateAreas : String -> Attribute msg
templateAreas value =
  Attrs.style "grid-template-areas" value |> htmlAttr


{-| -}
templateRows : String -> Attribute msg
templateRows value =
  Attrs.style "grid-template-rows" value |> htmlAttr


{-| -}
templateCols : String -> Attribute msg
templateCols value =
  Attrs.style "grid-template-columns" value |> htmlAttr


-- Alignment


{-| Determine alignment. -}
type Alignment 
  = Start | End | Center | Stretch


alignmentToValue : Alignment -> String
alignmentToValue alignment =
  case alignment of
    Start -> "start"
    End -> "end"
    Center -> "center"
    Stretch -> "stretch"


{-| -}
placeItems : Alignment -> Attribute msg
placeItems alignment =
  let toAttr = Attrs.style "place-items" >> htmlAttr in
  toAttr <| alignmentToValue alignment


{-| -}
alignItems : Alignment -> Attribute msg
alignItems alignment =
  let toAttr = Attrs.style "align-items" >> htmlAttr in
  toAttr <| alignmentToValue alignment


{-| -}
justifyItems : Alignment -> Attribute msg
justifyItems alignment =
  let toAttr = Attrs.style "justify-items" >> htmlAttr in
  toAttr <| alignmentToValue alignment



{-| -}
justifySelf : Alignment -> Attribute msg
justifySelf alignment =
  let toAttr = Attrs.style "justify-self" >> htmlAttr in
  toAttr <| alignmentToValue alignment


-- Autos


{-| -}
autoRows : String -> Attribute msg
autoRows =
  Attrs.style "grid-auto-rows" >> htmlAttr


{-| -}
autoCols : String -> Attribute msg
autoCols =
  Attrs.style "grid-auto-rows" >> htmlAttr


-- Practical


{-| -}
width : String -> Attribute msg
width = Attrs.style "width" >> htmlAttr


{-| -}
height : String -> Attribute msg
height = Attrs.style "height" >> htmlAttr


{-| -}
class : String -> Attribute msg
class = Attrs.class >> htmlAttr


{-| -}
id : String -> Attribute msg
id = Attrs.id >> htmlAttr



{-| Convert an Html.Attribute msg to a Grid.Attribute msg -}
htmlAttr : Html.Attribute msg -> Attribute msg
htmlAttr = Attribute
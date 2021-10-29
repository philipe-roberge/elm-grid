module Grid exposing 
  ( Attribute
  , Alignment(..)
  , make
  , templateAreas
  , templateCols
  , templateRows
  , autoCols
  , autoRows
  , justifyItems
  , justifySelf
  , alignItems
  , height
  , width
  , htmlAttr
  )

import Html
import Html.Attributes as Attrs



type Attribute msg = Attribute (Html.Attribute msg)


type Alignment 
  = Start | End | Center | Stretch


make : List (Attribute msg) -> List (Html.Html msg) -> Html.Html msg
make gridAttrs elems =
  let htmlAttrs = List.map (\(Attribute value) -> value) gridAttrs in
  Html.div (Attrs.style "display" "grid"::htmlAttrs) elems


templateAreas : String -> Attribute msg
templateAreas value =
  Attrs.style "grid-template-areas" value |> htmlAttr


templateRows : String -> Attribute msg
templateRows value =
  Attrs.style "grid-template-rows" value |> htmlAttr


templateCols : String -> Attribute msg
templateCols value =
  Attrs.style "grid-template-columns" value |> htmlAttr


alignItems : Alignment -> Attribute msg
alignItems alignment =
  let toAttr = Attrs.style "align-items" >> htmlAttr in
  toAttr 
    (case alignment of
      Start -> "start"
      End -> "end"
      Center -> "center"
      Stretch -> "stretch"
    )


justifyItems : Alignment -> Attribute msg
justifyItems position =
  let toAttr = Attrs.style "justify-items" >> htmlAttr in
  toAttr 
    (case position of
      Start -> "start"
      End -> "end"
      Center -> "center"
      Stretch -> "stretch"
    )


justifySelf : Alignment -> Attribute msg
justifySelf position =
  let toAttr = Attrs.style "justify-self" >> htmlAttr in
  toAttr 
    (case position of
      Start -> "start"
      End -> "end"
      Center -> "center"
      Stretch -> "stretch"
    )


autoRows : String -> Attribute msg
autoRows =
  Attrs.style "grid-auto-rows" >> htmlAttr


autoCols : String -> Attribute msg
autoCols =
  Attrs.style "grid-auto-rows" >> htmlAttr


width : String -> Attribute msg
width = Attrs.style "width" >> htmlAttr


height : String -> Attribute msg
height = Attrs.style "height" >> htmlAttr


htmlAttr : Html.Attribute msg -> Attribute msg
htmlAttr = Attribute
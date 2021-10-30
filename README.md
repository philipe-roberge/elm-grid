# elm-grid

elm-grid is a simple helper function package for css-grid containers.
It allows easier use of css-grid with less hassle. It's a small package intended for fast development.

Here is an example module:
```elm
module Main exposing (main)

import Html exposing (Html)
import Grid

main : Html msg
main =
  Grid.make
    [ Grid.height "100px"
    , Grid.width "100px"
    , Grid.alignItems Grid.Center
    , Grid.justifyItems Grid.Center
    ]
    [ Html.h1 [] [ Html.text "Hello" ]
    ]
```
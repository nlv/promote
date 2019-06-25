{-# LANGUAGE OverloadedStrings #-}

module TestPage
    ( testPageStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

testPageStylesheet :: Css
testPageStylesheet = do

    "#test" ? do
        display flex
        justifyContent center
        alignItems center

        -- width $ vw 100
        -- height $ vh 100

        backgroundImage $ url "../img/callback-background.jpg"
        backgroundSize $ by (pct 100) (pct 100)

    "#test-div" ? do
        width $ px 540
        height $ px 636

        -- display flex
        -- justifyContent center
        -- alignItems center

        position relative

        fontSize $ rem 2

        backgroundImage $ url "../img/smartphone_in_hand_3.png"
        backgroundSize $ by (pct 100) (pct 100)

        "p" ? do
            position relative
            left $ px 93
            top $ px 0 

            -- sym margin $ px 10
            marginTop $ px 18
            marginLeft $ px 11
            marginRight $ px 11
            marginBottom $ px 18
            sym borderRadius $ px 20

            height $ px 546
            width $ px 257

            -- background white

            sym padding $ px 20

        -- "p" ? do
        --     position relative
        --     left $ px 120
        --     top $ px 50 

        --     sym margin $ px 10

        --     height $ px 500
        --     width $ px 230

        --     background white


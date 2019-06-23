{-# LANGUAGE OverloadedStrings #-}

module Navbar
    ( navbarStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common

navbarHPadding = pct 10

navbarStylesheet :: Selector -> Css
navbarStylesheet s = do

    s ? do 
        -- "*" <? do
        --     borderStyle solid
        --     borderColor red
        --     borderWidth $ px 0.1

        display flex
        alignItems center
        justifyContent spaceAround

        position fixed
        top nil
        right nil
        left nil

        color brandColor
        fontWeight $ weight 600
        fontSize $ em 1.2
        textTransform uppercase

        backgroundColor $ rgba 255 255 255 0.8
        transition "background-color" (sec 1.5) linear (sec 0)

        ".no-background" & do
            backgroundColor transparent

        ".navbar-nav" ? do
            width $ pct 40

            display flex
            alignItems center
            justifyContent spaceAround

            li ? do
                borderColor brandColor
                borderBottomWidth $ px 1

                paddingBottom $ px 8
                paddingTop $ px 8

            li # ".active" ? do
                borderColor brandColor
                borderBottomWidth $ px 1
                borderStyle solid
                color red

            a ? do
                -- display block
                textDecoration none
                color brandColor

        ".navbar-phone" ? do
            fontSize $ rem 1.8

        ".navbar-toggle" ? do
            display none
            borderStyle none
            color brandColor
            backgroundColor transparent
            fontSize $ rem 1.8
            cursor pointer

    query Media.screen [Media.maxWidth $ px 1280] $ do
        s ? do 
            ".brand" ? do
                width $ px 200
                "img" ? do
                    width $ pct 100

            "#navbar-phone" ? do
                fontSize $ rem 1.4

    query Media.screen [Media.maxWidth $ px 900] $ do
        s ? do
            ".navbar-toggle" ? do
                display inlineBlock

            ".navbar-nav" ? do
                display none

            ".navbar-nav" # ".active" ? do
                display block

                position absolute
                left $ px 0
                top $ navbarHeight @-@ (px 1)
                width $ pct 80
                paddingTop $ px 10
                paddingBottom $ px 10

                backgroundColor $ rgba 0 0 0 0.8

                li ? do
                    width $ pct 100
                    sym2 padding (px 20) (px 20)

                    borderStyle none

                    fontSize $ rem 1.2

    query Media.screen [Media.maxWidth $ px 600] $ do
        s ? do 
            paddingLeft $ px 5
            paddingRight $ px 5
            justifyContent spaceBetween

            ".navbar-phone" ? do
                fontSize $ rem 1


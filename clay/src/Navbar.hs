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

navbarStylesheet :: Css
navbarStylesheet = do

    "#navbar" ? do 
        display flex
        alignItems center
        justifyContent spaceBetween

        position fixed
        top nil
        right nil
        left nil

        paddingLeft navbarHPadding
        paddingRight navbarHPadding

        color brandColor
        fontWeight $ weight 600

        backgroundColor $ rgba 255 255 255 0.8

        fontSize $ em 1.2
        textTransform uppercase

        transition "background-color" (sec 1.5) linear (sec 0)

        ".no-background" & do
            backgroundColor transparent

    ".navbar-nav" ? do
        display flex
        alignItems center
        justifyContent spaceBetween

        width (pct 40)

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
        "#navbar" ? do
            paddingLeft $ px 20
            paddingRight $ px 20

        ".brand" ? do
            transform $ scale 0.7 0.7

    query Media.screen [Media.maxWidth $ px 900] $ do
        ".navbar-nav" ? do
            width (pct 80)

        ".navbar-phone" ? do
            display none


    query Media.screen [Media.maxWidth $ px 480] $ do
        "#navbar" ? do

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

            ".navbar-toggle" ? do
                display inlineBlock

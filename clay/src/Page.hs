{-# LANGUAGE OverloadedStrings #-}

module Page
    ( pageStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common

pageStylesheet :: Css
pageStylesheet = do
    ".page" ? do
        display flex
        flexDirection column
        alignItems center

        paddingTop (navbarHeight @+@ (px 5))
        paddingBottom (navbarHeight @+@ (px 5))

        query Media.screen [Media.maxWidth $ px 1280] $ do
            fontSize $ rem 0.8

        query Media.screen [Media.maxWidth $ px 900] $ do
            fontSize $ rem 0.7

            ".newline-mobile" ? do
                display block

        query Media.screen [Media.maxWidth $ px 780] $ do
            fontSize $ rem 0.6

        h1 ? do
            textTransform uppercase
            textAlign center

        h2 ? do 
            textTransform uppercase
            textAlign center

        header <? do
            h1 ? do
                sym2 padding inherit (px 15)
                paddingTop $ px 15

                fontSize $ em 3
                lineHeight $ unitless 1.2

            h2 ? do
                paddingTop $ px 10
                paddingBottom $ px 20

                fontSize $ em 2.4
                color $ rgba 0 0 0 0.5

    ".cards" ? do
        display grid
        justifyContent center
        "grid-column-gap" -: "20px"
        "grid-row-gap" -: "20px"

    ".card" ? do 
        display flex
        flexDirection column
        alignItems center

        width $ px 280
        sym padding $ px 10

        borderColor brandColor
        borderWidth $ px 4
        borderStyle solid

        fontSize $ rem 1.6

        query Media.screen [Media.maxWidth $ px 1280] $ do
            fontSize $ rem 1.4

        hgroup ? do
            figure ? do
                textAlign center
                img ? do
                    width $ pct 70

            h1 ? do
                lineHeight $ em 1.2
                fontWeight bold
                paddingTop $ px 15

        p # ":first-of-type" ? do
            paddingTop $ px 15

        p ? do
            -- fontSize $ em 1.6
            paddingTop $ px 10
            textAlign justify
            lineHeight $ em 1.2

    "#sec-target" ? do
        backgroundColor $ rgb 237 242 247

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto auto"

            query Media.screen [Media.maxWidth $ px 1280] $ do
                "grid-template-columns" -: "auto auto"

            query Media.screen [Media.maxWidth $ px 700] $ do
                "grid-template-columns" -: "auto"

    {-
    query Media.screen [Media.maxWidth $ px 900] $ do
        ".page-callback" ? do
            backgroundImage $ url "../img/callback-background.jpg"

            ".cards" ? do
                "grid-template-columns" -: "auto auto auto auto"

            ".phone" ? do
                fontSize $ em 1.6
                textAlign center
                fontSize $ em 4

        "#p2" ? 
            ".cards" ? do
                "grid-template-columns" -: "auto auto auto"
    -}

    {-
    ".page-callback" ? do
        backgroundImage $ url "../img/callback-background.jpg"

        ".phone" ? do
            fontSize $ em 1.6
            textAlign center
            fontSize $ em 4
            color brandColor
            paddingTop $ px 20
            paddingBottom $ px 20

    "#p2" ? do
        backgroundColor $ rgb 237 242 247
        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"

    "#services" ? do
        -- backgroundColor $ rgb 237 242 247
        -- height $ px 1000

        header ? do
            h2 ? do
                color brandColor
                fontSize $ em 2

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"

    "#sites" ? do
        backgroundColor $ rgb 237 242 247
        -- height $ px 1000

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"

    "#accounting" ? do
        -- backgroundColor $ rgb 237 242 247
        -- height $ px 1000

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"

    "#profit" ? do
        backgroundColor $ rgb 237 242 247

    "#footer" ? do
        -- borderStyle solid
        -- borderColor green
        -- borderWidth $ px 0.1

        paddingLeft (pct 10)
        paddingRight (pct 10)
        paddingTop (px 40)
        paddingBottom (px 40)

        display flex
        flexDirection row

        height $ px 200

        -- "div" <? do
        --     borderStyle solid
        --     borderColor red
        --     borderWidth $ px 0.1

        "div" # ":fist-child" ? do
            width $ pct 20
            alignItems center
            justifyContent center

        "div" # (nthChild "2") ? do
            Flexbox.flex 1 0 auto
            display flex
            alignItems center
            justifyContent center

            fontSize $ rem 1.1

        "div" # nthChild "3" ? do
            width $ pct 20

            display flex
            sym padding $ px 20
            alignItems center
            justifyContent center


            figure ? do
                -- borderStyle solid
                -- borderColor black
                -- borderWidth $ px 0.1
                height $ pct 100
                display flex
                alignItems center
                justifyContent center
                marginRight $ px 20


                img ? do
                    height $ pct 60
                    width $ px 60
                    -- marginLeft $ px 40

            -- figure # firstChild ? do
            --     borderStyle solid
            --     borderColor red
            --     borderWidth $ px 0.1




        ".social-links" ? do
            display flex
            flexDirection row



    ".social-card" ? do
        backgroundColor $ rgb 237 242 247
        -- width $ px 370
        display flex
        justifyContent spaceAround
        alignItems center
        height $ pct 100

        backgroundColor white

        sym borderRadius $ px 4
        boxShadow $ pure $ bsColor (rgba 0 0 0 0.2) $ shadowWithBlur nil (px 2) (px 2)

        a ? do
            display flex
            justifyContent spaceAround
            alignItems center
            height $ pct 100

            textAlign center
            textDecoration none

        figure ? do
            height $ px 70
            width $ px 100
            display flex
            justifyContent center
            alignItems center
            borderRightWidth $ px 1
            borderRightStyle solid
            borderRightColor $ rgb 234 234 234

            img ? do
                height $ px 35
                width auto
                maxWidth $ px 40

            img # ".bigger" ? do
                height $ px 50
                maxWidth $ px 100


        ".social-name" ? do
            textTransform uppercase
            width $ px 270
            sym2 padding (px 10) nil
            textAlign center



    ".card3" ? do 
        width $ px 600
        -- height $ px 160

        borderColor brandColor
        borderWidth $ px 4
        borderStyle solid

        sym2 margin (px 5) nil

        display flex
        flexDirection row
        justifyContent spaceBetween
        alignItems center


        sym padding $ px 10

        figure ? do
            -- borderColor green
            -- borderWidth $ px 0.1
            -- borderStyle solid

            Flexbox.flex 1 0 auto
            textAlign center

            -- width $ pct 25

            img ? do
                height $ px 120

        "div" ? do
            Flexbox.flex 3 1 auto

        h1 ? do
            fontSize $ em 1.6
            fontWeight bold
            paddingTop $ px 15
            textAlign center

        p ? do
            fontSize $ em 1.6
            sym padding $ px 20
            -- textAlign center
            lineHeight $ em 1.2

    ".card-profit" ? do 
        width $ px 600
        -- height $ px 160

        borderColor brandColor
        borderWidth $ px 4
        borderStyle solid

        sym2 margin (px 5) nil
        sym padding $ px 30


        h1 ? do
            fontSize $ em 1.6
            fontWeight bold
            paddingTop $ px 0
            paddingBottom $ px 15
            textAlign start

        ul ? do
            fontSize $ em 1.6
            -- sym padding $ px 20
            -- textAlign center
            lineHeight $ em 1.5

            li ? do
                sym2 padding (px 10) nil

            li # ":before" ? do
                content $ stringContent "✔ "
                -- position absolute
                top $ px 0
                left $ px 0
                color brandColor
                fontSize $ em 1.8
                


    ".package-card" ? do 
        width $ px 280
        height $ px 680
        position relative

        alignItems center

        borderColor brandColor
        borderWidth $ px 4
        borderStyle solid

        h1 ? do
            backgroundColor brandColor
            color white

            sym2 padding (px 30) (px 20)

            fontSize $ rem 1

        ul ? do
            sym2 padding nil $ px 20

            -- listStyleImage $ imageUrl "../img/shevron.jpg"

            li ? do
                display block
                fontSize $ rem 1
                lineHeight $ em 1.5
                borderBottomStyle solid
                borderBottomColor gray
                borderBottomWidth $ px 0.1

                paddingTop $ em 1
                paddingBottom $ em 1

            li # lastChild ? do
                borderBottomWidth nil 

        ".callback-simple"  ? do
            -- borderStyle solid
            -- borderColor blue
            -- borderWidth $ px 0.1 

            position absolute
            bottom $ px 20
            left $ px 0

            width $ pct 100

            a ? do
                display block           
                marginLeft (px 40)
                marginRight (px 40)
                paddingTop (rem 1)
                paddingBottom (rem 1)

                backgroundColor brandColor
                color white

                textAlign center
                fontSize $ rem 1
                textDecoration none


        -- p # ":first-of-type" ? do
        --     paddingTop $ px 15

        -- p ? do
        --     fontSize $ em 1.6
        --     paddingTop $ px 10
        --     -- textAlign center
        --     textAlign justify
        --     textIndent $ indent $ px 20
        --     lineHeight $ em 1.2

            


    ".service-item" ? do
        display flex
        justifyContent spaceAround
        height $ pct 100

    "#callback-popup" ? do
        fieldset ? do
            display grid
            "grid-template-columns" -: "auto auto"
            -- "grid-template-rows" -: "2rem"
            "grid-row-gap" -: "15px"


    ".ui-dialog" ? do
        sym padding nil
        fontSize $ rem 1
    
    ".ui-widget-header" ? do
        background brandColor
        color white
    -}
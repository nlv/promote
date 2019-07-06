{-# LANGUAGE OverloadedStrings #-}

module CallbackPopup
    ( callbackPopupStylesheet
    ) where

import Clay
import qualified Clay.Media as Media
import Prelude hiding (rem)

import Common


callbackPopupStylesheet :: Css
callbackPopupStylesheet = do

    "#callback-popup" ? do
        fontSize $ rem 1.6

        fieldset ? do
            display flex
            flexDirection column
            justifyContent center

            input ? do
                display block
                width $ pct 90
                sym2 margin (px 10) auto
                sym padding (px 5)
                


    ".ui-dialog" ? do
        sym padding nil
    
        ".ui-widget-header" ? do
            background brandColor
            color white

            fontSize $ rem 1.6

        ".ui-dialog-buttonset" ? do
            marginLeft auto
            fontSize $ rem 1.2

        query Media.screen [Media.maxWidth $ px 640] $ do
            ".ui-widget-header" ? do
                fontSize $ rem 1.3

            -- ".ui-dialog-buttonset" ? do
            --     fontSize $ rem 1.1
        

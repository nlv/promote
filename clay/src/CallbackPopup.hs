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
            display grid
            "grid-template-columns" -: "auto"
            -- "grid-template-rows" -: "2rem"
            "grid-row-gap" -: "15px"


    ".ui-dialog" ? do
        sym padding nil
    
        ".ui-widget-header" ? do
            background brandColor
            color white

            fontSize $ rem 1.6

        ".ui-dialog-buttonset" ? do
            fontSize $ rem 1.6

        query Media.screen [Media.maxWidth $ px 640] $ do
            ".ui-widget-header" ? do
                fontSize $ rem 1.2

            ".ui-dialog-buttonset" ? do
                fontSize $ rem 1.2
        

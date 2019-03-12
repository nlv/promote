
module Main where

import Clay

import Config
import Stylesheets

main :: IO ()
main = do
    opts <- getOpts
    let debug = optDebug opts   
    putCss $ mainStylesheet debug

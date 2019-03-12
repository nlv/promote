-- {-# LANGUAGE DeriveGeneric     #-}

module Config (
  Opts(..)
, getOpts
)  
where

import GHC.Generics
import Options.Applicative
import Data.Semigroup ((<>))

newtype Opts = Opts { 
  optDebug :: Bool
}

getOpts :: IO Opts
getOpts = execParser opts
  where opts = info (opts' <**> helper)
          (fullDesc <> progDesc "CSS generator for promote site" <> header "CSS generator")
        opts' = Opts <$> switch (long "debug" <> short 'd' <> help "Debug mode")

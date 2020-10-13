module Klank.Dev where

import Prelude
import Data.Typelevel.Num (D1)
import FRP.Behavior (Behavior)
import FRP.Behavior.Audio
  ( AudioUnit
  , gain'
  , runInBrowser
  , sinOsc
  , squareOsc
  , speaker'
  )

scene :: Number -> Behavior (AudioUnit D1)
scene _ = pure (speaker' (gain' 0.2 (squareOsc 40.0)))

main = runInBrowser scene

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 2

main = do
   xmonad $ defaultConfig
     { terminal    = myTerminal
     , modMask     = myModMask
     , borderWidth = myBorderWidth
     }

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 2

main = do
   xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobarrc.hs"
   xmonad $ defaultConfig
     { startupHook = setWMName "LG3D"
       , manageHook = manageDocks <+> manageHook defaultConfig
       , layoutHook = avoidStruts  $  layoutHook defaultConfig
       , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
       , terminal    = myTerminal
       , modMask     = myModMask -- Rebind Mod to the Windows key
       , borderWidth = myBorderWidth
     }

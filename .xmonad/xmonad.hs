import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName
import Graphics.X11.ExtraTypes.XF86

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 2
myWorkspaces = ["1:term","2:web","3:devel","4:media","5:chat","6","7","8", "9"]

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
       , workspaces = myWorkspaces
       , modMask     = myModMask -- Rebind Mod to the Windows key
       , borderWidth = myBorderWidth
     }  `additionalKeys`
         [
        ((mod4Mask .|. shiftMask, xK_l), spawn "slock")
      , ((mod4Mask .|. shiftMask, xK_e), spawn "setxkbmap -layout en_US")
      , ((mod4Mask .|. shiftMask, xK_s), spawn "setxkbmap -layout es")
      -- Media Keys
      , ((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 2-")
      , ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 2+")
      , ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle")
      -- Spotify
      , ((0, xF86XK_AudioPlay          ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
      , ((0, xF86XK_AudioStop          ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop")
      , ((0, xF86XK_Back               ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
      , ((0, xF86XK_Forward            ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
      ]

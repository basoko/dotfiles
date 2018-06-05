import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat)
import Data.List

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 2
myWorkspaces = ["1:term","2:web","3:devel","4:media","5:chat","6","7","8", "9"]

-- IntelliJ popup fix from http://youtrack.jetbrains.com/issue/IDEA-74679#comment=27-417315
(~=?) :: Eq a => Query [a] -> [a] -> Query Bool
q ~=? x = fmap (isInfixOf x) q

main = do
   xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobarrc.hs"
   xmonad $ defaultConfig
     { startupHook = setWMName "LG3D"
       , manageHook = ( isFullscreen --> doFullFloat ) <+> manageDocks <+> manageHook defaultConfig
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
      , ((0, xF86XK_AudioRaiseVolume   ), spawn "pactl set-sink-volume 0 +1.5%")
      , ((0, xF86XK_AudioLowerVolume   ), spawn "pactl set-sink-volume 0 -1.5%")
      , ((0, xF86XK_AudioMute          ), spawn "pactl set-sink-mute 0 toggle")
      , ((0, xF86XK_MonBrightnessUp    ), spawn "xbacklight -inc 5")
      , ((0, xF86XK_MonBrightnessDown  ), spawn "xbacklight -dec 5")
      -- Spotify
      , ((0, xF86XK_AudioPlay          ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
      , ((0, xF86XK_AudioStop          ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop")
      , ((0, xF86XK_Back               ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
      , ((0, xF86XK_Forward            ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
      ]

Config { font = "-*-Fixed-Bold-R-Normal-*-13-*-*-*-*-*-*-*"
       , overrideRedirect = True
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 90
       , commands = [ Run Weather "LEBB" ["-t"," <tempC>C","-L","64","-H","77","--normal","green","--high","red","--low","lightblue"] 36000
                    , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run Date "%a %b %_d %l:%M" "date" 10
                    , Run BatteryP ["BAT0"]
                        [ "-t", "<acstatus>"
                         , "-L", "10", "-H", "80"
                         , "-l", "red", "-h", "green"
                         , "--", "-O", "<fc=#859900>+</fc><left>%", "-o", "<fc=#dc322f>-</fc><left>%"
                        ] 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %cpu% | %memory% * %swap% | %battery%   <fc=#ee9a00>%date%</fc> | %LEBB%"
       }

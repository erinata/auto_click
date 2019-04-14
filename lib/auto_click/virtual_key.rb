module VirtualKey
  def self.code_from_name(name)

    if name.kind_of? Fixnum
      return name
    elsif name.kind_of? String
      name=name.delete('_').delete('-').delete(' ')
    end
    name = name.to_sym.downcase  
    case name
    #when
    #  0x00S
    #when
    #  0x01
    #when
    #  0x02
    #when
    #  0x03
    #when
    #  0x04
    #when
    #  0x05
    #when
    #  0x06
    #when
    #  0x07
    when :back,:backspace
      0x08
    when :tab
      0x09
    #when
    #  0x0A
    #when
    #  0x0B
    when :clear
      0x0C
    when :return,:enter
      0x0D
    #when
    #  0x0E
    #when
    #  0x0F
    when :shift
      0x10
    when :ctrl,:control
      0x11
    when :alt,:alternate
      0x12
    when :pause
      0x13
    when :cap,:capslock,:caplock
      0x14
    #when
    #  0x15
    #when
    #  0x16
    #when
    #  0x17
    #when
    #  0x18
    #when
    #  0x19
    #when
    #  0x1A
    when :esc,:escape
      0x1B
    #when
    #  0x1C
    #when
    #  0x1D
    #when
    #  0x1E
    #when
    #  0x1F
    when :space,:spacebar
      0x20
    when :pageup
      0x21
    when :pagedown
      0x22
    when :end
      0x23
    when :home
      0x24
    when :left,:leftarrow,:leftkey
      0x25
    when :up,:uparrow,:upkey
      0x26
    when :right,:rightarrow,:rightkey
      0x27
    when :down,:downarrow,:downkey
      0x28
    when :select
      0x29
    when :print
      0x2A
    when :exe,:execute
      0x2B
    when :printscr,:printscreen
      0x2C
    when :ins,:insert
      0x2D
    when :del,:delete
      0x2E
    when :help
      0x2F
    when :num0,:number0
      0x30
    when :num1,:number1
      0x31
    when :num2,:number2
      0x32
    when :num3,:number3
      0x33
    when :num4,:number4
      0x34
    when :num5,:number5
      0x35
    when :num6,:number6
      0x36
    when :num7,:number7
      0x37
    when :num8,:number8
      0x38
    when :num9,:number9
      0x39
    #when
    #  0x3A
    #when
    #  0x3B
    #when
    #  0x3C
    #when
    #  0x3D
    #when
    #  0x3E
    #when
    #  0x3F
    #when
    #  0x40
    when :a
      0x41
    when :b
      0x42
    when :c
      0x43
    when :d
      0x44
    when :e
      0x45
    when :f
      0x46
    when :g
      0x47
    when :h
      0x48
    when :i
      0x49
    when :j
      0x4A
    when :k
      0x4B
    when :l
      0x4C
    when :m
      0x4D
    when :n
      0x4E
    when :o
      0x4F
    when :p
      0x50
    when :q
      0x51
    when :r
      0x52
    when :s
      0x53
    when :t
      0x54
    when :u
      0x55
    when :v
      0x56
    when :w
      0x57
    when :x
      0x58
    when :y
      0x59
    when :z
      0x5A
    when :win, :windows,:leftwin
      0x5B
    when :rightwin
      0x5C
    when :app,:application
      0x5D
    #when
    #  0x5E
    when :sleep
      0x5F
    when :numpad0,:numberpad0
      0x60
    when :numpad1,:numberpad1
      0x61
    when :numpad2,:numberpad2
      0x62
    when :numpad3,:numberpad3
      0x63
    when :numpad4,:numberpad4
      0x64
    when :numpad5,:numberpad5
      0x65
    when :numpad6,:numberpad6
      0x66
    when :numpad7,:numberpad7
      0x67
    when :numpad8,:numberpad8
      0x68
    when :numpad9,:numberpad9
      0x69
    when :multiply,:multiplication
      0x6A
    when :add,:addition
      0x6B
    when :separator
      0x6C
    when :substract,:subtraction
      0x6D
    when :decimal
      0x6E
    when :divide,:division
      0x6F
    when :f1
      0x70
    when :f2
      0x71
    when :f3
      0x72
    when :f4
      0x73
    when :f5
      0x74
    when :f6
      0x75
    when :f7
      0x76
    when :f8
      0x77
    when :f9
      0x78
    when :f10
      0x79
    when :f11
      0x7A
    when :f12
      0x7B
    when :f13
      0x7C
    when :f14
      0x7D
    when :f15
      0x7E
    when :f16
      0x7F
    when :f17
      0x80
    when :f18
      0x81
    when :f19
      0x82
    when :f20
      0x83
    when :f21
      0x84
    when :f22
      0x85
    when :f23
      0x86
    when :f24
      0x87
    #when
    #  0x88
    #when
    #  0x89
    #when
    #  0x8A
    #when
    #  0x8B
    #when
    #  0x8C
    #when
    #  0x8D
    #when
    #  0x8E
    #when
    #  0x8F
    when :numlock,:numberlock
      0x90
    when :scroll,:scrolllock
      0x91
    #when
    #  0x92
    #when
    #  0x93
    #when
    #  0x94
    #when
    #  0x95
    #when
    #  0x96
    #when
    #  0x97
    #when
    #  0x98
    #when
    #  0x99
    #when
    #  0x9A
    #when
    #  0x9B
    #when
    #  0x9C
    #when
    #  0x9D
    #when
    #  0x9E
    #when
    #  0x9F
    when :leftshift
      0xA0
    when :rightshift
      0xA1
    when :leftcontrol,:leftctrl
      0xA2
    when :rightcontrol,:rightctrl
      0xA3
    when :menu,:leftmenu
      0xA4
    when :rightmenu
      0xA5
    when :browserback
      0xA6
    when :browserforward
      0xA7
    when :browserrefresh
      0xA8
    when :browserstop
      0xA9
    when :browsersearch
      0xAA
    when :browserfav,:browserfavourites
      0xAB
    when :browserstart,:browserhome
      0xAC
    when :mute,:volmute,:volumemute
      0xAD
    when :voldown,:volumedown
      0xAE
    when :volup,:volumeup
      0xAF
    when :nexttrack
      0xB0
    when :previoustrack
      0xB1
    when :mediastop
      0xB2
    when :mediaplay,:mediapause
      0xB3
    when :mail
      0xB4
    when :mediaselect
      0xB5
    when :app1,:application1
      0xB6
    when :app2,:application2
      0xB7
    #when
    #  0xB8
    #when
    #  0xB9
    when :semicolon,:colon
      0xBA
    when :equal, :plus
      0xBB
    when :comma, :smallerthan
      0xBC
    when :hyphen,:underscore,:understrike
      0xBD
    when :period, :dot, :greaterthan
      0xBE
    when :slash,:question,:questionmark,:forwardslash
      0xBF
    when :grave, :graveaccent, :tilde,:leftquote
      0xC0
    #when
    #  0xC1
    #when
    #  0xC2
    #when
    #  0xC3
    #when
    #  0xC4
    #when
    #  0xC5
    #when
    #  0xC6
    #when
    #  0xC7
    #when
    #  0xC8
    #when
    #  0xC9
    #when
    #  0xCA
    #when
    #  0xCB
    #when
    #  0xCC
    #when
    #  0xCD
    #when
    #  0xCE
    #when
    #  0xCF
    #when
    #  0xD0
    #when
    #  0xD1
    #when
    #  0xD2
    #when
    #  0xD3
    #when
    #  0xD4
    #when
    #  0xD5
    #when
    #  0xD6
    #when
    #  0xD7
    #when
    #  0xD8
    #when
    #  0xD9
    #when
    #  0xDA
    when :branket, :openbranket, :leftbranket, :opensquarebranket, :leftsquarebranket, :squarebranket, :curlybranket, :opencurlybranket, :leftcurlybranket 
      0xDB
    when :pipe, :pipes, :bar, :brokenbar, :backslash
      0xDC
    when :closebranket, :closesquarebranket, :rightbranket, :rightsquarebranket, :closecurlybranket, :rightcurlybranket
      0xDD
    when :quote,:singlequote,:doublequote, :rightquote, :acute, :acuteaccent
      0xDE
    #when
    #  0xDF
    #when
    #  0xE0
    #when
    #  0xE1
    #when
    #  0xE2
    #when
    #  0xE3
    #when
    #  0xE4
    #when
    #  0xE5
    #when
    #  0xE6
    #when
    #  0xE7
    #when
    #  0xE8
    #when
    #  0xE9
    #when
    #  0xEA
    #when
    #  0xEB
    #when
    #  0xEC
    #when
    #  0xED
    #when
    #  0xEE
    #when
    #  0xEF
    #when
    #  0xF0
    #when
    #  0xF1
    #when
    #  0xF2
    #when
    #  0xF3
    #when
    #  0xF4
    #when
    #  0xF5
    #when
    #  0xF6
    #when
    #  0xF7
    #when
    #  0xF8
    #when
    #  0xF9
    when :play 
      0xFA
    when :zoom
      0xFB
    #when
    #  0xFC
    #when
    #  0xFD
    #when
    #  0xFE
    #when
    #  0xFF
    else
      0  
    end
  end
  
  
 
end

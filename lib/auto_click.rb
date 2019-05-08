require 'fiddle/import'
require 'auto_click/input_structure'
require 'auto_click/virtual_key'
require 'auto_click/user32'

module AutoClickMethods
  @@rightdown = InputStructure.mouse_input(0,0,0,0x0008)
  @@rightup = InputStructure.mouse_input(0,0,0,0x0010)  
  @@leftdown = InputStructure.mouse_input(0,0,0,0x0002)
  @@leftup = InputStructure.mouse_input(0,0,0,0x0004)
  @@middledown = InputStructure.mouse_input(0,0,0,0x0020)
  @@middleup = InputStructure.mouse_input(0,0,0,0x0040)


  def send_input(inputs)
    n = inputs.size
    ptr = inputs.collect {|i| i.to_s}.join
    User32.SendInput(n, ptr, inputs[0].size)    
  end

  def get_screen_resolution
    [User32.GetSystemMetrics(0), User32.GetSystemMetrics(1)]
  end

  def mouse_move(x,y)
    User32.SetCursorPos(x,y)
  end

  def mouse_move_percentage(x,y)
    screen_resolution = get_screen_resolution()
    User32.SetCursorPos(get_screen_resolution[0]*x,get_screen_resolution[1]*y)
  end
  
  # def mouse_move_pixel_absolute(x,y)
  #   User32.SetCursorPos(x,y)
  # end
  
  # def mouse_move_percentage_relative_virtual(x,y) # broken
  #   move = InputStructure.mouse_input(x,y,0,0x0001)
  #   send_input( [move])
  # end
  
  # def mouse_move_percentage_relative_real(x,y)  # broken
  #   move = InputStructure.mouse_input(x,y,0,0x4001)
  #   send_input( [move])
  # end
  
  # def mouse_move_percentage_absolute_virtual(x,y)
  #   move = InputStructure.mouse_input(x*65536,y*65536,0,0xc001)
  #   send_input( [move])
  # end
  
  # def mouse_move_percentage_absolute_real(x,y)
  #   move = InputStructure.mouse_input(x*65536,y*65536,0,0x8001)
  #   send_input( [move])
  # end
    
  def right_click
    send_input( [@@rightdown, @@rightup] )
  end
  
  def left_click
    send_input( [@@leftdown, @@leftup] )
  end
  
  def middle_click
    send_input( [@@middledown, @@middleup] )
  end
  
  def mouse_down(button_name)
    case button_name
    when :right
      send_input( [@@rightdown] )
    when :middle
      send_input( [@@middledown] )  
    else
      send_input( [@@leftdown] )
    end
  end
  
  def mouse_up(button_name)
    case button_name
    when :right
      send_input( [@@rightup] )
    when :middle
      send_input( [@@middleup] )  
    else
      send_input( [@@leftup] )
    end
  end  
  
  def double_click
    left_click
    left_click
  end
  
  def cursor_position
    point = " " * 8
    User32.GetCursorPos(point)
    point.unpack('LL')  
  end
  
  def mouse_scroll(d) 
    scroll = InputStructure.mouse_input(0,0,d*120,0x0800)
    send_input( [scroll])
  end
  

  def left_drag(sx,sy,ex,ey)
    mouse_move sx,sy
    sleep 0.1
    send_input( [@@leftdown] )
    sleep 0.1
    mouse_move ex,ey
    sleep 0.1
    send_input( [@@leftup] )
    sleep 0.1
  end
  
  def right_drag(sx,sy,ex,ey)
    mouse_move sx,sy
    sleep 0.1
    send_input( [@@rightdown] )
    sleep 0.1
    mouse_move ex,ey
    sleep 0.1
    send_input( [@@rightup] )
    sleep 0.1
  end
  
  def key_stroke(key_name)
    code=VirtualKey.code_from_name(key_name)
    send_input([InputStructure.keyboard_input(code,0x0000),
                InputStructure.keyboard_input(code,0x0002)])
  end
  
  def key_down(key_name)
    code=VirtualKey.code_from_name(key_name)
    send_input([InputStructure.keyboard_input(code,0x0000)])
  end
  
  def key_up(key_name)
    code=VirtualKey.code_from_name(key_name)
    send_input([InputStructure.keyboard_input(code,0x0002)])
  end
  
  def type(string)
    key_stroke(:capslock) if get_key_state(:capslock)==1
    string=string.to_s
    string.each_char do |c|
      if ('a'..'z').include? c
        key_stroke(c.to_sym)
      elsif ('A'..'Z').include? c
        key_down(:leftshift)
        key_stroke(c.to_sym)
        key_up(:leftshift)
      elsif ('0'..'9').include? c
        key_stroke(('num'+c).to_sym)
      else
        case c
        when ' '
          key_stroke(:space)
        when ';'
          key_stroke(:semicolon)
        when ':'
          key_down(:leftshift)
          key_stroke(:semicolon)
          key_up(:leftshift)
        when '='
          key_stroke(:equal)
        when '+'
          key_down(:leftshift)
          key_stroke(:plus)
          key_up(:leftshift)
        when ','
          key_stroke(:comma)
        when '<'
          key_down(:leftshift)
          key_stroke(:smallerthan)
          key_up(:leftshift)  
        when '-'
          key_stroke(:hyphen)
        when '_'
          key_down(:leftshift)
          key_stroke(:underscore)
          key_up(:leftshift)
        when '.'
          key_stroke(:period)
        when '>'
          key_down(:leftshift)
          key_stroke(:greaterthan)
          key_up(:leftshift)
        when '/'
          key_stroke(:slash)
        when '?'
          key_down(:leftshift)
          key_stroke(:question)
          key_up(:leftshift)
        when '`'
          key_stroke(:grave)
        when '~'
          key_down(:leftshift)
          key_stroke(:tilde)
          key_up(:leftshift)
        when '/'
          key_stroke(:slash)
        when '?'
          key_down(:leftshift)
          key_stroke(:question)
          key_up(:leftshift)  
        when '['
          key_stroke(:branket)
        when '{'
          key_down(:leftshift)
          key_stroke(:branket)
          key_up(:leftshift)
        when ']'
          key_stroke(:closebranket)
        when '}'
          key_down(:leftshift)
          key_stroke(:closebranket)
          key_up(:leftshift)
        when '\\'   # You need to esapce \ in the parameter string
          key_stroke(:backslash)
        when '|'
          key_down(:leftshift)
          key_stroke(:pipe)
          key_up(:leftshift)
        when '\''   # escape ' only for single quote string
          key_stroke(:quote)
        when '"'    # escape " only for double quote string
          key_down(:leftshift)
          key_stroke(:doublequote)
          key_up(:leftshift)
        when '!'
          key_down(:leftshift)
          key_stroke(:num1)
          key_up(:leftshift)
        when '@'
          key_down(:leftshift)
          key_stroke(:num2)
          key_up(:leftshift)  
        when '#'    # The sharp sign need to be escape in single quote string
          key_down(:leftshift)
          key_stroke(:num3)
          key_up(:leftshift)
        when '$'
          key_down(:leftshift)
          key_stroke(:num4)
          key_up(:leftshift)
        when '%'
          key_down(:leftshift)
          key_stroke(:num5)
          key_up(:leftshift)
        when '^'
          key_down(:leftshift)
          key_stroke(:num6)
          key_up(:leftshift)
        when '&'
          key_down(:leftshift)
          key_stroke(:num7)
          key_up(:leftshift)  
        when '*'
          key_down(:leftshift)
          key_stroke(:num8)
          key_up(:leftshift)
        when '('
          key_down(:leftshift)
          key_stroke(:num9)
          key_up(:leftshift)
        when ')'
          key_down(:leftshift)
          key_stroke(:num0)
          key_up(:leftshift)  
        end
        
      end
    end
  end
  
  def get_key_state(key_name)
    code=VirtualKey.code_from_name(key_name)
    User32.GetKeyState(code)
    # For normal keys (such as a)
    # When the key is down the value is -128
    # When the key is up the value is 0
     
    # For toggle keys (such as capslock)  
    # When the cap key is down and the caplock is on the value is -127
    # When the cap key is down and the caplock is off the value is -128
    # When the cap key is Up and the caplock is on the value is 1
    # When the cap key is Up and the caplock is off the value is 0 
  end
end


# include AutoClick  # This line allow auto include when the user require the gem

class AutoClick
  include AutoClickMethods
end



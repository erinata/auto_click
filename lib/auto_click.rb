require 'win32/api'
include Win32
require "auto_click/input_structure"

module AutoClick
  
  @@gcp = API.new("GetCursorPos",'P','V',"user32")
  @@scp = API.new('SetCursorPos', 'II', 'V',"user32")
  @@si = API.new('SendInput','IPI', 'I',"user32")


  INPUT_MOUSE = 0
  MOUSEEVENTF_MOVE = 0x0001
  MOUSEEVENTF_LEFTDOWN = 0x0002
  MOUSEEVENTF_LEFTUP = 0x0004
  MOUSEEVENTF_MIDDLEDOWN = 0x0020
  MOUSEEVENTF_MIDDLEUP = 0x0040
  MOUSEEVENTF_RIGHTDOWN = 0x0008
  MOUSEEVENTF_RIGHTUP = 0x0010
  MOUSEEVENTF_ABSOLUTE = 0x8000
  MOUSEEVENTF_WHEEL = 0x0800 # The amount of movement is specified in dwData
  MOUSEEVENTF_VIRTUALDESK = 0x4000
  WHEEL_DELTA = 120
  
  INPUT_KEYBOARD = 1
  KEYEVENTF_EXTENDEDKEY = 0x0001  # If specified, the scan code was preceded by a prefix byte that has the value 0xE0 (224).
  KEYEVENTF_KEYUP = 0x0002  # If specified, the key is being released. If not specified, the key is being pressed.
  KEYEVENTF_SCANCODE = 0x0008 #  If specified, wScan identifies the key and wVk is ignored.
  KEYEVENTF_UNICODE = 0x0004 # If specified, the system synthesizes a VK_PACKET keystroke. The wVk parameter must be zero. This flag can only be combined with the KEYEVENTF_KEYUP flag. For more information, see the Remarks section. 

  @@rightdown = InputStructure.mouse_input(0,0,0,MOUSEEVENTF_RIGHTDOWN)
  @@rightup = InputStructure.mouse_input(0,0,0,MOUSEEVENTF_RIGHTUP)  
  @@leftdown = InputStructure.mouse_input(0,0,0,MOUSEEVENTF_LEFTDOWN)
  @@leftup = InputStructure.mouse_input(0,0,0,MOUSEEVENTF_LEFTUP)


  def send_input(inputs)
    n = inputs.size
    ptr = inputs.collect {|i| i.to_s}.join
    @@si.call(n, ptr, inputs[0].size)
  end

  def move_mouse(x,y)
    @@scp.call(x,y)
  end
  
  def right_click
    send_input( [@@rightdown, @@rightup] )
  end
  
  def left_click
    send_input( [@@leftdown, @@leftup] )
  end
  
  def get_cursor_pos
    point = " " * 8
    @@gcp.call(point)
    point.unpack('LL')  
  end

end


include AutoClick  # This line allo auto include when the user require the gem

  









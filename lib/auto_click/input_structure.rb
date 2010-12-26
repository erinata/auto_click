module InputStructure

  def self.mouse_input(dx,dy,mouse_data,dw_flags)
    mi = Array.new(7, 0)
    mi[0] = 0
    mi[1] = dx
    mi[2] = dy
    mi[3] = mouse_data
    mi[4] = dw_flags
    mi.pack('LLLLLLL')
  end
  
  
end
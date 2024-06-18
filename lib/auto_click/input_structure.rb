module InputStructure
	def self.mouse_input(dx, dy, mouse_data, dw_flags)
		mi    = Array.new(7, 0)
		mi[0] = 0
		mi[1] = dx
		mi[2] = dy
		mi[3] = mouse_data
		mi[4] = dw_flags
		mi.pack('QLLLLQQ')
	end

	def self.keyboard_input(wVk, dw_flags)
		ki    = Array.new(7, 0)
		ki[0] = 1
		ki[1] = wVk
		ki[2] = dw_flags
		ki.pack('QLLLLQQ')
	end

	# def self.mouse_input_32(dx, dy, mouse_data, dw_flags)
	#     mi    = Array.new(7, 0)
	#     mi[0] = 0
	#     mi[1] = dx
	#     mi[2] = dy
	#     mi[3] = mouse_data
	#     mi[4] = dw_flags
	#     mi.pack('LLLLLLL')
	# end
	# def self.keyboard_input_32(wVk, dw_flags)
	#     ki    = Array.new(7, 0)
	#     ki[0] = 1
	#     ki[1] = wVk
	#     ki[2] = dw_flags
	#     ki.pack('LLLLLLL')
	# end
end
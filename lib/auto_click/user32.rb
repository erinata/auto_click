module User32
  extend Fiddle::Importer
  dlload 'user32'
  extern "int GetCursorPos(char*)"
  extern "int SetCursorPos(int,int)"
  extern "int SendInput(int,char*,int)"
  extern "int GetKeyState(int)"
  extern "int GetSystemMetrics(int)"
end

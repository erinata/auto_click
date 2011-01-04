module User32
  extend DL::Importer
  dlload 'user32'
  extern "int GetCursorPos(char*)"
  extern "int SetCursorPos(int,int)"
  extern "int SendInput(int,char*,int)"
  extern "int GetKeyState(int)"
end
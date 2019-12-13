program CheatEngine;

uses
  windows,
  uFindWindowByExe in '..\uFindWindowByExe.pas';

{$R *.res}
procedure Cheat;
var
  hw: HWND;
  pid: DWord;
  h: THandle;
  readNum: Cardinal;
  ArrAdress: array[0..3] of byte;
  Count: array[0..3] of byte;
  newCount: integer;
  PAdress: PInteger;
  const
  Adress = $53AE8C;
  offset = $398;
begin
  hw := FindHandleByExeName('test.exe');
  if hw = 0 then
  Exit;
  GetWindowThreadProcessId(hw, @pid);
  h := OpenProcess(PROCESS_ALL_ACCESS, false, pid);
  if h = 0 then
  Exit;
  readNum := 4;
  ReadProcessMemory(h, ptr(Adress), @ArrAdress, 4, readNum);
  PAdress := @ArrAdress;
  ReadProcessMemory(h, ptr(PAdress^+ offset), @Count, 4, readNum);
  newCount := 1000;
  move(newCount,Count[0],SizeOf(Count));
  Count := Count;
  WriteProcessMemory(h, ptr(PAdress^+ offset), @Count, 4, readNum);
  CloseHandle(h);
end;
begin
  Cheat();
end.

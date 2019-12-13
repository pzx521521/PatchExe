unit ufrmPatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Generics.Collections;

type

  TModifyRec = record
    address: Integer;
    oldVal: byte;
    newVal: byte;
  end;

  TForm1 = class(TForm)
    mmo1: TMemo;
    pnl1: TPanel;
    btn1: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    FList: TList<TModifyRec>;
    procedure Init;
    procedure PathExe;
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FList.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FList:= TList<TModifyRec>.Create;
  if FileExists('Patch.1337') then
    mmo1.Lines.LoadFromFile('Patch.1337');
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  Init();
  PathExe();
end;

procedure TForm1.PathExe();
var
  MS :TMemoryStream;
  P0 :PByte;
  P1 :PByte;
  I: Integer;
  h: string;
  aModifyRec: TModifyRec;
begin
  MS := TMemoryStream.Create;
  MS.LoadFromFile('test.exe');
  P0 := PByte(MS.Memory);
  for aModifyRec in FList do
  begin
    P1 := P0;
    Inc(P1, aModifyRec.address);
    if P1^ = aModifyRec.oldVal then
      P1^ := aModifyRec.newVal;
  end;
  MS.SaveToFile('test.ok.exe');
//   mmo1.Lines.BeginUpdate;
//   for i:= 0 to 32 -1 do
//   begin
//      if I mod 16 = 0 then
//        h:=IntToHex(I, 8) + ':';
//
//      h := h + ' ' + IntToHex(P1^, 2);
//      Inc(P1);
//      if (I + 1) mod 16 = 0 then
//        mmo1.Lines.Add(h);
//   end;
//   mmo1.Lines.EndUpdate;
  MessageBox(Self.Handle, 'ok', 'tip', 0);
end;

procedure TForm1.Init();
var
  s: string;
  iPos, iPos2: Integer;
  aModifyRec: TModifyRec;
  sAddress: string;
  sOldVal: string;
  sNewVal: string;
begin
  for s in mmo1.Lines do
  begin
    iPos := Pos(':', s);
    iPos2 := Pos('->', s);
    if (iPos = 0) or (iPos2 = 0) then Continue;
    ZeroMemory(@aModifyRec, SizeOf(aModifyRec));
    sAddress := Copy(s, 1, iPos - 1);
    sOldVal := Copy(s, iPos + 1, iPos2 - iPos - 1);
    sNewVal := Copy(s, iPos2 + 2, Length(s) - 2);
    //这里要注意-C00 的算法请参考 VA RVA Offset 之间的关系
    aModifyRec.address := StrToInt('$' + sAddress) - $C00;
    aModifyRec.OldVal := StrToInt('$' + sOldVal);
    aModifyRec.NewVal := StrToInt('$' + sNewVal);
    FList.Add(aModifyRec);
  end;
end;

end.

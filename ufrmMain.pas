unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Btn1: TButton;
    lbl1: TLabel;
    procedure Btn1Click(Sender: TObject);
  private
    Fcpunt: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Btn1Click(Sender: TObject);
begin
  Fcpunt := Fcpunt + 1;
 self.Caption := IntToStr(Fcpunt)
end;

end.

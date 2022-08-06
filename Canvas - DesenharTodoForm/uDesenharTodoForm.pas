unit uDesenharTodoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Click1: Integer;

implementation

{$R *.dfm}

procedure TForm1.FormClick(Sender: TObject);
begin
with Canvas do
  begin
    Brush.Style:=bsSolid;
    Brush.Color:=clWhite;
    Rectangle(0,0,ClientWidth,ClientHeight);
    case Click1 of
      1: Brush.Style:=bsHorizontal;
      2: Brush.Style:=bsVertical;
      3: Brush.Style:=bsFDiagonal;
      4: Brush.Style:=bsBDiagonal;
      5: Brush.Style:=bsCross;
      6: Brush.Style:=bsDiagCross;
      7: Brush.Style:=bsSolid;
      8: Brush.Style:=bsClear;
    end;
    Brush.Color:=clRed;
    Rectangle(0,0,ClientWidth,ClientHeight);
  end;
  Inc(Click1);
  if Click1>8 then Click1:=1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Click1:=1;
end;

end.

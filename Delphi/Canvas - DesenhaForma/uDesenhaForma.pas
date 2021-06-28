unit uDesenhaForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmDesenhaForma = class(TForm)
    Image1: TImage;
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesenhaForma: TfrmDesenhaForma;
  PDown, PActually: TPoint;
  MouseIsDown: boolean;

implementation

{$R *.dfm}

procedure TfrmDesenhaForma.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.Canvas.Rectangle(Rect(PDown.X,PDown.Y,PActually.X,PActually.Y));
  Image1.Canvas.Rectangle(Rect(PDown.X,PDown.Y,x,y));
  MouseIsDown := false;
end;

procedure TfrmDesenhaForma.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.Picture := nil;
  Image1.Transparent := True;
  Image1.Canvas.Pen.Color := clRed;
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Rectangle(Rect(x,y,x,y));
  MouseIsDown := True;
  PDown := Point(x,y);
  PActually := Point(x,y);
end;

procedure TfrmDesenhaForma.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if MouseIsDown then
  begin
    Image1.Picture := nil;
    Image1.Canvas.Brush.Style := bsClear;
    Image1.Canvas.Pen.Color := clRed;
    Image1.Canvas.Pen.Width := 1;
    if X > Image1.Width then
      X := Image1.Width
    else
      if X < 0 then
        X := 0;
    if Y > Image1.Height then
      Y := Image1.Height
    else
      if Y < 0 then
        Y := 0;
    if (PDown.X <= PActually.X) and (PDown.Y <= PActually.Y) then
    begin
      Image1.Canvas.Rectangle(Rect(PDown.X,PDown.Y,PActually.X,PActually.Y
));
      PActually := Point(x,y);
      Image1.Canvas.Rectangle(Rect(PDown.X,PDown.Y,x,y));
    end
    else
    begin
      if (PDown.X >= PActually.X) and (Pdown.Y >= PActually.Y) then
      begin
        Image1.Canvas.Rectangle(Rect(PActually.X,PActually.Y,PDown.X,
PDown.Y));
        PActually := Point(x,y);
        Image1.Canvas.Rectangle(Rect(x,y,PDown.X,PDown.Y));
      end
      else
      begin
        if (PDown.X >= PActually.X) and (PDown.Y <= PActually.Y) then
        begin
          Image1.Canvas.Rectangle(Rect(PActually.X,PDown.Y,PDown.X,
PActually.Y));
          PActually := Point(x,y);
          Image1.Canvas.Rectangle(Rect(x,PDown.Y,PDown.X,y));
        end
        else
        begin
          if (PDown.X <= PActually.X) and (PDown.Y >= PActually.Y) then
          begin
            Image1.Canvas.Rectangle(Rect(PDown.X,PActually.Y,Pactually.X,
PDown.Y));
            PActually := Point(x,y);
            Image1.Canvas.Rectangle(Rect(PDown.X,y,x,PDown.Y));
          end;
        end;
      end;
    end;
  end;
end;

end.

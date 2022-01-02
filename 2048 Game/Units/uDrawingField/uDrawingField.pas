unit uDrawingField;

interface

Uses
  Graphics, ExtCtrls, SysUtils;

Procedure DrawingField (PaintBox: TPaintBox; Size: Integer);
Procedure DrawingPlace (PaintBox: TPaintBox; Size, I, J, Number: Integer);

implementation

uses uGameLogic;

Procedure DrawingPlace (PaintBox: TPaintBox; Size, I, J, Number: Integer);
Var
  Len: Integer;
  xField, yField, Step: Integer;
  xShift, yShift: Integer;
  FontSize: Integer;
Begin
  FontSize:=40;
  PaintBox.Canvas.Font.Size:=FontSize;
  PaintBox.Canvas.Pen.Width:=3;
  Len:=PaintBox.Height-2*PaintBox.Canvas.Pen.Width;
  xField:=(PaintBox.Width-Len) div 2;
  yField:=3;
  Step:=Len div Size;
  While (PaintBox.Canvas.TextWidth(IntToStr(Number))>Step) or (PaintBox.Canvas.TextHeight(IntToStr(Number))>Step) do
  Begin
    Dec(FontSize);
    PaintBox.Canvas.Font.Size:=FontSize;
  End;

  xShift:=(Step-PaintBox.Canvas.TextWidth(IntToStr(Number))) div 2;
  yShift:=(Step-PaintBox.Canvas.TextHeight(IntToStr(Number))) div 2;

  PaintBox.Canvas.TextOut(xField+Step*J+xShift,yField+Step*I+yShift,IntToStr(Number));
End;

Procedure DrawingField (PaintBox: TPaintBox; Size: Integer);
Var
  Len, I, Step: Integer;
  xField, yField, xLines, yLines: Integer;
Begin
  PaintBox.Canvas.Pen.Width:=3;
  Len:=PaintBox.Height-2*PaintBox.Canvas.Pen.Width;
  xField:=(PaintBox.Width-Len) div 2;
  yField:=3;

  //drawing a rectangle
  With PaintBox.Canvas do
  Begin
    Pen.Color:=clBlack;
    Pen.Width:=3;
    Rectangle(xField,yField,xField+Len,Len);

    //drawing a lines
    Pen.Width:=2;
    Step:=Len div Size;
    xLines:=xField+Step;
    yLines:=yField;

    //vertical
    For I:=1 to Size-1 do
    Begin
      MoveTo(xLines,yLines);
      LineTo(xLines,Len);
      xLines:=xLines+Step;
    End;

    //horizontal
    xLines:=xField;
    yLines:=yField+Step;
    For I:=1 to Size-1 do
    Begin
      MoveTo(xLines,yLines);
      LineTo(xLines+Len,yLines);
      yLines:=yLines+Step;
    End;
  End;
End;

end.


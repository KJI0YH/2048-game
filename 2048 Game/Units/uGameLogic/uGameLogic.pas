unit uGameLogic;

interface

Uses
  ExtCtrls, Windows, SysUtils;

Const
  SavedGames = 'Saved Games\';

Type
  TField = Array of Array of Integer;
  TGeneralField = Array [0..7, 0..7] of Integer;

  SavedItem = Packed Record
    FieldState: TGeneralField;
    Size: Integer;
    Points: Integer;
    Steps: Integer;
    Time: Integer;
    p2048: Boolean;
    ShowOnce: Boolean;
  End;

  FSavedGame = File of SavedItem;

Var
  FieldState: TField;
  Points, Time, Steps: Integer;
  Stop, p2048, FirstStep: Boolean;
  StartTick, EndTick: Integer;

Procedure SetZero (Var Field: TField);
Function GeneratePlate (Var Field: TField): Boolean;
Procedure NewGame (Var Field: TField; Size: Integer);
Procedure StartGame (Var FieldState: TField; FieldSize: Integer);
Procedure ScanPlaces (PaintBox: TPaintBox; Field: TField);
Procedure MakeMove (Var Field: TField; Key: Word; Var Stop: Boolean);
Function SkipZero (Field: TField; Var I,J: Integer; Key: Word): Boolean;
Function Changes (Field, NewField: TField): Boolean;
Procedure SavindGame (Field: TField; Points: Integer);
Procedure LoadingGame (FieldName: String);
Function CheckMoves (Field: TField): Boolean;

implementation

uses uMain, uDrawingField, uGameWindow, uFiles, uRecords;

Procedure SetZero (Var Field: TField);
Var
  I, J: Integer;
Begin
  For I:=Low(Field) to High(Field) do
    For J:=Low(Field[I]) to High(Field[I]) do
      Field[I,J]:=0;
End;

Procedure ScanPlaces (PaintBox: TPaintBox; Field: TField);
Var
  I,J: Integer;
Begin
  For I:=Low(Field) to High(Field) do
    For J:=Low(Field[I]) to High(Field[I]) do
      If Field[I,J]<>0 then
        uDrawingField.DrawingPlace(PaintBox,Length(Field),I,J,Field[I,J]);
End;

Procedure SavindGame (Field: TField; Points: Integer);
Var
  F: FSavedGame;
  General: TGeneralField;
  I, J: Integer;
  FieldName: String;
  Item: SavedItem;
Begin
  EndTick:=GetTickCount;
  Time:=(EndTick-StartTick)+Time;

  For I:=Low(Field) to High(Field) do
    For J:=Low(Field) to High(Field) do
      General[I,J]:=Field[I,J];

  FieldName:=SavedGames+IntToStr(Length(Field))+'x'+IntToStr(Length(Field))+'.svd';
  AssignFile(F,FieldName);
  Rewrite(F);

  Item.FieldState:=General;
  Item.Size:=Length(Field);
  Item.Points:=uGameLogic.Points;
  Item.Steps:=uGameLogic.Steps;
  If uGameLogic.Steps=0 then
    Item.Time:=0
  Else
    Item.Time:=uGameLogic.Time;
  Item.p2048:=uGameLogic.p2048;
  Item.ShowOnce:=frmGame.ShowOnce;

  Write(F,Item);
  CloseFile(F);
End;

Procedure LoadingGame (FieldName: String);
Var
  F: FSavedGame;
  Item: SavedItem;
  I, J: Integer;
Begin
  AssignFile(F,FieldName);
  Reset(F);
  Read(F,Item);
  CloseFile(F);

  SetLength(uGameLogic.FieldState,Item.Size,Item.Size);
  For I:=Low(uGameLogic.FieldState) to High(uGameLogic.FieldState) do
    For J:=Low(uGameLogic.FieldState) to High(uGameLogic.FieldState) do
      uGameLogic.FieldState[I,J]:=Item.FieldState[I,J];

  uGameLogic.Points:=Item.Points;
  uGameLogic.Steps:=Item.Steps;
  uGameLogic.Time:=Item.Time;
  uGameLogic.p2048:=Item.p2048;
  uGameLogic.FirstStep:=False;
  frmGame.ShowOnce:=Item.ShowOnce;
End;

Procedure NewGame (Var Field: TField; Size: Integer);
Var
  I: Integer;
Begin
  SetLength(Field,Size,Size);
  SetZero(Field);
  uGameLogic.Points:=0;
  uGameLogic.Steps:=0;
  uGameLogic.Time:=0;
  uGameLogic.FirstStep:=False;
  uGameLogic.p2048:=False;
  frmGame.ShowOnce:=False;
  For I:=1 to 2 do
    GeneratePlate(Field);
End;

Procedure StartGame (Var FieldState: TField; FieldSize: Integer);
Var
  FileName: String;
  F: FItems;
  Item: TItem;
Begin

  FileName:=uFiles.Records+IntToStr(FieldSize)+'x'+IntToStr(FieldSize)+'.pnt';
  If not FileExists(FileName) then
    uFiles.CreateFile(FileName);
  AssignFile(F,FileName);
  Reset(F);
  Read(F,Item);
  CloseFile(F);
  frmGame.lblRecord.Caption:='All-time record: '+IntToStr(Item.Points);

  FileName:=uFiles.Records+IntToStr(FieldSize)+'x'+IntToStr(FieldSize)+'.spd';
  If not FileExists(FileName) then
    uFiles.CreateFile(FileName);
  AssignFile(F,FileName);
  Reset(F);
  Read(F,Item);
  CloseFile(F);
  frmGame.lblSpeedrun.Caption:='All-time speedrun: '+FloatToStr(Item.TimeSpent/1000)+' sec';

  FileName:=SavedGames+IntToStr(FieldSize)+'x'+IntToStr(FieldSize)+'.svd';

  If FileExists(FileName) then
    LoadingGame(FileName)
  Else
    NewGame(FieldState,FieldSize);
End;

Function GeneratePlate (Var Field: TField): Boolean;
Type
  TCoordinates = Record
    I,J: Integer
  End;

  TFreePlaces = Array of TCoordinates;

Var
  FreePlaces: TFreePlaces;
  Len, Index, I, J: Integer;

Begin
  SetLength(FreePlaces,Length(Field)*Length(Field));
  Len:=0;

  For I:=Low(Field) to High(Field) do
    For J:=Low(Field[I]) to High(Field[I]) do
      If Field[I,J]=0 then
      Begin
        FreePlaces[Len].I:=I;
        FreePlaces[Len].J:=J;
        Inc(Len);
      End;

  If Len=0 then
    Result:=False
  Else
  Begin
    Result:=True;
    Randomize;
    Index:=Random(Len);
    If Random(10)=9 then
      Field[FreePlaces[Index].I,FreePlaces[Index].J]:=4
    Else
      Field[FreePlaces[Index].I,FreePlaces[Index].J]:=2;
  End;
End;

Function SkipZero (Field: TField; Var I,J: Integer; Key: Word): Boolean;
Begin
  While (I<Length(Field)) and (J<Length(Field)) and (I>=0) and (J>=0) and (Field[I,J]=0)  do
    Case Key of
      VK_DOWN: Dec(I);
      VK_UP: Inc(I);
      VK_RIGHT: Dec(J);
      VK_LEFT: Inc(J);
    End;

  If (I<0) or (J<0) or (I>=Length(Field)) or (J>=Length(Field)) then
    Result:=False
  Else
    Result:=True;
End;

Function Changes (Field, NewField: TField): Boolean;
Var
  I, J: Integer;
Begin
  Result:=False;
  For I:=Low(Field) to High(Field) do
    For J:=Low(Field) to High(Field) do
      If Field[I,J]<>NewField[I,J] then
      Begin
        Result:=True;
        Exit;
      End;
End;

Function CheckMoves (Field: TField): Boolean;
Var
  I, J: Integer;
Begin
  Result:=False;

  //check lines
  For I:=Low(Field) to High(Field)-1 do
    For J:=Low(Field) to High(Field) do
      If (Field[I,J]=Field[I+1,J]) or (Field[I,J]=0) or (Field[I+1,J]=0) then
      Begin
        Result:=True;
        Exit;
      End;

  //check columns
  For J:=Low(Field) to High(Field)-1 do
    For I:=Low(Field) to High(Field) do
      If (Field[I,J]=Field[I,J+1]) or (Field[I,J]=0) or (Field[I,J+1]=0) then
      Begin
        Result:=True;
        Exit;
      End;
End;

Procedure MakeMove (Var Field: TField; Key: Word; Var Stop: Boolean);
Var
  I, J, NewInd: Integer;
  Current, StartMove, Shift: Integer;
  NewField: TField;
Begin

  If not FirstStep then
  Begin
    FirstStep:=True;
    StartTick:=GetTickCount;
  End;

  Stop:=False;
  SetLength(NewField,Length(Field),Length(Field));
  SetZero(NewField);

  Case Key of
    VK_UP, VK_LEFT:
    Begin
      StartMove:=Low(Field);
      Shift:=1;
    End;

    VK_DOWN, VK_RIGHT:
    Begin
      StartMove:=High(Field);
      Shift:=-1;
    End
    Else
      Exit;
  End;

  Case Key of
    VK_UP, VK_DOWN:
    Begin
      For J:=Low(Field) to High(Field) do
      Begin
        I:=StartMove;
        NewInd:=StartMove;

        While (I>=Low(Field)) and (I<=High(Field)) do
        Begin
          If SkipZero(Field,I,J,Key) then
          Begin
            Current:=Field[I,J];
            I:=I+Shift;
            If SkipZero(Field,I,J,Key) and (Current=Field[I,J]) then
            Begin
              NewField[NewInd,J]:=Current shl 1;
              If (NewField[NewInd,J]=2048) and not p2048 then
                uGameLogic.p2048:=True;
              Points:=Points+NewField[NewInd,J];
              I:=I+Shift;
            End
            Else
              NewField[NewInd,J]:=Current;

            NewInd:=NewInd+Shift;
          End;
        End;
      End;
    End;

    VK_RIGHT, VK_LEFT:
    Begin
      For I:=Low(Field) to High(Field) do
      Begin
        J:=StartMove;
        NewInd:=StartMove;

        While (J>=Low(Field)) and (J<=High(Field)) do
        Begin
          If SkipZero(Field,I,J,Key) then
          Begin
            Current:=Field[I,J];
            J:=J+Shift;
            If SkipZero(Field,I,J,Key) and (Current=Field[I,J]) then
            Begin
              NewField[I,NewInd]:=Current shl 1;
              If (NewField[I,NewInd]=2048) and not p2048 then
                uGameLogic.p2048:=True;
              Points:=Points+NewField[I,NewInd];
              J:=J+Shift;
            End
            Else
              NewField[I,NewInd]:=Current;

            NewInd:=NewInd+Shift;
          End;
        End;
      End;
    End;

  End;

  If Changes(Field,NewField) then
  Begin
    Field:=Copy(NewField);
    Inc(Steps);
    GeneratePlate(Field);
  End
  Else If not CheckMoves(Field) then
  Begin
    EndTick:=GetTickCount;
    Stop:=True;
    Time:=EndTick-StartTick+Time;
  End;
End;

end.

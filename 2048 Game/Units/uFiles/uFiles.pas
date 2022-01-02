unit uFiles;

interface

Uses
  uAddNickname, Controls, SysUtils;

Const
  Records = 'Records\';
  TopCount = 10;

Type

  TItem = Packed Record
    Nickname: TNickname;
    Points: Integer;
    Steps: Integer;
    TimeSpent: Integer;
    Date: TDateTime
  End;

  FItems = File of TItem;

  PLinkedList = ^TLinkedList;

  TLinkedList = Record
    Item: TItem;
    Next: PLinkedList;
  End;

Var
  Head: PLinkedList;
  Top: Integer;

Procedure LoadItems (FileName: String; Var Head: PLinkedList);
Procedure CheckPoints (Points: Integer; Var Head: PLinkedList);
Procedure CheckSpeedrun (Time: Integer; Var Head: PLinkedList);
Procedure CreateFile (FileName: String);
Procedure StoreItems (FileName: String; Head: PLinkedList);

implementation

uses uGameLogic, uEndGame;

Procedure CreateFile (FileName: String);
Var
  F: FItems;
  Item: TItem;
Begin
  AssignFile(F, FileName);
  Rewrite(F);
  Item.Nickname:='It''s empty here';
  Item.Points:=0;
  Item.Steps:=0;
  Item.TimeSpent:=0;
  Item.Date:=0;
  Write(F,Item);
  CloseFile(F);
End;

Procedure LoadItems (FileName: String; Var Head: PLinkedList);
Var
  F: FItems;
  Current: PLinkedList;
Begin
  AssignFile(F,FileName);
  Reset(F);
  New(Head);
  Current:=Head;
  While not EoF(F) do
  Begin
    New(Current^.Next);
    Current:=Current^.Next;
    Read(F,Current^.Item);
  End;
  Current^.Next:=Nil;
End;

Procedure CheckPoints (Points: Integer; Var Head: PLinkedList);
Var
  Current, Added: PLinkedList;
Begin
  Top:=1;
  Current:=Head;
  While (Current^.Next<>Nil) do
    If Points<Current^.Next^.Item.Points then
    Begin
      Inc(Top);
      Current:=Current^.Next;
    End
    Else If frmNickName.AddNickname=mrOK then
    Begin
      New(Added);
      Added^.Next:=Current^.Next;
      Current^.Next:=Added;

      With Added^.Item do
      Begin
        Nickname:=frmNickName.GetNickname;
        Points:=uGameLogic.Points;
        Steps:=uGameLogic.Steps;
        TimeSpent:=uGameLogic.Time;
        Date:=SysUtils.Date;
      End;
      Exit;
    End
    Else
      Exit;

    frmEnd.ShowModal;
End;

Procedure CheckSpeedrun (Time: Integer; Var Head: PLinkedList);
Var
  Current, Added: PLinkedList;
Begin
  Top:=1;
  Current:=Head;
  While (Current^.Next<>Nil) do
    If (Time>Current^.Next^.Item.TimeSpent) and (Current^.Next.Item.TimeSpent<>0) then
    Begin
      Inc(Top);
      Current:=Current^.Next;
    End
    Else If frmNickName.AddNickname=mrOK then
    Begin
      New(Added);
      Added^.Next:=Current^.Next;
      Current^.Next:=Added;

      With Added^.Item do
      Begin
        Nickname:=frmNickName.GetNickname;
        Points:=uGameLogic.Points;
        Steps:=uGameLogic.Steps;
        TimeSpent:=uGameLogic.Time;
        Date:=SysUtils.Date;
      End;
      Exit;
    End
    Else
      Exit;

    frmEnd.ShowModal;
End;

Procedure DeleteListItem (Var Current: PLinkedList);
Var
  Next: PLinkedList;
Begin
  Next:=Current^.Next;
  Dispose(Current);
  Current:=Next;
End;

Procedure StoreItems (FileName: String; Head: PLinkedList);
Var
  F: FItems;
  Current: PLinkedList;
  I: Integer;
Begin
  AssignFile(F,FileName);
  Rewrite(F);
  Current:=Head^.Next;
  I:=1;
  While (Current<>Nil) and (I<=uFiles.TopCount) do
  Begin
    Write(F,Current^.Item);
    Inc(I);
    DeleteListItem(Current);
  End;
  While Current<>Nil do
    DeleteListItem(Current);
End;

end.

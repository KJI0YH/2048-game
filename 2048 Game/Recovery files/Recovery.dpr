program Recovery;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  TNickName = String[20];

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
  F: FItems;
  Item: TItem;
  Head, Current: PlinkedList;
  I: Integer;

begin
  AssignFile(F,'Records\3x3.pnt');
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
  CloseFile(F);

  Rewrite(F);
  I:=1;
  Current:=Head^.Next;
  While Current<>Nil do
  Begin
    If I=7 then
      Current^.Item.Date:=Date;

    Write(F,Current^.Item);
    Inc(I);
    Current:=Current^.Next;
  End;
end.
 
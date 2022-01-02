unit uRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uFiles;

type
  TfrmRecords = class(TForm)
    lvPoints: TListView;
    pcRecords: TPageControl;
    tsPoints: TTabSheet;
    tsSpeedrun: TTabSheet;
    lvSpeedRun: TListView;

    Procedure UpdatePoints (FileName: String);
    Procedure UpdateSpeedrun (FileName: String);
    procedure tsPointsShow(Sender: TObject);
    procedure tsSpeedrunShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecords: TfrmRecords;

implementation

uses uMain, uAddNickname;

{$R *.dfm}

Procedure TfrmRecords.UpdatePoints (FileName: String);
Var
  F: FItems;
  Item: TItem;
  I: Integer;
Begin
  If not FileExists(FileName) then
    uFiles.CreateFile(FileName);

  lvPoints.Items.BeginUpdate;
  lvPoints.Items.Clear;
  AssignFile(F,FileName);
  Reset(F);
  I:=1;
  While not EoF(F) do
  Begin
    Read(F,Item);
    With lvPoints.Items.Add do
    Begin
      Caption:=IntToStr(I);
      SubItems.Add(Item.Nickname);
      SubItems.Add(IntToStr(Item.Points));
      SubItems.Add(IntToStr(Item.Steps));
      SubItems.Add(FloatToStr(Item.TimeSpent/1000)+' sec');
      SubItems.Add(DateToStr(Item.Date));
    End;
    Inc(I);
  End;
  CloseFile(F);
  lvPoints.Items.EndUpdate;
End;

Procedure TfrmRecords.UpdateSpeedrun (FileName: String);
Var
  F: FItems;
  Item: TItem;
  I: Integer;
Begin
  If not FileExists(FileName) then
    uFiles.CreateFile(FileName);

  lvSpeedRun.Items.BeginUpdate;
  lvSpeedRun.Items.Clear;
  AssignFile(F,FileName);
  Reset(F);
  I:=1;
  While not EoF(F) do
  Begin
    Read(F,Item);
    With lvSpeedRun.Items.Add do
    Begin
      Caption:=IntToStr(I);
      SubItems.Add(Item.Nickname);
      SubItems.Add(FloatToStr(Item.TimeSpent/1000)+' sec');
      SubItems.Add(IntToStr(Item.Points));
      SubItems.Add(IntToStr(Item.Steps));
      SubItems.Add(DateToStr(Item.Date))
    End;
    Inc(I);
  End;
  CloseFile(F);
  lvSpeedRun.Items.EndUpdate;
End;

procedure TfrmRecords.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Show;
end;

procedure TfrmRecords.tsPointsShow(Sender: TObject);
begin
  UpdatePoints(uFiles.Records+IntToStr(frmMain.FieldSize)+'x'+IntToStr(frmMain.FieldSize)+'.pnt');
end;

procedure TfrmRecords.tsSpeedrunShow(Sender: TObject);
begin
  UpdateSpeedrun(uFiles.Records+IntToStr(frmMain.FieldSize)+'x'+IntToStr(frmMain.FieldSize)+'.spd');
end;

procedure TfrmRecords.FormShow(Sender: TObject);
begin
  UpdatePoints(uFiles.Records+IntToStr(frmMain.FieldSize)+'x'+IntToStr(frmMain.FieldSize)+'.pnt');
  UpdateSpeedrun(uFiles.Records+IntToStr(frmMain.FieldSize)+'x'+IntToStr(frmMain.FieldSize)+'.spd');
end;

end.

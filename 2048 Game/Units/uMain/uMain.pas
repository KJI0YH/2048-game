unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmMain = class(TForm)
    btnStartGame: TButton;
    btnRecords: TButton;
    btnRight: TButton;
    btnLeft: TButton;

    lblSize: TLabel;
    lblAuthor: TLabel;
    lblUniversity: TLabel;

    pnlButtons: TPanel;
    pnlField: TPanel;
    pbField: TPaintBox;

    procedure FormShow(Sender: TObject);
    procedure pbFieldPaint(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure btnStartGameClick(Sender: TObject);
    procedure btnRecordsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FieldSize: 3..8;
  end;

var
  frmMain: TfrmMain;

implementation

uses uDrawingField, uGameWindow, uGameLogic, uRecords;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FieldSize:=Low(FieldSize);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

  frmMain.pbField.Invalidate;
  frmMain.lblSize.Caption:=IntToStr(FieldSize)+'x'+IntToStr(FieldSize);
end;

procedure TfrmMain.btnRightClick(Sender: TObject);
begin
  If FieldSize<>High(FieldSize) then
    FieldSize:=Succ(FieldSize)
  Else
    FieldSize:=Low(FieldSize);

  lblSize.Caption:=IntToStr(FieldSize)+'x'+IntToStr(FieldSize);
  frmMain.pbField.Invalidate;
end;

procedure TfrmMain.btnLeftClick(Sender: TObject);
begin
  If FieldSize<>Low(FieldSize) then
    FieldSize:=Pred(FieldSize)
  Else
    FieldSize:=High(FieldSize);

  lblSize.Caption:=IntToStr(FieldSize)+'x'+IntToStr(FieldSize);
  frmMain.pbField.Invalidate;
end;

procedure TfrmMain.pbFieldPaint(Sender: TObject);
begin
  uDrawingField.DrawingField(pbField,FieldSize);
end;

procedure TfrmMain.btnStartGameClick(Sender: TObject);
begin
  frmMain.Hide;
  uGameLogic.StartGame(uGameLogic.FieldState,FieldSize);
  uGameWindow.frmGame.Show;
end;

procedure TfrmMain.btnRecordsClick(Sender: TObject);
begin
  frmMain.Hide;
  uRecords.frmRecords.ShowModal;
end;

Initialization
Begin
  CreateDir('Saved Games');
  CreateDir('Records');
End;

end.

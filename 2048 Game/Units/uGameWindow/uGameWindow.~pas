unit uGameWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmGame = class(TForm)
    pbGame: TPaintBox;
    pnlGame: TPanel;
    pnlTop: TPanel;
    btnRestart: TButton;
    lblPoints: TLabel;
    lblRecord: TLabel;
    pnlPoints: TPanel;
    pnlSteps: TPanel;
    lblSteps: TLabel;
    lblSpeedrun: TLabel;
    pnlButtons: TPanel;
    procedure pbGamePaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRestartClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    ShowOnce: Boolean;
  end;

var
  frmGame: TfrmGame;

implementation

uses uDrawingField, uMain, uGameLogic, uFiles;

{$R *.dfm}

procedure TfrmGame.pbGamePaint(Sender: TObject);
begin
  uDrawingField.DrawingField(pbGame,frmMain.FieldSize);
  uGameLogic.ScanPlaces(pbGame,uGameLogic.FieldState);
  lblPoints.Caption:='Points: '+IntToStr(uGameLogic.Points);
  lblSteps.Caption:='Steps: '+IntToStr(uGameLogic.Steps);
end;

procedure TfrmGame.FormShow(Sender: TObject);
begin
  pbGame.Invalidate;
end;

procedure TfrmGame.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  uGameLogic.SavindGame(uGameLogic.FieldState,uGameLogic.Points);
  uMain.frmMain.Show;
end;

procedure TfrmGame.btnRestartClick(Sender: TObject);
begin
  uGameLogic.NewGame(uGameLogic.FieldState,uMain.frmMain.FieldSize);
  pbGame.Invalidate;
  btnRestart.Enabled:=False;
  btnRestart.Enabled:=True;
end;


procedure TfrmGame.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  FileName: String;
begin
  If (Key=VK_UP) or (Key=VK_DOWN) or (Key=VK_LEFT) or (Key=VK_RIGHT) then
    uGameLogic.MakeMove(uGameLogic.FieldState,Key,uGameLogic.Stop);
    
  If not uGameLogic.Stop then
    pbGame.Invalidate
  Else
  Begin
    FileName:=uFiles.Records+IntToStr(frmMain.FieldSize)+'x'+IntToStr(frmMain.FieldSize)+'.pnt';
    If not FileExists(FileName) then
      uFiles.CreateFile(FileName);
    uFiles.LoadItems(FileName,uFiles.Head);
    uFiles.CheckPoints(uGameLogic.Points,uFiles.Head);
    uFiles.StoreItems(FileName,uFiles.Head);
    uGameLogic.NewGame(uGameLogic.FieldState,uMain.frmMain.FieldSize);
    pbGame.Invalidate;
  End;

  If uGameLogic.p2048 and not ShowOnce then
  Begin
    uGameLogic.EndTick:=GetTickCount;
    uGameLogic.Time:=EndTick-StartTick+uGameLogic.Time;
    FileName:=uFiles.Records+IntToStr(frmMain.FieldSize)+'x'+IntToStr(frmMain.FieldSize)+'.spd';
    If not FileExists(FileName) then
      uFiles.CreateFile(FileName);
    uFiles.LoadItems(FileName,uFiles.Head);
    uFiles.CheckSpeedrun(uGameLogic.Time,uFiles.Head);
    uFiles.StoreItems(FileName,uFiles.Head);
    uGameLogic.StartTick:=GetTickCount;
    ShowOnce:=True;
  End;

end;

end.



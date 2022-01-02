program Game2048;

uses
  Forms,
  uMain in 'Units\uMain\uMain.pas' {frmMain},
  uDrawingField in 'Units\uDrawingField\uDrawingField.pas',
  uGameWindow in 'Units\uGameWindow\uGameWindow.pas' {frmGame},
  uGameLogic in 'Units\uGameLogic\uGameLogic.pas',
  uFiles in 'Units\uFiles\uFiles.pas',
  uRecords in 'Units\uRecords\uRecords.pas' {frmRecords},
  uAddNickname in 'Units\uAddNickname\uAddNickname.pas' {frmNickName},
  uEndGame in 'Units\uEndGame\uEndGame.pas' {frmEnd};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '2048';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGame, frmGame);
  Application.CreateForm(TfrmNickName, frmNickName);
  Application.CreateForm(TfrmRecords, frmRecords);
  Application.CreateForm(TfrmEnd, frmEnd);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGame, frmGame);
  Application.CreateForm(TfrmRecords, frmRecords);
  Application.CreateForm(TfrmNickName, frmNickName);
  Application.CreateForm(TfrmEnd, frmEnd);
  Application.Run;
end.

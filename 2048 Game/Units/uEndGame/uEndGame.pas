unit uEndGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmEnd = class(TForm)
    lblEnd: TLabel;
    lblScore: TLabel;
    lblTime: TLabel;

    btnOk: TButton;

    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnd: TfrmEnd;

implementation

uses uGameLogic;

{$R *.dfm}

procedure TfrmEnd.FormShow(Sender: TObject);
begin
  lblScore.Caption:='You have scored: '+ IntToStr(uGameLogic.Points)+' points';
  lblTime.Caption:='with the time: ' +FloatToStr(uGameLogic.Time/1000)+' sec';
end;

procedure TfrmEnd.btnOkClick(Sender: TObject);
begin
  frmEnd.Close;
end;

end.

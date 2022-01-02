unit uAddNickname;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TNickName = String[20];

  TfrmNickName = class(TForm)
    leNickname: TLabeledEdit;
    lblTop: TLabel;
    btnAdd: TButton;
    lblScore: TLabel;
    procedure leNicknameChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    function AddNickname: Integer;
    procedure FormShow(Sender: TObject);
    
  published
    Function GetNickname: TNickname;

    Property Nickname: TNickname read GetNickname;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNickName: TfrmNickName;

implementation

uses uFiles, uGameLogic;

{$R *.dfm}

procedure TfrmNickName.leNicknameChange(Sender: TObject);
begin
  If leNickname.Text='' then
    btnAdd.Enabled:=False
  Else
    btnAdd.Enabled:=True;
end;

Function TfrmNickName.GetNickname: TNickname;
Begin
  Result:=frmNickname.leNickName.Text;
End;

procedure TfrmNickName.btnAddClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

function TfrmNickName.AddNickname: Integer;
Begin
  Result:=ShowModal;
End;

procedure TfrmNickName.FormShow(Sender: TObject);
begin
  lblTop.Caption:='Now you are entering the top: '+IntToStr(uFiles.Top);

  If uGameLogic.p2048 and not uGameLogic.Stop then
    lblScore.Caption:='with the time: '+FloatToStr(uGameLogic.Time/1000)
  Else
    lblScore.Caption:='with the score: '+IntToStr(uGameLogic.Points);
end;

end.

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Display;
    procedure OnLevel;
    procedure OnAddExp;
    procedure OnModHP(Value: Integer);
    procedure OnDead;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Player;

var
  P: TPlayer;

procedure TForm1.Button1Click(Sender: TObject);
begin
  P.AddExp(55);
  Display;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  P.ModHP(+2);
  Display;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  P.ModHP(-2);
  Display;
end;

procedure TForm1.Display;
begin
  Memo1.Clear;
  Memo1.Lines.Append(Format('Level: %d', [P.Level]));
  Memo1.Lines.Append(Format('Exp: %d/%d', [P.Exp, P.MaxExp]));
  Memo1.Lines.Append(Format('HP: %d/%d', [P.HP, P.MaxHP]));
  Memo1.Lines.Append(Format('MP: %d/%d', [P.MP, P.MaxMP]));
  // Memo1.Lines.Append(Format('', []));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  P := TPlayer.Create;
  P.OnLevel := OnLevel;
  P.OnModHP := OnModHP;
  P.OnBeforeAddExp := OnAddExp;
  P.OnMinHP := OnDead;
  OnLevel;
  Display;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  P.Free;
end;

procedure TForm1.OnAddExp;
begin
  //ShowMessage('OnBeforeAddExp');
end;

procedure TForm1.OnDead;
begin
    ShowMessage('DEAD!!!');
end;

procedure TForm1.OnLevel;
begin
  P.Exp := P.Exp - P.MaxExp;
  P.MaxExp := P.Level * 50;
  P.MaxHP := P.MaxHP + 2;
  P.MaxMP := P.MaxMP + 5;
//  P.ModHP();
end;

procedure TForm1.OnModHP(Value: Integer);
begin
  //ShowMessage(Format('OnModHP: %d', [Value]));

end;

end.

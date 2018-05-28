unit Player;

interface

type
  TNotifyEvent = procedure of object;
  TPNotifyEvent = procedure(Value: Integer) of object;

type
  TPlayer = class(TObject)
  public
    X, Y: Integer;
    Exp: Integer;
    MaxExp: Integer;
    HP: Integer;
    MaxHP: Integer;
    MP: Integer;
    MaxMP: Integer;
    Level: Integer;
    OnBeforeAddExp: TNotifyEvent;
    OnAfterAddExp: TNotifyEvent;
    OnLevel: TNotifyEvent;
    OnMinHP: TNotifyEvent;
    OnMaxHP: TNotifyEvent;
    OnModHP: TPNotifyEvent;
    OnMinMP: TNotifyEvent;
    OnMaxMP: TNotifyEvent;
    OnModMP: TPNotifyEvent;
    constructor Create;
    procedure AddExp(const AExp: Integer);
    procedure ModHP(const Value: Integer);
    procedure ModMP(const Value: Integer);
  end;

implementation

uses Math;

{ TPlayer }

procedure TPlayer.AddExp(const AExp: Integer);
begin
  if Assigned(OnBeforeAddExp) then
    OnBeforeAddExp;
  Exp := Exp + AExp;
  if (Exp >= MaxExp) then
  begin
    Level := Level + 1;
    if Assigned(OnLevel) then
      OnLevel;
  end;
  if Assigned(OnAfterAddExp) then
    OnAfterAddExp;
end;

constructor TPlayer.Create;
begin
  X := 0;
  Y := 0;
  Exp := 0;
  MaxExp := 0;
  HP := 10;
  MaxHP := 10;
  MP := 10;
  MaxMP := 10;
  Level := 1;
end;

procedure TPlayer.ModHP(const Value: Integer);
begin
  HP := EnsureRange(HP + Value, 0, MaxHP);
  if Assigned(OnModHP) then
    OnModHP(Value);
  if (HP = MaxHP) and Assigned(OnMaxHP) then
    OnMaxHP;
  if (HP = 0) and Assigned(OnMinHP) then
    OnMinHP;
end;

procedure TPlayer.ModMP(const Value: Integer);
begin
  MP := EnsureRange(MP + Value, 0, MaxMP);
  if Assigned(OnModMP) then
    OnModMP(Value);
  if (MP = MaxMP) and Assigned(OnMaxMP) then
    OnMaxMP;
  if (MP = 0) and Assigned(OnMinMP) then
    OnMinMP;
end;

end.

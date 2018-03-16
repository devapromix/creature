Program Creature;

{$APPTYPE CONSOLE}

uses System.SysUtils, EventArray;

type
  TCustomEvent = procedure(Params: Integer) of object;

type
  TMyEventClient = class(TObject)
  private
    FEvents: TEventArray;
    procedure CallEvents(Params: Integer);
    property Events: TEventArray read FEvents;
  public
    procedure AddEvent(AEvent: TCustomEvent);
    procedure RemoveEvent(AEvent: TCustomEvent);
    constructor Create();
    destructor Destroy(); override;
  end;

type
  THP = class(TObject)
  private
  public

    procedure Print(Params: Integer);
    procedure lol(Params: Integer);
  end;

const
  SFEventError: string = 'Error in Event with parameter %d';

var
  MyEventClient: TMyEventClient;
  HP: THP;

procedure TMyEventClient.AddEvent(AEvent: TCustomEvent);
begin
  Events.Add(TMethod(AEvent));
end;

procedure TMyEventClient.RemoveEvent(AEvent: TCustomEvent);
begin
  Events.Remove(TMethod(AEvent));
end;

procedure TMyEventClient.CallEvents(Params: Integer);
var
  I: Integer;
begin
  for I := 0 to Events.Count - 1 do
    if Events.IsValid(I) then
      try
        TCustomEvent(Events[I])(Params);
      except
        WriteLn(Format(SFEventError, [Params]));
      end;
end;

{ THP }

procedure THP.lol(Params: Integer);
begin
  WriteLn('lol' + IntToStr(Params));
end;

procedure THP.Print(Params: Integer);
begin
  WriteLn(IntToStr(Params));
end;


constructor TMyEventClient.Create;
begin
  FEvents := TEventArray.Create();
end;

destructor TMyEventClient.Destroy;
begin
  FreeAndNil(FEvents);
  inherited;
end;

begin
  HP := THP.Create;
  MyEventClient := TMyEventClient.Create;
  MyEventClient.AddEvent(HP.Print);
  MyEventClient.AddEvent(HP.lol);
  MyEventClient.CallEvents(666);

  ReadLn

end.

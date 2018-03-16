unit EventArray;

interface

type
  TEventArray = class(TObject)
  private
    FEvents: array of TMethod;
    function GetCount: Integer;
    function GetEvent(Index: Integer): TMethod;
  public
    procedure Add(AEvent: TMethod);
    procedure Remove(AEvent: TMethod);
    property Count: Integer read GetCount;
    property Events[Index: Integer]: TMethod read GetEvent; default;
    function IsValid(Index: Integer): Boolean;
  end;

implementation

procedure TEventArray.Add(AEvent: TMethod);
var
  i: Integer;
begin
  // note the non-existence of "- 1"
  for i := 0 to Count do
    if i = Count then
    begin
      SetLength(FEvents, Count + 1);
      FEvents[i] := AEvent;
    end
    else
      if not IsValid(i) then
      begin
        FEvents[i] := AEvent;
        Break;
      end;
end;

function TEventArray.GetCount: Integer;
begin
  Result := Length(FEvents);
end;

function TEventArray.GetEvent(Index: Integer): TMethod;
begin
  if (Index >= 0) and (Index < Count) then
    Result := FEvents[Index];
end;

function TEventArray.IsValid(Index: Integer): Boolean;
begin
  Result := Assigned(FEvents[Index].Data) and Assigned(FEvents[Index].Code);
end;

procedure TEventArray.Remove(AEvent: TMethod);
var
  I: Integer;
begin
  for i := 0 to Count - 1 do
    if (TMethod(FEvents[i]).Code = TMethod(AEvent).Code) and
      (TMethod(FEvents[i]).Data = TMethod(AEvent).Data) then
    begin
      FEvents[i].Data := nil;
      FEvents[i].Code := nil;
      Break;
    end;
end;

end.

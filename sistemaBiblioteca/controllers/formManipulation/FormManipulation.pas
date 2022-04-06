unit FormManipulation;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormManipulation = class
    procedure AbrirForm(const objForm: TForm);
    procedure MostrarForm(const objForm: TForm);
    procedure LimparInputs(const owner: TWinControl);
    function ExisteInputsVazios(const owner: TWinControl): Boolean;
  end;

implementation

procedure TFormManipulation.AbrirForm(const objForm: TForm);
var
  mousePointer: TPoint;
begin
  mousePointer := Mouse.CursorPos;
  objForm.Left := mousePointer.X - 100;
  objForm.Top := mousePointer.Y - 100;
end;

procedure TFormManipulation.MostrarForm(const objForm: TForm);
begin
  if objForm.Visible = True then
  begin
    objForm.BringToFront;
  end
  else
  begin
    objForm.Visible := True
  end;
end;

procedure TFormManipulation.LimparInputs(const owner: TWinControl);
var
  i: Integer;
begin
  for i := 0 to owner.ComponentCount - 1 do
    if owner.Components[i] is TEdit then
      TEdit(owner.Components[i]).Clear;
end;

function TFormManipulation.ExisteInputsVazios(const owner: TWinControl): Boolean;
var
  i: Integer;
  countInputs: Integer;

begin

  countInputs := 0;

  for i := 0 to owner.ComponentCount - 1 do
  begin
    if owner.components[i] is TEdit then
    begin
      if TEdit(owner.Components[i]).Text = '' then
      begin
        countInputs := countInputs + 1;
      end;
    end;
  end;

  if countInputs > 0 then
    begin
      Result := True;
    end
  else
    begin
      Result := False;
    end;
end;
end.

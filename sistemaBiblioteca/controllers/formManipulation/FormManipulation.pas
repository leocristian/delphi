unit FormManipulation;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormManipulation = class
    procedure AbrirForm(const objForm: TForm);
    procedure LimparInputs(const owner: TWinControl);
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

procedure TFormManipulation.LimparInputs(const owner: TWinControl);
var
  i: Integer;
begin
  for i := 0 to owner.ComponentCount - 1 do
    if owner.Components[i] is TEdit then
      TEdit(owner.Components[i]).Clear;
end;

end.

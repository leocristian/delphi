unit u_forms;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

procedure AbrirForm(const objForm: TForm);
procedure MostrarForm(const objForm: TForm);
procedure LimparInputs(const owner: TWinControl);
function ExisteInputsVazios(const owner: TWinControl): Boolean;
function testacpf(cpf:string):boolean;
function testaemail(aStr: string): Boolean;

implementation
procedure AbrirForm(const objForm: TForm);
var
  mousePointer: TPoint;
begin
  mousePointer := Mouse.CursorPos;
  objForm.Left := mousePointer.X - 100;
  objForm.Top := mousePointer.Y - 100;
end;
procedure MostrarForm(const objForm: TForm);
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
procedure LimparInputs(const owner: TWinControl);
var
  i: Integer;
begin
  for i := 0 to owner.ComponentCount - 1 do
    if owner.Components[i] is TEdit then
      TEdit(owner.Components[i]).Clear;
end;
function ExisteInputsVazios(const owner: TWinControl): Boolean;
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


function testacpf(cpf:string):boolean;
var i:integer;
    Want:char;
    Wvalid:boolean;
    Wdigit1,Wdigit2:integer;
begin
    Wdigit1:=0;
    Wdigit2:=0;
    Want:=cpf[1];//variavel para testar se o cpf é repetido como 111.111.111-11
    Delete(cpf,ansipos('.',cpf),1);  //retira as mascaras se houver
    Delete(cpf,ansipos('.',cpf),1);
    Delete(cpf,ansipos('-',cpf),1);

   //testar se o cpf é repetido como 111.111.111-11
   for i:=1 to length(cpf) do
     begin
       if cpf[i] <> Want then
         begin
            Wvalid:=true;  // se o cpf possui um digito diferente ele passou no primeiro teste
            break
         end;
     end;
       // se o cpf é composto por numeros repetido retorna falso
     if not Wvalid then
       begin
          result:=false;
          exit;
       end;

     //executa o calculo para o primeiro verificador
     for i:=1 to 9 do
       begin
          wdigit1:=Wdigit1+(strtoint(cpf[10-i])*(I+1));
       end;
        Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
        {formula do primeiro verificador
            soma=1°*2+2°*3+3°*4.. até 9°*10
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

         //verifica se o 1° digito confere
        if IntToStr(Wdigit1) <> cpf[10] then
          begin
             result:=false;
             exit;
          end;


         for i:=1 to 10 do
       begin
          wdigit2:=Wdigit2+(strtoint(cpf[11-i])*(I+1));
       end;
       Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
         {formula do segundo verificador
            soma=1°*2+2°*3+3°*4.. até 10°*11
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

       // confere o 2° digito verificador
       if IntToStr(Wdigit2) <> cpf[11] then
          begin
             result:=false;
             exit;
          end;

   //se chegar até aqui o cpf é valido
   result:=true;
end;

function testaemail(aStr: string): Boolean;
begin
 aStr := Trim(UpperCase(aStr));
 if Pos('@', aStr) > 1 then
 begin
   Delete(aStr, 1, pos('@', aStr));
   Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
 end
 else
   Result := False;
end;

end.

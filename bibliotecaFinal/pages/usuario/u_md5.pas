unit u_md5;

interface uses IdHashMessageDigest, Classes, SysUtils;

function MD5String(const Value: string): string;

implementation {Função : MD5String(Const Value : String): String;}

function MD5String(const Value: string): string;
  var
    xMD5: TIdHashMessageDigest5;
  begin
    xMD5 := TIdHashMessageDigest5.Create;
    try
      Result := LowerCase(xMD5.HashStringAsHex(Value));
    finally
      xMD5.Free;
    end;
  end;
end.

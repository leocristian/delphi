unit UserUnit;

interface

uses
  System.SysUtils, System.Classes;

type
  TUserScreen = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserScreen: TUserScreen;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

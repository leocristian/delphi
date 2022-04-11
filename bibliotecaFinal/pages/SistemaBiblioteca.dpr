program SistemaBiblioteca;

uses
  Vcl.Forms,
  u_login in 'usuario\u_login.pas' {LoginForm},
  u_cadastro in 'usuario\u_cadastro.pas' {CadastroForm},
  u_dm1 in 'u_dm1.pas' {dm1: TDataModule},
  u_forms in 'u_forms.pas',
  u_principal in 'u_principal.pas' {FormPrincipal},
  u_usuarios in 'usuario\u_usuarios.pas' {FormUsuarios},
  u_clientes in 'cliente\u_clientes.pas' {FormClientes},
  u_mostrar in 'usuario\u_mostrar.pas' {UsuarioForm},
  u_perfil in 'usuario\u_perfil.pas' {PerfilUsuario},
  u_mostrarClientes in 'cliente\u_mostrarClientes.pas' {MostrarClientesForm},
  u_vendas in 'vendas\u_vendas.pas' {FormVendas},
  u_novaVenda in 'vendas\u_novaVenda.pas' {NovaVendaForm},
  u_vendaControle in 'vendas\u_vendaControle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCadastroForm, CadastroForm);
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormUsuarios, FormUsuarios);
  Application.CreateForm(TFormClientes, FormClientes);
  Application.CreateForm(TUsuarioForm, UsuarioForm);
  Application.CreateForm(TPerfilUsuario, PerfilUsuario);
  Application.CreateForm(TMostrarClientesForm, MostrarClientesForm);
  Application.CreateForm(TFormVendas, FormVendas);
  Application.CreateForm(TNovaVendaForm, NovaVendaForm);
  Application.Run;
end.

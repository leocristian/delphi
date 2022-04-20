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
  u_vendaControle in 'vendas\u_vendaControle.pas',
  u_escolhaLivro in 'vendas\u_escolhaLivro.pas' {EscolhaLivroForm},
  u_livros in 'livros\u_livros.pas' {FormLivros},
  u_novoLivro in 'livros\u_novoLivro.pas' {NovoLivroForm},
  u_mostrarLivro in 'livros\u_mostrarLivro.pas' {MostrarLivroForm},
  u_novoCliente in 'cliente\u_novoCliente.pas' {NovoCliente},
  u_mostrarVenda in 'vendas\u_mostrarVenda.pas' {MostrarVendaForm},
  u_alterarSenha in 'usuario\u_alterarSenha.pas' {AlterarSenhaForm},
  u_md5 in 'usuario\u_md5.pas',
  frame_busca in 'frames\frame_busca.pas' {FrameBusca: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCadastroForm, CadastroForm);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormUsuarios, FormUsuarios);
  Application.CreateForm(TUsuarioForm, UsuarioForm);
  Application.CreateForm(TPerfilUsuario, PerfilUsuario);
  Application.CreateForm(TMostrarClientesForm, MostrarClientesForm);
  Application.CreateForm(TFormVendas, FormVendas);
  Application.CreateForm(TMostrarVendaForm, MostrarVendaForm);
  Application.CreateForm(TEscolhaLivroForm, EscolhaLivroForm);
  Application.CreateForm(TFormLivros, FormLivros);
  Application.CreateForm(TNovoLivroForm, NovoLivroForm);
  Application.CreateForm(TMostrarLivroForm, MostrarLivroForm);
  Application.CreateForm(TNovoCliente, NovoCliente);
  Application.CreateForm(TMostrarVendaForm, MostrarVendaForm);
  Application.CreateForm(TFormClientes, FormClientes);
  Application.CreateForm(TAlterarSenhaForm, AlterarSenhaForm);
  Application.Run;
end.



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
  u_mostrarClientes in 'cliente\u_mostrarClientes.pas' {ClienteForm},
  u_vendas in 'vendas\u_vendas.pas' {FormVendas},
  u_vendaControle in 'vendas\u_vendaControle.pas',
  u_escolhaLivro in 'vendas\u_escolhaLivro.pas' {EscolhaLivroForm},
  u_livros in 'livros\u_livros.pas' {FormLivros},
  u_mostrarLivro in 'livros\u_mostrarLivro.pas' {LivroForm},
  u_mostrarVenda in 'vendas\u_mostrarVenda.pas' {MostrarVendaForm},
  u_alterarSenha in 'usuario\u_alterarSenha.pas' {AlterarSenhaForm},
  u_md5 in 'usuario\u_md5.pas',
  frame_busca in 'frames\frame_busca.pas' {FrameBusca: TFrame},
  frame_estilo in 'frames\frame_estilo.pas' {frame_cxGrid: TFrame},
  frame_grid in 'frames\frame_grid.pas' {frame_estilo_grid: TFrame},
  u_novoLivro in 'livros\u_novoLivro.pas' {NovoLivroForm},
  frame_imagens in 'frames\frame_imagens.pas' {FrameImagens},
  frame_seleciona_item in 'frames\frame_seleciona_item.pas' {SelecionaItemFrame},
  u_novaVenda in 'vendas\u_novaVenda.pas' {NovaVendaForm},
  u_novoCliente in 'cliente\u_novoCliente.pas' {NovoCliente},
  u_mostrarVenda2 in 'vendas\u_mostrarVenda2.pas' {FormVenda},
  u_atualizarEstoque in 'livros\u_atualizarEstoque.pas' {AtualizarEstoqueForm},
  u_selecionaCliente in 'cliente\u_selecionaCliente.pas',
  u_escolhaCliente in 'vendas\u_escolhaCliente.pas' {EscolhaClienteForm};

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
  Application.CreateForm(TClienteForm, ClienteForm);
  Application.CreateForm(TFormVendas, FormVendas);
  Application.CreateForm(TMostrarVendaForm, MostrarVendaForm);
  Application.CreateForm(TEscolhaLivroForm, EscolhaLivroForm);
  Application.CreateForm(TFormLivros, FormLivros);
  Application.CreateForm(TLivroForm, LivroForm);
  Application.CreateForm(TMostrarVendaForm, MostrarVendaForm);
  Application.CreateForm(TFormClientes, FormClientes);
  Application.CreateForm(TAlterarSenhaForm, AlterarSenhaForm);
  Application.CreateForm(TNovoLivroForm, NovoLivroForm);
  Application.CreateForm(TNovoCliente, NovoCliente);
  Application.CreateForm(TFormVenda, FormVenda);
  Application.CreateForm(TAtualizarEstoqueForm, AtualizarEstoqueForm);
  Application.CreateForm(TEscolhaClienteForm, EscolhaClienteForm);
  Application.Run;
end.



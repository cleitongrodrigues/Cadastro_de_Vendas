unit UCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmCadClientes = class(TForm)
    lblCodigo: TLabel;
    DBEdit1: TDBEdit;
    dsCadClientes: TDataSource;
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblSexo: TLabel;
    edtSexo: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsCadClientesStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin
  DM.qryCadClientes.Cancel;
end;

procedure TfrmCadClientes.btnEditarClick(Sender: TObject);
begin
  DM.qryCadClientes.Edit;
end;

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
begin
  DM.qryCadClientes.Delete;
end;

procedure TfrmCadClientes.btnNovoClick(Sender: TObject);
begin
  DM.qryCadClientes.Append;
end;

procedure TfrmCadClientes.btnSalvarClick(Sender: TObject);
begin
  DM.qryCadClientes.Post;
end;

procedure TfrmCadClientes.dsCadClientesStateChange(Sender: TObject);
begin
  btnNovo.Enabled := dsCadClientes.State = dsBrowse;
  btnEditar.Enabled := dsCadClientes.State = dsBrowse;
  btnExcluir.Enabled := dsCadClientes.State = dsBrowse;
  btnSalvar.Enabled := dsCadClientes.State in [dsInsert, dsEdit];
  btnCancelar.Enabled := dsCadClientes.State in [dsInsert, dsEdit];
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryCadClientes.Close;
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  DM.qryCadClientes.Open;
end;

end.

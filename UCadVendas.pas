unit UCadVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmCadVendas = class(TForm)
    lblCodigo: TLabel;
    DBEdit1: TDBEdit;
    dsCadVendas: TDataSource;
    lblCodigoCliente: TLabel;
    DBEdit2: TDBEdit;
    lblDtVenda: TLabel;
    edtDtVenda: TDBEdit;
    lblFormPagamento: TLabel;
    edtFormPagamento: TDBEdit;
    lblValorVenda: TLabel;
    edtValorTotal: TDBEdit;
    lblQtParcelas: TLabel;
    edtQtdParcelas: TDBEdit;
    lblSttVenda: TLabel;
    edtVendaFinalizada: TDBEdit;
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
    procedure dsCadVendasStateChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVendas: TfrmCadVendas;

implementation

{$R *.dfm}

uses UDM, UPesqVendas;

procedure TfrmCadVendas.btnCancelarClick(Sender: TObject);
begin
  DM.qryCadVendas.Cancel;
end;

procedure TfrmCadVendas.btnEditarClick(Sender: TObject);
begin
  DM.qryCadVendas.Edit;
end;

procedure TfrmCadVendas.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Realmete deseja excluir essa venda?','CONFIRMAÇÃO',
                            MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.qryCadVendas.Delete;
  end;
end;

procedure TfrmCadVendas.btnNovoClick(Sender: TObject);
begin
  DM.qryCadVendas.Append;
end;

procedure TfrmCadVendas.btnPesquisarClick(Sender: TObject);
begin
  frmPesqVendas := TfrmPesqVendas.Create(self);
  try
    frmPesqVendas.ShowModal;
  finally
    frmPesqVendas.Free;
  end;
end;

procedure TfrmCadVendas.btnSalvarClick(Sender: TObject);
begin
  Application.MessageBox('Concluído com sucesso!','AVISO', MB_OK + MB_ICONEXCLAMATION);
  DM.qryCadVendas.Post;
end;

procedure TfrmCadVendas.dsCadVendasStateChange(Sender: TObject);
begin
  btnNovo.Enabled := dsCadVendas.State = dsBrowse;
  btnEditar.Enabled := dsCadVendas.State = dsBrowse;
  btnExcluir.Enabled := dsCadVendas.State = dsBrowse;
  btnSalvar.Enabled := dsCadVendas.State in [dsInsert, dsEdit];
  btnCancelar.Enabled := dsCadVendas.State in [dsInsert, dsEdit];
end;

procedure TfrmCadVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryCadVendas.Close;
end;

procedure TfrmCadVendas.FormShow(Sender: TObject);
begin
  DM.qryCadVendas.Open;
end;

end.

unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDM = class(TDataModule)
    Conexao: TADOConnection;
    qryCadClientes: TADOQuery;
    qryCadClientesCod_Cliente: TAutoIncField;
    qryCadClientesNome_Cliente: TStringField;
    qryCadClientesTelefone_Cliente: TStringField;
    qryCadClientesSexo_Cliente: TStringField;
    qryCadClientesEndereco_Cliente: TStringField;
    qryCadVendas: TADOQuery;
    qryCadVendasCod_Venda: TAutoIncField;
    qryCadVendasCod_Cliente: TIntegerField;
    qryCadVendasData_Venda: TDateTimeField;
    qryCadVendasForma_Pagamento_Venda: TWordField;
    qryCadVendasValor_Total_Venda: TBCDField;
    qryCadVendasQtd_Parcelas_Venda: TIntegerField;
    qryCadVendasStatus_Venda: TWordField;
    qryPesqParcelas: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UCadClientes;

{$R *.dfm}

end.

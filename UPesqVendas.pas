unit UPesqVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Data.DB;

type
  TfrmPesqVendas = class(TForm)
    dbgVendas: TDBGrid;
    btnPesquisar: TBitBtn;
    Label1: TLabel;
    cbbMes: TComboBox;
    cbAno: TComboBox;
    btnPagar: TBitBtn;
    dsPesqParcela: TDataSource;
    dsPagarParcela: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqVendas: TfrmPesqVendas;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmPesqVendas.btnPagarClick(Sender: TObject);
begin
  if not (DM.qryPesqParcelas.IsEmpty) then
  begin
    DM.qryPagarParcela.Close;
    DM.qryPagarParcela.Parameters.ParamByName('Cod_Venda').Value :=
        DM.qryPesqParcelas.FieldByName('Cod_Venda').AsInteger;

    DM.qryPagarParcela.Parameters.ParamByName('DataVenc').Value :=
        DM.qryPesqParcelas.FieldByName('Data_Vencimento_Parcela').AsDateTime;

    DM.qryPagarParcela.ExecSQL;

    ShowMessage('Deu certo!');
    DM.qryPesqParcelas.Close;
    DM.qryPesqParcelas.Open;
  end
  else
      ShowMessage('Nenhuma parcela selecionada');
end;

procedure TfrmPesqVendas.btnPesquisarClick(Sender: TObject);
begin
  if DM.qryPesqParcelas.Active then
    DM.qryPesqParcelas.Close;

  DM.qryPesqParcelas.Parameters.ParamByName('Mes').Value := StrToInt(cbbMes.Text);
  DM.qryPesqParcelas.Parameters.ParamByName('Ano').Value := StrToInt(cbAno.Text);

  DM.qryPesqParcelas.Open;
end;

end.

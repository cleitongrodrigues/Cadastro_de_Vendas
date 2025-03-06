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
    procedure btnPesquisarClick(Sender: TObject);
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

procedure TfrmPesqVendas.btnPesquisarClick(Sender: TObject);
begin
  if DM.qryPesqParcelas.Active then
    DM.qryPesqParcelas.Close;

  DM.qryPesqParcelas.Parameters.ParamByName('Mes').Value := StrToInt(cbbMes.Text);
  DM.qryPesqParcelas.Parameters.ParamByName('Ano').Value := StrToInt(cbAno.Text);

  DM.qryPesqParcelas.Open;
end;

end.

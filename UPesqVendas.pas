unit UPesqVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmPesqVendas = class(TForm)
    DBGrid1: TDBGrid;
    btnPesquisar: TBitBtn;
    Label1: TLabel;
    cbbMes: TComboBox;
    ComboBox1: TComboBox;
    btnPagar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqVendas: TfrmPesqVendas;

implementation

{$R *.dfm}

end.

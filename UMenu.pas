unit UMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ImgList, Vcl.Menus;

type
  TfrmMenu = class(TForm)
    mmMenu: TMainMenu;
    Cadastro1: TMenuItem;
    Gerar1: TMenuItem;
    Sair1: TMenuItem;
    mmClientes: TMenuItem;
    mmVenda: TMenuItem;
    mmRelatório: TMenuItem;
    aclMenu: TActionList;
    Images: TImageList;
    actClientes: TAction;
    actVendas: TAction;
    actRelatorio: TAction;
    actSair: TAction;
    procedure actSairExecute(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses UCadClientes, UCadVendas, UDM;

procedure TfrmMenu.actClientesExecute(Sender: TObject);
begin
  frmCadClientes := TfrmCadClientes.Create(self);
  try
    frmCadClientes.ShowModal;
  finally
    frmCadClientes.Free;
  end;
end;

procedure TfrmMenu.actSairExecute(Sender: TObject);
begin
  frmMenu.Close;
end;

procedure TfrmMenu.actVendasExecute(Sender: TObject);
begin
  frmCadVendas := TfrmCadVendas.Create(self);
  try
    frmCadVendas.ShowModal;
  finally
    frmCadVendas.Free;
  end;
end;
end.

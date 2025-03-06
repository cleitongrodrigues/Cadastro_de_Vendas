program CadastroDeVendas;

uses
  Vcl.Forms,
  UCadClientes in 'UCadClientes.pas' {frmCadClientes},
  UDM in 'UDM.pas' {DM: TDataModule},
  UCadVendas in 'UCadVendas.pas' {frmCadVendas},
  UMenu in 'UMenu.pas' {frmMenu},
  UPesqVendas in 'UPesqVendas.pas' {frmPesqVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPesqVendas, frmPesqVendas);
  Application.Run;
end.

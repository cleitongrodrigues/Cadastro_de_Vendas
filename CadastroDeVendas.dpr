program CadastroDeVendas;

uses
  Vcl.Forms,
  UCadClientes in 'UCadClientes.pas' {frmCadClientes},
  UDM in 'UDM.pas' {DM: TDataModule},
  UCadVendas in 'UCadVendas.pas' {frmCadVendas},
  UMenu in 'UMenu.pas' {frmMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

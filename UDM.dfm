object DM: TDM
  OldCreateOrder = False
  Height = 203
  Width = 347
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CAD_VENDAS;Data Source=DESKTOP-C54NB6O'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 24
  end
  object qryCadClientes: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Cod_Cliente'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE Cod_Cliente = :Cod_Cliente')
    Left = 48
    Top = 80
    object qryCadClientesCod_Cliente: TAutoIncField
      FieldName = 'Cod_Cliente'
      ReadOnly = True
    end
    object qryCadClientesNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 50
    end
    object qryCadClientesTelefone_Cliente: TStringField
      FieldName = 'Telefone_Cliente'
      EditMask = '(00)00000-0000;0;_'
      Size = 11
    end
    object qryCadClientesSexo_Cliente: TStringField
      FieldName = 'Sexo_Cliente'
      FixedChar = True
      Size = 1
    end
    object qryCadClientesEndereco_Cliente: TStringField
      FieldName = 'Endereco_Cliente'
      Size = 50
    end
  end
  object qryCadVendas: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Cod_Venda'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM VENDAS'
      'WHERE Cod_Venda = :Cod_Venda')
    Left = 136
    Top = 80
    object qryCadVendasCod_Venda: TAutoIncField
      FieldName = 'Cod_Venda'
      ReadOnly = True
    end
    object qryCadVendasCod_Cliente: TIntegerField
      FieldName = 'Cod_Cliente'
    end
    object qryCadVendasData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qryCadVendasForma_Pagamento_Venda: TWordField
      FieldName = 'Forma_Pagamento_Venda'
    end
    object qryCadVendasValor_Total_Venda: TBCDField
      FieldName = 'Valor_Total_Venda'
      Precision = 10
      Size = 2
    end
    object qryCadVendasQtd_Parcelas_Venda: TIntegerField
      FieldName = 'Qtd_Parcelas_Venda'
    end
    object qryCadVendasStatus_Venda: TWordField
      FieldName = 'Status_Venda'
    end
  end
end

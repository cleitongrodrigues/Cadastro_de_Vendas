USE CAD_VENDAS
CREATE TABLE CLIENTES (
    Cod_Cliente			INTEGER			PRIMARY KEY IDENTITY,
    Nome_Cliente		VARCHAR(50)		NOT NULL,
    Telefone_Cliente	VARCHAR(11)		NOT NULL,
    Sexo_Cliente		CHAR(1),
    Endereco_Cliente	VARCHAR(50),
);

SELECT * FROM CLIENTES
WHERE Cod_Cliente = :Cod_Cliente

CREATE TABLE VENDAS (
    Cod_Venda			INTEGER			PRIMARY KEY IDENTITY,
    Cod_Cliente			INTEGER			NOT NULL,
    Data_Venda			DATETIME		DEFAULT GETDATE(),
    Forma_Pagamento_Venda		TINYINT			CHECK (Forma_Pagamento_Venda IN (1,2,3,4,5)),
    Valor_Total_Venda			DECIMAL(10,2)	NOT NULL,
    Qtd_Parcelas_Venda		INTEGER,
	Status_Venda TINYINT CHECK (Status_Venda IN (0, 1, 2)),  -- 0 = Pendiente, 1 = Pago, 2 = Cancelado
    FOREIGN KEY (Cod_Cliente) REFERENCES CLIENTES(Cod_Cliente) ON DELETE CASCADE
);


CREATE TABLE PARCELAS (
    Cod_Parcela			INTEGER			PRIMARY KEY IDENTITY,
    Cod_Venda			INTEGER			NOT NULL,
    Numero_Parcela		INTEGER			NOT NULL,
    Valor_Parcela		DECIMAL(10,2)	NOT NULL,
    Data_Vencimento_Parcela		DATE			NOT NULL,
    Status_Parcela				TINYINT			CHECK (Status_Parcela IN (0,1)),
    FOREIGN KEY (Cod_Venda) REFERENCES VENDAS(Cod_venda) ON DELETE CASCADE
);

CREATE VIEW VENDAS_VIEW 
AS
    SELECT 
        v.Cod_Venda,
        v.Cod_Cliente,
        v.Data_venda,
        v.Valor_total_Venda,  -- Nome da coluna alterado
        v.Qtd_parcelas_Venda, -- Nome da coluna alterado
        CASE 
            WHEN v.Forma_pagamento_Venda = 1 THEN '� vista'
            WHEN v.Forma_pagamento_Venda = 2 THEN 'Promiss�ria'
            WHEN v.Forma_pagamento_Venda = 3 THEN 'Cr�dito'
            WHEN v.Forma_pagamento_Venda = 4 THEN 'D�bito'
            WHEN v.Forma_pagamento_Venda = 5 THEN 'PIX'
            ELSE 'Desconhecido'
        END AS Forma_pagamento,
        CASE 
            WHEN v.Status_Venda = 0 THEN 'Pendente'
            WHEN v.Status_Venda = 1 THEN 'Pago'
            WHEN v.Status_Venda = 2 THEN 'Cancelado'
            ELSE 'Desconhecido'
        END AS Status_Venda  -- Nome da coluna alterado
    FROM VENDAS v;

	select * from VENDAS_VIEW


SELECT FKId_TBProduto,IXCodigo_TBCodigo_barras,DFUNIDADE_COMPRA_TBPRODUTO,DFIntegrado_portal_TBCodigo_barras,DFIntegrado_filiais_TBCodigo_barras,DFData_alteracao_TBCodigo_barras,DFCodigo_Identificador_TBCodigo_barras 
INTO TBA
FROM TBCodigo_barras 
INNER JOIN TBProduto ON TBCodigo_barras.FKId_TBProduto = TBProduto.PKID_TBProduto
WHERE DFUNIDADE_COMPRA_TBPRODUTO <> DFUNIDADE_VENDA_TBPRODUTO
AND DFUnidade_TBCodigo_barras = DFUNIDADE_VENDA_TBPRODUTO

SELECT FKId_TBProduto,IXCodigo_TBCodigo_barras,DFUNIDADE_VENDA_TBPRODUTO,DFIntegrado_portal_TBCodigo_barras,DFIntegrado_filiais_TBCodigo_barras,DFData_alteracao_TBCodigo_barras,DFCodigo_Identificador_TBCodigo_barras 
INTO TBB
FROM TBCodigo_barras 
INNER JOIN TBProduto ON TBCodigo_barras.FKId_TBProduto = TBProduto.PKID_TBProduto
WHERE DFUNIDADE_COMPRA_TBPRODUTO <> DFUNIDADE_VENDA_TBPRODUTO
AND DFUnidade_TBCodigo_barras = DFUNIDADE_COMPRA_TBPRODUTO 

SELECT FKId_TBProduto,IXCodigo_TBCodigo_barras,DFUNIDADE_VENDA_TBPRODUTO,DFIntegrado_portal_TBCodigo_barras,DFIntegrado_filiais_TBCodigo_barras,DFData_alteracao_TBCodigo_barras,DFCodigo_Identificador_TBCodigo_barras 
INTO TBC
FROM TBCodigo_barras 
INNER JOIN TBProduto ON TBCodigo_barras.FKId_TBProduto = TBProduto.PKID_TBProduto
WHERE DFUnidade_TBCodigo_barras <> DFUNIDADE_VENDA_TBPRODUTO
AND DFUnidade_TBCodigo_barras <> DFUNIDADE_COMPRA_TBPRODUTO 


SELECT * FROM TBA
UNION 
SELECT * FROM TBB
UNION
SELECT * FROM TBC

INSERT TBCodigo_barras
SELECT * FROM TBA
UNION 
SELECT * FROM TBB
UNION 
SELECT * FROM TBC


DROP TABLE TBA
DROP TABLE TBB
DROP TABLE TBC
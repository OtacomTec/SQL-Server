
DECLARE @Classificacao     nvarchar(100), 
        @Campo_Formatado   nvarchar(100), 
        @Ordem             nvarchar(100), 
        @Resultado         nvarchar(100),
        @Parte_Campo       nvarchar(100),
        @intPosicao_Ponto  int,
        @Id_TBCentro_custo int

DECLARE Centro_custo CURSOR FOR
SELECT PKId_TBCentro_custo, DFClassificacao_TBCentro_custo, DFOrdem_TBCentro_custo
FROM TBCentro_custo
WHERE DFOrdem_TBCentro_custo is null

OPEN Centro_custo

FETCH NEXT FROM Centro_custo
INTO @Id_TBCentro_custo, @Classificacao, @Ordem

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Campo_Formatado = ''
    IF CHARINDEX('.', @Classificacao) <> 0 
    BEGIN
        WHILE CHARINDEX('.', @Classificacao) <> 0
        BEGIN  
            SET @intPosicao_Ponto = CHARINDEX('.', @Classificacao)
            SET @Parte_Campo = SUBSTRING(@Classificacao, 1, @intPosicao_Ponto - 1)
            SELECT @Campo_Formatado = @Campo_Formatado + '.' + 
            CASE 
                WHEN LEN(@Parte_Campo) = 1 THEN '00' + @Parte_Campo
                WHEN LEN(@Parte_Campo) = 2 THEN '0'  + @Parte_Campo
                ELSE @Parte_Campo 
            END

            SET @Classificacao = SUBSTRING(@Classificacao, @intPosicao_Ponto + 1, LEN(@Classificacao))
            IF CHARINDEX('.', @Classificacao) = 0 
              BREAK
            ELSE
              CONTINUE

        END         
    END 
    
    IF CHARINDEX('.', @Classificacao) = 0      
    BEGIN
       SELECT @Campo_Formatado = @Campo_Formatado + '.' +
       CASE 
           WHEN LEN(@Classificacao) = 1 THEN '00' + @Classificacao
           WHEN LEN(@Classificacao) = 2 THEN '0'  + @Classificacao
           ELSE @Classificacao
       END
    END 

    UPDATE TBCentro_custo SET DFOrdem_TBCentro_custo = SUBSTRING(@Campo_Formatado, 2, LEN(@Campo_Formatado) - 1) WHERE PKId_TBCentro_custo = @Id_TBCentro_custo 

    FETCH NEXT FROM Centro_custo
    INTO @Id_TBCentro_custo, @Classificacao, @Ordem
END

CLOSE Centro_custo
DEALLOCATE Centro_custo


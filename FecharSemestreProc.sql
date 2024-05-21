CREATE or ALTER PROC Fechar_semestre 
AS
BEGIN
	DECLARE Aux_Cursor CURSOR FOR  
		SELECT  RA_aluno
				,Sigla_disciplina
				,N1
                ,N2
                ,Sub
                ,Faltas
                ,Media
                ,Situacao
		FROM Aluno_Disciplina;
		--where
 
	OPEN Aux_Cursor
 
	DECLARE @RA_aluno varchar(15),
			@codigo varchar(4),
			@N1 numeric(3,1),
            @N2 numeric(3,1),
            @Sub numeric(3,1),
            @Faltas int,
            @Media numeric(3,1),
            @Situacao VARCHAR(17),
            @Menor numeric(3,1),
            @frequencia numeric(4,2)
            
 
	FETCH NEXT FROM Aux_Cursor  
	INTO @RA_aluno,
		 @codigo,
		 @N1,
         @N2,
         @Sub,
         @Faltas,
         @Media,
         @Situacao 
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
        DECLARE @Total_aulas int;
        SET @Total_aulas =( SELECT Total_aulas FROM Disciplina WHERE Sigla = @codigo)




        

        if (@N1 is null)
        begin 
            SET @N1 = 0
        end
        if (@N2 is null)
        begin 
            SET @N2 = 0
        end

        if(@Sub is not null)
        BEGIN
            SET @Menor = @N1

            if (@N1 > @N2)
            BEGIN
                SET @Menor = @N2
            END

            SET @Media = (@Menor + @Sub) / 2
        END
        ELSE
        BEGIN
            SET @Media = (@N1 + @N2) / 2
        END

        SET @frequencia = (@Faltas * 100) / @Total_aulas


        IF(@frequencia < 75.0)
            SET @Situacao = 'REPROVADO POR FALTA'
        ELSE IF (@Media < 6)
            SET @Situacao = 'REPROVADO POR NOTA'
        ELSE
            SET @Situacao = 'APROVADO'


        update Aluno_Disciplina
        SET 
            Media = @Media,
            Situacao = @Situacao
        WHERE   
            RA_aluno = @RA_aluno and Sigla_disciplina = @codigo

		FETCH NEXT FROM Aux_Cursor  
        INTO @RA_aluno,
            @codigo,
            @N1,
            @N2,
            @Sub,
            @Faltas,
            @Media,
            @Situacao

	END
    PRINT('');
 
	CLOSE Aux_Cursor
	DEALLOCATE Aux_Cursor
END

EXEC Fechar_semestre
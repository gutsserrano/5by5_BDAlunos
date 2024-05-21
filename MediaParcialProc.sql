CREATE or ALTER PROC Calculo_Media_Parcial 
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
		FROM Aluno_Disciplina
		--where
 
	OPEN Aux_Cursor
 
	DECLARE @RA_aluno varchar(15),
			@codigo varchar(4),
			@N1 numeric(3,1),
            @N2 numeric(3,1),
            @Sub numeric(3,1),
            @Faltas int,
            @Media numeric(3,1)
 
	FETCH NEXT FROM Aux_Cursor  
	INTO @RA_aluno,
		 @codigo,
		 @N1,
         @N2,
         @Sub,
         @Faltas,
         @Media
 
    PRINT('Dados do Registro:');
    PRINT('');
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
	    Print('    Id: '+ @RA_aluno +' Codigo: '+ @codigo+' nota 1: '+CONVERT(varchar(10),ISNULL(@N1, 0))+' nota 2: '+CONVERT(varchar(10),ISNULL(@N2, 0)));
        Print('        Média: '+CONVERT(varchar(20), ((@N1 + @N2) / 2)));

        if (@N1 is null)
        begin 
            SET @N1 = 0
        end
        if (@N2 is null)
        begin 
            SET @N2 = 0
        end

        SET @Media = (@N1 + @N2) / 2

        update Aluno_Disciplina
        SET 
            Media = @Media
        WHERE   
            RA_aluno = @RA_aluno and Sigla_disciplina = @codigo

		FETCH NEXT FROM Aux_Cursor  
        INTO @RA_aluno,
            @codigo,
            @N1,
            @N2,
            @Sub,
            @Faltas,
            @Media

	END
    PRINT('');
 
	CLOSE Aux_Cursor
	DEALLOCATE Aux_Cursor
END
 
EXEC Calculo_Media_Parcial
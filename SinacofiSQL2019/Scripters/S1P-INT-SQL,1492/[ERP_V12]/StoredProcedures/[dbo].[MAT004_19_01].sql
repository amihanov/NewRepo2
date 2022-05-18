SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[MAT004_19_01]') IS NULL EXEC('CREATE PROCEDURE [dbo].[MAT004_19_01] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- Procedure creation 
ALTER PROCEDURE [dbo].[MAT004_19_01]
(
    @IN_FILIALCOR Char( 2) , 
    @IN_MV_NIVALT Char( 01 ) , 
    @IN_MV_LOCPROC Char( 2) , 
    @IN_MV_PAR1 Char( 08 ) , 
    @IN_MV_PAR09 Integer , 
    @IN_MV_PAR11 Integer , 
    @IN_MV_PAR14 Integer , 
    @IN_MV_CUSFIFO Char( 01 ) , 
    @IN_MV_RASTRO Char( 01 ) , 
    @IN_MV_LOCALIZ Char( 01 ) , 
    @IN_MV_CQ Char( 2) , 
    @IN_DINICIO Char( 08 ) , 
    @IN_TAM_TRB_DOC Integer , 
    @IN_COPCOES Char( 04 ) , 
    @IN_CUSUNIF Char( 01 ) , 
    @IN_MV_PRODPR0 Integer , 
    @IN_DDATABASE Char( 08 ) , 
    @IN_MV_NEGESTR Char( 01 ) , 
    @IN_RECNOSMO Integer , 
    @IN_MV_PAR18 Integer , 
    @IN_CPAISLOC Char( 03 ) , 
    @IN_FILSEQ Integer , 
    @IN_MV_PRODMNT Char( 15) , 
    @IN_MV_MOEDACM Char( 5 ) , 
    @IN_MV_D3SERVI Char( 01 ) , 
    @IN_INTDL Char( 01 ) , 
    @IN_MV_CUSREP Char( 01 ) , 
    @IN_MV_PAR15 Integer , 
    @IN_USAFILTRF Char( 01 ) , 
    @IN_SEQ500 Char( 01 ) , 
    @IN_MVULMES Char( 08 ) , 
    @IN_MV_WMSNEW Char( 01 ) , 
    @IN_MV_PRODMOD Char( 01 ) , 
    @IN_MV_SEQREBE Char( 03 ) , 
    @IN_MV_330JCM1 Char( 05 ) , 
    @IN_MV_PROCQE6 Char( 01 ) , 
    @IN_FILIALPROC Char( 2) , 
    @OUT_RESULTADO Char( 01 )  output ) AS
 
-- Declaration of variables
DECLARE @cFil_AFN Char( 2)
DECLARE @cFil_SD1 Char( 2)
DECLARE @cFil_SD2 Char( 2)
DECLARE @cFil_SD3 Char( 2)
DECLARE @cFil_SF4 Char( 2)
DECLARE @cFil_SG1 Char( 2)
DECLARE @cFil_SB1 Char( 2)
DECLARE @cExecutou Char( 01 )
DECLARE @vContador Integer
DECLARE @vRecnoD1 Integer
DECLARE @vRecnoMNT Integer
DECLARE @cF4_PODER3 Char( 1)
DECLARE @cF4_ESTOQUE Char( 1)
DECLARE @cD1_COD Char( 15)
DECLARE @cD1_TIPO Char( 1)
DECLARE @cD1_OP Char( 13)
DECLARE @cD1_NUMSEQ Char( 6)
DECLARE @cD1_LOCAL Char( 2)
DECLARE @cD1_DOC Char( 9)
DECLARE @cD1_SERIE Char( 3)
DECLARE @cD1_FORNECE Char( 14)
DECLARE @cD1_LOJA Char( 4)
DECLARE @cD1_ITEM Char( 4)
DECLARE @cD1_TIPODOC Char( 2)
DECLARE @vRecnoD2 Integer
DECLARE @cD2_COD Char( 15)
DECLARE @cD2_LOCAL Char( 2)
DECLARE @cD2_TIPO Char( 1)
DECLARE @cD2_TIPODOC Char( 2)
DECLARE @vRecnoD3 Integer
DECLARE @vRecnoD7 Integer
DECLARE @cD3_COD Char( 15)
DECLARE @cD3_LOCAL Char( 2)
DECLARE @cD3_CF Char( 3)
DECLARE @cD3_NUMSEQ Char( 6)
DECLARE @cD3_DOC Char( 9)
DECLARE @cD3_ESTORNO Char( 1)
DECLARE @cD3_LOTECTL Char( 10)
DECLARE @cD3_NUMLOTE Char( 6)
DECLARE @cD3_PROJPMS Char( 10)
DECLARE @cD3_OP Char( 14)
DECLARE @cD3_IDENT Char( 6)
DECLARE @cD3_EMISSAO Char( 8)
DECLARE @cD3_CHAVE Char( 2)
DECLARE @nRecTRB Integer
DECLARE @iRecCount Integer
DECLARE @MV_PAR14 Integer
DECLARE @cMDia Char( 01 )
DECLARE @cAux VarChar( 3 )
DECLARE @cAux1 VarChar( 3 )
DECLARE @nAux Integer
DECLARE @nAptmPMS Integer
DECLARE @nAptmPMSTMP Integer
DECLARE @iTRA_RECNO Integer
DECLARE @cTransf Char( 01 )
DECLARE @nRecnoSD3 Integer
DECLARE @cD3_STATUS VarChar( 2 )
DECLARE @fim_CUR Integer
DECLARE @cMV_PAR1 Char( 08 )
DECLARE @cDINICIO Char( 08 )
DECLARE @cMV_PRODMNT Char( 15)
DECLARE @cFILIALCOR Char( 2)
DECLARE @cMV_CQ Char( 2)
DECLARE @cB1_CCCUSTO Char( 9)
DECLARE @nConSD3 Char( 01 )
BEGIN
   SET @cMV_PAR1  = @IN_MV_PAR1 
   SET @cDINICIO  = @IN_DINICIO 
   SET @cMV_PRODMNT  = @IN_MV_PRODMNT 
   SET @cFILIALCOR  = @IN_FILIALCOR 
   SET @cMV_CQ  = @IN_MV_CQ 
   SET @cAux  = 'AFN' 
   EXEC XFILIAL_19_01 @cAux , @cFILIALCOR , @cFil_AFN output 
   SET @cAux  = 'SD1' 
   EXEC XFILIAL_19_01 @cAux , @cFILIALCOR , @cFil_SD1 output 
   SET @cAux  = 'SD2' 
   EXEC XFILIAL_19_01 @cAux , @cFILIALCOR , @cFil_SD2 output 
   SET @cAux  = 'SD3' 
   EXEC XFILIAL_19_01 @cAux , @cFILIALCOR , @cFil_SD3 output 
   SET @cAux  = 'SF4' 
   EXEC XFILIAL_19_01 @cAux , @cFILIALCOR , @cFil_SF4 output 
   SET @cAux  = 'SG1' 
   EXEC XFILIAL_19_01 @cAux , @cFILIALCOR , @cFil_SG1 output 
   SET @cAux  = 'SB1' 
   EXEC XFILIAL_19_01 @cAux , @cFILIALCOR , @cFil_SB1 output 
   SET @OUT_RESULTADO  = '0' 
   SET @cExecutou  = ' ' 
   SET @vRecnoD3  = 0 
   SET @vRecnoD7  = 0 
   SET @cD3_ESTORNO  = ' ' 
   SET @MV_PAR14  = @IN_MV_PAR14 
   SET @cTransf  = '0' 
   SET @nAptmPMS  = 0 
   SET @nAptmPMSTMP  = 0 
   SET @cD3_STATUS  = '  ' 
   SET @vRecnoD1  = 0 
   SET @cB1_CCCUSTO  = ' ' 
   SET @nConSD3  = '0' 
   SET @cAux  = '  ' 
   EXEC MAT007_19_01 @cFILIALCOR , @cAux , @cDINICIO , @IN_MV_LOCPROC , @IN_COPCOES , @IN_CUSUNIF , @IN_DDATABASE , @IN_MV_NEGESTR , 
          @IN_MV_MOEDACM , @IN_MV_PAR1 , @IN_MV_CUSFIFO , @cMV_PRODMNT , @IN_MV_D3SERVI , @IN_INTDL , @cMV_CQ , @IN_MVULMES , 
          @IN_MV_WMSNEW , @IN_MV_PRODMOD , @cExecutou output 
    
   -- Cursor declaration SD1_Cursor
   DECLARE SD1_Cursor insensitive  CURSOR FOR 
   SELECT SD1.R_E_C_N_O_ , SF4.F4_PODER3 , D1_COD , D1_TIPO , D1_OP , D1_NUMSEQ , D1_DOC , D1_SERIE , D1_FORNECE , D1_LOJA , 
          D1_ITEM , D1_TIPODOC , D1_LOCAL , SF4.F4_ESTOQUE 
     FROM SD1010 SD1, SF4010 SF4
     WHERE SD1.D1_FILIAL  = @cFil_SD1  and SF4.F4_FILIAL  = @cFil_SF4  and SD1.D1_DTDIGIT  >= @cDINICIO  and SD1.D1_DTDIGIT  <= @cMV_PAR1 
      and SD1.D1_TES  = SF4.F4_CODIGO  and SF4.F4_ESTOQUE  = 'S'  and SD1.D1_ORIGLAN  <> 'LF'  and SD1.D1_REMITO  = ' '  and SD1.D_E_L_E_T_  = ' ' 
      and SF4.D_E_L_E_T_  = ' ' 
   FOR READ ONLY 
    
   OPEN SD1_Cursor
   FETCH SD1_Cursor 
    INTO @vRecnoD1 , @cF4_PODER3 , @cD1_COD , @cD1_TIPO , @cD1_OP , @cD1_NUMSEQ , @cD1_DOC , @cD1_SERIE , @cD1_FORNECE , 
          @cD1_LOJA , @cD1_ITEM , @cD1_TIPODOC , @cD1_LOCAL , @cF4_ESTOQUE 
   WHILE (@@Fetch_Status  = 0 )
   BEGIN
      SET @nRecnoSD3  = 0 
      SET @cB1_CCCUSTO  = ' ' 
      IF  (@cD1_OP  <> ' ' )  and  (@cF4_ESTOQUE  = 'S' )  and  (@cF4_PODER3 NOT IN ( 'R' , 'S'  ) ) 
      BEGIN 
         SELECT @nRecnoSD3  = COALESCE ( R_E_C_N_O_ , 0 )
           FROM SD3010 SD3
           WHERE SD3.D3_FILIAL  = @cFil_SD3  and  ( ( (@cMV_CQ  = @cD1_LOCAL )  and  (SD3.D3_IDENT  = @cD1_NUMSEQ ) )  or  ( (@cMV_CQ  <> @cD1_LOCAL 
           )  and  (SD3.D3_NUMSEQ  = @cD1_NUMSEQ ) ) )  and SD3.D3_EMISSAO  >= @cDINICIO  and SD3.D3_EMISSAO  <= @cMV_PAR1 
            and SD3.D3_CF  = 'RE5'  and SD3.D3_COD  = @cD1_COD  and SD3.D3_OP  = @cD1_OP  and SD3.D3_ESTORNO  = ' '  and SD3.D_E_L_E_T_  = ' ' 
           
      END 
      IF @nRecnoSD3 is null 
      BEGIN 
         SET @nRecnoSD3  = 0 
      END 
      IF  (@cD1_TIPO  <> 'D' ) 
      BEGIN 
         IF  (@cF4_PODER3  = 'D' ) 
         BEGIN 
            SET @cAux  = 'D' 
            EXEC MAT042_19_01 @cFILIALCOR , @cAux , @cMV_PAR1 , @IN_MV_PAR14 , @vRecnoD1 , @cDINICIO , @cMDia output 
            IF  (@cMDia  = '1' ) 
            BEGIN 
               SET @cAux  = 'SD1' 
               SET @cAux1  = '300' 
               SET @nAux  = 0 
               EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                      @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                      @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
            END 
            ELSE 
            BEGIN 
               SET @cAux  = 'SD1' 
               SET @cAux1  = '280' 
               SET @nAux  = 0 
               EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                      @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                      @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
            END 
         END 
         ELSE 
         BEGIN 
            IF  (@cF4_PODER3  = 'R' ) 
            BEGIN 
               SET @cAux  = 'SD1' 
               SET @cAux1  = '250' 
               SET @nAux  = 0 
               EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                      @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                      @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
            END 
            ELSE 
            BEGIN 
               IF @nRecnoSD3  = 0 
               BEGIN 
                  SET @cAux  = 'SD1' 
                  SET @nAux  = 0 
                  IF  (@cD1_TIPODOC  >= '50' ) 
                  BEGIN 
                     SET @cAux1  = '095' 
                     SET @nAux  = 0 
                     EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                            @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                            @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                  END 
                  ELSE 
                  BEGIN 
                     SET @cAux1  = '100' 
                     SET @nAux  = 0 
                     EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                            @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                            @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                  END 
               END 
            END 
         END 
      END 
      ELSE 
      BEGIN 
         IF  (@cD1_TIPO  = 'D' ) 
         BEGIN 
            SET @cAux  = 'V' 
            EXEC MAT042_19_01 @cFILIALCOR , @cAux , @cMV_PAR1 , @IN_MV_PAR14 , @vRecnoD1 , @cDINICIO , @cMDia output 
            SET @cAux  = 'SD1' 
            SET @nAux  = 0 
            IF  (@cMDia  = '1' ) 
            BEGIN 
               IF  (@cD1_TIPODOC  >= '50' ) 
               BEGIN 
                  SET @cAux1  = '545' 
                  EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                         @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                         @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
               END 
               ELSE 
               BEGIN 
                  SET @cAux1  = '500' 
                  EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                         @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                         @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
               END 
            END 
            ELSE 
            BEGIN 
               IF  (@cD1_TIPODOC  >= '50' ) 
               BEGIN 
                  SET @cAux1  = '195' 
                  EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                         @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                         @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
               END 
               ELSE 
               BEGIN 
                  SET @cAux1  = '200' 
                  EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nRecnoSD3 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                         @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                         @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
               END 
            END 
         END 
      END 
      IF  ( (@cD1_OP  <> ' ' )  or  (@nAptmPMS  > 0 ) )  and  (@cF4_PODER3 NOT in ( 'R' , 'S'  ) ) 
      BEGIN 
         SELECT @nAptmPMS  = COALESCE ( COUNT ( * ), 0 )
           FROM AFN010 AFN
           WHERE AFN_FILIAL  = @cFil_AFN  and AFN_DOC  = @cD1_DOC  and AFN_SERIE  = @cD1_SERIE  and AFN_FORNEC  = @cD1_FORNECE 
            and AFN_LOJA  = @cD1_LOJA  and AFN_ITEM  = @cD1_ITEM  and AFN_ESTOQU  <> '2'  and D_E_L_E_T_  = ' ' 
         SELECT @nRecTRB  = MAX ( R_E_C_N_O_ )
           FROM TRB01SP 
           WHERE TRB_FILIAL  = @cFILIALCOR 
         IF @nRecTRB is null 
         BEGIN 
            SET @nRecTRB  = 0 
         END 
         SET @nConSD3  = '0' 
          
         -- Cursor declaration SD3_Cursor01
         DECLARE SD3_Cursor01 insensitive  CURSOR FOR 
         SELECT SD3.R_E_C_N_O_ , D3_COD , D3_NUMSEQ , D3_LOCAL , D3_LOTECTL , D3_NUMLOTE , D3_DOC , D3_ESTORNO , COALESCE ( SB1.B1_CCCUSTO , 
                ' ' )
           FROM SD3010 SD3 left join SB1010 SB1 ON SB1.B1_FILIAL  = @cFil_SB1  and SB1.B1_COD  = SD3.D3_COD  and SB1.D_E_L_E_T_  = ' ' 
           
           WHERE SD3.D3_FILIAL  = @cFil_SD3  and  ( ( (SD3.D3_IDENT  = @cD1_NUMSEQ ) )  or  ( (@cMV_CQ  <> @cD1_LOCAL )  and  (SD3.D3_NUMSEQ  = @cD1_NUMSEQ 
           ) ) )  and SD3.D3_EMISSAO  >= @cDINICIO  and SD3.D3_EMISSAO  <= @cMV_PAR1  and SD3.D3_CF  = 'RE5'  and SD3.D3_COD  = @cD1_COD 
            and SD3.D3_OP  = @cD1_OP  and SD3.D3_ESTORNO  = ' '  and SD3.D_E_L_E_T_  = ' ' 
         FOR READ ONLY 
          
         OPEN SD3_Cursor01
         FETCH SD3_Cursor01 
          INTO @vRecnoD3 , @cD3_COD , @cD3_NUMSEQ , @cD3_LOCAL , @cD3_LOTECTL , @cD3_NUMLOTE , @cD3_DOC , @cD3_ESTORNO , 
                @cB1_CCCUSTO 
         WHILE (@@Fetch_Status  = 0 )
         BEGIN
            IF  (@vRecnoD3 is null ) 
            BEGIN 
               SET @vRecnoD3  = 0 
            END 
            IF  (@nConSD3  = '0' ) 
            BEGIN 
               IF @cMV_CQ  = @cD1_LOCAL 
               BEGIN 
                  SET @nConSD3  = '1' 
               END 
               IF  (@cD1_TIPO  <> 'D' ) 
               BEGIN 
                  IF  (@cF4_PODER3  = 'D' ) 
                  BEGIN 
                     SET @cAux  = 'D' 
                     EXEC MAT042_19_01 @cFILIALCOR , @cAux , @cMV_PAR1 , @IN_MV_PAR14 , @vRecnoD1 , @cDINICIO , @cMDia output 
                     IF  (@cMDia  = '1' ) 
                     BEGIN 
                        SET @cAux  = 'SD3' 
                        SET @cAux1  = '300' 
                        EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @vRecnoD1 , @nRecTRB , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                               @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                               @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                     END 
                     ELSE 
                     BEGIN 
                        SET @cAux  = 'SD3' 
                        SET @cAux1  = '280' 
                        EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @vRecnoD1 , @nRecTRB , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                               @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                               @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                     END 
                     Begin tran 
                     UPDATE TRB01SP 
                       WITH (ROWLOCK) 
                        SET TRB_RECSD1  = @vRecnoD3 
                      WHERE R_E_C_N_O_  = @nRecTRB 
                     Commit Tran 
                  END 
                  ELSE 
                  BEGIN 
                     IF  (@cF4_PODER3  <> 'R' ) 
                     BEGIN 
                        IF  (@nAptmPMS  > 0 ) 
                        BEGIN 
                           SET @vContador  = @nAptmPMS 
                           WHILE ( (@vContador  > 0 ) )
                           BEGIN
                              SET @cAux1  = '300' 
                              SET @cAux  = 'SD1' 
                              SET @nRecTRB  = 0 
                              EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @vRecnoD3 , @nRecTRB , @MV_PAR14 , @cMV_PAR1 , 
                                     @IN_MV_PRODPR0 , @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , 
                                     @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , 
                                     @IN_MV_PROCQE6 , ' ' , @IN_FILIALPROC 
                              SELECT @nRecTRB  = MAX ( R_E_C_N_O_ )
                                FROM TRB01SP 
                                WHERE TRB_FILIAL  = @cFILIALCOR 
                              IF @nRecTRB is null 
                              BEGIN 
                                 SET @nRecTRB  = 0 
                              END 
                              SET @cAux1  = '300' 
                              SET @cAux  = 'SD3' 
                              EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @vRecnoD1 , @nRecTRB , @MV_PAR14 , @cMV_PAR1 , 
                                     @IN_MV_PRODPR0 , @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , 
                                     @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , 
                                     @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                              SET @vContador  = @vContador  - 1 
                           END 
                        END 
                        ELSE 
                        BEGIN 
                           SET @cAux1  = '300' 
                           SET @cAux  = 'SD1' 
                           SET @nAux  = 0 
                           SET @nRecTRB  = 0 
                           EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD1 , @nAux , @nRecTRB , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                                  @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                                  @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , ' ' , @IN_FILIALPROC 
                           SELECT @nRecTRB  = MAX ( R_E_C_N_O_ )
                             FROM TRB01SP 
                             WHERE TRB_FILIAL  = @cFILIALCOR 
                           IF @nRecTRB is null 
                           BEGIN 
                              SET @nRecTRB  = 0 
                           END 
                           SET @cAux  = 'SD3' 
                           SET @cAux1  = '300' 
                           EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @vRecnoD1 , @nRecTRB , @MV_PAR14 , @cMV_PAR1 , 
                                  @IN_MV_PRODPR0 , @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , 
                                  @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , 
                                  @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                        END 
                     END 
                  END 
               END 
            END 
            SET @fim_CUR  = 0 
            FETCH SD3_Cursor01 
             INTO @vRecnoD3 , @cD3_COD , @cD3_NUMSEQ , @cD3_LOCAL , @cD3_LOTECTL , @cD3_NUMLOTE , @cD3_DOC , @cD3_ESTORNO , 
                   @cB1_CCCUSTO 
         END 
         CLOSE SD3_Cursor01
         DEALLOCATE SD3_Cursor01
      END 
      SET @fim_CUR  = 0 
      FETCH SD1_Cursor 
       INTO @vRecnoD1 , @cF4_PODER3 , @cD1_COD , @cD1_TIPO , @cD1_OP , @cD1_NUMSEQ , @cD1_DOC , @cD1_SERIE , @cD1_FORNECE , 
             @cD1_LOJA , @cD1_ITEM , @cD1_TIPODOC , @cD1_LOCAL , @cF4_ESTOQUE 
   END 
   CLOSE SD1_Cursor
   DEALLOCATE SD1_Cursor
   SET @nAptmPMSTMP  = 0 
   SET @cAux  = 'SD2' 
    
   -- Cursor declaration SD2_Cursor
   DECLARE SD2_Cursor insensitive  CURSOR FOR 
   SELECT SD2.R_E_C_N_O_ , D2_COD , D2_LOCAL , D2_TIPO , F4_PODER3 , D2_TIPODOC 
     FROM SD2010 SD2, SF4010 SF4
     WHERE SD2.D2_FILIAL  = @cFil_SD2  and SF4.F4_FILIAL  = @cFil_SF4  and SD2.D2_EMISSAO  >= @cDINICIO  and SD2.D2_EMISSAO  <= @cMV_PAR1 
      and SD2.D2_TES  = SF4.F4_CODIGO  and SD2.D2_ORIGLAN  <> 'LF'  and  (SD2.D2_REMITO  = ' '  or SD2.D2_REMITO  <> ' ' 
      and SD2.D2_TPDCENV in ( '1' , 'A'  ) )  and SF4.F4_ESTOQUE  = 'S'  and SD2.D_E_L_E_T_  = ' '  and SF4.D_E_L_E_T_  = ' ' 
     
   FOR READ ONLY 
    
   OPEN SD2_Cursor
   FETCH SD2_Cursor 
    INTO @vRecnoD2 , @cD2_COD , @cD2_LOCAL , @cD2_TIPO , @cF4_PODER3 , @cD2_TIPODOC 
   WHILE ( (@@Fetch_Status  = 0 ) )
   BEGIN
      SET @cB1_CCCUSTO  = ' ' 
      IF  (@cD2_TIPO  <> 'D' ) 
      BEGIN 
         IF  (@cF4_PODER3  = 'R' ) 
         BEGIN 
            SET @cAux1  = '300' 
            EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD2 , @nAptmPMSTMP , @nAptmPMSTMP , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                   @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , 
                   @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
         END 
         ELSE 
         BEGIN 
            IF  (@cF4_PODER3  = 'D' ) 
            BEGIN 
               SET @cAux1  = @IN_MV_SEQREBE 
               EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD2 , @nAptmPMSTMP , @nAptmPMSTMP , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                      @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                      @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
            END 
            ELSE 
            BEGIN 
               IF  (@cD2_TIPODOC  >= '50' ) 
               BEGIN 
                  SET @cAux1  = '495' 
                  EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD2 , @nAptmPMSTMP , @nAptmPMSTMP , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                         @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                         @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
               END 
               ELSE 
               BEGIN 
                  SET @cAux1  = '500' 
                  EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD2 , @nAptmPMSTMP , @nAptmPMSTMP , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                         @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                         @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
               END 
            END 
         END 
      END 
      ELSE 
      BEGIN 
         IF  (@cD2_TIPODOC  >= '50' ) 
         BEGIN 
            SET @cAux1  = '145' 
            EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD2 , @nAptmPMSTMP , @nAptmPMSTMP , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                   @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , 
                   @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
         END 
         ELSE 
         BEGIN 
            SELECT @vRecnoD1  = COALESCE ( SD1.R_E_C_N_O_ , 0 ), @cD1_LOCAL  = SD1.D1_LOCAL 
              FROM SD1010 SD1, SD2010 SD2
              WHERE SD1.D1_FILIAL  = @cFil_SD1  and SD2.D2_FILIAL  = @cFil_SD2  and SD1.D1_DOC  = SD2.D2_NFORI  and SD1.D1_SERIE  = SD2.D2_SERIORI 
               and SD1.D1_FORNECE  = SD2.D2_CLIENTE  and SD1.D1_LOJA  = SD2.D2_LOJA  and SD1.D1_COD  = SD2.D2_COD  and SD1.D1_ITEM  = SD2.D2_ITEMORI 
               and SD2.R_E_C_N_O_  = @vRecnoD2  and SD1.D_E_L_E_T_  = ' '  and SD2.D_E_L_E_T_  = ' ' 
            IF @vRecnoD1  = 0  or  (@vRecnoD1  > 0  and  (@cD1_LOCAL  = @cD2_LOCAL  or @cD1_LOCAL  <> @cMV_CQ ) ) 
            BEGIN 
               SET @cAux1  = '150' 
               EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD2 , @nAptmPMSTMP , @nAptmPMSTMP , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                      @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                      @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
            END 
            ELSE 
            BEGIN 
               IF @vRecnoD1  > 0  and  (@cD1_LOCAL  <> @cD2_LOCAL  and @cD1_LOCAL  = @cMV_CQ ) 
               BEGIN 
                  SET @cAux1  = '500' 
                  EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD2 , @nAptmPMSTMP , @nAptmPMSTMP , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                         @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                         @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
               END 
            END 
         END 
      END 
      SET @fim_CUR  = 0 
      FETCH SD2_Cursor 
       INTO @vRecnoD2 , @cD2_COD , @cD2_LOCAL , @cD2_TIPO , @cF4_PODER3 , @cD2_TIPODOC 
   END 
   CLOSE SD2_Cursor
   DEALLOCATE SD2_Cursor
   SET @cF4_PODER3  = ' ' 
    
   -- Cursor declaration SD3_Cursor
   DECLARE SD3_Cursor insensitive  CURSOR FOR 
   SELECT COALESCE ( SD3.R_E_C_N_O_ , 0 ) R_E_C_N_O_ , D3_COD , D3_LOCAL , D3_CF , D3_NUMSEQ , D3_DOC , D3_ESTORNO , D3_LOTECTL , 
          D3_NUMLOTE , D3_PROJPMS , D3_OP , D3_IDENT , D3_EMISSAO , D3_CHAVE , COALESCE ( SB1.B1_CCCUSTO , ' ' )
     FROM SD3010 SD3 left join SB1010 SB1 ON SB1.B1_FILIAL  = @cFil_SB1  and SB1.B1_COD  = SD3.D3_COD  and SB1.D_E_L_E_T_  = ' ' 
     
     WHERE SD3.D3_FILIAL  = @cFil_SD3  and SD3.D3_EMISSAO  >= @cDINICIO  and SD3.D3_EMISSAO  <= @cMV_PAR1  and SD3.D3_ESTORNO  = ' ' 
      and SD3.D_E_L_E_T_  = ' ' 
     ORDER BY SD3.D3_EMISSAO , SD3.D3_NUMSEQ , SD3.D3_CHAVE , SD3.D3_COD , SD3.R_E_C_N_O_ 
   FOR READ ONLY 
    
   OPEN SD3_Cursor
   FETCH SD3_Cursor 
    INTO @vRecnoD3 , @cD3_COD , @cD3_LOCAL , @cD3_CF , @cD3_NUMSEQ , @cD3_DOC , @cD3_ESTORNO , @cD3_LOTECTL , @cD3_NUMLOTE , 
          @cD3_PROJPMS , @cD3_OP , @cD3_IDENT , @cD3_EMISSAO , @cD3_CHAVE , @cB1_CCCUSTO 
   WHILE (@@Fetch_Status  = 0 )
   BEGIN
      IF  (@vRecnoD3 is null ) 
      BEGIN 
         SET @vRecnoD3  = 0 
      END 
      IF  (@cD3_CF in ( 'RE5' , 'DE5'  ) ) 
      BEGIN 
         SET @iRecCount  = 0 
         SELECT @iRecCount  = COALESCE ( R_E_C_N_O_ , 0 )
           FROM TRB01SP 
           WHERE TRB_RECNO  = @vRecnoD3  and TRB_ALIAS  = 'SD3' 
         IF @iRecCount is null 
         BEGIN 
            SET @iRecCount  = 0 
         END 
         IF @iRecCount  = 0 
         BEGIN 
            IF @cD3_IDENT  <> ' ' 
            BEGIN 
               SET @vRecnoD1  = 0 
               SELECT @vRecnoD1  = COALESCE ( R_E_C_N_O_ , 0 )
                 FROM SD1010 
                 WHERE D1_FILIAL  = @cFil_SD1  and D1_NUMSEQ  = @cD3_IDENT  and D_E_L_E_T_  = ' ' 
            END 
            ELSE 
            BEGIN 
               SET @vRecnoD1  = 0 
            END 
            IF @vRecnoD1  = 0 
            BEGIN 
               SET @cAux  = 'SD3' 
               SET @cAux1  = '300' 
               SET @nAux  = 0 
               EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , @cFILIALCOR , 
                      @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , 
                      @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
            END 
            ELSE 
            BEGIN 
               SET @cAux  = 'SD3' 
               SET @cAux1  = '300' 
               EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @vRecnoD1 , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                      @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                      @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
            END 
         END 
      END 
      ELSE 
      BEGIN 
         IF  (@cD3_CF in ( 'RE8' , 'DE8'  ) ) 
         BEGIN 
            SET @cAux  = 'SD3' 
            SET @cAux1  = '100' 
            SET @nAux  = 0 
            EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , @cFILIALCOR , 
                   @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , 
                   @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
         END 
         ELSE 
         BEGIN 
            IF @cD3_PROJPMS  <> ' ' 
            BEGIN 
               SET @cAux  = 'SD3' 
               SET @cAux1  = '480' 
               SET @nAux  = 0 
               EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , @cFILIALCOR , 
                      @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , 
                      @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
            END 
            ELSE 
            BEGIN 
               IF  (@cD3_CF  = 'RE0' )  and  (@cD3_OP  = ' ' ) 
               BEGIN 
                  SET @cAux  = 'SD3' 
                  SET @cAux1  = '301' 
                  SET @nAux  = 0 
                  EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                         @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                         @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
               END 
               ELSE 
               BEGIN 
                  IF  (@cD3_CF  = 'RE4'  or @cD3_CF  = 'DE4' )  and @cD3_ESTORNO  = 'S' 
                  BEGIN 
                     SET @iTRA_RECNO  = 0 
                     SELECT @iTRA_RECNO  = COALESCE ( MAX ( R_E_C_N_O_ ), 0 )
                       FROM TRA01SP 
                       WHERE TRA_FILIAL  = @cFILIALCOR  and TRA_NUMSEQ  = @cD3_NUMSEQ  and TRA_CF  = @cD3_CF  and TRA_COD  = @cD3_COD 
                        and D_E_L_E_T_  = ' ' 
                     IF @iTRA_RECNO  = 0 
                     BEGIN 
                        begin tran 
                        INSERT INTO TRA01SP (TRA_FILIAL , TRA_NUMSEQ , TRA_CF , TRA_COD ) 
                        VALUES (@cFILIALCOR , @cD3_NUMSEQ , @cD3_CF , @cD3_COD );
                        Commit Tran 
                        SET @cTransf  = '1' 
                     END 
                     ELSE 
                     BEGIN 
                        SET @cTransf  = '2' 
                     END 
                     SET @cAux  = 'SD3' 
                     SET @cAux1  = '300' 
                     SET @nAux  = 0 
                     EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                            @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                            @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                  END 
                  ELSE 
                  BEGIN 
                     IF  (@cD3_CF  = 'RE6'  or @cD3_CF  = 'DE6' ) 
                     BEGIN 
                        SELECT @vRecnoD7  = COALESCE ( MAX ( R_E_C_N_O_ ), 0 )
                          FROM SD7010 
                          WHERE D7_FILIAL  = @cFILIALCOR  and D7_PRODUTO  = @cD3_COD  and D7_NUMSEQ  = @cD3_NUMSEQ  and D7_NUMERO  = @cD3_DOC 
                           and D7_ORIGLAN  = 'CP'  and D_E_L_E_T_  = ' ' 
                        IF @cD3_LOCAL  = @cMV_CQ  and @vRecnoD7  > 0 
                        BEGIN 
                           SET @cAux  = 'SD3' 
                           SET @cAux1  = '110' 
                           SET @nAux  = 0 
                           EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                                  @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                                  @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , 
                                  @IN_FILIALPROC 
                        END 
                        ELSE 
                        BEGIN 
                           IF @vRecnoD7  > 0 
                           BEGIN 
                              SET @cAux  = 'SD3' 
                              SET @cAux1  = '110' 
                              SET @nAux  = 0 
                              EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                                     @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , 
                                     @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , 
                                     @cB1_CCCUSTO , @IN_FILIALPROC 
                           END 
                           ELSE 
                           BEGIN 
                              IF @IN_MV_CUSREP  = '1' 
                              BEGIN 
                                 SELECT @cD3_STATUS  = COALESCE ( SD3.D3_STATUS , '  ' )
                                   FROM SD3010 SD3
                                   WHERE SD3.R_E_C_N_O_  = @vRecnoD3  and SD3.D_E_L_E_T_  = ' ' 
                                 IF @cD3_STATUS  = 'RP' 
                                 BEGIN 
                                    SET @cAux  = 'SD3' 
                                    SET @cAux1  = '610' 
                                    SET @nAux  = 0 
                                    EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , 
                                           @IN_MV_PRODPR0 , @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , 
                                           @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , 
                                           @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                                 END 
                                 ELSE 
                                 BEGIN 
                                    SET @cAux  = 'SD3' 
                                    SET @cAux1  = '300' 
                                    SET @nAux  = 0 
                                    EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , 
                                           @IN_MV_PRODPR0 , @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , 
                                           @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , 
                                           @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                                 END 
                              END 
                              ELSE 
                              BEGIN 
                                 IF @IN_CPAISLOC  = 'BOL' 
                                 BEGIN 
                                    SELECT @cD3_STATUS  = COALESCE ( SD3.D3_STATUS , '  ' )
                                      FROM SD3010 SD3
                                      WHERE SD3.R_E_C_N_O_  = @vRecnoD3  and SD3.D_E_L_E_T_  = ' ' 
                                    IF @cD3_STATUS  = 'AC' 
                                    BEGIN 
                                       SET @cAux  = 'SD3' 
                                       SET @cAux1  = '080' 
                                       SET @nAux  = 0 
                                       EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , 
                                              @IN_MV_PRODPR0 , @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , 
                                              @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , 
                                              @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                                    END 
                                    ELSE 
                                    BEGIN 
                                       SET @cAux  = 'SD3' 
                                       SET @cAux1  = '300' 
                                       SET @nAux  = 0 
                                       EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , 
                                              @IN_MV_PRODPR0 , @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , 
                                              @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , 
                                              @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                                    END 
                                 END 
                                 ELSE 
                                 BEGIN 
                                    SET @cAux  = 'SD3' 
                                    SET @cAux1  = '300' 
                                    SET @nAux  = 0 
                                    EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , 
                                           @IN_MV_PRODPR0 , @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , 
                                           @IN_SEQ500 , @IN_MV_PRODMOD , @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , 
                                           @IN_MV_PROCQE6 , @cB1_CCCUSTO , @IN_FILIALPROC 
                                 END 
                              END 
                           END 
                        END 
                     END 
                     ELSE 
                     BEGIN 
                        IF  (@cD3_CF  = 'REA'  or @cD3_CF  = 'DEA' ) 
                        BEGIN 
                           SET @cAux  = 'SD3' 
                           SET @cAux1  = '600' 
                           SET @nAux  = 0 
                           EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                                  @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                                  @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , 
                                  @IN_FILIALPROC 
                        END 
                        ELSE 
                        BEGIN 
                           SET @cAux  = 'SD3' 
                           SET @cAux1  = '300' 
                           SET @nAux  = 0 
                           EXEC MAT009_19_01 @cAux , @cAux1 , @vRecnoD3 , @nAux , @nAux , @MV_PAR14 , @cMV_PAR1 , @IN_MV_PRODPR0 , 
                                  @cFILIALCOR , @IN_RECNOSMO , @cTransf , @IN_CPAISLOC , @IN_USAFILTRF , @IN_SEQ500 , @IN_MV_PRODMOD , 
                                  @cMV_CQ , @IN_MV_PAR11 , @IN_MV_PAR18 , @IN_MV_330JCM1 , @IN_MV_PROCQE6 , @cB1_CCCUSTO , 
                                  @IN_FILIALPROC 
                        END 
                     END 
                  END 
               END 
            END 
         END 
      END 
      SET @fim_CUR  = 0 
      FETCH SD3_Cursor 
       INTO @vRecnoD3 , @cD3_COD , @cD3_LOCAL , @cD3_CF , @cD3_NUMSEQ , @cD3_DOC , @cD3_ESTORNO , @cD3_LOTECTL , @cD3_NUMLOTE , 
             @cD3_PROJPMS , @cD3_OP , @cD3_IDENT , @cD3_EMISSAO , @cD3_CHAVE , @cB1_CCCUSTO 
   END 
   CLOSE SD3_Cursor
   DEALLOCATE SD3_Cursor
   IF  (@cMV_PRODMNT  <> ' ' ) 
   BEGIN 
      SELECT @vRecnoMNT  = COALESCE ( COUNT ( * ), 0 )
        FROM SB1010 
        WHERE B1_FILIAL  = @cFil_SB1  and B1_COD  = @cMV_PRODMNT  and D_E_L_E_T_  = ' ' 
      IF @vRecnoMNT  > 0 
      BEGIN 
         begin tran 
         DELETE FROM TRB01SP  WHERE TRB_COD  = @cMV_PRODMNT 
         commit tran 
      END 
   END 
   SET @OUT_RESULTADO  = '1' 
END
GO

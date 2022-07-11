SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[MAT007_19_02]') IS NULL EXEC('CREATE PROCEDURE [dbo].[MAT007_19_02] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
-- Procedure creation 
ALTER PROCEDURE [dbo].[MAT007_19_02]
(
    @IN_FILIALCOR Char( 2) , 
    @IN_CFILAUX Char( 2) , 
    @IN_DINICIO Char( 08 ) , 
    @IN_MV_LOCPROC Char( 2) , 
    @IN_COPCOES Char( 04 ) , 
    @IN_CUSUNIF Char( 01 ) , 
    @IN_DDATABASE Char( 08 ) , 
    @IN_MV_NEGESTR Char( 01 ) , 
    @IN_MV_MOEDACM Char( 05 ) , 
    @IN_MV_PAR1 Char( 08 ) , 
    @IN_MV_CUSFIFO Char( 01 ) , 
    @IN_MV_PRODMNT Char( 15) , 
    @IN_MV_D3SERVI Char( 01 ) , 
    @IN_INTDL Char( 01 ) , 
    @IN_MV_CQ Char( 2) , 
    @IN_MVULMES Char( 08 ) , 
    @IN_MV_WMSNEW Char( 2) , 
    @IN_MV_PRODMOD Char( 01 ) , 
    @OUT_RESULTADO Char( 01 )  output ) AS
 
-- Declaration of variables
DECLARE @cCod Char( 15)
DECLARE @cLocal Char( 2)
DECLARE @cLocalOri Char( 2)
DECLARE @cFil_SB2 Char( 2)
DECLARE @cFil_SB1 Char( 2)
DECLARE @cFil_SC2 Char( 2)
DECLARE @cFil_SB9 Char( 2)
DECLARE @cFil_SD1 Char( 2)
DECLARE @cFil_SD2 Char( 2)
DECLARE @cFil_SD3 Char( 2)
DECLARE @cFil_SF4 Char( 2)
DECLARE @cCodOriMod Char( 15)
DECLARE @cB1_CC Char( 01 )
DECLARE @cFILAUX Char( 2)
DECLARE @cCusFilAux Char( 2)
DECLARE @cFiltra Char( 01 )
DECLARE @cExecutou Char( 01 )
DECLARE @cAux VarChar( 03 )
DECLARE @OutResult VarChar( 01 )
DECLARE @nSaldo01 Decimal( 12 , 2 )
DECLARE @nSaldo02 Decimal( 14 , 2 )
DECLARE @nSaldo03 Decimal( 14 , 2 )
DECLARE @nSaldo04 Decimal( 14 , 2 )
DECLARE @nSaldo05 Decimal( 14 , 2 )
DECLARE @nSaldo06 Decimal( 14 , 2 )
DECLARE @nSaldo07 Decimal( 12 , 2 )
DECLARE @nVFim01 Float
DECLARE @nVFim02 Float
DECLARE @nVFim03 Float
DECLARE @nVFim04 Float
DECLARE @nVFim05 Float
DECLARE @nQFim01 Float
DECLARE @nQFim02 Float
DECLARE @nQFim03 Float
DECLARE @nQFim04 Float
DECLARE @nQFim05 Float
DECLARE @nTRB_QFIM Float
DECLARE @nQtd Float
DECLARE @nQSaldoAtuFF Float
DECLARE @nCustoAtuFF01 Float
DECLARE @nCustoAtuFF02 Float
DECLARE @nCustoAtuFF03 Float
DECLARE @nCustoAtuFF04 Float
DECLARE @nCustoAtuFF05 Float
DECLARE @nQt2umFF Float
DECLARE @nB2_CM1 Decimal( 14 , 4 )
DECLARE @nB2_CM2 Decimal( 14 , 4 )
DECLARE @nB2_CM3 Decimal( 14 , 4 )
DECLARE @nB2_CM4 Decimal( 14 , 4 )
DECLARE @nB2_CM5 Decimal( 14 , 4 )
DECLARE @nB9_CM1 Decimal( 14 , 4 )
DECLARE @nB9_CM2 Decimal( 14 , 4 )
DECLARE @nB9_CM3 Decimal( 14 , 4 )
DECLARE @nB9_CM4 Decimal( 14 , 4 )
DECLARE @nB9_CM5 Decimal( 14 , 4 )
DECLARE @nB9_CMRP1 Decimal( 14 , 4 )
DECLARE @nB9_CMRP2 Decimal( 14 , 4 )
DECLARE @nB9_CMRP3 Decimal( 14 , 4 )
DECLARE @nB9_CMRP4 Decimal( 14 , 4 )
DECLARE @nB9_CMRP5 Decimal( 14 , 4 )
DECLARE @nB9_VINIRP1 Decimal( 14 , 2 )
DECLARE @nB9_VINIRP2 Decimal( 14 , 2 )
DECLARE @nB9_VINIRP3 Decimal( 14 , 2 )
DECLARE @nB9_VINIRP4 Decimal( 14 , 2 )
DECLARE @nB9_VINIRP5 Decimal( 14 , 2 )
DECLARE @nB2_QFIM Decimal( 12 , 2 )
DECLARE @nB2_VFIM1 Decimal( 14 , 2 )
DECLARE @nB2_VFIM2 Decimal( 14 , 2 )
DECLARE @nB2_VFIM3 Decimal( 14 , 2 )
DECLARE @nB2_VFIM4 Decimal( 14 , 2 )
DECLARE @nB2_VFIM5 Decimal( 14 , 2 )
DECLARE @nB2_QFIM2 Decimal( 12 , 2 )
DECLARE @nB2_QFIMFF Decimal( 12 , 2 )
DECLARE @nB2_CMFF1 Decimal( 14 , 4 )
DECLARE @nB2_CMFF2 Decimal( 14 , 4 )
DECLARE @nB2_CMFF3 Decimal( 14 , 4 )
DECLARE @nB2_CMFF4 Decimal( 14 , 4 )
DECLARE @nB2_CMFF5 Decimal( 14 , 4 )
DECLARE @nB2_VFIMFF1 Decimal( 14 , 2 )
DECLARE @nB2_VFIMFF2 Decimal( 14 , 2 )
DECLARE @nB2_VFIMFF3 Decimal( 14 , 2 )
DECLARE @nB2_VFIMFF4 Decimal( 14 , 2 )
DECLARE @nB2_VFIMFF5 Decimal( 14 , 2 )
DECLARE @nTRB_VFIM1 Decimal( 14 , 2 )
DECLARE @nTRB_VFIM2 Decimal( 14 , 2 )
DECLARE @nTRB_VFIM3 Decimal( 14 , 2 )
DECLARE @nTRB_VFIM4 Decimal( 14 , 2 )
DECLARE @nTRB_VFIM5 Decimal( 14 , 2 )
DECLARE @nTRB_CM1 Decimal( 14 , 4 )
DECLARE @nTRB_CM2 Decimal( 14 , 4 )
DECLARE @nTRB_CM3 Decimal( 14 , 4 )
DECLARE @nTRB_CM4 Decimal( 14 , 4 )
DECLARE @nTRB_CM5 Decimal( 14 , 4 )
DECLARE @nCM1aux Decimal( 14 , 4 )
DECLARE @nCM2aux Decimal( 14 , 4 )
DECLARE @nCM3aux Decimal( 14 , 4 )
DECLARE @nCM4aux Decimal( 14 , 4 )
DECLARE @nCM5aux Decimal( 14 , 4 )
DECLARE @nQTMOD Decimal( 12 , 2 )
DECLARE @nTOTCM1 Decimal( 14 , 4 )
DECLARE @nRec Integer
DECLARE @nRecAnt Integer
DECLARE @nMaxRecnoSC2 Integer
DECLARE @iRecnoTRT Integer
DECLARE @iRECNO_AUX Integer
DECLARE @iTranCount Integer
DECLARE @iPos Integer
DECLARE @iRecno Integer
DECLARE @nRecno Integer
DECLARE @nCHKSB2 Integer
DECLARE @cFILIALCOR Char( 2)
DECLARE @dDTINICIO Char( 08 )
DECLARE @cMV_PAR1 Char( 08 )
DECLARE @cMVULMES Char( 08 )
DECLARE @cB1_CCCUSTO Char( 9)
BEGIN
   SET @cFILIALCOR  = @IN_FILIALCOR 
   SET @dDTINICIO  = @IN_DINICIO 
   SET @cMV_PAR1  = @IN_MV_PAR1 
   SET @cMVULMES  = @IN_MVULMES 
   IF @IN_CUSUNIF  = '1' 
   BEGIN 
      SET @cCusFilAux  = @IN_FILIALCOR 
   END 
   ELSE 
   BEGIN 
      SET @cCusFilAux  = '  ' 
   END 
   SET @OUT_RESULTADO  = '0' 
   SET @cFILAUX  = @IN_CFILAUX 
   IF @cFILAUX is null 
   BEGIN 
      SET @cFILAUX  = '  ' 
   END 
   SET @cB1_CC  = '0' 
   SET @nB2_QFIM  = 0 
   SET @nB2_CM1  = 0 
   SET @nB2_CM2  = 0 
   SET @nB2_CM3  = 0 
   SET @nB2_CM4  = 0 
   SET @nB2_CM5  = 0 
   SET @nB9_CM1  = 0 
   SET @nB9_CM2  = 0 
   SET @nB9_CM3  = 0 
   SET @nB9_CM4  = 0 
   SET @nB9_CM5  = 0 
   SET @nB9_CMRP1  = 0 
   SET @nB9_CMRP2  = 0 
   SET @nB9_CMRP3  = 0 
   SET @nB9_CMRP4  = 0 
   SET @nB9_CMRP5  = 0 
   SET @nB9_VINIRP1  = 0 
   SET @nB9_VINIRP2  = 0 
   SET @nB9_VINIRP3  = 0 
   SET @nB9_VINIRP4  = 0 
   SET @nB9_VINIRP5  = 0 
   SET @nB2_QFIM2  = 0 
   SET @nB2_VFIM1  = 0 
   SET @nB2_VFIM2  = 0 
   SET @nB2_VFIM3  = 0 
   SET @nB2_VFIM4  = 0 
   SET @nB2_VFIM5  = 0 
   SET @nTRB_CM1  = 0 
   SET @nTRB_CM2  = 0 
   SET @nTRB_CM3  = 0 
   SET @nTRB_CM4  = 0 
   SET @nTRB_CM5  = 0 
   SET @cAux  = 'SB1' 
   EXEC XFILIAL_19_02 @cAux , @cFILIALCOR , @cFil_SB1 output 
   SET @cAux  = 'SB2' 
   EXEC XFILIAL_19_02 @cAux , @cFILIALCOR , @cFil_SB2 output 
   SET @cAux  = 'SB9' 
   EXEC XFILIAL_19_02 @cAux , @cFILIALCOR , @cFil_SB9 output 
   SET @cAux  = 'SF4' 
   EXEC XFILIAL_19_02 @cAux , @cFILIALCOR , @cFil_SF4 output 
   SET @cAux  = 'SC2' 
   EXEC XFILIAL_19_02 @cAux , @cFILIALCOR , @cFil_SC2 output 
   SET @cAux  = 'SD1' 
   EXEC XFILIAL_19_02 @cAux , @cFILIALCOR , @cFil_SD1 output 
   SET @cAux  = 'SD2' 
   EXEC XFILIAL_19_02 @cAux , @cFILIALCOR , @cFil_SD2 output 
   SET @cAux  = 'SD3' 
   EXEC XFILIAL_19_02 @cAux , @cFILIALCOR , @cFil_SD3 output 
   SET @cCodOriMod  = ' ' 
   SET @cFiltra  = '0' 
    
   -- Cursor declaration CUR_A330INI
   DECLARE CUR_A330INI INSENSITIVE  CURSOR FOR 
   SELECT SB2.B2_FILIAL , SB2.B2_COD , SB2.B2_LOCAL , SB2.R_E_C_N_O_ , SB2.B2_QFIM , SB2.B2_VFIM1 , SB2.B2_VFIM2 , SB2.B2_VFIM3 , 
          SB2.B2_VFIM4 , SB2.B2_VFIM5 , SB2.B2_QFIM2 , SB2.B2_CM1 , SB2.B2_CM2 , SB2.B2_CM3 , SB2.B2_CM4 , SB2.B2_CM5 , SB1.B1_CCCUSTO 
     FROM SB2030 SB2, SB1030 SB1
     WHERE SB2.B2_FILIAL  = @cFil_SB2  and SB1.B1_FILIAL  = @cFil_SB1  and SB2.B2_COD  = SB1.B1_COD  and SB2.D_E_L_E_T_  = ' ' 
      and SB1.D_E_L_E_T_  = ' '  and  (SB2.B2_QFIM  <> 0  or SB2.B2_VFIM1  <> 0  or SB2.B2_VFIM2  <> 0  or SB2.B2_VFIM3  <> 0 
      or SB2.B2_VFIM4  <> 0  or SB2.B2_VFIM5  <> 0  or  (SUBSTRING ( SB1.B1_COD , 1 , 3 ) = 'MOD'  or SB1.B1_CCCUSTO  <> ' ' 
     )  or EXISTS (
   SELECT 1 
     FROM SB9030 SB9
     WHERE SB9.B9_FILIAL  = @cFil_SB9  and SB9.B9_COD  = SB2.B2_COD  and SB9.B9_LOCAL  = SB2.B2_LOCAL  and  (SB9.B9_DATA  = @cMVULMES 
      or SB9.B9_DATA  = ' ' )  and SB9.D_E_L_E_T_  = ' '  and  (SB9.B9_QINI  <> 0  or SB9.B9_VINI1  <> 0  or SB9.B9_VINI2  <> 0 
      or SB9.B9_VINI3  <> 0  or SB9.B9_VINI4  <> 0  or SB9.B9_VINI5  <> 0 ) )  or EXISTS (
   SELECT 1 
     FROM SD1030 SD1, SF4030 SF4
     WHERE SD1.D1_FILIAL  = @cFil_SD1  and SD1.D1_COD  = SB2.B2_COD  and SD1.D1_LOCAL  = SB2.B2_LOCAL  and SD1.D1_DTDIGIT  > (
   SELECT CONVERT( Char( 08 ) ,DATEADD ( DAY , 1 , MAX ( B9_DATA )),112 )
     FROM SB9030 
     WHERE B9_FILIAL  = @cFil_SB9  and B9_COD  = SD1.D1_COD  and B9_LOCAL  = SD1.D1_LOCAL  and B9_DATA  < @dDTINICIO  and D_E_L_E_T_  = ' ' 
     ) and SD1.D1_DTDIGIT  <= @cMV_PAR1  and SD1.D1_ORIGLAN  <> 'LF'  and SF4.F4_FILIAL  = @cFil_SF4  and SF4.F4_CODIGO  = SD1.D1_TES 
      and SF4.F4_ESTOQUE  = 'S'  and SF4.D_E_L_E_T_  = ' '  and SD1.D_E_L_E_T_  = ' ' )  or EXISTS (
   SELECT 1 
     FROM SD2030 SD2, SF4030 SF4
     WHERE SD2.D2_FILIAL  = @cFil_SD2  and SD2.D2_COD  = SB2.B2_COD  and SD2.D2_LOCAL  = SB2.B2_LOCAL  and SD2.D2_EMISSAO  > (
   SELECT CONVERT( Char( 08 ) ,DATEADD ( DAY , 1 , MAX ( B9_DATA )),112 )
     FROM SB9030 
     WHERE B9_FILIAL  = @cFil_SB9  and B9_COD  = SD2.D2_COD  and B9_LOCAL  = SD2.D2_LOCAL  and B9_DATA  < @dDTINICIO  and D_E_L_E_T_  = ' ' 
     ) and SD2.D2_EMISSAO  <= @cMV_PAR1  and SD2.D2_ORIGLAN  <> 'LF'  and SF4.F4_FILIAL  = @cFil_SF4  and SF4.F4_CODIGO  = SD2.D2_TES 
      and SF4.F4_ESTOQUE  = 'S'  and SF4.D_E_L_E_T_  = ' '  and SD2.D_E_L_E_T_  = ' ' )  or EXISTS (
   SELECT 1 
     FROM SD3030 SD3
     WHERE SD3.D3_FILIAL  = @cFil_SD3  and SD3.D3_COD  = SB2.B2_COD  and SD3.D3_LOCAL  = SB2.B2_LOCAL  and SD3.D3_EMISSAO  > (
   SELECT CONVERT( Char( 08 ) ,DATEADD ( DAY , 1 , MAX ( B9_DATA )),112 )
     FROM SB9030 
     WHERE B9_FILIAL  = @cFil_SB9  and B9_COD  = SD3.D3_COD  and B9_LOCAL  = SD3.D3_LOCAL  and B9_DATA  < @dDTINICIO  and D_E_L_E_T_  = ' ' 
     ) and SD3.D3_EMISSAO  <= @cMV_PAR1  and SD3.D3_ESTORNO  = ' '  and SD3.D_E_L_E_T_  = ' ' ) ) 
     ORDER BY SB2.B2_FILIAL , SB2.B2_COD , SB2.B2_LOCAL 
   FOR READ ONLY 
    
   OPEN CUR_A330INI
   FETCH CUR_A330INI 
    INTO @cFil_SB2 , @cCod , @cLocal , @nRecno , @nB2_QFIM , @nB2_VFIM1 , @nB2_VFIM2 , @nB2_VFIM3 , @nB2_VFIM4 , @nB2_VFIM5 , 
          @nB2_QFIM2 , @nB2_CM1 , @nB2_CM2 , @nB2_CM3 , @nB2_CM4 , @nB2_CM5 , @cB1_CCCUSTO 
   WHILE ( (@@fetch_status  = 0 ) )
   BEGIN
      IF @IN_MV_PRODMNT  = @cCod 
      BEGIN 
         FETCH CUR_A330INI 
          INTO @cFil_SB2 , @cCod , @cLocal , @nRecno , @nB2_QFIM , @nB2_VFIM1 , @nB2_VFIM2 , @nB2_VFIM3 , @nB2_VFIM4 , @nB2_VFIM5 , 
                @nB2_QFIM2 , @nB2_CM1 , @nB2_CM2 , @nB2_CM3 , @nB2_CM4 , @nB2_CM5 , @cB1_CCCUSTO 
         CONTINUE 
      END 
      IF @cB1_CCCUSTO  = ' ' 
      BEGIN 
         SET @cB1_CC  = '0' 
      END 
      ELSE 
      BEGIN 
         SET @cB1_CC  = '1' 
      END 
      SET @cFiltra  = '0' 
      EXEC MA330AL_02 @cFILIALCOR , @cCod , @cLocal , @nRecno , @cFiltra output 
      IF @cFiltra  = '1' 
      BEGIN 
         FETCH CUR_A330INI 
          INTO @cFil_SB2 , @cCod , @cLocal , @nRecno , @nB2_QFIM , @nB2_VFIM1 , @nB2_VFIM2 , @nB2_VFIM3 , @nB2_VFIM4 , @nB2_VFIM5 , 
                @nB2_QFIM2 , @nB2_CM1 , @nB2_CM2 , @nB2_CM3 , @nB2_CM4 , @nB2_CM5 , @cB1_CCCUSTO 
         CONTINUE 
      END 
      SET @nTRB_VFIM1  = 0 
      SET @nTRB_VFIM2  = 0 
      SET @nTRB_VFIM3  = 0 
      SET @nTRB_VFIM4  = 0 
      SET @nTRB_VFIM5  = 0 
      SET @nTRB_QFIM  = 0 
      SET @nVFim01  = 0 
      SET @nVFim02  = 0 
      SET @nVFim03  = 0 
      SET @nVFim04  = 0 
      SET @nVFim05  = 0 
      SET @nQFim01  = 0 
      SET @nQFim02  = 0 
      SET @nQFim03  = 0 
      SET @nQFim04  = 0 
      SET @nQFim05  = 0 
      SET @nB9_CM1  = 0 
      SET @nB9_CM2  = 0 
      SET @nB9_CM3  = 0 
      SET @nB9_CM4  = 0 
      SET @nB9_CM5  = 0 
      SET @nB9_CMRP1  = 0 
      SET @nB9_CMRP2  = 0 
      SET @nB9_CMRP3  = 0 
      SET @nB9_CMRP4  = 0 
      SET @nB9_CMRP5  = 0 
      SET @nB9_VINIRP1  = 0 
      SET @nB9_VINIRP2  = 0 
      SET @nB9_VINIRP3  = 0 
      SET @nB9_VINIRP4  = 0 
      SET @nB9_VINIRP5  = 0 
      SET @cLocalOri  = @cLocal 
      IF  (@IN_MV_PRODMOD  = '0'  and @cB1_CCCUSTO  <> ' ' )  or  ( (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , 
             '0' ) = '0' ) 
      BEGIN 
         EXEC MAT006_19_02 @cCod , @cLocal , @dDTINICIO , @cFILAUX , @IN_MV_LOCPROC , @cFILIALCOR , @IN_MV_D3SERVI , @IN_INTDL , 
                @IN_MV_CQ , @IN_MV_WMSNEW , '0' , @nSaldo01 output , @nSaldo02 output , @nSaldo03 output , @nSaldo04 output , 
                @nSaldo05 output , @nSaldo06 output , @nSaldo07 output , @nB9_CM1 output , @nB9_CM2 output , @nB9_CM3 output , 
                @nB9_CM4 output , @nB9_CM5 output , @nB9_CMRP1 output , @nB9_CMRP2 output , @nB9_CMRP3 output , @nB9_CMRP4 output , 
                @nB9_CMRP5 output , @nB9_VINIRP1 output , @nB9_VINIRP2 output , @nB9_VINIRP3 output , @nB9_VINIRP4 output , 
                @nB9_VINIRP5 output 
         IF @IN_CUSUNIF in ( '1' , '2'  ) 
         BEGIN 
            IF @cCod  <> @cCodOriMod 
            BEGIN 
               SET @cCodOriMod  = @cCod 
            END 
         END 
         ELSE 
         BEGIN 
            SET @cCodOriMod  = ' ' 
         END 
      END 
      ELSE 
      BEGIN 
         IF SUBSTRING ( @IN_COPCOES , 1 , 1 ) = '1' 
         BEGIN 
            SET @cCodOriMod  = ' ' 
            SET @nSaldo01  = @nB2_QFIM 
            SET @nSaldo02  = @nB2_VFIM1 
            SET @nSaldo03  = @nB2_VFIM2 
            SET @nSaldo04  = @nB2_VFIM3 
            SET @nSaldo05  = @nB2_VFIM4 
            SET @nSaldo06  = @nB2_VFIM5 
            SET @nSaldo07  = @nB2_QFIM2 
         END 
         ELSE 
         BEGIN 
            IF @IN_CUSUNIF in ( '1' , '2'  ) 
            BEGIN 
               IF @cCod  <> @cCodOriMod 
               BEGIN 
                  SET @cCodOriMod  = @cCod 
               END 
            END 
            ELSE 
            BEGIN 
               SET @cCodOriMod  = ' ' 
            END 
            SET @nSaldo01  = 0 
            SET @nSaldo02  = 0 
            SET @nSaldo03  = 0 
            SET @nSaldo04  = 0 
            SET @nSaldo05  = 0 
            SET @nSaldo06  = 0 
            SET @nSaldo07  = 0 
         END 
      END 
      SET @nSaldo01  = COALESCE ( @nSaldo01 , 0 )
      SET @nSaldo02  = COALESCE ( @nSaldo02 , 0 )
      SET @nSaldo03  = COALESCE ( @nSaldo03 , 0 )
      SET @nSaldo04  = COALESCE ( @nSaldo04 , 0 )
      SET @nSaldo05  = COALESCE ( @nSaldo05 , 0 )
      SET @nSaldo06  = COALESCE ( @nSaldo06 , 0 )
      SET @nSaldo07  = COALESCE ( @nSaldo07 , 0 )
      SET @nB9_CM1  = COALESCE ( @nB9_CM1 , 0 )
      SET @nB9_CM2  = COALESCE ( @nB9_CM2 , 0 )
      SET @nB9_CM3  = COALESCE ( @nB9_CM3 , 0 )
      SET @nB9_CM4  = COALESCE ( @nB9_CM4 , 0 )
      SET @nB9_CM5  = COALESCE ( @nB9_CM5 , 0 )
      SET @nB9_CMRP1  = COALESCE ( @nB9_CMRP1 , 0 )
      SET @nB9_CMRP2  = COALESCE ( @nB9_CMRP2 , 0 )
      SET @nB9_CMRP3  = COALESCE ( @nB9_CMRP3 , 0 )
      SET @nB9_CMRP4  = COALESCE ( @nB9_CMRP4 , 0 )
      SET @nB9_CMRP5  = COALESCE ( @nB9_CMRP5 , 0 )
      SET @nB9_VINIRP1  = COALESCE ( @nB9_VINIRP1 , 0 )
      SET @nB9_VINIRP2  = COALESCE ( @nB9_VINIRP2 , 0 )
      SET @nB9_VINIRP3  = COALESCE ( @nB9_VINIRP3 , 0 )
      SET @nB9_VINIRP4  = COALESCE ( @nB9_VINIRP4 , 0 )
      SET @nB9_VINIRP5  = COALESCE ( @nB9_VINIRP5 , 0 )
      IF  (@nSaldo01  > 0 ) 
      BEGIN 
         SET @nVFim01  = @nSaldo02 
         SET @nVFim02  = @nSaldo03 
         SET @nVFim03  = @nSaldo04 
         SET @nVFim04  = @nSaldo05 
         SET @nVFim05  = @nSaldo06 
         SET @nQFim01  = @nSaldo01 
         SET @nQFim02  = @nSaldo01 
         SET @nQFim03  = @nSaldo01 
         SET @nQFim04  = @nSaldo01 
         SET @nQFim05  = @nSaldo01 
         IF @nVFim01  <= 0 
         BEGIN 
            SET @nVFim01  = COALESCE ( @nB2_CM1 , 0 )
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               SET @nVFim01  = COALESCE ( @nB9_CM1 , 0 )
            END 
            SET @nQFim01  = 1 
         END 
         IF @nVFim02  <= 0 
         BEGIN 
            SET @nVFim02  = COALESCE ( @nB2_CM2 , 0 )
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               SET @nVFim02  = COALESCE ( @nB9_CM2 , 0 )
            END 
            SET @nQFim02  = 1 
         END 
         IF @nVFim03  <= 0 
         BEGIN 
            SET @nVFim03  = COALESCE ( @nB2_CM3 , 0 )
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               SET @nVFim03  = COALESCE ( @nB9_CM3 , 0 )
            END 
            SET @nQFim03  = 1 
         END 
         IF @nVFim04  <= 0 
         BEGIN 
            SET @nVFim04  = COALESCE ( @nB2_CM4 , 0 )
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               SET @nVFim04  = COALESCE ( @nB9_CM4 , 0 )
            END 
            SET @nQFim04  = 1 
         END 
         IF @nVFim05  <= 0 
         BEGIN 
            SET @nVFim05  = COALESCE ( @nB2_CM5 , 0 )
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               SET @nVFim05  = COALESCE ( @nB9_CM5 , 0 )
            END 
            SET @nQFim05  = 1 
         END 
         IF @nQFim01  = 0 
         BEGIN 
            SET @nQFim01  = 1 
         END 
         IF @nQFim02  = 0 
         BEGIN 
            SET @nQFim02  = 1 
         END 
         IF @nQFim03  = 0 
         BEGIN 
            SET @nQFim03  = 1 
         END 
         IF @nQFim04  = 0 
         BEGIN 
            SET @nQFim04  = 1 
         END 
         IF @nQFim05  = 0 
         BEGIN 
            SET @nQFim05  = 1 
         END 
         SET @nB2_CM1  = @nVFim01  / @nQFim01 
         SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            SET @nB2_CM2  = @nVFim02  / @nQFim02 
         END 
         SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            SET @nB2_CM3  = @nVFim03  / @nQFim03 
         END 
         SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            SET @nB2_CM4  = @nVFim04  / @nQFim04 
         END 
         SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            SET @nB2_CM5  = @nVFim05  / @nQFim05 
         END 
         begin transaction 
         UPDATE SB2030 
           WITH (ROWLOCK) 
            SET B2_QFIM  = @nSaldo01 , B2_VFIM1  = @nSaldo02 , B2_CMFIM1  = @nB2_CM1 , B2_QFIM2  = @nSaldo07 , B2_CMRP1  = @nB9_CMRP1 
           , B2_VFRP1  = @nB9_VINIRP1 
          WHERE R_E_C_N_O_  = @nRecno 
         SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            UPDATE SB2030 
              WITH (ROWLOCK) 
               SET B2_VFIM2  = @nSaldo03 , B2_CMFIM2  = @nB2_CM2 , B2_CMRP2  = @nB9_CMRP2 , B2_VFRP2  = @nB9_VINIRP2 
             WHERE R_E_C_N_O_  = @nRecno 
         END 
         SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            UPDATE SB2030 
              WITH (ROWLOCK) 
               SET B2_VFIM3  = @nSaldo04 , B2_CMFIM3  = @nB2_CM3 , B2_CMRP3  = @nB9_CMRP3 , B2_VFRP3  = @nB9_VINIRP3 
             WHERE R_E_C_N_O_  = @nRecno 
         END 
         SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            UPDATE SB2030 
              WITH (ROWLOCK) 
               SET B2_VFIM4  = @nSaldo05 , B2_CMFIM4  = @nB2_CM4 , B2_CMRP4  = @nB9_CMRP4 , B2_VFRP4  = @nB9_VINIRP4 
             WHERE R_E_C_N_O_  = @nRecno 
         END 
         SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            UPDATE SB2030 
              WITH (ROWLOCK) 
               SET B2_VFIM5  = @nSaldo06 , B2_CMFIM5  = @nB2_CM5 , B2_CMRP5  = @nB9_CMRP5 , B2_VFRP5  = @nB9_VINIRP5 
             WHERE R_E_C_N_O_  = @nRecno 
         END 
         commit transaction 
      END 
      ELSE 
      BEGIN 
         begin transaction 
         IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
         BEGIN 
            UPDATE SB2030 
              WITH (ROWLOCK) 
               SET B2_QFIM  = @nSaldo01 , B2_VFIM1  = @nSaldo02 , B2_QFIM2  = @nSaldo07 , B2_CMFIM1  = @nB9_CM1 , B2_CMRP1  = @nB9_CMRP1 
              , B2_VFRP1  = @nB9_VINIRP1 
             WHERE R_E_C_N_O_  = @nRecno 
         END 
         ELSE 
         BEGIN 
            UPDATE SB2030 
              WITH (ROWLOCK) 
               SET B2_QFIM  = @nSaldo01 , B2_VFIM1  = @nSaldo02 , B2_QFIM2  = @nSaldo07 
             WHERE R_E_C_N_O_  = @nRecno 
         END 
         SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               UPDATE SB2030 
                 WITH (ROWLOCK) 
                  SET B2_VFIM2  = @nSaldo03 , B2_CMFIM2  = @nB9_CM2 , B2_CMRP2  = @nB9_CMRP2 , B2_VFRP2  = @nB9_VINIRP2 
                WHERE R_E_C_N_O_  = @nRecno 
            END 
            ELSE 
            BEGIN 
               UPDATE SB2030 
                 WITH (ROWLOCK) 
                  SET B2_VFIM2  = @nSaldo03 
                WHERE R_E_C_N_O_  = @nRecno 
            END 
         END 
         SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               UPDATE SB2030 
                 WITH (ROWLOCK) 
                  SET B2_VFIM3  = @nSaldo04 , B2_CMFIM3  = @nB9_CM3 , B2_CMRP3  = @nB9_CMRP3 , B2_VFRP3  = @nB9_VINIRP3 
                WHERE R_E_C_N_O_  = @nRecno 
            END 
            ELSE 
            BEGIN 
               UPDATE SB2030 
                 WITH (ROWLOCK) 
                  SET B2_VFIM3  = @nSaldo04 
                WHERE R_E_C_N_O_  = @nRecno 
            END 
         END 
         SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               UPDATE SB2030 
                 WITH (ROWLOCK) 
                  SET B2_VFIM4  = @nSaldo05 , B2_CMFIM4  = @nB9_CM4 , B2_CMRP4  = @nB9_CMRP4 , B2_VFRP4  = @nB9_VINIRP4 
                WHERE R_E_C_N_O_  = @nRecno 
            END 
            ELSE 
            BEGIN 
               UPDATE SB2030 
                 WITH (ROWLOCK) 
                  SET B2_VFIM4  = @nSaldo05 
                WHERE R_E_C_N_O_  = @nRecno 
            END 
         END 
         SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
            BEGIN 
               UPDATE SB2030 
                 WITH (ROWLOCK) 
                  SET B2_VFIM5  = @nSaldo06 , B2_CMFIM5  = @nB9_CM5 , B2_CMRP5  = @nB9_CMRP5 , B2_VFRP5  = @nB9_VINIRP5 
                WHERE R_E_C_N_O_  = @nRecno 
            END 
            ELSE 
            BEGIN 
               UPDATE SB2030 
                 WITH (ROWLOCK) 
                  SET B2_VFIM5  = @nSaldo06 
                WHERE R_E_C_N_O_  = @nRecno 
            END 
         END 
         IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
         BEGIN 
            SET @nB2_CM1  = @nB9_CM1 
            SET @nB2_CM2  = @nB9_CM2 
            SET @nB2_CM3  = @nB9_CM3 
            SET @nB2_CM4  = @nB9_CM4 
            SET @nB2_CM5  = @nB9_CM5 
         END 
         commit transaction 
      END 
      IF @IN_CUSUNIF in ( '1' , '2'  ) 
      BEGIN 
         SET @iRecnoTRT  = 0 
         SELECT @iRecnoTRT  = COALESCE ( R_E_C_N_O_ , 0 ), @nTRB_QFIM  = TRB_QFIM 
           FROM TRT02SP 
           WHERE TRB_FILIAL  = @cCusFilAux  and TRB_COD  = @cCod 
         IF COALESCE ( @iRecnoTRT , 0 ) = 0 
         BEGIN 
            INSERT INTO TRT02SP (TRB_FILIAL , TRB_COD ) 
            VALUES (@cCusFilAux , @cCod );
            SELECT @iRecnoTRT  = MAX ( R_E_C_N_O_ )
              FROM TRT02SP 
              WHERE TRB_FILIAL  = @cCusFilAux  and TRB_COD  = @cCod 
         END 
         IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
         BEGIN 
            SELECT @nCHKSB2  = R_E_C_N_O_ 
              FROM SB2030 
              WHERE B2_FILIAL  = @cCusFilAux  and B2_COD  = @cCod  and B2_LOCAL  = @cLocal  and B2_QATU  = 0  and B2_CMFIM1  = 0 
               and D_E_L_E_T_  = ' ' 
            IF COALESCE ( @nCHKSB2 , 0 ) > 0 
            BEGIN 
               SELECT @nQTMOD  = TRB_QTDMOD , @nTOTCM1  = TRB_TOTCM1 
                 FROM TRT02SP 
                 WHERE R_E_C_N_O_  = @iRecnoTRT 
               IF @nQTMOD  > 0  and @nB2_CM1  = 0 
               BEGIN 
                  SET @nB2_CM1  = @nTOTCM1  / @nQTMOD 
               END 
            END 
            UPDATE TRT02SP 
              WITH (ROWLOCK) 
               SET TRB_QFIM  = TRB_QFIM  + @nSaldo01 , TRB_QFIM2  = TRB_QFIM2  + @nSaldo07 , TRB_VFIM1  = TRB_VFIM1  + @nSaldo02 
              , TRB_QTDMOD  = TRB_QTDMOD  + 1 , TRB_TOTCM1  = TRB_TOTCM1  + @nB2_CM1 
             WHERE R_E_C_N_O_  = @iRecnoTRT 
            SELECT @nTRB_QFIM  = TRB_QFIM , @nTRB_VFIM1  = TRB_VFIM1 
              FROM TRT02SP 
              WHERE R_E_C_N_O_  = @iRecnoTRT 
            SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
            IF @iPos  > 0 
            BEGIN 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_VFIM2  = TRB_VFIM2  + @nSaldo03 , TRB_TOTCM2  = TRB_TOTCM2  + @nB2_CM2 
                WHERE R_E_C_N_O_  = @iRecnoTRT 
               SELECT @nTRB_VFIM2  = TRB_VFIM2 
                 FROM TRT02SP 
                 WHERE R_E_C_N_O_  = @iRecnoTRT 
            END 
            SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
            IF @iPos  > 0 
            BEGIN 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_VFIM3  = TRB_VFIM3  + @nSaldo04 , TRB_TOTCM3  = TRB_TOTCM3  + @nB2_CM3 
                WHERE R_E_C_N_O_  = @iRecnoTRT 
               SELECT @nTRB_VFIM3  = TRB_VFIM3 
                 FROM TRT02SP 
                 WHERE R_E_C_N_O_  = @iRecnoTRT 
            END 
            SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
            IF @iPos  > 0 
            BEGIN 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_VFIM4  = TRB_VFIM4  + @nSaldo05 , TRB_TOTCM4  = TRB_TOTCM4  + @nB2_CM4 
                WHERE R_E_C_N_O_  = @iRecnoTRT 
               SELECT @nTRB_VFIM4  = TRB_VFIM4 
                 FROM TRT02SP 
                 WHERE R_E_C_N_O_  = @iRecnoTRT 
            END 
            SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
            IF @iPos  > 0 
            BEGIN 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_VFIM5  = TRB_VFIM5  + @nSaldo06 , TRB_TOTCM5  = TRB_TOTCM5  + @nB2_CM5 
                WHERE R_E_C_N_O_  = @iRecnoTRT 
               SELECT @nTRB_VFIM5  = TRB_VFIM5 
                 FROM TRT02SP 
                 WHERE R_E_C_N_O_  = @iRecnoTRT 
            END 
         END 
         IF  (SUBSTRING ( @cCod , 1 , 3 ) <> 'MOD' )  and COALESCE ( @cB1_CC , '0' ) = '0' 
         BEGIN 
            IF @nTRB_VFIM1  > 0  and @nTRB_QFIM  > 0 
            BEGIN 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_CM1  = TRB_VFIM1  / @nTRB_QFIM 
                WHERE R_E_C_N_O_  = @iRecnoTRT 
            END 
            ELSE 
            BEGIN 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_CM1  = TRB_TOTCM1  / TRB_QTDMOD 
                WHERE R_E_C_N_O_  = @iRecnoTRT 
            END 
            SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
            IF @iPos  > 0 
            BEGIN 
               IF @nTRB_VFIM2  > 0  and @nTRB_QFIM  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM2  = TRB_VFIM2  / @nTRB_QFIM 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               ELSE 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM2  = TRB_TOTCM2  / TRB_QTDMOD 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
            END 
            SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
            IF @iPos  > 0 
            BEGIN 
               IF @nTRB_VFIM3  > 0  and @nTRB_QFIM  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM3  = TRB_VFIM3  / @nTRB_QFIM 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               ELSE 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM3  = TRB_TOTCM3  / TRB_QTDMOD 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
            END 
            SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
            IF @iPos  > 0 
            BEGIN 
               IF @nTRB_VFIM4  > 0  and @nTRB_QFIM  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM4  = TRB_VFIM4  / @nTRB_QFIM 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               ELSE 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM4  = TRB_TOTCM4  / TRB_QTDMOD 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
            END 
            SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
            IF @iPos  > 0 
            BEGIN 
               IF @nTRB_VFIM5  > 0  and @nTRB_QFIM  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM5  = TRB_VFIM5  / @nTRB_QFIM 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               ELSE 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM5  = TRB_TOTCM5  / TRB_QTDMOD 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
            END 
         END 
         ELSE 
         BEGIN 
            IF  (SUBSTRING ( @IN_COPCOES , 1 , 1 ) <> '1' ) 
            BEGIN 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_QTDMOD  = TRB_QTDMOD  + 1 , TRB_TOTCM1  = TRB_TOTCM1  + @nB2_CM1 
                WHERE R_E_C_N_O_  = @iRecnoTRT 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_CM1  = TRB_TOTCM1  / TRB_QTDMOD 
                WHERE R_E_C_N_O_  = @iRecnoTRT 
               SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
               IF @iPos  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_TOTCM2  = TRB_TOTCM2  + @nB2_CM2 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM2  = TRB_TOTCM2  / TRB_QTDMOD 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
               IF @iPos  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_TOTCM3  = TRB_TOTCM3  + @nB2_CM3 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM3  = TRB_TOTCM3  / TRB_QTDMOD 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
               IF @iPos  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_TOTCM4  = TRB_TOTCM4  + @nB2_CM4 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM4  = TRB_TOTCM4  / TRB_QTDMOD 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
               IF @iPos  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_TOTCM5  = TRB_TOTCM5  + @nB2_CM5 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM5  = TRB_TOTCM5  / TRB_QTDMOD 
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
            END 
         END 
      END 
      EXEC M330INB2CP_02 @cFILIALCOR , @dDTINICIO , @IN_CUSUNIF , @cCod , @cLocal , @nRecno 
      IF @IN_MV_CUSFIFO  = '1' 
      BEGIN 
         EXEC MAT049_19_02 @cCod , @cLocal , @dDTINICIO , @cFILIALCOR , @nQSaldoAtuFF output , @nCustoAtuFF01 output , @nCustoAtuFF02 output , 
                @nCustoAtuFF03 output , @nCustoAtuFF04 output , @nCustoAtuFF05 output , @nQt2umFF output 
         SET @nB2_QFIMFF  = @nQSaldoAtuFF 
         SET @nB2_VFIMFF1  = 0 
         SET @nB2_VFIMFF2  = 0 
         SET @nB2_VFIMFF3  = 0 
         SET @nB2_VFIMFF4  = 0 
         SET @nB2_VFIMFF5  = 0 
         SET @nB2_CMFF1  = 0 
         SET @nB2_CMFF2  = 0 
         SET @nB2_CMFF3  = 0 
         SET @nB2_CMFF4  = 0 
         SET @nB2_CMFF5  = 0 
         SET @nB2_VFIMFF1  = @nCustoAtuFF01 
         IF  (@nSaldo01  > 0 )  and  (@nCustoAtuFF01  > 0 ) 
         BEGIN 
            SET @nB2_CMFF1  = @nB2_VFIMFF1  / @nSaldo01 
         END 
         SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            SET @nB2_VFIMFF2  = @nCustoAtuFF02 
            IF  (@nSaldo01  > 0 )  and  (@nB2_VFIMFF2  > 0 ) 
            BEGIN 
               SET @nB2_CMFF2  = @nB2_VFIMFF2  / @nSaldo01 
            END 
         END 
         SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            SET @nB2_VFIMFF3  = @nCustoAtuFF03 
            IF  (@nSaldo01  > 0 )  and  (@nB2_VFIMFF3  > 0 ) 
            BEGIN 
               SET @nB2_CMFF3  = @nB2_VFIMFF3  / @nSaldo01 
            END 
         END 
         SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            SET @nB2_VFIMFF4  = @nCustoAtuFF04 
            IF  (@nSaldo01  > 0 )  and  (@nB2_VFIMFF4  > 0 ) 
            BEGIN 
               SET @nB2_CMFF4  = @nB2_VFIMFF4  / @nSaldo01 
            END 
         END 
         SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
         IF @iPos  > 0 
         BEGIN 
            SET @nB2_VFIMFF5  = @nCustoAtuFF05 
            IF  (@nSaldo01  > 0 )  and  (@nB2_VFIMFF5  > 0 ) 
            BEGIN 
               SET @nB2_CMFF5  = @nB2_VFIMFF5  / @nSaldo01 
            END 
         END 
         UPDATE SB2030 
           WITH (ROWLOCK) 
            SET B2_VFIMFF1  = @nB2_VFIMFF1 , B2_CMFF1  = @nB2_CMFF1 , B2_VFIMFF2  = @nB2_VFIMFF2 , B2_CMFF2  = @nB2_CMFF2 
           , B2_VFIMFF3  = @nB2_VFIMFF3 , B2_CMFF3  = @nB2_CMFF3 , B2_VFIMFF4  = @nB2_VFIMFF4 , B2_CMFF4  = @nB2_CMFF4 , 
                B2_VFIMFF5  = @nB2_VFIMFF5 , B2_CMFF5  = @nB2_CMFF5 , B2_QFIMFF  = @nB2_QFIMFF 
          WHERE R_E_C_N_O_  = @nRecno 
      END 
      FETCH CUR_A330INI 
       INTO @cFil_SB2 , @cCod , @cLocal , @nRecno , @nB2_QFIM , @nB2_VFIM1 , @nB2_VFIM2 , @nB2_VFIM3 , @nB2_VFIM4 , @nB2_VFIM5 , 
             @nB2_QFIM2 , @nB2_CM1 , @nB2_CM2 , @nB2_CM3 , @nB2_CM4 , @nB2_CM5 , @cB1_CCCUSTO 
      IF @IN_CUSUNIF in ( '1' , '2'  ) 
      BEGIN 
         EXEC MAT043_19_02 @cFILIALCOR , @cCodOriMod , @IN_MV_NEGESTR , @OutResult output 
         IF  (@OutResult  = '1' ) 
         BEGIN 
            SELECT @nCM1aux  = TRB_CM1 , @nCM2aux  = TRB_CM2 , @nCM3aux  = TRB_CM3 , @nCM4aux  = TRB_CM4 , @nCM5aux  = TRB_CM5 
              
              FROM TRT02SP 
              WHERE TRB_FILIAL  = @cCusFilAux  and TRB_COD  = @cCodOriMod 
            EXEC M330CMU_02 @cFILIALCOR , @cCodOriMod , @IN_DDATABASE , @nCM1aux , @nCM2aux , @nCM3aux , @nCM4aux , @nCM5aux , 
                   @nTRB_CM1 output , @nTRB_CM2 output , @nTRB_CM3 output , @nTRB_CM4 output , @nTRB_CM5 output , @cExecutou output 
            IF  (@cExecutou  = '1' ) 
            BEGIN 
               UPDATE TRT02SP 
                 WITH (ROWLOCK) 
                  SET TRB_CM1  = COALESCE ( @nTRB_CM1 , 0 )
                WHERE R_E_C_N_O_  = @iRecnoTRT 
               SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
               IF @iPos  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM2  = COALESCE ( @nTRB_CM2 , 0 )
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
               IF @iPos  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM3  = COALESCE ( @nTRB_CM3 , 0 )
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
               IF @iPos  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM4  = COALESCE ( @nTRB_CM4 , 0 )
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
               SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
               IF @iPos  > 0 
               BEGIN 
                  UPDATE TRT02SP 
                    WITH (ROWLOCK) 
                     SET TRB_CM5  = COALESCE ( @nTRB_CM5 , 0 )
                   WHERE R_E_C_N_O_  = @iRecnoTRT 
               END 
            END 
         END 
      END 
   END 
   CLOSE CUR_A330INI
   DEALLOCATE CUR_A330INI
   begin transaction 
   UPDATE SC2030 
     WITH (ROWLOCK) 
      SET C2_VFIM1  = C2_VINI1 , C2_APRFIM1  = C2_APRINI1 , C2_VFIMRP1  = C2_APRINI1 , C2_APRFRP1  = C2_APRIRP1 
    WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
   SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
   IF @iPos  > 0 
   BEGIN 
      UPDATE SC2030 
        WITH (ROWLOCK) 
         SET C2_VFIM2  = C2_VINI2 , C2_APRFIM2  = C2_APRINI2 , C2_VFIMRP2  = C2_APRINI2 , C2_APRFRP2  = C2_APRIRP2 
       WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
   END 
   SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
   IF @iPos  > 0 
   BEGIN 
      UPDATE SC2030 
        WITH (ROWLOCK) 
         SET C2_VFIM3  = C2_VINI3 , C2_APRFIM3  = C2_APRINI3 , C2_VFIMRP3  = C2_APRINI3 , C2_APRFRP3  = C2_APRIRP3 
       WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
   END 
   SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
   IF @iPos  > 0 
   BEGIN 
      UPDATE SC2030 
        WITH (ROWLOCK) 
         SET C2_VFIM4  = C2_VINI4 , C2_APRFIM4  = C2_APRINI4 , C2_VFIMRP4  = C2_APRINI4 , C2_APRFRP4  = C2_APRIRP4 
       WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
   END 
   SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
   IF @iPos  > 0 
   BEGIN 
      UPDATE SC2030 
        WITH (ROWLOCK) 
         SET C2_VFIM5  = C2_VINI5 , C2_APRFIM5  = C2_APRINI5 , C2_VFIMRP5  = C2_APRINI5 , C2_APRFRP5  = C2_APRIRP5 
       WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
   END 
   IF @IN_MV_CUSFIFO  = '1' 
   BEGIN 
      UPDATE SC2030 
        WITH (ROWLOCK) 
         SET C2_VFIMFF1  = C2_VINIFF1 , C2_APFIFF1  = C2_APINFF1 
       WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
      SET @iPos  = CHARINDEX ( '2' , @IN_MV_MOEDACM )
      IF @iPos  > 0 
      BEGIN 
         UPDATE SC2030 
           WITH (ROWLOCK) 
            SET C2_VFIMFF2  = C2_VINIFF2 , C2_APFIFF2  = C2_APINFF2 
          WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
      END 
      SET @iPos  = CHARINDEX ( '3' , @IN_MV_MOEDACM )
      IF @iPos  > 0 
      BEGIN 
         UPDATE SC2030 
           WITH (ROWLOCK) 
            SET C2_VFIMFF3  = C2_VINIFF3 , C2_APFIFF3  = C2_APINFF3 
          WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
      END 
      SET @iPos  = CHARINDEX ( '4' , @IN_MV_MOEDACM )
      IF @iPos  > 0 
      BEGIN 
         UPDATE SC2030 
           WITH (ROWLOCK) 
            SET C2_VFIMFF4  = C2_VINIFF4 , C2_APFIFF4  = C2_APINFF4 
          WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
      END 
      SET @iPos  = CHARINDEX ( '5' , @IN_MV_MOEDACM )
      IF @iPos  > 0 
      BEGIN 
         UPDATE SC2030 
           WITH (ROWLOCK) 
            SET C2_VFIMFF5  = C2_VINIFF5 , C2_APFIFF5  = C2_APINFF5 
          WHERE C2_FILIAL  = @cFil_SC2  and D_E_L_E_T_  = ' '  and  (C2_DATRF  = ' '  or C2_DATRF  >= @dDTINICIO ) 
      END 
   END 
   commit transaction 
   EXEC M330INC2CP_02 @cFILIALCOR 
   EXEC MAT054_19_02 @cFILIALCOR , @IN_CFILAUX , @dDTINICIO , @IN_MV_MOEDACM , @cMV_PAR1 , @IN_MV_CUSFIFO , @OutResult output 
   IF  (@OutResult  = '1' ) 
   BEGIN 
      SET @OUT_RESULTADO  = '1' 
   END 
END
GO

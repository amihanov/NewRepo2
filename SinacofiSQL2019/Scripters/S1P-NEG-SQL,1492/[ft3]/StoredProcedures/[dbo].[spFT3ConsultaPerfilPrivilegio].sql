SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
IF OBJECT_ID('[dbo].[spFT3ConsultaPerfilPrivilegio]') IS NULL EXEC('CREATE PROCEDURE [dbo].[spFT3ConsultaPerfilPrivilegio] AS PRINT ''TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED''')
GO
ALTER PROCEDURE [dbo].[spFT3ConsultaPerfilPrivilegio]
@error           varchar(255) out,
                                                @vcCodigoPerfil  varchar(2)

/*
 *  Servicio:       spFT3ConsultaPerfilPrivilegio
 *  Objetivo:       Consulta sobre los privilegios y los perfiles relacionados.
 *  Autor Creacion: Andrea Zarabia.
 *  Fecha Creacion: 30/09/2010
 *
 *  Autor Modific.: Geronimo Martinez
 *  Fecha Modific.: 26/09/2012
 *  Motivo Mod.   : Se incorporan los campos iNivelUrl, vcCodPrivPadre al conjunto resultado.
 *
 *  Entrada:        @vcCodigoPerfil  Codigo del perfil.
 *
 *  Salida:         @error           error de salida
 *
 *
 *  Comentario:     No hay.
 */

as

begin
    select pr.vcCodigoPrivilegio, pr.vcDescripcionPrivilegio, pr.vcDireccionHttp,
      pr.iNivelUrl, pr.vcCodPrivPadre
    from tblPerfil pe, tblRelPrivilegioPerfil rpp, tblPrivilegio pr
    where pe.vcCodigoPerfil      = @vcCodigoPerfil
      and rpp.vcCodigoPrivilegio = pr.vcCodigoPrivilegio
      and rpp.vcCodigoPerfil     = pe.vcCodigoPerfil
    order by pr.vcCodigoPrivilegio
end

if @@rowcount < 1
begin
    select @error = "NO EXISTEN DATOS"
    return 1
end

select @error = ""
return 0
GO

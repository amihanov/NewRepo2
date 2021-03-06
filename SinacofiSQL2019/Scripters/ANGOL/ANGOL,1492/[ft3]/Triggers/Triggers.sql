
GO
--SqlScripter----[dbo].[tg_elim_tarc].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tg_elim_tarc]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tg_elim_tarc]')
GO
CREATE TRIGGER [dbo].[tg_elim_tarc]
ON dbo.tbl_tarc
    FOR DELETE
      AS 
         /*Generated by SQL Server Migration Assistant for Sybase version 5.2.1260.*/
         BEGIN TRANSACTION 
         DELETE dbo.tbl_htra
         FROM dbo.tbl_htra, deleted
         WHERE dbo.tbl_htra.ide_traz = deleted.ide_traz
         /*
         *   SSMA warning messages:
         *   S2SS0016: SQL Server might use a different error code.
         */

         IF (@@ERROR != 0)
            BEGIN
               IF @@TRANCOUNT > 0
                  ROLLBACK TRANSACTION trans
            END
         ELSE 
            BEGIN

               DELETE dbo.tbl_opca
               FROM dbo.tbl_opca, deleted
               WHERE dbo.tbl_opca.ide_traz = deleted.ide_traz

               /*
               *   SSMA warning messages:
               *   S2SS0016: SQL Server might use a different error code.
               */

               IF (@@ERROR != 0)
                  BEGIN
                     IF @@TRANCOUNT > 0
                        ROLLBACK TRANSACTION trans
                  END

            END
         IF @@TRANCOUNT > 0
            COMMIT TRANSACTION tra
GO

GO
--SqlScripter----[dbo].[tg_elim_tpro].sql
GO
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[tg_elim_tpro]') IS NOT NULL EXEC('DROP TRIGGER [dbo].[tg_elim_tpro]')
GO
CREATE TRIGGER [dbo].[tg_elim_tpro]
ON dbo.tbl_tpro
    FOR DELETE
      AS 
         
         /*
         *   Generated by SQL Server Migration Assistant for Sybase version 5.2.1260.
         *   
         *    *      Servicio        :       tg_elim_tpro
         *    *
         *    *      Objetivo        :       Eliminar las trazas relacionadas en las tablas tbl_hpro y tbl_oppr cuando
         *    *                              se borre en la tabla tbl_tpro    
         *    *
         *    *      Autor           :       ruh.
         *    *
         *    *      Creacion        :       08/06/2000
         *    *
         *    *      Modificado      :       
         *    *
         *    *      Comentario      :      No tiene 
         *    *
         *
         */
         BEGIN TRANSACTION 
         DELETE dbo.tbl_hpro
         FROM dbo.tbl_hpro, deleted
         WHERE dbo.tbl_hpro.ide_traz = deleted.ide_traz
         /*
         *   SSMA warning messages:
         *   S2SS0016: SQL Server might use a different error code.
         */

         IF (@@ERROR != 0)
            BEGIN
               IF @@TRANCOUNT > 0
                  ROLLBACK TRANSACTION trans
            END
         ELSE 
            BEGIN

               DELETE dbo.tbl_oppr
               FROM dbo.tbl_oppr, deleted
               WHERE dbo.tbl_oppr.ide_traz = deleted.ide_traz

               /*
               *   SSMA warning messages:
               *   S2SS0016: SQL Server might use a different error code.
               */

               IF (@@ERROR != 0)
                  BEGIN
                     IF @@TRANCOUNT > 0
                        ROLLBACK TRANSACTION trans
                  END

            END
         IF @@TRANCOUNT > 0
            COMMIT TRANSACTION
GO

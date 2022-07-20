
GO
--SqlScripter----[ope_harvest].sql
GO
CREATE USER [ope_harvest] FOR LOGIN [ope_harvest]

GO
--SqlScripter----[ope_reporteharvest].sql
GO
CREATE USER [ope_reporteharvest] WITHOUT LOGIN

GO
--SqlScripter----[ope_splunkbd].sql
GO
CREATE USER [ope_splunkbd] WITHOUT LOGIN

GO
--SqlScripter----[harvest].sql
GO
CREATE USER [harvest] WITHOUT LOGIN

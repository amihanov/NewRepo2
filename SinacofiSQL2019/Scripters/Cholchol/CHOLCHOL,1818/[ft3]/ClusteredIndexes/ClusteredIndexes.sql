
GO
--SqlScripter----[dbo].[tbl_casi].[in1_tbl_casi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_casi] ON [dbo].[tbl_casi] (
	[cod_casi] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_cdex].[in1_tbl_cdex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_cdex] ON [dbo].[tbl_cdex] (
	[cod_cdex] ASC,
	[cod_serv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_cerr].[in1_tbl_cerr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_cerr] ON [dbo].[tbl_cerr] (
	[cod_erro] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_corr].[in1_tbl_corr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_corr] ON [dbo].[tbl_corr] (
	[cod_inst] ASC,
	[cor_actu] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_dest].[in1_tbl_dest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_dest] ON [dbo].[tbl_dest] (
	[cod_prod] ASC,
	[cas_dest] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_estr].[in1_tbl_estr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_estr] ON [dbo].[tbl_estr] (
	[cod_msg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_estt].[in1_tbl_estt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_estt] ON [dbo].[tbl_estt] (
	[est_traz] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_hpro].[in1_tbl_hpro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [in1_tbl_hpro] ON [dbo].[tbl_hpro] (
	[ide_traz] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_hres].[in1_tbl_hres].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [in1_tbl_hres] ON [dbo].[tbl_hres] (
	[cor_resc] ASC,
	[cas_dest] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_htra].[in1_tbl_htra].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [in1_tbl_htra] ON [dbo].[tbl_htra] (
	[ide_traz] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_inst].[in1_tbl_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_inst] ON [dbo].[tbl_inst] (
	[cod_inst] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_limp].[in1_tbl_limp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [in1_tbl_limp] ON [dbo].[tbl_limp] (
	[ide_traz] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_opca].[in1_tbl_opca].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [in1_tbl_opca] ON [dbo].[tbl_opca] (
	[ide_traz] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_oppr].[in1_tbl_oppr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [in1_tbl_oppr] ON [dbo].[tbl_oppr] (
	[ide_traz] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_prod].[in1_tbl_prod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_prod] ON [dbo].[tbl_prod] (
	[cod_prod] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_resc].[in1_tbl_resc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_resc] ON [dbo].[tbl_resc] (
	[cor_resc] ASC,
	[cas_dest] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_serv].[in1_tbl_serv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_serv] ON [dbo].[tbl_serv] (
	[cod_serv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_tarc].[in1_tbl_tarc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_tarc] ON [dbo].[tbl_tarc] (
	[ide_traz] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_tpro].[in1_tbl_tpro].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [in1_tbl_tpro] ON [dbo].[tbl_tpro] (
	[ide_traz] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tbl_user].[in1_tbl_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [in1_tbl_user] ON [dbo].[tbl_user] (
	[cod_inst] ASC,
	[cod_user] ASC
) ON [PRIMARY]

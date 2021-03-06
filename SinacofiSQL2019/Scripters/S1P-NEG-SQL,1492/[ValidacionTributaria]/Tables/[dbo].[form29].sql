SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[form29](
	[rutContribuyente] [int] NULL,
	[nContribuyente] [nvarchar](2) NULL,
	[periodo] [int] NULL,
	[respuesta] [nvarchar](50) NULL,
	[vigente] [int] NULL,
	[cod_0585] [bigint] NULL,
	[cod_0020] [bigint] NULL,
	[cod_0586] [bigint] NULL,
	[cod_0142] [bigint] NULL,
	[cod_0515] [int] NULL,
	[cod_0587] [bigint] NULL,
	[cod_0503] [bigint] NULL,
	[cod_0502] [bigint] NULL,
	[cod_0110] [bigint] NULL,
	[cod_0111] [bigint] NULL,
	[cod_0512] [bigint] NULL,
	[cod_0513] [bigint] NULL,
	[cod_0509] [bigint] NULL,
	[cod_0510] [bigint] NULL,
	[cod_0708] [bigint] NULL,
	[cod_0709] [bigint] NULL,
	[cod_0733] [bigint] NULL,
	[cod_0734] [int] NULL,
	[cod_0516] [bigint] NULL,
	[cod_0517] [bigint] NULL,
	[cod_0500] [bigint] NULL,
	[cod_0501] [bigint] NULL,
	[cod_0154] [bigint] NULL,
	[cod_0518] [bigint] NULL,
	[cod_0538] [bigint] NULL,
	[cod_0511] [bigint] NULL,
	[cod_0514] [bigint] NULL,
	[cod_0564] [bigint] NULL,
	[cod_0521] [bigint] NULL,
	[cod_0566] [bigint] NULL,
	[cod_0560] [bigint] NULL,
	[cod_0584] [bigint] NULL,
	[cod_0562] [bigint] NULL,
	[cod_0519] [bigint] NULL,
	[cod_0520] [bigint] NULL,
	[cod_0524] [bigint] NULL,
	[cod_0525] [bigint] NULL,
	[cod_0527] [bigint] NULL,
	[cod_0528] [bigint] NULL,
	[cod_0531] [bigint] NULL,
	[cod_0532] [bigint] NULL,
	[cod_0534] [bigint] NULL,
	[cod_0535] [bigint] NULL,
	[cod_0536] [bigint] NULL,
	[cod_0553] [bigint] NULL,
	[cod_0504] [bigint] NULL,
	[cod_0593] [bigint] NULL,
	[cod_0594] [bigint] NULL,
	[cod_0592] [bigint] NULL,
	[cod_0539] [bigint] NULL,
	[cod_0164] [bigint] NULL,
	[cod_0127] [bigint] NULL,
	[cod_0544] [bigint] NULL,
	[cod_0523] [bigint] NULL,
	[cod_0537] [bigint] NULL,
	[cod_0089] [bigint] NULL,
	[cod_0050] [bigint] NULL,
	[cod_0048] [bigint] NULL,
	[cod_0151] [bigint] NULL,
	[cod_0153] [bigint] NULL,
	[cod_0054] [bigint] NULL,
	[cod_0056] [bigint] NULL,
	[cod_0588] [bigint] NULL,
	[cod_0589] [bigint] NULL,
	[cod_0062] [bigint] NULL,
	[cod_0030] [bigint] NULL,
	[cod_0563] [bigint] NULL,
	[cod_0115] [numeric](10, 5) NULL,
	[cod_0068] [bigint] NULL,
	[cod_0123] [bigint] NULL,
	[cod_0565] [bigint] NULL,
	[cod_0120] [bigint] NULL,
	[cod_0542] [nvarchar](50) NULL,
	[cod_0122] [bigint] NULL,
	[cod_0703] [bigint] NULL,
	[cod_0700] [bigint] NULL,
	[cod_0701] [bigint] NULL,
	[cod_0702] [bigint] NULL,
	[cod_0711] [bigint] NULL,
	[cod_0152] [bigint] NULL,
	[cod_0070] [bigint] NULL,
	[cod_0066] [bigint] NULL,
	[cod_0595] [bigint] NULL,
	[cod_0001] [nvarchar](100) NULL,
	[cod_0002] [nvarchar](40) NULL,
	[cod_0005] [nvarchar](80) NULL,
	[cod_0091] [bigint] NULL,
	[cod_0092] [int] NULL,
	[cod_0093] [bigint] NULL,
	[cod_0094] [bigint] NULL,
	[cod_0583] [int] NULL,
	[cod_0315] [nvarchar](10) NULL,
	[cod_0003] [nvarchar](15) NULL,
	[cod_0006] [nvarchar](80) NULL,
	[cod_0007] [bigint] NOT NULL,
	[cod_0008] [nvarchar](30) NULL,
	[cod_0009] [nvarchar](14) NULL,
	[cod_0015] [int] NULL,
	[cod_0547] [bigint] NULL,
	[cod_0573] [int] NULL,
	[cod_0598] [int] NULL,
	[cod_0723] [int] NULL,
	[cod_0724] [int] NULL,
	[cant_anuladas] [int] NULL,
	[moneda] [int] NULL,
	[usuario] [int] NULL,
	[codint] [int] NULL,
	[opcion] [nvarchar](10) NULL,
	[clase] [nvarchar](50) NULL,
	[medio_pago] [nvarchar](10) NULL,
	[banco] [nvarchar](80) NULL,
	[mostrar_folio] [int] NULL,
	[fecha_ingreso] [date] NULL,
	[nombres] [nvarchar](20) NULL,
	[fecha_hoy] [date] NULL,
	[medio_ingreso] [nvarchar](10) NULL,
	[codigo_ingreso] [int] NULL,
	[tipo_movimiento] [int] NULL,
	[calidadDeclarante] [nvarchar](20) NULL,
	[nombre_fun] [nvarchar](80) NULL,
	[adm8703] [nvarchar](20) NULL,
	[adm8721] [nvarchar](20) NULL,
	[cartrib] [int] NULL,
	[token] [nvarchar](10) NULL,
	[cod_0732] [int] NULL,
	[cod_0715] [int] NULL,
	[cod_0720] [int] NULL,
	[cod_0077] [bigint] NULL,
	[cod_0055] [nvarchar](80) NULL,
	[cod_0596] [int] NULL,
	[cod_9906] [nvarchar](20) NULL,
	[cod_0060] [int] NULL,
	[cod_0795] [int] NULL,
	[cod_0915] [nvarchar](20) NULL,
	[cod_0922] [nvarchar](20) NULL,
	[cod_0146] [int] NULL,
	[cod_0506] [int] NULL,
	[cod_0507] [int] NULL,
	[cod_0576] [int] NULL,
	[cod_0602] [int] NULL,
	[cod_0603] [int] NULL,
	[cod_0508] [int] NULL,
	[cod_0149] [int] NULL,
	[cod_0580] [int] NULL,
	[cod_0039] [int] NULL,
	[nom_uni] [nvarchar](60) NULL,
	[nom_reg] [nvarchar](255) NULL,
	[nom_depto] [nvarchar](255) NULL,
	[cod_0543] [nvarchar](60) NULL,
	[cod_0556] [nvarchar](60) NULL,
	[cod_0716] [nvarchar](60) NULL,
	[cod_0717] [nvarchar](60) NULL,
	[cod_0731] [nvarchar](60) NULL,
	[cod_9400] [nvarchar](60) NULL,
	[cod_9401] [nvarchar](60) NULL,
	[cod_9402] [nvarchar](60) NULL,
	[cod_9403] [nvarchar](60) NULL,
	[cod_9404] [nvarchar](60) NULL,
	[cod_9405] [nvarchar](60) NULL,
	[cod_9406] [nvarchar](60) NULL,
	[cod_9407] [nvarchar](60) NULL,
	[cod_9408] [nvarchar](60) NULL,
	[cod_9409] [nvarchar](60) NULL,
	[cod_9410] [nvarchar](60) NULL,
	[cod_9411] [nvarchar](60) NULL,
	[cod_9412] [nvarchar](60) NULL,
	[cod_9413] [nvarchar](60) NULL,
	[cod_9414] [nvarchar](60) NULL,
	[cod_0714] [nvarchar](60) NULL,
	[cod_0729] [nvarchar](60) NULL,
	[cod_0744] [nvarchar](60) NULL,
	[cod_0745] [nvarchar](60) NULL,
	[cod_0739] [nvarchar](60) NULL,
	[cod_0740] [nvarchar](60) NULL,
	[cod_0730] [nvarchar](50) NULL,
	[cod_0742] [nvarchar](60) NULL,
	[cod_0743] [nvarchar](60) NULL,
	[cod_0557] [nvarchar](60) NULL,
	[cod_0554] [nvarchar](60) NULL,
	[cod_0085] [nvarchar](60) NULL,
	[cod_0150] [nvarchar](60) NULL,
	[cod_0575] [nvarchar](60) NULL,
	[cod_0577] [nvarchar](60) NULL,
	[cod_0582] [nvarchar](60) NULL,
	[cod_0032] [nvarchar](60) NULL,
	[cod_0033] [nvarchar](60) NULL,
	[cod_0574] [nvarchar](60) NULL,
	[cod_0028] [int] NULL,
	[cod_0044] [int] NULL,
	[cod_0053] [int] NULL,
	[cod_0073] [int] NULL,
	[cod_0113] [int] NULL,
	[cod_0555] [int] NULL,
	[cod_0559] [int] NULL,
	[cod_0610] [int] NULL,
	[COD_9902_1] [bigint] NULL,
	[COD_9902_2] [bigint] NULL,
	[cod_chk] [nvarchar](20) NULL,
	[cod_0759] [varchar](100) NULL,
	[cod_0755] [varchar](100) NULL,
	[cod_0126] [bigint] NULL,
	[cod_0128] [bigint] NULL,
	[cod_0160] [bigint] NULL,
	[cod_0161] [bigint] NULL,
	[cod_0313] [int] NULL,
	[Cod_0314] [varchar](50) NULL,
	[cod_0409] [decimal](18, 0) NULL,
	[cod_0522] [decimal](18, 0) NULL,
	[cod_0526] [decimal](18, 0) NULL,
	[cod_0529] [bigint] NULL,
	[cod_0530] [bigint] NULL,
	[cod_0533] [bigint] NULL,
	[cod_0540] [bigint] NULL,
	[cod_0541] [bigint] NULL,
	[cod_0545] [bigint] NULL,
	[cod_0546] [bigint] NULL,
	[cod_0549] [bigint] NULL,
	[cod_0550] [bigint] NULL,
	[cod_0551] [bigint] NULL,
	[cod_0552] [bigint] NULL,
	[cod_0558] [bigint] NULL,
	[cod_0568] [bigint] NULL,
	[cod_0570] [bigint] NULL,
	[cod_0571] [bigint] NULL,
	[cod_0572] [bigint] NULL,
	[cod_0590] [bigint] NULL,
	[cod_0591] [bigint] NULL,
	[cod_0597] [bigint] NULL,
	[cod_0601] [int] NULL,
	[cod_0604] [int] NULL,
	[cod_0611] [int] NULL,
	[cod_0612] [nvarchar](255) NULL,
	[cod_0613] [int] NULL,
	[cod_0704] [bigint] NULL,
	[cod_0705] [bigint] NULL,
	[cod_0706] [bigint] NULL,
	[cod_0707] [bigint] NULL,
	[cod_0710] [bigint] NULL,
	[cod_0712] [bigint] NULL,
	[cod_0718] [bigint] NULL,
	[cod_0721] [bigint] NULL,
	[cod_0722] [bigint] NULL,
	[cod_0725] [bigint] NULL,
	[cod_0726] [int] NULL,
	[cod_0727] [bigint] NULL,
	[cod_0728] [bigint] NULL,
	[cod_0735] [bigint] NULL,
	[cod_0736] [bigint] NULL,
	[cod_0737] [bigint] NULL,
	[cod_0738] [bigint] NULL,
	[cod_0741] [bigint] NULL,
	[cod_0750] [varchar](50) NULL,
	[cod_0751] [bigint] NULL,
	[cod_0752] [bigint] NULL,
	[cod_0753] [bigint] NULL,
	[cod_0754] [bigint] NULL,
	[cod_0756] [nvarchar](10) NULL,
	[cod_0757] [bigint] NULL,
	[cod_0760] [bigint] NULL,
	[cod_0761] [bigint] NULL,
	[cod_0762] [bigint] NULL,
	[cod_9920] [varchar](30) NULL,
	[cod_0758] [bigint] NULL
)
ON [PRIMARY]

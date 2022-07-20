
GO
--SqlScripter----[dbo].[acc_lvls].[acc_lvls_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [acc_lvls_x0] ON [dbo].[acc_lvls] (
	[enum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[acc_lvls].[acc_lvls_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [acc_lvls_x1] ON [dbo].[acc_lvls] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[acctyp].[acctyp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [acctyp_x0] ON [dbo].[acctyp] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[act_log].[act_log_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [act_log_x0] ON [dbo].[act_log] (
	[call_req_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[act_log].[act_log_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [act_log_x1] ON [dbo].[act_log] (
	[time_stamp] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[act_type].[act_type_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [act_type_x0] ON [dbo].[act_type] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[act_type].[act_type_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [act_type_x1] ON [dbo].[act_type] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[act_type].[act_type_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [act_type_x2] ON [dbo].[act_type] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actbool].[actbool_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [actbool_x0] ON [dbo].[actbool] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actors].[$actor_u000041c600000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[actors] ADD CONSTRAINT [$actor_u000041c600000000] PRIMARY KEY NONCLUSTERED (
	[productid] ASC,
	[actor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actors].[actors_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [actors_ind1] ON [dbo].[actors] (
	[productid] ASC,
	[lastcheckin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actrbool].[actrbool_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [actrbool_x0] ON [dbo].[actrbool] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[aec_hist_report_v2].[XIE1aec_hist_report_v2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XIE1aec_hist_report_v2] ON [dbo].[aec_hist_report_v2] (
	[node] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fddef_prop_ak2] ON [dbo].[ai_fddef_prop] (
	[fddevice] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fddef_prop_ak3] ON [dbo].[ai_fddef_prop] (
	[fdvendor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fddef_prop_ak4] ON [dbo].[ai_fddef_prop] (
	[fdmodel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fddef_prop_ak5] ON [dbo].[ai_fddef_prop] (
	[fdinterface] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_ak6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fddef_prop_ak6] ON [dbo].[ai_fddef_prop] (
	[fdsize] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_ak7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fddef_prop_ak7] ON [dbo].[ai_fddef_prop] (
	[fdsn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_ak8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fddef_prop_ak8] ON [dbo].[ai_fddef_prop] (
	[fdstatus] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_fddef_prop] ADD CONSTRAINT [ai_fddef_prop_pk] PRIMARY KEY NONCLUSTERED (
	[hwuuid] ASC,
	[fddevice] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fsdef_prop_ak2] ON [dbo].[ai_fsdef_prop] (
	[fsdevice] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fsdef_prop_ak3] ON [dbo].[ai_fsdef_prop] (
	[fsname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fsdef_prop_ak4] ON [dbo].[ai_fsdef_prop] (
	[fslabel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fsdef_prop_ak5] ON [dbo].[ai_fsdef_prop] (
	[fstype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_ak6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fsdef_prop_ak6] ON [dbo].[ai_fsdef_prop] (
	[fssize] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_ak7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fsdef_prop_ak7] ON [dbo].[ai_fsdef_prop] (
	[fsused] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_ak8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_fsdef_prop_ak8] ON [dbo].[ai_fsdef_prop] (
	[fsfree] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_fsdef_prop] ADD CONSTRAINT [ai_fsdef_prop_pk] PRIMARY KEY NONCLUSTERED (
	[hwuuid] ASC,
	[fsdevice] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_hwdef_rel].[ai_hfdef_hwdef_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_hwdef_rel_ak2] ON [dbo].[ai_hfdef_hwdef_rel] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_hwdef_rel].[ai_hfdef_hwdef_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hfdef_hwdef_rel] ADD CONSTRAINT [ai_hfdef_hwdef_rel_pk] PRIMARY KEY NONCLUSTERED (
	[hfuuid] ASC,
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_instcnt_kpi].[ai_hfdef_instcnt_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_instcnt_kpi_ak1] ON [dbo].[ai_hfdef_instcnt_kpi] (
	[count] DESC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_prop_ak1] ON [dbo].[ai_hfdef_prop] (
	[hfpub] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_prop_ak2] ON [dbo].[ai_hfdef_prop] (
	[hfname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_prop_ak3] ON [dbo].[ai_hfdef_prop] (
	[hfsp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_prop_ak4] ON [dbo].[ai_hfdef_prop] (
	[hfid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_prop_ak5] ON [dbo].[ai_hfdef_prop] (
	[hfver] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_ak6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_prop_ak6] ON [dbo].[ai_hfdef_prop] (
	[hfrel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_ak7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_prop_ak7] ON [dbo].[ai_hfdef_prop] (
	[hfmod] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_ak8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hfdef_prop_ak8] ON [dbo].[ai_hfdef_prop] (
	[hfbld] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_classdef_rel].[ai_hwdef_classdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_classdef_rel_ak1] ON [dbo].[ai_hwdef_classdef_rel] (
	[classid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak1] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[earlyavg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak2] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[earlymax] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak3] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[earlymin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak4] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[coreavg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak5] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[coremax] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak6] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[coremin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak7] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[lateavg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak8] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[latemax] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_ak9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_cpuperf_kpi_ak9] ON [dbo].[ai_hwdef_cpuperf_kpi] (
	[latemin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_createdate_kpi].[ai_hwdef_createdate_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_createdate_kpi_ak1] ON [dbo].[ai_hwdef_createdate_kpi] (
	[createdate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_all_rel].[ai_hwdef_login_all_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_login_all_rel_ak2] ON [dbo].[ai_hwdef_login_all_rel] (
	[loginid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_all_rel].[ai_hwdef_login_all_rel_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_login_all_rel_ak3] ON [dbo].[ai_hwdef_login_all_rel] (
	[logindomain] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_all_rel].[ai_hwdef_login_all_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_login_all_rel] ADD CONSTRAINT [ai_hwdef_login_all_rel_pk] PRIMARY KEY NONCLUSTERED (
	[hwuuid] ASC,
	[loginid] ASC,
	[logindomain] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_lscandate_rel].[ai_hwdef_login_lscandate_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_login_lscandate_rel_ak1] ON [dbo].[ai_hwdef_login_lscandate_rel] (
	[loginid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_lscandate_rel].[ai_hwdef_login_lscandate_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_login_lscandate_rel_ak2] ON [dbo].[ai_hwdef_login_lscandate_rel] (
	[logindomain] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_maxscan_rel].[ai_hwdef_login_maxscan_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_login_maxscan_rel_ak1] ON [dbo].[ai_hwdef_login_maxscan_rel] (
	[loginid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_maxscan_rel].[ai_hwdef_login_maxscan_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_login_maxscan_rel_ak2] ON [dbo].[ai_hwdef_login_maxscan_rel] (
	[logindomain] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_rel].[ai_hwdef_login_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_login_rel_ak1] ON [dbo].[ai_hwdef_login_rel] (
	[loginid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_rel].[ai_hwdef_login_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_login_rel_ak2] ON [dbo].[ai_hwdef_login_rel] (
	[logindomain] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_lscandate_kpi].[ai_hwdef_lscandate_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_lscandate_kpi_ak1] ON [dbo].[ai_hwdef_lscandate_kpi] (
	[lscandate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_mac_kpi].[ai_hwdef_mac_kpi_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_mac_kpi_ak2] ON [dbo].[ai_hwdef_mac_kpi] (
	[hwmac] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_mac_kpi].[ai_hwdef_mac_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_mac_kpi] ADD CONSTRAINT [ai_hwdef_mac_kpi_pk] PRIMARY KEY NONCLUSTERED (
	[hwuuid] ASC,
	[hwmac] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_osinstdate_kpi].[ai_hwdef_osinstdate_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_osinstdate_kpi_ak1] ON [dbo].[ai_hwdef_osinstdate_kpi] (
	[osinstdate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak1] ON [dbo].[ai_hwdef_prop] (
	[hwdom] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak10].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak10] ON [dbo].[ai_hwdef_prop] (
	[hwbiosver] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak11] ON [dbo].[ai_hwdef_prop] (
	[hwbiosdate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak12].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak12] ON [dbo].[ai_hwdef_prop] (
	[hwprocmfgr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak13].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak13] ON [dbo].[ai_hwdef_prop] (
	[hwprocmodel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak14].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak14] ON [dbo].[ai_hwdef_prop] (
	[hwproctype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak15].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak15] ON [dbo].[ai_hwdef_prop] (
	[hwproccount] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak16].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak16] ON [dbo].[ai_hwdef_prop] (
	[hwprocspeed] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak2] ON [dbo].[ai_hwdef_prop] (
	[hwname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak3] ON [dbo].[ai_hwdef_prop] (
	[hwsn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak4] ON [dbo].[ai_hwdef_prop] (
	[hwtype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak5] ON [dbo].[ai_hwdef_prop] (
	[hwmfgr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak6] ON [dbo].[ai_hwdef_prop] (
	[hwmem] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak7] ON [dbo].[ai_hwdef_prop] (
	[hwmodel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak8] ON [dbo].[ai_hwdef_prop] (
	[hwbiosmfgr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_ak9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_hwdef_prop_ak9] ON [dbo].[ai_hwdef_prop] (
	[hwbiosmfgr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_ipdef_prop].[ai_ipdef_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_ipdef_prop_ak2] ON [dbo].[ai_ipdef_prop] (
	[ipaddr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_ipdef_prop].[ai_ipdef_prop_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_ipdef_prop_ak3] ON [dbo].[ai_ipdef_prop] (
	[ipmask] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_ipdef_prop].[ai_ipdef_prop_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_ipdef_prop_ak4] ON [dbo].[ai_ipdef_prop] (
	[ipnwaddr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_orgdef_rel].[ai_orgdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_orgdef_rel_ak1] ON [dbo].[ai_orgdef_rel] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_orgdef_rel].[ai_orgdef_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_orgdef_rel_ak2] ON [dbo].[ai_orgdef_rel] (
	[region] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_hwdef_rel].[ai_osdef_hwdef_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_osdef_hwdef_rel_ak2] ON [dbo].[ai_osdef_hwdef_rel] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_hwdef_rel].[ai_osdef_hwdef_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_osdef_hwdef_rel] ADD CONSTRAINT [ai_osdef_hwdef_rel_pk] PRIMARY KEY NONCLUSTERED (
	[osuuid] ASC,
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_instcnt_kpi].[ai_osdef_instcnt_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_osdef_instcnt_kpi_ak1] ON [dbo].[ai_osdef_instcnt_kpi] (
	[count] DESC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_prop].[ai_osdef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_osdef_prop_ak1] ON [dbo].[ai_osdef_prop] (
	[ospub] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_prop].[ai_osdef_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_osdef_prop_ak2] ON [dbo].[ai_osdef_prop] (
	[osname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_prop].[ai_osdef_prop_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_osdef_prop_ak3] ON [dbo].[ai_osdef_prop] (
	[osver] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_prop].[ai_osdef_prop_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_osdef_prop_ak4] ON [dbo].[ai_osdef_prop] (
	[osbuild] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_prop].[ai_osdef_prop_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_osdef_prop_ak5] ON [dbo].[ai_osdef_prop] (
	[ossp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_prop].[ai_osdef_prop_ak6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_osdef_prop_ak6] ON [dbo].[ai_osdef_prop] (
	[oslanguage] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_pubdef_hwdef_rel].[ai_pubdef_hwdef_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_pubdef_hwdef_rel_ak2] ON [dbo].[ai_pubdef_hwdef_rel] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_pubdef_hwdef_rel].[ai_pubdef_hwdef_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_pubdef_hwdef_rel] ADD CONSTRAINT [ai_pubdef_hwdef_rel_pk] PRIMARY KEY NONCLUSTERED (
	[pubuuid] ASC,
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_pubdef_instcnt_kpi].[ai_pubdef_instcnt_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_pubdef_instcnt_kpi_ak1] ON [dbo].[ai_pubdef_instcnt_kpi] (
	[count] DESC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_pubdef_prop].[ai_pubdef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_pubdef_prop_ak1] ON [dbo].[ai_pubdef_prop] (
	[pubname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_hwdef_rel].[ai_swcat_hwdef_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swcat_hwdef_rel_ak2] ON [dbo].[ai_swcat_hwdef_rel] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_hwdef_rel].[ai_swcat_hwdef_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_swcat_hwdef_rel] ADD CONSTRAINT [ai_swcat_hwdef_rel_pk] PRIMARY KEY NONCLUSTERED (
	[scuuid] ASC,
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_instcnt_kpi].[ai_swcat_instcnt_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swcat_instcnt_kpi_ak1] ON [dbo].[ai_swcat_instcnt_kpi] (
	[count] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_prop].[ai_swcat_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swcat_prop_ak1] ON [dbo].[ai_swcat_prop] (
	[scname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_prop].[ai_swcat_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swcat_prop_ak2] ON [dbo].[ai_swcat_prop] (
	[scnote] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_swdef_rel].[ai_swcat_swdef_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swcat_swdef_rel_ak2] ON [dbo].[ai_swcat_swdef_rel] (
	[swuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_swdef_rel].[ai_swcat_swdef_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_swcat_swdef_rel] ADD CONSTRAINT [ai_swcat_swdef_rel_pk] PRIMARY KEY NONCLUSTERED (
	[scuuid] ASC,
	[swuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_hwdef_rel].[ai_swdef_hwdef_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_hwdef_rel_ak2] ON [dbo].[ai_swdef_hwdef_rel] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_hwdef_rel].[ai_swdef_hwdef_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_swdef_hwdef_rel] ADD CONSTRAINT [ai_swdef_hwdef_rel_pk] PRIMARY KEY NONCLUSTERED (
	[swuuid] ASC,
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_instcnt_kpi].[ai_swdef_instcnt_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_instcnt_kpi_ak1] ON [dbo].[ai_swdef_instcnt_kpi] (
	[count] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak1] ON [dbo].[ai_swdef_prop] (
	[pubuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak2] ON [dbo].[ai_swdef_prop] (
	[swpub] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak3] ON [dbo].[ai_swdef_prop] (
	[swname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak4] ON [dbo].[ai_swdef_prop] (
	[swver] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak5] ON [dbo].[ai_swdef_prop] (
	[swrel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak6] ON [dbo].[ai_swdef_prop] (
	[swmod] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak7] ON [dbo].[ai_swdef_prop] (
	[swbld] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak8] ON [dbo].[ai_swdef_prop] (
	[swnote] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_ak9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_swdef_prop_ak9] ON [dbo].[ai_swdef_prop] (
	[swlang] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_undef_hwdef_rel].[ai_undef_hwdef_rel_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_undef_hwdef_rel_ak2] ON [dbo].[ai_undef_hwdef_rel] (
	[domuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_undef_hwdef_rel].[ai_undef_hwdef_rel_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_undef_hwdef_rel_ak3] ON [dbo].[ai_undef_hwdef_rel] (
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_undef_hwdef_rel].[ai_undef_hwdef_rel_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_undef_hwdef_rel_ak4] ON [dbo].[ai_undef_hwdef_rel] (
	[unitid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_undef_hwdef_rel].[ai_undef_hwdef_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_undef_hwdef_rel] ADD CONSTRAINT [ai_undef_hwdef_rel_pk] PRIMARY KEY NONCLUSTERED (
	[domuuid] ASC,
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_orgtree_prop].[ai_usrdef_orgtree_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_orgtree_prop_ak1] ON [dbo].[ai_usrdef_orgtree_prop] (
	[reportsto] ASC,
	[pmf] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_prop_ak1] ON [dbo].[ai_usrdef_prop] (
	[fn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_prop_ak2] ON [dbo].[ai_usrdef_prop] (
	[ln] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_prop_ak3] ON [dbo].[ai_usrdef_prop] (
	[mgr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_prop_ak4] ON [dbo].[ai_usrdef_prop] (
	[company] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_prop_ak5] ON [dbo].[ai_usrdef_prop] (
	[dept] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_ak6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_prop_ak6] ON [dbo].[ai_usrdef_prop] (
	[office] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_ak7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_prop_ak7] ON [dbo].[ai_usrdef_prop] (
	[title] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_ak8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ai_usrdef_prop_ak8] ON [dbo].[ai_usrdef_prop] (
	[orgnm] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[alertdrillmap].[baseidx_alertdrillmap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_alertdrillmap] ON [dbo].[alertdrillmap] (
	[fieldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[alias].[baseidx_alias].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_alias] ON [dbo].[alias] (
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[alias].[ialias].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ialias] ON [dbo].[alias] (
	[a_eid] ASC,
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_approved_licenses].[am_approved_licenses_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [am_approved_licenses_idx1] ON [dbo].[am_approved_licenses] (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_external_device].[baseidx_am_external_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_am_external_device] ON [dbo].[am_external_device] (
	[device_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_external_device_def].[baseidx_am_external_device_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_am_external_device_def] ON [dbo].[am_external_device_def] (
	[def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_link_external_device].[am_link_external_device_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [am_link_external_device_idx1] ON [dbo].[am_link_external_device] (
	[primary_uuid] ASC,
	[secondary_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_map].[am_map_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [am_map_x0] ON [dbo].[am_map] (
	[am_unit_domain_id] ASC,
	[am_unit_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_map].[am_map_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [am_map_x1] ON [dbo].[am_map] (
	[ob_persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[amepdef].[amepdef_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [amepdef_idx_01] ON [dbo].[amepdef] (
	[policy_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[amephis].[baseidx_amephis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_amephis] ON [dbo].[amephis] (
	[huserdid] ASC,
	[huserid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[amlegacy_objects].[amlegacy_objects_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [amlegacy_objects_idx_01] ON [dbo].[amlegacy_objects] (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[amlegacy_objects].[amlegacy_objects_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [amlegacy_objects_idx_02] ON [dbo].[amlegacy_objects] (
	[object_domain_id] ASC,
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_alerts].[ams_lv1_alerts_index0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ams_lv1_alerts_index0] ON [dbo].[ams_lv1_alerts] (
	[queue] ASC,
	[active] ASC,
	[groupid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_alerts].[ams_lv1_alerts_index1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ams_lv1_alerts_index1] ON [dbo].[ams_lv1_alerts] (
	[escalating] ASC,
	[active] ASC,
	[groupid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_alerts].[ams_lv1_alerts_index2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ams_lv1_alerts_index2] ON [dbo].[ams_lv1_alerts] (
	[queue] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_alerts].[ams_lv1_alerts_index3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ams_lv1_alerts_index3] ON [dbo].[ams_lv1_alerts] (
	[active] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_alerts].[ams_lv1_alerts_index4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ams_lv1_alerts_index4] ON [dbo].[ams_lv1_alerts] (
	[groupid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_alerts].[baseidx_ams_lv1_alerts].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_alerts] ON [dbo].[ams_lv1_alerts] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_annotation].[baseidx_ams_lv1_annotation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_annotation] ON [dbo].[ams_lv1_annotation] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_association].[ams_lv1_association_index0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ams_lv1_association_index0] ON [dbo].[ams_lv1_association] (
	[name] ASC,
	[moclass] ASC,
	[corename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_association].[baseidx_ams_lv1_association].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_association] ON [dbo].[ams_lv1_association] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_classes].[baseidx_ams_lv1_classes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_classes] ON [dbo].[ams_lv1_classes] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_display].[ams_lv1_display_index2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ams_lv1_display_index2] ON [dbo].[ams_lv1_display] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_display].[baseidx_ams_lv1_display].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_display] ON [dbo].[ams_lv1_display] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_escalation].[baseidx_ams_lv1_escalation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_escalation] ON [dbo].[ams_lv1_escalation] (
	[id] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_global].[baseidx_ams_lv1_global].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_global] ON [dbo].[ams_lv1_global] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_history].[baseidx_ams_lv1_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_ams_lv1_history] ON [dbo].[ams_lv1_history] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_menus].[ams_lv1_menus_index2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ams_lv1_menus_index2] ON [dbo].[ams_lv1_menus] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_menus].[baseidx_ams_lv1_menus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_menus] ON [dbo].[ams_lv1_menus] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_queues].[ams_lv1_queues_index2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ams_lv1_queues_index2] ON [dbo].[ams_lv1_queues] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_queues].[baseidx_ams_lv1_queues].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_queues] ON [dbo].[ams_lv1_queues] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_uaction].[ams_lv1_uaction_index2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ams_lv1_uaction_index2] ON [dbo].[ams_lv1_uaction] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_uaction].[baseidx_ams_lv1_uaction].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_uaction] ON [dbo].[ams_lv1_uaction] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_uactionlinker].[baseidx_ams_lv1_uactionlinker].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_uactionlinker] ON [dbo].[ams_lv1_uactionlinker] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ams_lv1_udata].[baseidx_ams_lv1_udata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ams_lv1_udata] ON [dbo].[ams_lv1_udata] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[analysis].[analysis_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [analysis_idx_01] ON [dbo].[analysis] (
	[name] ASC,
	[owner] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[analysis].[analysis_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [analysis_idx_02] ON [dbo].[analysis] (
	[owner] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[analysis].[baseidx_analysis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_analysis] ON [dbo].[analysis] (
	[analysisid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[analysisproperties].[baseidx_analysisproperties].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_analysisproperties] ON [dbo].[analysisproperties] (
	[analysisid] ASC,
	[position] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[anima].[anima_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [anima_x0] ON [dbo].[anima] (
	[a_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[anima].[anima_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [anima_x1] ON [dbo].[anima] (
	[t_persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_auth_call].[ap_nm_auth_call_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_auth_call_x1] ON [dbo].[ap_nm_auth_call] (
	[acikey] ASC,
	[acekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_auth_call].[baseidx_ap_nm_auth_call].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_auth_call] ON [dbo].[ap_nm_auth_call] (
	[ackey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_entity].[ap_nm_entity_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_entity_x1] ON [dbo].[ap_nm_entity] (
	[enm_upcase] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_entity].[ap_nm_entity_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_entity_x2] ON [dbo].[ap_nm_entity] (
	[eescalate_to] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_entity].[baseidx_ap_nm_entity].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_entity] ON [dbo].[ap_nm_entity] (
	[ekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_internal].[baseidx_ap_nm_internal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_internal] ON [dbo].[ap_nm_internal] (
	[ilabel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_key].[baseidx_ap_nm_key].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_key] ON [dbo].[ap_nm_key] (
	[knm] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_login].[ap_nm_login_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_login_x1] ON [dbo].[ap_nm_login] (
	[lnm_upcase] ASC,
	[lekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_login].[baseidx_ap_nm_login].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_login] ON [dbo].[ap_nm_login] (
	[lkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_method].[ap_nm_method_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_method_x1] ON [dbo].[ap_nm_method] (
	[mnm_upcase] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_method].[baseidx_ap_nm_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_method] ON [dbo].[ap_nm_method] (
	[mkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_notify_item].[ap_nm_notify_item_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_notify_item_x1] ON [dbo].[ap_nm_notify_item] (
	[nilkey] ASC,
	[niekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_notify_item].[baseidx_ap_nm_notify_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_notify_item] ON [dbo].[ap_nm_notify_item] (
	[nikey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_parameter].[ap_nm_parameter_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_parameter_x1] ON [dbo].[ap_nm_parameter] (
	[pekey] ASC,
	[ptkey] ASC,
	[pmkey] ASC,
	[pnm_upcase] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_parameter].[ap_nm_parameter_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_parameter_x2] ON [dbo].[ap_nm_parameter] (
	[ppkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_parameter].[baseidx_ap_nm_parameter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_parameter] ON [dbo].[ap_nm_parameter] (
	[pkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_record_lock].[baseidx_ap_nm_record_lock].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_record_lock] ON [dbo].[ap_nm_record_lock] (
	[rllock] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_schedule].[ap_nm_schedule_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_schedule_x1] ON [dbo].[ap_nm_schedule] (
	[tekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_schedule].[ap_nm_schedule_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_schedule_x2] ON [dbo].[ap_nm_schedule] (
	[tforward_to] ASC,
	[ttell_method] ASC,
	[task_method] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_schedule].[ap_nm_schedule_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_nm_schedule_x3] ON [dbo].[ap_nm_schedule] (
	[tnm_upcase] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_nm_schedule].[baseidx_ap_nm_schedule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_nm_schedule] ON [dbo].[ap_nm_schedule] (
	[tkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_wmv_messages].[ap_wmv_messages_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_wmv_messages_x1] ON [dbo].[ap_wmv_messages] (
	[assigned_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_wmv_messages].[ap_wmv_messages_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_wmv_messages_x2] ON [dbo].[ap_wmv_messages] (
	[session_action_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_wmv_messages].[baseidx_ap_wmv_messages].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_wmv_messages] ON [dbo].[ap_wmv_messages] (
	[webmv_key] ASC,
	[session_nm_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_wmv_session_nm].[ap_wmv_session_nm_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ap_wmv_session_nm_x1] ON [dbo].[ap_wmv_session_nm] (
	[session_nm] ASC,
	[ap_host] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_wmv_session_nm].[baseidx_ap_wmv_session_nm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_wmv_session_nm] ON [dbo].[ap_wmv_session_nm] (
	[session_nm_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ap_wmv_usr_config].[baseidx_ap_wmv_usr_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ap_wmv_usr_config] ON [dbo].[ap_wmv_usr_config] (
	[usr_nm] ASC,
	[session_nm] ASC,
	[ap_host] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[applicationgroups].[baseidx_applicationgroups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_applicationgroups] ON [dbo].[applicationgroups] (
	[protocolname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arcpur_rule].[arcpur_rule_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [arcpur_rule_x0] ON [dbo].[arcpur_rule] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_action].[acindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [acindex02] ON [dbo].[arg_action] (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_action].[acindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [acindex03] ON [dbo].[arg_action] (
	[acadid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_actiondf].[adindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [adindex02] ON [dbo].[arg_actiondf] (
	[adtext] ASC,
	[adtype] ASC,
	[ad1obty] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_actionlk].[lkindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lkindex02] ON [dbo].[arg_actionlk] (
	[primary_object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_actionlk].[lkindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lkindex03] ON [dbo].[arg_actionlk] (
	[secondary_object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_assetver].[avindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [avindex02] ON [dbo].[arg_assetver] (
	[avstatus] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_assetver].[avindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [avindex03] ON [dbo].[arg_assetver] (
	[avivid] ASC,
	[own_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_assetver].[avindex04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [avindex04] ON [dbo].[arg_assetver] (
	[model_uuid] ASC,
	[avivid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_attachmt].[amindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [amindex02] ON [dbo].[arg_attachmt] (
	[object_uuid] ASC,
	[amfile] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_attribute_def].[sysadindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sysadindex02] ON [dbo].[arg_attribute_def] (
	[table_name] ASC,
	[field_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_attribute_def].[sysadindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sysadindex03] ON [dbo].[arg_attribute_def] (
	[join_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_attribute_def].[sysadindex04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sysadindex04] ON [dbo].[arg_attribute_def] (
	[class_template] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_attribute_def].[sysadindex05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sysadindex05] ON [dbo].[arg_attribute_def] (
	[control_object] ASC,
	[control_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_class_def].[syscdindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [syscdindex02] ON [dbo].[arg_class_def] (
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_class_def].[syscdindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [syscdindex03] ON [dbo].[arg_class_def] (
	[class_template] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_class_def].[syscdindex04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [syscdindex04] ON [dbo].[arg_class_def] (
	[control_object] ASC,
	[control_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_controls].[cnindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [cnindex02] ON [dbo].[arg_controls] (
	[cnobject] ASC,
	[cnname] ASC,
	[cndefid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_costdet].[cdindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cdindex02] ON [dbo].[arg_costdet] (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_costdet].[cdindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cdindex03] ON [dbo].[arg_costdet] (
	[company_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_drpdnlst].[arg_drpdnlst_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [arg_drpdnlst_idx_04] ON [dbo].[arg_drpdnlst] (
	[organization_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_drpdnlst].[dlindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [dlindex02] ON [dbo].[arg_drpdnlst] (
	[dlldid] ASC,
	[dlvalue] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_drpdnlst].[dlindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dlindex03] ON [dbo].[arg_drpdnlst] (
	[dlkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefhdr].[evindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [evindex02] ON [dbo].[arg_evdefhdr] (
	[evname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefhdr].[evindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [evindex03] ON [dbo].[arg_evdefhdr] (
	[evenable] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefhdr].[evindex04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [evindex04] ON [dbo].[arg_evdefhdr] (
	[evaction] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefhdr].[evindex05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [evindex05] ON [dbo].[arg_evdefhdr] (
	[table_name] ASC,
	[field_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefhdr].[evindex06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [evindex06] ON [dbo].[arg_evdefhdr] (
	[evenable] ASC,
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefny].[enindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [enindex02] ON [dbo].[arg_evdefny] (
	[enevid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefny].[enindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [enindex03] ON [dbo].[arg_evdefny] (
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evnotify].[nyindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [nyindex02] ON [dbo].[arg_evnotify] (
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evnotify].[nyindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [nyindex03] ON [dbo].[arg_evnotify] (
	[nyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evrem].[erindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [erindex02] ON [dbo].[arg_evrem] (
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evrem].[erindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [erindex03] ON [dbo].[arg_evrem] (
	[erstat] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evrem].[erindex04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [erindex04] ON [dbo].[arg_evrem] (
	[erevid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evrem].[erindex05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [erindex05] ON [dbo].[arg_evrem] (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evrem].[erindex06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [erindex06] ON [dbo].[arg_evrem] (
	[object_uuid] ASC,
	[erstat] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_extsys].[esindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [esindex02] ON [dbo].[arg_extsys] (
	[esid] ASC,
	[esobty] ASC,
	[esvalue1] ASC,
	[esvalue2] ASC,
	[esvalue3] ASC,
	[esvalue4] ASC,
	[esvalue5] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtcrit].[fcindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [fcindex02] ON [dbo].[arg_filtcrit] (
	[fcfeid] ASC,
	[fcname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtcrit].[fcindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [fcindex03] ON [dbo].[arg_filtcrit] (
	[fcname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtdef].[feindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [feindex02] ON [dbo].[arg_filtdef] (
	[fename] ASC,
	[feobtype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtdef].[feindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [feindex03] ON [dbo].[arg_filtdef] (
	[feobtype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtind].[fnindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [fnindex02] ON [dbo].[arg_filtind] (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hierarchy_values].[arg_hierarchy_values_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [arg_hierarchy_values_idx_02] ON [dbo].[arg_hierarchy_values] (
	[parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_history].[hsindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [hsindex02] ON [dbo].[arg_history] (
	[table_name] ASC,
	[field_name] ASC,
	[hsinstnc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hsnotify].[hnindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [hnindex02] ON [dbo].[arg_hsnotify] (
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hsrem].[hrindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [hrindex02] ON [dbo].[arg_hsrem] (
	[hrevid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hsrem].[hrindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [hrindex03] ON [dbo].[arg_hsrem] (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hsrem].[hrindex04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [hrindex04] ON [dbo].[arg_hsrem] (
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_index_def].[sysidindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sysidindex02] ON [dbo].[arg_index_def] (
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_index_member].[sysimindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sysimindex02] ON [dbo].[arg_index_member] (
	[table_name] ASC,
	[field_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_intxref].[ixindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ixindex02] ON [dbo].[arg_intxref] (
	[ixdomid] ASC,
	[ixunitid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_itemver].[ivindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ivindex02] ON [dbo].[arg_itemver] (
	[ivid] ASC,
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_itemver].[ivindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ivindex03] ON [dbo].[arg_itemver] (
	[model_uuid] ASC,
	[ivname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_itemver].[ivindex04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ivindex04] ON [dbo].[arg_itemver] (
	[ivmannbr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_job].[arg_job_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [arg_job_idx_01] ON [dbo].[arg_job] (
	[category] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_join_member].[sysjmindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sysjmindex02] ON [dbo].[arg_join_member] (
	[left_side_table] ASC,
	[left_side_field] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_join_member].[sysjmindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sysjmindex03] ON [dbo].[arg_join_member] (
	[right_side_table] ASC,
	[right_side_field] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_keydef].[kdindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [kdindex02] ON [dbo].[arg_keydef] (
	[kdkwtext] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_keyword].[kwindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kwindex02] ON [dbo].[arg_keyword] (
	[kwkdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legaldef].[lgindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [lgindex02] ON [dbo].[arg_legaldef] (
	[lgtype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legaldet].[ltindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ltindex02] ON [dbo].[arg_legaldet] (
	[lttdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legaldoc].[leindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [leindex03] ON [dbo].[arg_legaldoc] (
	[external_company_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legaldoc].[leindex04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [leindex04] ON [dbo].[arg_legaldoc] (
	[ledocidn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legaldoc].[leindex05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [leindex05] ON [dbo].[arg_legaldoc] (
	[requestor_contact_uuid] ASC,
	[vendor_contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legalpar].[lpindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lpindex02] ON [dbo].[arg_legalpar] (
	[company_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legasset].[laindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [laindex02] ON [dbo].[arg_legasset] (
	[own_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legasstc].[lcindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcindex02] ON [dbo].[arg_legasstc] (
	[own_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legasstc].[lcindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lcindex03] ON [dbo].[arg_legasstc] (
	[lctdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_linkdef].[ndindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ndindex02] ON [dbo].[arg_linkdef] (
	[ndadid] ASC,
	[ndtext] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_listdef].[ldindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ldindex02] ON [dbo].[arg_listdef] (
	[ldlist] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_ltcdef].[tdindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tdindex02] ON [dbo].[arg_ltcdef] (
	[tdtext] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_notes].[noindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [noindex02] ON [dbo].[arg_notes] (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_notes].[noindex03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [noindex03] ON [dbo].[arg_notes] (
	[notype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_paydet].[pdindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pdindex02] ON [dbo].[arg_paydet] (
	[pdduedt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_data].[arg_reconcile_data_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [arg_reconcile_data_idx_01] ON [dbo].[arg_reconcile_data] (
	[task_uuid] ASC,
	[reconcile_data_type] ASC,
	[own_resource_uuid] ASC,
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_modification].[arg_reconcile_mod_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [arg_reconcile_mod_idx_01] ON [dbo].[arg_reconcile_modification] (
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_modification].[arg_reconcile_mod_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [arg_reconcile_mod_idx_02] ON [dbo].[arg_reconcile_modification] (
	[own_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_msg_queue].[arg_reconcile_msg_queue_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [arg_reconcile_msg_queue_idx_01] ON [dbo].[arg_reconcile_msg_queue] (
	[task_uuid] ASC,
	[reconcile_msg_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_task].[arg_reconcile_task_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [arg_reconcile_task_idx_01] ON [dbo].[arg_reconcile_task] (
	[task_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_roledef].[rdindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [rdindex02] ON [dbo].[arg_roledef] (
	[rdname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_script].[scindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [scindex02] ON [dbo].[arg_script] (
	[scenable] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_tclgdef].[tlindex02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [tlindex02] ON [dbo].[arg_tclgdef] (
	[tltdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_roles].[$asmo__u00000f6200000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$asmo__u00000f6200000000] ON [dbo].[asmo_roles] (
	[role_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_group].[xif1asset_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1asset_group] ON [dbo].[asset_group] (
	[protection_level_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_group].[xif2asset_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2asset_group] ON [dbo].[asset_group] (
	[config_standard_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_group_software_product].[xif1asset_group_software_product].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1asset_group_software_product] ON [dbo].[asset_group_software_product] (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_group_software_product].[xif2asset_group_software_product].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2asset_group_software_product] ON [dbo].[asset_group_software_product] (
	[asset_group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_software_delivery_job].[xif0asset_software_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xif0asset_software_delivery_job] ON [dbo].[asset_software_delivery_job] (
	[software_delivery_server_id] ASC,
	[software_delivery_job_id] ASC,
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_software_delivery_job].[xif1asset_software_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1asset_software_delivery_job] ON [dbo].[asset_software_delivery_job] (
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_software_delivery_job].[xif3asset_software_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3asset_software_delivery_job] ON [dbo].[asset_software_delivery_job] (
	[software_delivery_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_vulnerability].[xif1asset_vulnerability].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1asset_vulnerability] ON [dbo].[asset_vulnerability] (
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_vulnerability].[xif2asset_vulnerability].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2asset_vulnerability] ON [dbo].[asset_vulnerability] (
	[vuln_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[assettyp_profile].[baseidx_assettyp_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_assettyp_profile] ON [dbo].[assettyp_profile] (
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[assignments].[assignments_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [assignments_ind1] ON [dbo].[assignments] (
	[productid] ASC,
	[usertype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[assignments].[assignments_ind2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [assignments_ind2] ON [dbo].[assignments] (
	[productid] ASC,
	[workitemid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[atn].[atn_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [atn_x0] ON [dbo].[atn] (
	[at_obj] ASC,
	[at_sys] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[atomic_cond].[atomic_cond_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [atomic_cond_x0] ON [dbo].[atomic_cond] (
	[owning_macro] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[att_evt].[att_evt_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [att_evt_x0] ON [dbo].[att_evt] (
	[event_tmpl] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[att_evt].[att_evt_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [att_evt_x1] ON [dbo].[att_evt] (
	[obj_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[att_evt].[att_evt_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [att_evt_x2] ON [dbo].[att_evt] (
	[fire_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[att_evt].[att_evt_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [att_evt_x3] ON [dbo].[att_evt] (
	[owning_ast] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attached_sla].[attached_sla_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attached_sla_x0] ON [dbo].[attached_sla] (
	[ticket_id] ASC,
	[ticket_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attached_sla].[attached_sla_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attached_sla_x1] ON [dbo].[attached_sla] (
	[time_to_violation] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attached_sla].[attached_sla_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attached_sla_x2] ON [dbo].[attached_sla] (
	[mapped_cr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attached_sla].[attached_sla_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attached_sla_x3] ON [dbo].[attached_sla] (
	[mapped_chg] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attached_sla].[attached_sla_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attached_sla_x4] ON [dbo].[attached_sla] (
	[mapped_iss] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attached_sla].[attached_sla_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attached_sla_x5] ON [dbo].[attached_sla] (
	[mapped_wf] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attached_sla].[attached_sla_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attached_sla_x6] ON [dbo].[attached_sla] (
	[mapped_iss_wf] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_x0] ON [dbo].[attmnt] (
	[created_dt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [attmnt_x1] ON [dbo].[attmnt] (
	[persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_x2] ON [dbo].[attmnt] (
	[folder_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_x3] ON [dbo].[attmnt] (
	[folder_path_ids] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_x4] ON [dbo].[attmnt] (
	[inherit_permission_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_x5] ON [dbo].[attmnt] (
	[read_pgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_x6] ON [dbo].[attmnt] (
	[write_pgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_x7] ON [dbo].[attmnt] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[attmnt_x8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_x8] ON [dbo].[attmnt] (
	[del] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[attmnt_folder_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_folder_x0] ON [dbo].[attmnt_folder] (
	[folder_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[attmnt_folder_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_folder_x1] ON [dbo].[attmnt_folder] (
	[folder_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[attmnt_folder_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_folder_x2] ON [dbo].[attmnt_folder] (
	[parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[attmnt_folder_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_folder_x3] ON [dbo].[attmnt_folder] (
	[folder_path_ids] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[attmnt_folder_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_folder_x4] ON [dbo].[attmnt_folder] (
	[inherit_permission_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[attmnt_folder_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_folder_x5] ON [dbo].[attmnt_folder] (
	[read_pgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[attmnt_folder_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_folder_x6] ON [dbo].[attmnt_folder] (
	[write_pgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[attmnt_folder_x7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_folder_x7] ON [dbo].[attmnt_folder] (
	[repository] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_lrel].[attmnt_lrel_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_lrel_x0] ON [dbo].[attmnt_lrel] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_lrel].[attmnt_lrel_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [attmnt_lrel_x1] ON [dbo].[attmnt_lrel] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attr].[baseidx_attr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_attr] ON [dbo].[attr] (
	[aid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[atyp_asc].[atyp_asc_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [atyp_asc_x0] ON [dbo].[atyp_asc] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[atyp_asc].[atyp_asc_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [atyp_asc_x1] ON [dbo].[atyp_asc] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[audit_log].[audit_log_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [audit_log_x0] ON [dbo].[audit_log] (
	[change_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[audithis].[audithis_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [audithis_sk1] ON [dbo].[audithis] (
	[acid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[audithis].[audithis_sk2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [audithis_sk2] ON [dbo].[audithis] (
	[object_uuid] ASC,
	[object_domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_active_user_policy].[xif2backup_active_user_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_active_user_policy] ON [dbo].[backup_active_user_policy] (
	[schedule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_active_user_policy].[xif3backup_active_user_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_active_user_policy] ON [dbo].[backup_active_user_policy] (
	[network_throttle_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_active_user_policy].[xif4backup_active_user_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4backup_active_user_policy] ON [dbo].[backup_active_user_policy] (
	[alert_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_agent_config].[xif2backup_agent_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_agent_config] ON [dbo].[backup_agent_config] (
	[msg_log_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_archive].[xif1backup_archive].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_archive] ON [dbo].[backup_archive] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_backed_up_file].[xif1backup_backed_up_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_backed_up_file] ON [dbo].[backup_backed_up_file] (
	[backed_up_folder_id] ASC,
	[backed_up_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_backed_up_file_revision].[xif1backup_backed_up_file_revisi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_backed_up_file_revisi] ON [dbo].[backup_backed_up_file_revision] (
	[user_id] ASC,
	[backup_run_date] ASC,
	[backed_up_file_id] ASC,
	[backed_up_folder_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_backed_up_file_revision].[xif2backup_backed_up_file_revisi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_backed_up_file_revisi] ON [dbo].[backup_backed_up_file_revision] (
	[backup_run_date] ASC,
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_backed_up_folder].[xif1backup_backed_up_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_backed_up_folder] ON [dbo].[backup_backed_up_folder] (
	[name] ASC,
	[backed_up_folder_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_job].[xif1backup_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_job] ON [dbo].[backup_job] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_job].[xif2backup_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_job] ON [dbo].[backup_job] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_job].[xif3backup_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_job] ON [dbo].[backup_job] (
	[schedule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_job_member].[xif1backup_job_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_job_member] ON [dbo].[backup_job_member] (
	[job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_job_member].[xif2backup_job_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_job_member] ON [dbo].[backup_job_member] (
	[member_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_policy_server].[xif1backup_link_backup_policy_se].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_link_backup_policy_se] ON [dbo].[backup_link_backup_policy_server] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_policy_server].[xif2backup_link_backup_policy_se].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_link_backup_policy_se] ON [dbo].[backup_link_backup_policy_server] (
	[backup_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_set_policy].[xif2backup_link_backup_set_polic].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_link_backup_set_polic] ON [dbo].[backup_link_backup_set_policy] (
	[backup_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_set_policy].[xif3backup_link_backup_set_polic].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_link_backup_set_polic] ON [dbo].[backup_link_backup_set_policy] (
	[backup_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_set_user].[xif1backup_link_backup_set_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_link_backup_set_user] ON [dbo].[backup_link_backup_set_user] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_set_user].[xif4backup_link_backup_set_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4backup_link_backup_set_user] ON [dbo].[backup_link_backup_set_user] (
	[backup_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_job_file_object].[xif1backup_link_job_file_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_link_job_file_object] ON [dbo].[backup_link_job_file_object] (
	[job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_job_file_object].[xif2backup_link_job_file_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_link_job_file_object] ON [dbo].[backup_link_job_file_object] (
	[file_object_id] ASC,
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_login_history].[xif1backup_login_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_login_history] ON [dbo].[backup_login_history] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_manager].[xif1backup_manager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_manager] ON [dbo].[backup_manager] (
	[msg_log_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_msg_log].[xie1backup_msg_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1backup_msg_log] ON [dbo].[backup_msg_log] (
	[server_id] ASC,
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_msg_log].[xif1backup_msg_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_msg_log] ON [dbo].[backup_msg_log] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_msg_log].[xif2backup_msg_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_msg_log] ON [dbo].[backup_msg_log] (
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_msg_log].[xif3backup_msg_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_msg_log] ON [dbo].[backup_msg_log] (
	[manager_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_msg_log_config].[XIF1backup_msg_log_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XIF1backup_msg_log_config] ON [dbo].[backup_msg_log_config] (
	[email_def_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_performed_restore].[xif1backup_performed_restore].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_performed_restore] ON [dbo].[backup_performed_restore] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_performed_restore].[xif2backup_performed_restore].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_performed_restore] ON [dbo].[backup_performed_restore] (
	[job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_policy].[xif2backup_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_policy] ON [dbo].[backup_policy] (
	[schedule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_policy].[xif3backup_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_policy] ON [dbo].[backup_policy] (
	[network_throttle_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_policy].[xif4backup_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4backup_policy] ON [dbo].[backup_policy] (
	[alert_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_query_based_policy].[xif1backup_query_based_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_query_based_policy] ON [dbo].[backup_query_based_policy] (
	[query_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_query_based_policy].[xif2backup_query_based_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_query_based_policy] ON [dbo].[backup_query_based_policy] (
	[email_def_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_query_based_policy].[xif3backup_query_based_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_query_based_policy] ON [dbo].[backup_query_based_policy] (
	[schedule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_restored_file].[xif1backup_restored_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_restored_file] ON [dbo].[backup_restored_file] (
	[user_id] ASC,
	[restore_run_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_restored_file].[xif2backup_restored_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_restored_file] ON [dbo].[backup_restored_file] (
	[backed_up_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_restored_file].[xif3backup_restored_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_restored_file] ON [dbo].[backup_restored_file] (
	[user_id] ASC,
	[backup_run_date] ASC,
	[backed_up_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server].[xif1backup_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_server] ON [dbo].[backup_server] (
	[manager_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server].[xif2backup_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_server] ON [dbo].[backup_server] (
	[data_growth_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server].[xif3backup_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_server] ON [dbo].[backup_server] (
	[parent_server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server].[xif4backup_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4backup_server] ON [dbo].[backup_server] (
	[server_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server].[xif5backup_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif5backup_server] ON [dbo].[backup_server] (
	[server_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server_config].[xif1backup_server_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_server_config] ON [dbo].[backup_server_config] (
	[server_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server_config].[xif2backup_server_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2backup_server_config] ON [dbo].[backup_server_config] (
	[data_growth_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server_config].[xif3backup_server_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3backup_server_config] ON [dbo].[backup_server_config] (
	[msg_log_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_set_include_exclude].[xif1backup_set_include_exclude].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_set_include_exclude] ON [dbo].[backup_set_include_exclude] (
	[backup_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_set_inventory_selection_p].[xif1backup_set_inventory_selecti].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_set_inventory_selecti] ON [dbo].[backup_set_inventory_selection_p] (
	[backup_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_statistic].[xif1backup_statistic].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_statistic] ON [dbo].[backup_statistic] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user].[xif10backup_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif10backup_user] ON [dbo].[backup_user] (
	[agent_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user].[xif11backup_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif11backup_user] ON [dbo].[backup_user] (
	[user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user].[xif13backup_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif13backup_user] ON [dbo].[backup_user] (
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user].[xif5backup_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif5backup_user] ON [dbo].[backup_user] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user].[xif6backup_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif6backup_user] ON [dbo].[backup_user] (
	[link_dis_hw_user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user].[xif8backup_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif8backup_user] ON [dbo].[backup_user] (
	[archive_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user].[xif9backup_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif9backup_user] ON [dbo].[backup_user] (
	[backup_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user_drive].[xif1backup_user_drive].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_user_drive] ON [dbo].[backup_user_drive] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user_shell_folder].[xif1backup_user_shell_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1backup_user_shell_folder] ON [dbo].[backup_user_shell_folder] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinebgp4].[baseidx_baselinebgp4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinebgp4] ON [dbo].[baselinebgp4] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[bgpidentifier] ASC,
	[bgppeeridentifier] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinecisco].[baseidx_baselinecisco].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinecisco] ON [dbo].[baselinecisco] (
	[probe_addr] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselineciscotemp].[baseidx_baselineciscotemp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselineciscotemp] ON [dbo].[baselineciscotemp] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselineciscovolt].[baseidx_baselineciscovolt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselineciscovolt] ON [dbo].[baselineciscovolt] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselineetherstats].[baseidx_baselineetherstats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselineetherstats] ON [dbo].[baselineetherstats] (
	[probe_addr] ASC,
	[etherstatsindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinefr].[baseidx_baselinefr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinefr] ON [dbo].[baselinefr] (
	[probe_addr] ASC,
	[frcircuitifindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinefs].[baseidx_baselinefs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinefs] ON [dbo].[baselinefs] (
	[probe_addr] ASC,
	[probeindex] ASC,
	[fileserverkeyid] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinehopdelay].[baseidx_baselinehopdelay].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinehopdelay] ON [dbo].[baselinehopdelay] (
	[probe_addr] ASC,
	[intervaldate] ASC,
	[probeindex] ASC,
	[hopdelayindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselineif].[baseidx_baselineif].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselineif] ON [dbo].[baselineif] (
	[probe_addr] ASC,
	[ifindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselineip].[baseidx_baselineip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselineip] ON [dbo].[baselineip] (
	[probe_addr] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinelp].[baseidx_baselinelp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinelp] ON [dbo].[baselinelp] (
	[probe_addr] ASC,
	[probeindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinelu].[baseidx_baselinelu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinelu] ON [dbo].[baselinelu] (
	[probe_addr] ASC,
	[probeindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinenbar].[baseidx_baselinenbar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinenbar] ON [dbo].[baselinenbar] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[ifindex] ASC,
	[allstatsprotocolsindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinermon2proto].[baseidx_baselinermon2proto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinermon2proto] ON [dbo].[baselinermon2proto] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[protocoldirrmindex] ASC,
	[protocoldistdatasource] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinerttcapture].[baseidx_baselinerttcapture].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinerttcapture] ON [dbo].[baselinerttcapture] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[ctrladminindex] ASC,
	[statscapturepathindex] ASC,
	[statscapturehopindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinerttcoll].[baseidx_baselinerttcoll].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinerttcoll] ON [dbo].[baselinerttcoll] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[ctrladminindex] ASC,
	[statscapturepathindex] ASC,
	[statscapturehopindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinerttjitter].[baseidx_baselinerttjitter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinerttjitter] ON [dbo].[baselinerttjitter] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[ctrladminindex] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[baselinets].[baseidx_baselinets].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_baselinets] ON [dbo].[baselinets] (
	[probe_addr] ASC,
	[probeindex] ASC,
	[termserverkeyid] ASC,
	[intervaldate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bckdef].[bckdef_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bckdef_sk1] ON [dbo].[bckdef] (
	[dbname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bgp4peerentry].[baseidx_bgp4peerentry].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_bgp4peerentry] ON [dbo].[bgp4peerentry] (
	[bgpidentifier] ASC,
	[bgppeeridentifier] ASC,
	[bgplocalas] ASC,
	[bgppeerremoteas] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bgp4peerentrymessage].[baseidx_bgp4peerentrymessage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_bgp4peerentrymessage] ON [dbo].[bgp4peerentrymessage] (
	[bgpidentifier] ASC,
	[bgppeeridentifier] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bhvtpl].[bhvtpl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [bhvtpl_x0] ON [dbo].[bhvtpl] (
	[object_id] ASC,
	[context_type] ASC,
	[context_attrname] ASC,
	[context_attrval] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[blob].[baseidx_blob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_blob] ON [dbo].[blob] (
	[eid] ASC,
	[aid] ASC,
	[vid] ASC,
	[vfrag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bool_tab].[bool_tab_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [bool_tab_x0] ON [dbo].[bool_tab] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bpwshft].[bpwshft_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bpwshft_x0] ON [dbo].[bpwshft] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bpwshft].[bpwshft_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bpwshft_x1] ON [dbo].[bpwshft] (
	[persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[bu_trans_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bu_trans_x0] ON [dbo].[bu_trans] (
	[bu_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[bu_trans_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bu_trans_x1] ON [dbo].[bu_trans] (
	[doc_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[bu_trans_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bu_trans_x2] ON [dbo].[bu_trans] (
	[hit_no_vote] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[bu_trans_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bu_trans_x3] ON [dbo].[bu_trans] (
	[hit_origin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[bu_trans_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bu_trans_x4] ON [dbo].[bu_trans] (
	[index_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[bu_trans_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bu_trans_x5] ON [dbo].[bu_trans] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[bu_trans_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bu_trans_x6] ON [dbo].[bu_trans] (
	[user_slv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[bu_trans_x7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [bu_trans_x7] ON [dbo].[bu_trans] (
	[ticket_slv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[building].[$build_u0000354000000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$build_u0000354000000000] ON [dbo].[building] (
	[screenname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[buscls].[buscls_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [buscls_x0] ON [dbo].[buscls] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[buslrel].[buslrel_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [buslrel_x0] ON [dbo].[buslrel] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[buslrel].[buslrel_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [buslrel_x1] ON [dbo].[buslrel] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busmgt].[busmgt_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [busmgt_X0] ON [dbo].[busmgt] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busmgt].[busmgt_X1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [busmgt_X1] ON [dbo].[busmgt] (
	[hier_parent] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busmgt].[busmgt_X2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [busmgt_X2] ON [dbo].[busmgt] (
	[hier_child] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busmgt].[busmgt_X3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [busmgt_X3] ON [dbo].[busmgt] (
	[ci_rel_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busmgt].[PK__busmgt__7E8439BE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[busmgt] ADD CONSTRAINT [PK__busmgt__7E8439BE] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busrep].[busrep_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [busrep_x0] ON [dbo].[busrep] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busrep].[busrep_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [busrep_x1] ON [dbo].[busrep] (
	[hostname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busstat].[busstat_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [busstat_x0] ON [dbo].[busstat] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busstat].[busstat_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [busstat_x1] ON [dbo].[busstat] (
	[status_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_agent].[ca_agent_idx0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_agent_idx0] ON [dbo].[ca_agent] (
	[agent_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_agent].[ca_agent_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_agent_idx1] ON [dbo].[ca_agent] (
	[unit_id] ASC,
	[domain_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset].[ca_asset_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_asset_idx_01] ON [dbo].[ca_asset] (
	[label] ASC,
	[asset_type_id] ASC,
	[asset_uuid] ASC,
	[delete_time] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset].[ca_asset_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_asset_idx_02] ON [dbo].[ca_asset] (
	[serial_number] ASC,
	[asset_type_id] ASC,
	[asset_uuid] ASC,
	[delete_time] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset].[ca_asset_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_asset_idx_03] ON [dbo].[ca_asset] (
	[asset_tag] ASC,
	[asset_type_id] ASC,
	[asset_uuid] ASC,
	[delete_time] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset_source].[ca_asset_source_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_asset_source_idx_01] ON [dbo].[ca_asset_source] (
	[logical_asset_uuid] ASC,
	[subschema_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset_source].[ca_asset_source_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_asset_source] ADD CONSTRAINT [ca_asset_source_idx_02] PRIMARY KEY NONCLUSTERED (
	[asset_source_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset_source].[ca_asset_source_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_asset_source_idx_03] ON [dbo].[ca_asset_source] (
	[source_location_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset_source].[ca_asset_source_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_asset_source_idx_04] ON [dbo].[ca_asset_source] (
	[logical_asset_uuid] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_capacity_unit].[ca_capacity_unit_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_capacity_unit_idx_01] ON [dbo].[ca_capacity_unit] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_company].[ca_company_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_company_idx_01] ON [dbo].[ca_company] (
	[company_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_company_type].[ca_company_type_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_company_type_idx_01] ON [dbo].[ca_company_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_01] ON [dbo].[ca_contact] (
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_02] ON [dbo].[ca_contact] (
	[last_name] ASC,
	[first_name] ASC,
	[middle_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_03] ON [dbo].[ca_contact] (
	[userid] ASC,
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_04] ON [dbo].[ca_contact] (
	[alternate_identifier] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_05] ON [dbo].[ca_contact] (
	[email_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_06] ON [dbo].[ca_contact] (
	[contact_type] ASC,
	[last_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_07].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_07] ON [dbo].[ca_contact] (
	[pri_phone_number] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_08].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_08] ON [dbo].[ca_contact] (
	[first_name] ASC,
	[middle_name] ASC,
	[last_name] ASC,
	[company_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_09].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_09] ON [dbo].[ca_contact] (
	[company_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_10].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_10] ON [dbo].[ca_contact] (
	[cost_center] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_11] ON [dbo].[ca_contact] (
	[job_function] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_12].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_12] ON [dbo].[ca_contact] (
	[department] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_idx_13].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_contact_idx_13] ON [dbo].[ca_contact] (
	[inrdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact_type].[ca_contact_type_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_contact_type_idx_01] ON [dbo].[ca_contact_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_country].[ca_country_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_country_idx_01] ON [dbo].[ca_country] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware].[ca_disc_hardware_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_hardware_idx_01] ON [dbo].[ca_discovered_hardware] (
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware].[ca_disc_hardware_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_hardware_idx_02] ON [dbo].[ca_discovered_hardware] (
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware].[ca_disc_hardware_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_hardware_idx_03] ON [dbo].[ca_discovered_hardware] (
	[label] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware].[ca_disc_hardware_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_hardware_idx_04] ON [dbo].[ca_discovered_hardware] (
	[host_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware].[ca_disc_hardware_idx_05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_hardware_idx_05] ON [dbo].[ca_discovered_hardware] (
	[asset_source_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware].[ca_disc_hardware_idx_06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_hardware_idx_06] ON [dbo].[ca_discovered_hardware] (
	[host_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware_ext_sys].[ca_disc_hard_ext_sys_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_disc_hard_ext_sys_idx_01] ON [dbo].[ca_discovered_hardware_ext_sys] (
	[external_sys_name] ASC,
	[discovery_id_1] ASC,
	[discovery_id_2] ASC,
	[discovery_id_3] ASC,
	[discovery_id_4] ASC,
	[discovery_id_5] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_software].[ca_disc_software_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_software_idx_01] ON [dbo].[ca_discovered_software] (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_software].[ca_disc_software_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_software_idx_02] ON [dbo].[ca_discovered_software] (
	[asset_source_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_software].[ca_disc_software_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_software_idx_03] ON [dbo].[ca_discovered_software] (
	[license_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_software].[ca_disc_software_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_software_idx_04] ON [dbo].[ca_discovered_software] (
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_software].[ca_disc_software_idx_05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_software_idx_05] ON [dbo].[ca_discovered_software] (
	[auto_rep_version] ASC,
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_software_prop].[ca_disc_software_prop_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_software_prop_idx_01] ON [dbo].[ca_discovered_software_prop] (
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_user].[ca_disc_user_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_disc_user_idx_02] ON [dbo].[ca_discovered_user] (
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_user].[ca_discovered_user_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_discovered_user_idx_03] ON [dbo].[ca_discovered_user] (
	[uri] ASC,
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_download_file].[xif1ca_download_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1ca_download_file] ON [dbo].[ca_download_file] (
	[install_pkg_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_download_file].[xif2ca_download_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2ca_download_file] ON [dbo].[ca_download_file] (
	[package_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_download_file].[xif3ca_download_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3ca_download_file] ON [dbo].[ca_download_file] (
	[compression_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_geo_coord_type].[ca_geo_coord_type_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_geo_coord_type_idx_01] ON [dbo].[ca_geo_coord_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_group_ace].[x1ca_group_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x1ca_group_ace] ON [dbo].[ca_group_ace] (
	[security_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_group_def].[ca_group_def_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_group_def_idx_01] ON [dbo].[ca_group_def] (
	[label] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_group_member].[ca_group_member_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_group_member_x1] ON [dbo].[ca_group_member] (
	[group_uuid] ASC,
	[member_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_image_type].[ca_image_type_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_image_type_name] ON [dbo].[ca_image_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_image_type].[xca_image_type_extension].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xca_image_type_extension] ON [dbo].[ca_image_type] (
	[extension] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_install_package].[xak9ca_install_package].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xak9ca_install_package] ON [dbo].[ca_install_package] (
	[ipkg_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_install_package].[xie3ca_install_package].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie3ca_install_package] ON [dbo].[ca_install_package] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_install_package].[xie5ca_install_package].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie5ca_install_package] ON [dbo].[ca_install_package] (
	[pmode] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_install_package].[xif1ca_install_package].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1ca_install_package] ON [dbo].[ca_install_package] (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_install_step].[xif1ca_install_step].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1ca_install_step] ON [dbo].[ca_install_step] (
	[install_pkg_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_job_function].[ca_job_function_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_job_function_idx_01] ON [dbo].[ca_job_function] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_job_function].[ca_job_function_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_job_function_idx_02] ON [dbo].[ca_job_function] (
	[organization_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_job_title].[ca_job_title_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_job_title_idx_01] ON [dbo].[ca_job_title] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_job_title].[ca_job_title_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_job_title_idx_02] ON [dbo].[ca_job_title] (
	[organization_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_language].[xak1ca_language].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1ca_language] ON [dbo].[ca_language] (
	[lang_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_license_type].[ca_license_type_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_license_type_idx_01] ON [dbo].[ca_license_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_object_owner].[ca_link_object_owner_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_link_object_owner_idx1] ON [dbo].[ca_link_object_owner] (
	[security_profile_uuid] ASC,
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_sw_def].[ca_link_sw_def_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_link_sw_def_idx1] ON [dbo].[ca_link_sw_def] (
	[secondary_sw_def_uuid] ASC,
	[primary_sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_location].[ca_location_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_location_idx_01] ON [dbo].[ca_location] (
	[location_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_location].[ca_location_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_location_idx_02] ON [dbo].[ca_location] (
	[parent_location_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_location].[ca_location_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_location_idx_03] ON [dbo].[ca_location] (
	[location_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_location_type].[ca_location_type_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_location_type_idx_01] ON [dbo].[ca_location_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_logical_asset].[ca_logical_asset_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_logical_asset_idx_02] ON [dbo].[ca_logical_asset] (
	[host_name] ASC,
	[asset_uuid] ASC,
	[logical_asset_uuid] ASC,
	[delete_time] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_logical_asset].[ca_logical_asset_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_logical_asset_idx_03] ON [dbo].[ca_logical_asset] (
	[asset_uuid] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_logical_asset_property].[ca_logical_asset_property_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_logical_asset_property_idx_01] ON [dbo].[ca_logical_asset_property] (
	[mac_address] ASC,
	[delete_time] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_logical_asset_property].[ca_logical_asset_property_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_logical_asset_property_idx_02] ON [dbo].[ca_logical_asset_property] (
	[dns_name] ASC,
	[delete_time] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_logical_asset_property].[ca_logical_asset_property_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_logical_asset_property_idx_03] ON [dbo].[ca_logical_asset_property] (
	[logical_asset_uuid] ASC,
	[exclude_registration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_model_def].[ca_model_def_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_model_def_idx_01] ON [dbo].[ca_model_def] (
	[name] ASC,
	[manufacturer_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_model_def].[ca_model_def_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_model_def_idx_02] ON [dbo].[ca_model_def] (
	[manufacturer_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_model_def].[ca_model_def_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_model_def_idx_03] ON [dbo].[ca_model_def] (
	[family_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_model_def].[ca_model_def_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_model_def_idx_04] ON [dbo].[ca_model_def] (
	[abbreviation] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_model_def].[ca_model_def_idx_05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_model_def_idx_05] ON [dbo].[ca_model_def] (
	[class_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_model_def].[ca_model_def_idx_06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_model_def_idx_06] ON [dbo].[ca_model_def] (
	[subclass_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_object_ace].[ca_object_ace_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_object_ace_x0] ON [dbo].[ca_object_ace] (
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_object_ace].[ca_object_ace_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_object_ace_x1] ON [dbo].[ca_object_ace] (
	[object_def_uuid] ASC,
	[security_profile_uuid] ASC,
	[ace] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_organization].[ca_organization_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_organization_idx_01] ON [dbo].[ca_organization] (
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_organization].[ca_organization_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_organization_idx_02] ON [dbo].[ca_organization] (
	[org_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_01] ON [dbo].[ca_owned_resource] (
	[resource_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_02] ON [dbo].[ca_owned_resource] (
	[host_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_03] ON [dbo].[ca_owned_resource] (
	[mac_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_04] ON [dbo].[ca_owned_resource] (
	[ip_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_05] ON [dbo].[ca_owned_resource] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_06] ON [dbo].[ca_owned_resource] (
	[supply_vendor_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_07].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_07] ON [dbo].[ca_owned_resource] (
	[company_bought_for_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_08].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_08] ON [dbo].[ca_owned_resource] (
	[resource_contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_09].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_09] ON [dbo].[ca_owned_resource] (
	[location_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_10].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_10] ON [dbo].[ca_owned_resource] (
	[resource_alias] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_11] ON [dbo].[ca_owned_resource] (
	[resource_tag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_12].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_12] ON [dbo].[ca_owned_resource] (
	[serial_number] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_13].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_13] ON [dbo].[ca_owned_resource] (
	[purchase_order_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_14].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_14] ON [dbo].[ca_owned_resource] (
	[requisition_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_15].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_15] ON [dbo].[ca_owned_resource] (
	[resource_capacity_unit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_16].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_16] ON [dbo].[ca_owned_resource] (
	[resource_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_17].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_17] ON [dbo].[ca_owned_resource] (
	[asset_source_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_18].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_18] ON [dbo].[ca_owned_resource] (
	[resource_subclass] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_19].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_19] ON [dbo].[ca_owned_resource] (
	[license_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_20].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_20] ON [dbo].[ca_owned_resource] (
	[dns_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_idx_21].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_owned_resource_idx_21] ON [dbo].[ca_owned_resource] (
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_pool_resource].[baseidx_ca_pool_resource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ca_pool_resource] ON [dbo].[ca_pool_resource] (
	[pool_name] ASC,
	[instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_pool_resource].[poolresidx01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [poolresidx01] ON [dbo].[ca_pool_resource] (
	[pool_name] ASC,
	[instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_query_def_contents].[ca_query_def_contents_id1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_query_def_contents_id1] ON [dbo].[ca_query_def_contents] (
	[domain_uuid] ASC,
	[query_uuid] ASC,
	[sequence_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_replication_history].[baseidx_ca_replication_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_ca_replication_history] ON [dbo].[ca_replication_history] (
	[primary_uuid] ASC,
	[secondary_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_replication_history].[ca_replication_history_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_replication_history_idx1] ON [dbo].[ca_replication_history] (
	[table_name] ASC,
	[primary_uuid] ASC,
	[lng1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_requirement_spec].[xif1ca_requirement_spec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1ca_requirement_spec] ON [dbo].[ca_requirement_spec] (
	[source_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_requirement_spec_group].[xif1ca_requirement_spec_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1ca_requirement_spec_group] ON [dbo].[ca_requirement_spec_group] (
	[owner_object_uuid] ASC,
	[requirement_spec_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_requirement_spec_item].[ix_req_spec_item_class_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_req_spec_item_class_id] ON [dbo].[ca_requirement_spec_item] (
	[class_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_requirement_spec_item].[xif1ca_requirement_spec_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1ca_requirement_spec_item] ON [dbo].[ca_requirement_spec_item] (
	[owner_object_uuid] ASC,
	[group_sequence] ASC,
	[requirement_spec_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_class].[ca_resource_class_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_resource_class_idx_01] ON [dbo].[ca_resource_class] (
	[name] ASC,
	[parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_cost_center].[ca_resource_cost_center_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_resource_cost_center_idx_01] ON [dbo].[ca_resource_cost_center] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_cost_center].[ca_resource_cost_center_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_resource_cost_center_idx_02] ON [dbo].[ca_resource_cost_center] (
	[organization_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_department].[ca_resource_department_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_resource_department_idx_01] ON [dbo].[ca_resource_department] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_department].[ca_resource_department_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_resource_department_idx_02] ON [dbo].[ca_resource_department] (
	[organization_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_family].[ca_resource_family_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_resource_family_idx_01] ON [dbo].[ca_resource_family] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_gl_code].[ca_resource_gl_code_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_resource_gl_code_idx_01] ON [dbo].[ca_resource_gl_code] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_operating_system].[ca_resource_os_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_resource_os_idx_01] ON [dbo].[ca_resource_operating_system] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_pool].[baseidx_ca_resource_pool].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ca_resource_pool] ON [dbo].[ca_resource_pool] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_pool].[respoolidx01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [respoolidx01] ON [dbo].[ca_resource_pool] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_status].[ca_resource_status_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_resource_status_idx_01] ON [dbo].[ca_resource_status] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_sdi_ticket].[ca_sdi_ticket_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_sdi_ticket_idx1] ON [dbo].[ca_sdi_ticket] (
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_security_class_def].[IDX_sec_class_def_clsId].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_sec_class_def_clsId] ON [dbo].[ca_security_class_def] (
	[class_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_security_profile].[x1ca_security_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x1ca_security_profile] ON [dbo].[ca_security_profile] (
	[name] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_site].[ca_site_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_site_idx_01] ON [dbo].[ca_site] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def].[ca_software_def_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_software_def_idx_01] ON [dbo].[ca_software_def] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def].[ca_software_def_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_software_def_idx_02] ON [dbo].[ca_software_def] (
	[software_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def].[ca_software_def_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_software_def_idx_03] ON [dbo].[ca_software_def] (
	[manufacturer_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def].[ca_software_def_ix04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_software_def_ix04] ON [dbo].[ca_software_def] (
	[impact] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def].[ca_software_def_ix05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_software_def_ix05] ON [dbo].[ca_software_def] (
	[severity] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def].[ca_software_def_ix06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_software_def_ix06] ON [dbo].[ca_software_def] (
	[linear_sequence_number] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def_class_def_matrix].[xif1ca_software_def_class_def_ma].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1ca_software_def_class_def_ma] ON [dbo].[ca_software_def_class_def_matrix] (
	[class_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def_class_def_matrix].[xif2ca_software_def_class_def_ma].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2ca_software_def_class_def_ma] ON [dbo].[ca_software_def_class_def_matrix] (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def_class_def_matrix].[xif3ca_software_def_class_def_ma].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3ca_software_def_class_def_ma] ON [dbo].[ca_software_def_class_def_matrix] (
	[sw_def_class_def_matrix_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def_types].[xif2ca_software_def_types].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2ca_software_def_types] ON [dbo].[ca_software_def_types] (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_license].[ca_software_license_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_software_license_idx_01] ON [dbo].[ca_software_license] (
	[license_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_license].[ca_software_license_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ca_software_license_idx_02] ON [dbo].[ca_software_license] (
	[asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_state_province].[ca_state_province_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_state_province_idx_01] ON [dbo].[ca_state_province] (
	[symbol] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_taskwiz_def].[ca_taskwiz_def_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ca_taskwiz_def_x0] ON [dbo].[ca_taskwiz_def] (
	[task_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cal].[baseidx_cal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_cal] ON [dbo].[cal] (
	[id] ASC,
	[fixed_year] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [call_req_x0] ON [dbo].[call_req] (
	[open_date] ASC,
	[ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x1] ON [dbo].[call_req] (
	[customer] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x10].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x10] ON [dbo].[call_req] (
	[status] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x11] ON [dbo].[call_req] (
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x12].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x12] ON [dbo].[call_req] (
	[persid] ASC,
	[ref_num] ASC,
	[open_date] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x13].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x13] ON [dbo].[call_req] (
	[parent] ASC,
	[ref_num] ASC,
	[open_date] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x14].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x14] ON [dbo].[call_req] (
	[template_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x15].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x15] ON [dbo].[call_req] (
	[close_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x16].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x16] ON [dbo].[call_req] (
	[resolve_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x17].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x17] ON [dbo].[call_req] (
	[change] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x18].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x18] ON [dbo].[call_req] (
	[problem] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x2] ON [dbo].[call_req] (
	[log_agent] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [call_req_x3] ON [dbo].[call_req] (
	[ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x4] ON [dbo].[call_req] (
	[assignee] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x5] ON [dbo].[call_req] (
	[group_id] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x6] ON [dbo].[call_req] (
	[affected_rc] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x7] ON [dbo].[call_req] (
	[category] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x8] ON [dbo].[call_req] (
	[priority] ASC,
	[active_flag] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[call_req_x9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [call_req_x9] ON [dbo].[call_req] (
	[extern_ref] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_grp].[ccat_grp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ccat_grp_x0] ON [dbo].[ccat_grp] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_grp].[ccat_grp_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ccat_grp_x1] ON [dbo].[ccat_grp] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_loc].[ccat_loc_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ccat_loc_x0] ON [dbo].[ccat_loc] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_loc].[ccat_loc_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ccat_loc_x1] ON [dbo].[ccat_loc] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_wrkshft].[ccat_wrkshft_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ccat_wrkshft_x0] ON [dbo].[ccat_wrkshft] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_wrkshft].[ccat_wrkshft_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ccat_wrkshft_x1] ON [dbo].[ccat_wrkshft] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chg_x0] ON [dbo].[chg] (
	[open_date] ASC,
	[chg_ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x1] ON [dbo].[chg] (
	[requestor] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x10].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x10] ON [dbo].[chg] (
	[persid] ASC,
	[chg_ref_num] ASC,
	[open_date] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x11] ON [dbo].[chg] (
	[parent] ASC,
	[chg_ref_num] ASC,
	[open_date] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x12].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x12] ON [dbo].[chg] (
	[template_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x13].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x13] ON [dbo].[chg] (
	[close_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x14].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x14] ON [dbo].[chg] (
	[resolve_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x15].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x15] ON [dbo].[chg] (
	[project] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x2] ON [dbo].[chg] (
	[log_agent] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chg_x3] ON [dbo].[chg] (
	[chg_ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x4] ON [dbo].[chg] (
	[assignee] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x5] ON [dbo].[chg] (
	[group_id] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x6] ON [dbo].[chg] (
	[category] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x7] ON [dbo].[chg] (
	[priority] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x8] ON [dbo].[chg] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[chg_x9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_x9] ON [dbo].[chg] (
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg_template].[chg_template_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chg_template_x0] ON [dbo].[chg_template] (
	[template_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg_template].[chg_template_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chg_template_x1] ON [dbo].[chg_template] (
	[template_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgalg].[chgalg_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chgalg_x0] ON [dbo].[chgalg] (
	[change_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgalg].[chgalg_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [chgalg_x1] ON [dbo].[chgalg] (
	[time_stamp] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgcat].[chgcat_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chgcat_x0] ON [dbo].[chgcat] (
	[sym] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgcat].[chgcat_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chgcat_x1] ON [dbo].[chgcat] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgcat].[chgcat_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chgcat_x2] ON [dbo].[chgcat] (
	[sym] ASC,
	[owning_contract] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgcat].[chgcat_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chgcat_x3] ON [dbo].[chgcat] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgstat].[chgstat_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chgstat_x0] ON [dbo].[chgstat] (
	[sym] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgstat].[chgstat_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chgstat_x1] ON [dbo].[chgstat] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgstat].[chgstat_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [chgstat_x2] ON [dbo].[chgstat] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions].[ci_actions_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_actions_x0] ON [dbo].[ci_actions] (
	[id] ASC,
	[wf_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions].[ci_actions_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_actions_x1] ON [dbo].[ci_actions] (
	[action_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions].[ci_actions_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_actions_x2] ON [dbo].[ci_actions] (
	[analyst_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions].[ci_actions_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_actions_x3] ON [dbo].[ci_actions] (
	[group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions].[ci_actions_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_actions_x4] ON [dbo].[ci_actions] (
	[status_current_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions].[ci_actions_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_actions_x5] ON [dbo].[ci_actions] (
	[unpublish] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions].[ci_actions_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_actions_x6] ON [dbo].[ci_actions] (
	[unretire] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions_alternate].[ci_actions_alternate_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_actions_alternate_x0] ON [dbo].[ci_actions_alternate] (
	[action_id] ASC,
	[contact_type] ASC,
	[contact_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions_alternate].[ci_actions_alternate_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_actions_alternate_x1] ON [dbo].[ci_actions_alternate] (
	[action_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_app_ext].[PK__ci_app_ext__006C8230].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_app_ext] ADD CONSTRAINT [PK__ci_app_ext__006C8230] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_app_inhouse].[PK__ci_app_inhouse__0254CAA2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_app_inhouse] ADD CONSTRAINT [PK__ci_app_inhouse__0254CAA2] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_bookmarks].[ci_bookmarks_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_bookmarks_x0] ON [dbo].[ci_bookmarks] (
	[user_id] ASC,
	[document_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_bookmarks].[ci_bookmarks_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_bookmarks_x1] ON [dbo].[ci_bookmarks] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_contract].[PK__ci_contract__043D1314].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_contract] ADD CONSTRAINT [PK__ci_contract__043D1314] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_database].[PK__ci_database__06255B86].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_database] ADD CONSTRAINT [PK__ci_database__06255B86] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_doc_links].[ci_doc_links_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_doc_links_x0] ON [dbo].[ci_doc_links] (
	[doc_id1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_doc_links].[ci_doc_links_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_doc_links_x1] ON [dbo].[ci_doc_links] (
	[doc_id2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_doc_templates].[ci_doc_templates_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_doc_templates_x0] ON [dbo].[ci_doc_templates] (
	[is_default] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_doc_templates].[ci_doc_templates_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_doc_templates_x1] ON [dbo].[ci_doc_templates] (
	[template_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_document].[PK__ci_document__080DA3F8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_document] ADD CONSTRAINT [PK__ci_document__080DA3F8] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_eligible_child].[PK__ci_eligible_chil__09F5EC6A].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_eligible_child] ADD CONSTRAINT [PK__ci_eligible_chil__09F5EC6A] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_eligible_parent].[PK__ci_eligible_pare__0BDE34DC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_eligible_parent] ADD CONSTRAINT [PK__ci_eligible_pare__0BDE34DC] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_ac].[PK__ci_fac_ac__0DC67D4E].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_fac_ac] ADD CONSTRAINT [PK__ci_fac_ac__0DC67D4E] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_fire_control].[PK__ci_fac_fire_cont__0FAEC5C0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_fac_fire_control] ADD CONSTRAINT [PK__ci_fac_fire_cont__0FAEC5C0] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_furnishings].[PK__ci_fac_furnishin__11970E32].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_fac_furnishings] ADD CONSTRAINT [PK__ci_fac_furnishin__11970E32] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_other].[PK__ci_fac_other__137F56A4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_fac_other] ADD CONSTRAINT [PK__ci_fac_other__137F56A4] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_ups].[PK__ci_fac_ups__15679F16].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_fac_ups] ADD CONSTRAINT [PK__ci_fac_ups__15679F16] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_lpar].[PK__ci_hardware_lpar__174FE788].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_lpar] ADD CONSTRAINT [PK__ci_hardware_lpar__174FE788] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_mainframe].[PK__ci_hardware_main__19382FFA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_mainframe] ADD CONSTRAINT [PK__ci_hardware_main__19382FFA] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_monitor].[PK__ci_hardware_moni__1B20786C].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_monitor] ADD CONSTRAINT [PK__ci_hardware_moni__1B20786C] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_other].[PK__ci_hardware_othe__1D08C0DE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_other] ADD CONSTRAINT [PK__ci_hardware_othe__1D08C0DE] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_printer].[PK__ci_hardware_prin__1EF10950].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_printer] ADD CONSTRAINT [PK__ci_hardware_prin__1EF10950] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_server].[PK__ci_hardware_serv__20D951C2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_server] ADD CONSTRAINT [PK__ci_hardware_serv__20D951C2] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_storage].[PK__ci_hardware_stor__22C19A34].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_storage] ADD CONSTRAINT [PK__ci_hardware_stor__22C19A34] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_virtual].[PK__ci_hardware_virt__24A9E2A6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_virtual] ADD CONSTRAINT [PK__ci_hardware_virt__24A9E2A6] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_workstation].[PK__ci_hardware_work__26922B18].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_hardware_workstation] ADD CONSTRAINT [PK__ci_hardware_work__26922B18] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_mdr_idmap].[ci_mdr_idmap_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_mdr_idmap_X0] ON [dbo].[ci_mdr_idmap] (
	[mdr_provider_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_mdr_idmap].[ci_mdr_idmap_X1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_mdr_idmap_X1] ON [dbo].[ci_mdr_idmap] (
	[federated_asset_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_mdr_idmap].[ci_mdr_idmap_X2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_mdr_idmap_X2] ON [dbo].[ci_mdr_idmap] (
	[cmdb_asset_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_mdr_idmap].[PK__ci_mdr_i__3213E83E21B86762].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_mdr_idmap] ADD CONSTRAINT [PK__ci_mdr_i__3213E83E21B86762] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_mdr_provider].[ci_mdr_provider_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_mdr_provider_X0] ON [dbo].[ci_mdr_provider] (
	[mdr_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_mdr_provider].[ci_mdr_provider_X1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_mdr_provider_X1] ON [dbo].[ci_mdr_provider] (
	[mdr_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_mdr_provider].[ci_mdr_provider_X2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_mdr_provider_X2] ON [dbo].[ci_mdr_provider] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_mdr_provider].[PK__ci_mdr_p__3213E83E1DE7D67E].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_mdr_provider] ADD CONSTRAINT [PK__ci_mdr_p__3213E83E1DE7D67E] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_bridge].[PK__ci_network_bridg__287A738A].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_bridge] ADD CONSTRAINT [PK__ci_network_bridg__287A738A] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_cluster].[PK__ci_network_clust__2A62BBFC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_cluster] ADD CONSTRAINT [PK__ci_network_clust__2A62BBFC] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_controller].[PK__ci_network_contr__2C4B046E].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_controller] ADD CONSTRAINT [PK__ci_network_contr__2C4B046E] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_frontend].[PK__ci_network_front__2E334CE0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_frontend] ADD CONSTRAINT [PK__ci_network_front__2E334CE0] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_gateway].[PK__ci_network_gatew__301B9552].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_gateway] ADD CONSTRAINT [PK__ci_network_gatew__301B9552] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_hub].[PK__ci_network_hub__3203DDC4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_hub] ADD CONSTRAINT [PK__ci_network_hub__3203DDC4] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_nic].[PK__ci_network_nic__33EC2636].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_nic] ADD CONSTRAINT [PK__ci_network_nic__33EC2636] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_other].[PK__ci_network_other__35D46EA8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_other] ADD CONSTRAINT [PK__ci_network_other__35D46EA8] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_peripheral].[PK__ci_network_perip__37BCB71A].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_peripheral] ADD CONSTRAINT [PK__ci_network_perip__37BCB71A] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_port].[PK__ci_network_port__39A4FF8C].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_port] ADD CONSTRAINT [PK__ci_network_port__39A4FF8C] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_resource].[PK__ci_network_resou__3B8D47FE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_resource] ADD CONSTRAINT [PK__ci_network_resou__3B8D47FE] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_resource_group].[PK__ci_network_resou__3D759070].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_resource_group] ADD CONSTRAINT [PK__ci_network_resou__3D759070] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_router].[PK__ci_network_route__3F5DD8E2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_router] ADD CONSTRAINT [PK__ci_network_route__3F5DD8E2] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_server].[PK__ci_network_serve__41462154].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_network_server] ADD CONSTRAINT [PK__ci_network_serve__41462154] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_operating_system].[PK__ci_operating_sys__432E69C6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_operating_system] ADD CONSTRAINT [PK__ci_operating_sys__432E69C6] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_priorities].[ci_priorities_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_priorities_x0] ON [dbo].[ci_priorities] (
	[priority] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_rel_type].[ci_rel_type_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_rel_type_X0] ON [dbo].[ci_rel_type] (
	[parenttochild] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_rel_type].[ci_rel_type_X1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_rel_type_X1] ON [dbo].[ci_rel_type] (
	[childtoparent] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_rel_type].[PK__ci_rel_type__4516B238].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_rel_type] ADD CONSTRAINT [PK__ci_rel_type__4516B238] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_security].[PK__ci_security__46FEFAAA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_security] ADD CONSTRAINT [PK__ci_security__46FEFAAA] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_service].[PK__ci_service__48E7431C].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_service] ADD CONSTRAINT [PK__ci_service__48E7431C] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_sla].[PK__ci_sla__4ACF8B8E].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_sla] ADD CONSTRAINT [PK__ci_sla__4ACF8B8E] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_statuses].[ci_statuses_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_statuses_x0] ON [dbo].[ci_statuses] (
	[status_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_statuses].[ci_statuses_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_statuses_x1] ON [dbo].[ci_statuses] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_ciruit].[PK__ci_telcom_ciruit__4CB7D400].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_telcom_ciruit] ADD CONSTRAINT [PK__ci_telcom_ciruit__4CB7D400] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_other].[PK__ci_telcom_other__4EA01C72].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_telcom_other] ADD CONSTRAINT [PK__ci_telcom_other__4EA01C72] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_radio].[PK__ci_telcom_radio__508864E4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_telcom_radio] ADD CONSTRAINT [PK__ci_telcom_radio__508864E4] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_voice].[PK__ci_telcom_voice__5270AD56].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_telcom_voice] ADD CONSTRAINT [PK__ci_telcom_voice__5270AD56] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_wireless].[PK__ci_telcom_wirele__5458F5C8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_telcom_wireless] ADD CONSTRAINT [PK__ci_telcom_wirele__5458F5C8] PRIMARY KEY NONCLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_wf_templates].[ci_wf_templates_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ci_wf_templates_x0] ON [dbo].[ci_wf_templates] (
	[is_default] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_wf_templates].[ci_wf_templates_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ci_wf_templates_x1] ON [dbo].[ci_wf_templates] (
	[wf_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ciscostats].[baseidx_ciscostats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_ciscostats] ON [dbo].[ciscostats] (
	[probe_addr] ASC,
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ciscostats].[ciscostatstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ciscostatstime] ON [dbo].[ciscostats] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[clone].[baseidx_clone].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_clone] ON [dbo].[clone] (
	[cloneid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSADMINRESOURCEBACKBONEDATA].[IDX_CMSBBNAMEUP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_CMSBBNAMEUP] ON [dbo].[CMSADMINRESOURCEBACKBONEDATA] (
	[UERESOURCENAMEUP] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSADMINRESOURCEBACKBONEDATA].[idx_cmsbbparentpath].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_cmsbbparentpath] ON [dbo].[CMSADMINRESOURCEBACKBONEDATA] (
	[UEPARENTPATH] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSADMINRESOURCEBACKBONEDATA].[IDX_CMSBBTITLEUP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_CMSBBTITLEUP] ON [dbo].[CMSADMINRESOURCEBACKBONEDATA] (
	[UERESOURCETITLEUP] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSADMINRESOURCEBACKBONEDATA].[UE107d798c7e6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSADMINRESOURCEBACKBONEDATA] ADD CONSTRAINT [UE107d798c7e6] UNIQUE NONCLUSTERED (
	[UECCITEMID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSGROUPDATA].[IDX_CMSGROUPNAME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_CMSGROUPNAME] ON [dbo].[CMSGROUPDATA] (
	[UEGROUPNAME] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSGROUPDATA].[UE107d798c7e0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSGROUPDATA] ADD CONSTRAINT [UE107d798c7e0] UNIQUE NONCLUSTERED (
	[UEGROUPNAME] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMDIDDATA].[IDX_CMSMDIDNAME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_CMSMDIDNAME] ON [dbo].[CMSMDIDDATA] (
	[UENAME] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMDIDDATA].[IDX_CMSMDIDTABLENAME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_CMSMDIDTABLENAME] ON [dbo].[CMSMDIDDATA] (
	[UETABLENAME] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMDIDDATA].[UE107d798c7d9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSMDIDDATA] ADD CONSTRAINT [UE107d798c7d9] UNIQUE NONCLUSTERED (
	[UENAME] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMDIDDATA].[UE107d798c7da].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSMDIDDATA] ADD CONSTRAINT [UE107d798c7da] UNIQUE NONCLUSTERED (
	[UETABLENAME] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSUSERDATA].[IDX_CMSUSERNAME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IDX_CMSUSERNAME] ON [dbo].[CMSUSERDATA] (
	[UEUSERNAME] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSUSERDATA].[UE107d798c7de].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSUSERDATA] ADD CONSTRAINT [UE107d798c7de] UNIQUE NONCLUSTERED (
	[UEUSERNAME] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cn].[cn_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cn_x0] ON [dbo].[cn] (
	[cn_table] ASC,
	[cn_sys] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cnote].[cnote_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cnote_x0] ON [dbo].[cnote] (
	[posted_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cnote].[cnote_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cnote_x1] ON [dbo].[cnote] (
	[control_group] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[collectionparmgroups].[baseidx_collectionparmgroups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_collectionparmgroups] ON [dbo].[collectionparmgroups] (
	[parmgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[collectionparms].[baseidx_collectionparms].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_collectionparms] ON [dbo].[collectionparms] (
	[parmname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[collectserver].[baseidx_collectserver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_collectserver] ON [dbo].[collectserver] (
	[server_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[confmemo].[confmemo_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [confmemo_idx_01] ON [dbo].[confmemo] (
	[unitid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_prp].[cr_prp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cr_prp_x0] ON [dbo].[cr_prp] (
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_prp].[cr_prp_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cr_prp_x1] ON [dbo].[cr_prp] (
	[owning_cr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_prptpl].[cr_prptpl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cr_prptpl_x0] ON [dbo].[cr_prptpl] (
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_prptpl].[cr_prptpl_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cr_prptpl_x1] ON [dbo].[cr_prptpl] (
	[owning_area] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_stat].[cr_stat_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [cr_stat_x0] ON [dbo].[cr_stat] (
	[sym] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_stat].[cr_stat_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [cr_stat_x1] ON [dbo].[cr_stat] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_stat].[cr_stat_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [cr_stat_x2] ON [dbo].[cr_stat] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_template].[cr_template_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [cr_template_x0] ON [dbo].[cr_template] (
	[template_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_template].[cr_template_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [cr_template_x1] ON [dbo].[cr_template] (
	[template_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crctmr].[crctmr_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [crctmr_x0] ON [dbo].[crctmr] (
	[threshold] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crepository].[$crepo_u00003d7b00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$crepo_u00003d7b00000000] ON [dbo].[crepository] (
	[mackey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crepository].[baseidx_crepository].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_crepository] ON [dbo].[crepository] (
	[regno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crepository].[crepository_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [crepository_idx_01] ON [dbo].[crepository] (
	[serno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crsol].[crsol_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [crsol_x0] ON [dbo].[crsol] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crsq].[crsq_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [crsq_x0] ON [dbo].[crsq] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crsq].[crsq_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [crsq_x1] ON [dbo].[crsq] (
	[obj_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crt].[crt_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [crt_x0] ON [dbo].[crt] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crt].[crt_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [crt_x1] ON [dbo].[crt] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_link].[baseidx_csm_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_csm_link] ON [dbo].[csm_link] (
	[child] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_link].[csm_link_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [csm_link_idx_01] ON [dbo].[csm_link] (
	[child] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_link].[csm_link_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [csm_link_idx_02] ON [dbo].[csm_link] (
	[parent] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_object].[csm_object_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [csm_object_idx_01] ON [dbo].[csm_object] (
	[class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_object].[csm_object_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [csm_object_idx_02] ON [dbo].[csm_object] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_object].[xie2csm_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie2csm_object] ON [dbo].[csm_object] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_property].[csm_property_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [csm_property_idx_01] ON [dbo].[csm_property] (
	[object] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_property].[xie2csm_property].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie2csm_property] ON [dbo].[csm_property] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ct_mth].[ct_mth_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ct_mth_x0] ON [dbo].[ct_mth] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ctab].[ctab_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ctab_x0] ON [dbo].[ctab] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[d_painter].[d_painter_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [d_painter_x0] ON [dbo].[d_painter] (
	[formname] ASC,
	[cntlid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[d_painter].[d_painter_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [d_painter_x1] ON [dbo].[d_painter] (
	[formgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_anlyplugin].[$das_a_u00001a0200000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$das_a_u00001a0200000000] ON [dbo].[das_anlyplugin] (
	[pluginname] ASC,
	[pluginversionmin] ASC,
	[pluginversionmax] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_groupjob].[$das_g_u00001a1b00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$das_g_u00001a1b00000000] ON [dbo].[das_groupjob] (
	[actiontype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_object_list].[$das_o_u00001a2f00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$das_o_u00001a2f00000000] ON [dbo].[das_object_list] (
	[hostid] ASC,
	[serverid] ASC,
	[objectname] ASC,
	[objecttype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_policy].[$das_p_u00001a0b00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$das_p_u00001a0b00000000] ON [dbo].[das_policy] (
	[policyowner] ASC,
	[policyname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_policyaction].[$das_p_u00001a1000000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$das_p_u00001a1000000000] ON [dbo].[das_policyaction] (
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[datarolldate].[baseidx_datarolldate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_datarolldate] ON [dbo].[datarolldate] (
	[datatype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[datarollup].[baseidx_datarollup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_datarollup] ON [dbo].[datarollup] (
	[probe_addr] ASC,
	[rsrcindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[datasource].[$datas_u0000354700000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$datas_u0000354700000000] ON [dbo].[datasource] (
	[screenname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_IndexCol].[idx_db_IndexCol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_db_IndexCol] ON [dbo].[db_IndexCol] (
	[dbrep_IndexIID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Object].[db_ObjectUnique].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Object] ADD CONSTRAINT [db_ObjectUnique] UNIQUE NONCLUSTERED (
	[dbrep_ParentIID] ASC,
	[dbrep_Name] ASC,
	[dbrep_ObjectType] ASC,
	[dbrep_Status] ASC,
	[dbrep_Version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Object].[idx_db_ObjParent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_db_ObjParent] ON [dbo].[db_Object] (
	[dbrep_ParentIID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_agent_status].[dbh_agent_status_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_agent_status_idx] ON [dbo].[dbh_agent_status] (
	[agent_name] ASC,
	[alarm_name] ASC,
	[alarm_object] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_captures].[dbh_captures_db_batch_st_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_captures_db_batch_st_idx] ON [dbo].[dbh_captures] (
	[db] ASC,
	[batch_start_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_captures].[dbh_captures_db_collect_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_captures_db_collect_idx] ON [dbo].[dbh_captures] (
	[db] ASC,
	[collection_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_hist].[dbh_hist_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_hist_idx] ON [dbo].[dbh_hist] (
	[seq_no] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_key].[dbh_key_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_key_idx] ON [dbo].[dbh_key] (
	[dbh_instance] ASC,
	[name] ASC,
	[sub_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_ora].[dbh_sql_ora_inst_snapts_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_sql_ora_inst_snapts_idx] ON [dbo].[dbh_sql_ora] (
	[var1] ASC,
	[var2] ASC,
	[snapshot_timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_ora].[dbh_sql_ora_snapshot_ts_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_sql_ora_snapshot_ts_idx] ON [dbo].[dbh_sql_ora] (
	[capture_id] ASC,
	[snapshot_timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_tables_ora].[dbh_sql_tables_ora_table_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_sql_tables_ora_table_idx] ON [dbo].[dbh_sql_tables_ora] (
	[table_owner] ASC,
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_udb].[dbh_sql_udb_inst_snapts_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_sql_udb_inst_snapts_idx] ON [dbo].[dbh_sql_udb] (
	[var1] ASC,
	[snapshot_timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_udb].[dbh_sql_udb_snapshot_ts_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dbh_sql_udb_snapshot_ts_idx] ON [dbo].[dbh_sql_udb] (
	[capture_id] ASC,
	[snapshot_timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dcon].[dcon_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [dcon_x0] ON [dbo].[dcon] (
	[dom_id] ASC,
	[tbl_id] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DDTableModify].[XPKDDTableModify].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XPKDDTableModify] ON [dbo].[DDTableModify] (
	[ExecutionId] ASC,
	[DDTableProviderId] ASC,
	[DDTableModifyName] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[deletedjobs].[baseidx_deletedjobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_deletedjobs] ON [dbo].[deletedjobs] (
	[instancename] ASC,
	[jobname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[deletedjobs].[deletedjobs_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [deletedjobs_idx_01] ON [dbo].[deletedjobs] (
	[jobname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[disp].[baseidx_disp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_disp] ON [dbo].[disp] (
	[dsa] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dispmoddn].[baseidx_dispmoddn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_dispmoddn] ON [dbo].[dispmoddn] (
	[updated] ASC,
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dit].[baseidx_dit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_dit] ON [dbo].[dit] (
	[parent] ASC,
	[rdnkey] ASC,
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dit].[idit1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idit1] ON [dbo].[dit] (
	[eid] ASC,
	[parent] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dit].[idit2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idit2] ON [dbo].[dit] (
	[parent] ASC,
	[eid] ASC,
	[flags] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dlgtsrv].[dlgtsrv_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [dlgtsrv_x0] ON [dbo].[dlgtsrv] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dmn].[dmn_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [dmn_x0] ON [dbo].[dmn] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[doc_rep].[doc_rep_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [doc_rep_x0] ON [dbo].[doc_rep] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[doc_rep].[doc_rep_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [doc_rep_x1] ON [dbo].[doc_rep] (
	[repository_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[doc_rep].[doc_rep_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [doc_rep_x2] ON [dbo].[doc_rep] (
	[archive_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[doc_rep].[doc_rep_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [doc_rep_x3] ON [dbo].[doc_rep] (
	[server] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[documentation].[baseidx_documentation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_documentation] ON [dbo].[documentation] (
	[prod] ASC,
	[id] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dtfilter].[dts_dtfilter_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dts_dtfilter_idx_01] ON [dbo].[dts_dtfilter] (
	[permanent_filter] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dtsubscribers].[dts_dtsubscribers_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dts_dtsubscribers_idx_01] ON [dbo].[dts_dtsubscribers] (
	[agent_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dttransfer].[dts_dttransfer_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dts_dttransfer_idx_01] ON [dbo].[dts_dttransfer] (
	[initiator_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dttransfer].[dts_dttransfer_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dts_dttransfer_idx_02] ON [dbo].[dts_dttransfer] (
	[responder_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dttransfer].[dts_dttransfer_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dts_dttransfer_idx_03] ON [dbo].[dts_dttransfer] (
	[transfer_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dttransfer].[dts_dttransfer_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dts_dttransfer_idx_04] ON [dbo].[dts_dttransfer] (
	[state] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dttransfer].[dts_dttransfer_idx_05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dts_dttransfer_idx_05] ON [dbo].[dts_dttransfer] (
	[calendar] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dttransfer].[dts_dttransfer_idx_06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dts_dttransfer_idx_06] ON [dbo].[dts_dttransfer] (
	[has_children] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dynamic_worklist].[dynamic_worklist_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dynamic_worklist_ind1] ON [dbo].[dynamic_worklist] (
	[productid] ASC,
	[users] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dynamic_worklist].[dynamic_worklist_ind2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dynamic_worklist_ind2] ON [dbo].[dynamic_worklist] (
	[productid] ASC,
	[workitemid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_bpv_comp_mod].[xif2e2e_adm_add_bpv_comp_mod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_add_bpv_comp_mod] ON [dbo].[e2e_adm_add_bpv_comp_mod] (
	[component_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_bpv_comp_mod].[xif3e2e_adm_add_bpv_comp_mod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3e2e_adm_add_bpv_comp_mod] ON [dbo].[e2e_adm_add_bpv_comp_mod] (
	[adm_add_uuid] ASC,
	[definition_version] ASC,
	[bpv_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_bpv_link_mod].[xif2e2e_adm_add_bpv_link_mod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_add_bpv_link_mod] ON [dbo].[e2e_adm_add_bpv_link_mod] (
	[client_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_bpv_link_mod].[xif3e2e_adm_add_bpv_link_mod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3e2e_adm_add_bpv_link_mod] ON [dbo].[e2e_adm_add_bpv_link_mod] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_bpv_link_mod].[xif4e2e_adm_add_bpv_link_mod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4e2e_adm_add_bpv_link_mod] ON [dbo].[e2e_adm_add_bpv_link_mod] (
	[adm_add_uuid] ASC,
	[definition_version] ASC,
	[bpv_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_component].[xif2e2e_adm_add_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_add_component] ON [dbo].[e2e_adm_add_component] (
	[component_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_component].[xif3e2e_adm_add_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3e2e_adm_add_component] ON [dbo].[e2e_adm_add_component] (
	[adm_add_uuid] ASC,
	[definition_version] ASC,
	[bpv_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_component].[xif4e2e_adm_add_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4e2e_adm_add_component] ON [dbo].[e2e_adm_add_component] (
	[tailor_uuid] ASC,
	[definition_version] ASC,
	[adm_add_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_h_component].[xif1e2e_adm_add_h_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_add_h_component] ON [dbo].[e2e_adm_add_h_component] (
	[adm_add_uuid] ASC,
	[definition_version] ASC,
	[bpv_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_h_component].[xif2e2e_adm_add_h_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_add_h_component] ON [dbo].[e2e_adm_add_h_component] (
	[component_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_h_component].[xif3e2e_adm_add_h_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3e2e_adm_add_h_component] ON [dbo].[e2e_adm_add_h_component] (
	[tailor_uuid] ASC,
	[definition_version] ASC,
	[adm_add_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_h_link].[xif1e2e_adm_add_h_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_add_h_link] ON [dbo].[e2e_adm_add_h_link] (
	[adm_add_uuid] ASC,
	[definition_version] ASC,
	[bpv_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_h_link].[xif2e2e_adm_add_h_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_add_h_link] ON [dbo].[e2e_adm_add_h_link] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_h_link].[xif4e2e_adm_add_h_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4e2e_adm_add_h_link] ON [dbo].[e2e_adm_add_h_link] (
	[client_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_h_link].[xif5e2e_adm_add_h_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif5e2e_adm_add_h_link] ON [dbo].[e2e_adm_add_h_link] (
	[tailor_uuid] ASC,
	[definition_version] ASC,
	[adm_add_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_history].[xif1e2e_adm_add_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_add_history] ON [dbo].[e2e_adm_add_history] (
	[adm_add_uuid] ASC,
	[definition_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_link].[xif2e2e_adm_add_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_add_link] ON [dbo].[e2e_adm_add_link] (
	[client_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_link].[xif3e2e_adm_add_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3e2e_adm_add_link] ON [dbo].[e2e_adm_add_link] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_link].[xif4e2e_adm_add_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4e2e_adm_add_link] ON [dbo].[e2e_adm_add_link] (
	[adm_add_uuid] ASC,
	[definition_version] ASC,
	[bpv_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_link].[xif5e2e_adm_add_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif5e2e_adm_add_link] ON [dbo].[e2e_adm_add_link] (
	[tailor_uuid] ASC,
	[definition_version] ASC,
	[adm_add_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_add_transaction].[xif1e2e_adm_add_transaction].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_add_transaction] ON [dbo].[e2e_adm_add_transaction] (
	[adm_add_uuid] ASC,
	[definition_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_appl_discovery_def].[xie1e2e_adm_appl_discovery_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1e2e_adm_appl_discovery_def] ON [dbo].[e2e_adm_appl_discovery_def] (
	[apm_application_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_appl_discovery_def].[xie2e2e_adm_appl_discovery_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie2e2e_adm_appl_discovery_def] ON [dbo].[e2e_adm_appl_discovery_def] (
	[discovery_definition_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_appl_discovery_def].[xie3e2e_adm_appl_discovery_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie3e2e_adm_appl_discovery_def] ON [dbo].[e2e_adm_appl_discovery_def] (
	[adm_add_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_correlation_rule].[xif1e2e_adm_correlation_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_correlation_rule] ON [dbo].[e2e_adm_correlation_rule] (
	[adm_add_uuid] ASC,
	[definition_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_daily_performance].[xif1e2e_adm_daily_performance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_daily_performance] ON [dbo].[e2e_adm_daily_performance] (
	[client_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_daily_performance].[xif2e2e_adm_daily_performance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_daily_performance] ON [dbo].[e2e_adm_daily_performance] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_hourly_performance].[xif1e2e_adm_hourly_performance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_hourly_performance] ON [dbo].[e2e_adm_hourly_performance] (
	[client_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_hourly_performance].[xif2e2e_adm_hourly_performance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_hourly_performance] ON [dbo].[e2e_adm_hourly_performance] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_observer_activity].[xie1e2e_adm_observer_activity].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1e2e_adm_observer_activity] ON [dbo].[e2e_adm_observer_activity] (
	[start_gmt_time_mills] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_performance].[xif1e2e_adm_performance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_performance] ON [dbo].[e2e_adm_performance] (
	[client_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_performance].[xif2e2e_adm_performance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_performance] ON [dbo].[e2e_adm_performance] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_raw_component].[xif1e2e_adm_raw_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_raw_component] ON [dbo].[e2e_adm_raw_component] (
	[apm_application_name] ASC,
	[apm_transaction_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_raw_component].[xif2e2e_adm_raw_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_raw_component] ON [dbo].[e2e_adm_raw_component] (
	[component_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_raw_link].[xif1e2e_adm_raw_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_raw_link] ON [dbo].[e2e_adm_raw_link] (
	[apm_application_name] ASC,
	[apm_transaction_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_raw_link].[xif2e2e_adm_raw_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2e2e_adm_raw_link] ON [dbo].[e2e_adm_raw_link] (
	[client_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_raw_link].[xif3e2e_adm_raw_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3e2e_adm_raw_link] ON [dbo].[e2e_adm_raw_link] (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_tailoring_rule].[xif1e2e_adm_tailoring_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1e2e_adm_tailoring_rule] ON [dbo].[e2e_adm_tailoring_rule] (
	[adm_add_uuid] ASC,
	[definition_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_transaction_activity].[xie1e2e_adm_transaction_activity].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1e2e_adm_transaction_activity] ON [dbo].[e2e_adm_transaction_activity] (
	[start_gmt_time_mills] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_adm_transaction_activity].[xie2e2e_adm_transaction_activity].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie2e2e_adm_transaction_activity] ON [dbo].[e2e_adm_transaction_activity] (
	[end_gmt_time_mills] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_apm_application].[ix_e2e_apm_application].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_e2e_apm_application] ON [dbo].[e2e_apm_application] (
	[app_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_apm_appop_ref].[ix_e2e_apm_appop_ref].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_e2e_apm_appop_ref] ON [dbo].[e2e_apm_appop_ref] (
	[app_name] ASC,
	[op_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_apm_client].[ix_e2e_apm_client].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_e2e_apm_client] ON [dbo].[e2e_apm_client] (
	[client_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_apm_host].[ix_e2e_apm_host].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_e2e_apm_host] ON [dbo].[e2e_apm_host] (
	[mac_address] ASC,
	[local_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_apm_operation].[ix_e2e_apm_operation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_e2e_apm_operation] ON [dbo].[e2e_apm_operation] (
	[op_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_apm_resp_data].[ix_e2e_apm_resp_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_e2e_apm_resp_data] ON [dbo].[e2e_apm_resp_data] (
	[trans_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_apm_server].[ix_e2e_apm_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_e2e_apm_server] ON [dbo].[e2e_apm_server] (
	[server_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_apm_user].[ix_e2e_apm_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_e2e_apm_user] ON [dbo].[e2e_apm_user] (
	[user_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_countersource].[xak1e2e_wrm_countersource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1e2e_wrm_countersource] ON [dbo].[e2e_wrm_countersource] (
	[sourcename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_countersource].[xie1e2e_wrm_countersource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1e2e_wrm_countersource] ON [dbo].[e2e_wrm_countersource] (
	[hostname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_report].[xak1e2e_wrm_report].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1e2e_wrm_report] ON [dbo].[e2e_wrm_report] (
	[title] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_sourcelocale].[xak1e2e_wrm_sourcelocale].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1e2e_wrm_sourcelocale] ON [dbo].[e2e_wrm_sourcelocale] (
	[localename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_sourcelocale].[xak2e2e_wrm_sourcelocale].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak2e2e_wrm_sourcelocale] ON [dbo].[e2e_wrm_sourcelocale] (
	[langcode] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[ie1e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ie1e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[timefactor] ASC,
	[issent] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[ie2e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ie2e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[typeid] ASC,
	[sourceid] ASC,
	[transactionid] ASC,
	[timestart] ASC,
	[issent] ASC,
	[urlid] ASC,
	[timefactor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[ie3e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ie3e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[typeid] ASC,
	[sourceid] ASC,
	[identifierid] ASC,
	[resptime] ASC,
	[timestart] ASC,
	[urlid] ASC,
	[timefactor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[ie4e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ie4e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[typeid] ASC,
	[sourceid] ASC,
	[identifierid] ASC,
	[resptime] ASC,
	[timestart] ASC,
	[urlid] ASC,
	[timefactor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[xie1e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[timefactor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[xie2e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie2e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[timestart] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[xie3e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie3e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[timeend] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[xie4e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie4e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[sourceid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[xie5e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie5e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[typeid] ASC,
	[sourceid] ASC,
	[transactionid] ASC,
	[timestart] ASC,
	[timefactor] ASC,
	[requestnameid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[xie6e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie6e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[transactionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[xie7e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie7e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[typeid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[e2e_wrm_wrmreport].[xie8e2e_wrm_wrmreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie8e2e_wrm_wrmreport] ON [dbo].[e2e_wrm_wrmreport] (
	[urlid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_acronyms].[ebr_acronyms_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_acronyms_x0] ON [dbo].[ebr_acronyms] (
	[acronym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_dictionary].[ebr_dictionary_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_dictionary_x0] ON [dbo].[ebr_dictionary] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_dictionary].[ebr_dictionary_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_dictionary_x1] ON [dbo].[ebr_dictionary] (
	[word_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_dictionary].[ebr_dictionary_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_dictionary_x2] ON [dbo].[ebr_dictionary] (
	[word_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_dictionary_adm].[ebr_dictionary_adm_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_dictionary_adm_x0] ON [dbo].[ebr_dictionary_adm] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_dictionary_adm].[ebr_dictionary_adm_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_dictionary_adm_x1] ON [dbo].[ebr_dictionary_adm] (
	[word_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_dictionary_adm].[ebr_dictionary_adm_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_dictionary_adm_x2] ON [dbo].[ebr_dictionary_adm] (
	[word_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext].[ebr_fulltext_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_fulltext_x0] ON [dbo].[ebr_fulltext] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext].[ebr_fulltext_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_x1] ON [dbo].[ebr_fulltext] (
	[word_count_title] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext].[ebr_fulltext_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_x2] ON [dbo].[ebr_fulltext] (
	[word_count_summary] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext].[ebr_fulltext_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_x3] ON [dbo].[ebr_fulltext] (
	[word_count_problem] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext].[ebr_fulltext_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_x4] ON [dbo].[ebr_fulltext] (
	[word_count_resolution] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext].[ebr_fulltext_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_x5] ON [dbo].[ebr_fulltext] (
	[table_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext].[ebr_fulltext_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_x6] ON [dbo].[ebr_fulltext] (
	[entity_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext_adm].[ebr_fulltext_adm_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_fulltext_adm_x0] ON [dbo].[ebr_fulltext_adm] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext_adm].[ebr_fulltext_adm_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_adm_x1] ON [dbo].[ebr_fulltext_adm] (
	[word_count_title] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext_adm].[ebr_fulltext_adm_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_adm_x2] ON [dbo].[ebr_fulltext_adm] (
	[word_count_summary] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext_adm].[ebr_fulltext_adm_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_adm_x3] ON [dbo].[ebr_fulltext_adm] (
	[word_count_problem] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext_adm].[ebr_fulltext_adm_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_adm_x4] ON [dbo].[ebr_fulltext_adm] (
	[word_count_resolution] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext_adm].[ebr_fulltext_adm_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_adm_x5] ON [dbo].[ebr_fulltext_adm] (
	[table_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext_adm].[ebr_fulltext_adm_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_fulltext_adm_x6] ON [dbo].[ebr_fulltext_adm] (
	[entity_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_log].[ebr_log_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_log_x0] ON [dbo].[ebr_log] (
	[asked_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_log].[ebr_log_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_log_x1] ON [dbo].[ebr_log] (
	[num_matches] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_log].[ebr_log_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_log_x2] ON [dbo].[ebr_log] (
	[external_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_log].[ebr_log_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_log_x3] ON [dbo].[ebr_log] (
	[method_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_log].[ebr_log_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_log_x4] ON [dbo].[ebr_log] (
	[search_text] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_log].[ebr_log_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_log_x5] ON [dbo].[ebr_log] (
	[session_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_log].[ebr_log_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_log_x6] ON [dbo].[ebr_log] (
	[search_quality] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_metrics].[ebr_metrics_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_metrics_x0] ON [dbo].[ebr_metrics] (
	[metric] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_noise_words].[ebr_noise_words_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_noise_words_x0] ON [dbo].[ebr_noise_words] (
	[noise_word] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_patterns].[baseidx_ebr_patterns].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ebr_patterns] ON [dbo].[ebr_patterns] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_patterns].[ebr_patterns_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_patterns_x0] ON [dbo].[ebr_patterns] (
	[pattern_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_prefixes].[ebr_prefixes_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_prefixes_x0] ON [dbo].[ebr_prefixes] (
	[prefix] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_properties].[ebr_properties_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_properties_x0] ON [dbo].[ebr_properties] (
	[property_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_properties].[ebr_properties_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ebr_properties_x1] ON [dbo].[ebr_properties] (
	[property_admin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_substits].[ebr_substits_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_substits_x0] ON [dbo].[ebr_substits] (
	[symbol1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_suffixes].[ebr_suffixes_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_suffixes_x0] ON [dbo].[ebr_suffixes] (
	[suffix] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_synonym_groups].[ebr_synonym_groups_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_synonym_groups_x0] ON [dbo].[ebr_synonym_groups] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_synonym_groups_adm].[ebr_synonym_groups_adm_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_synonym_groups_adm_x0] ON [dbo].[ebr_synonym_groups_adm] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_synonyms].[ebr_synonyms_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_synonyms_x0] ON [dbo].[ebr_synonyms] (
	[keyword1] ASC,
	[keyword2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_synonyms_adm].[ebr_synonyms_adm_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ebr_synonyms_adm_x0] ON [dbo].[ebr_synonyms_adm] (
	[keyword1] ASC,
	[keyword2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[emevt_mib].[baseidx_emevt_mib].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_emevt_mib] ON [dbo].[emevt_mib] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[emevt_mib].[emevt_mib_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [emevt_mib_idx1] ON [dbo].[emevt_mib] (
	[vendor] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[emevt_trap].[baseidx_emevt_trap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_emevt_trap] ON [dbo].[emevt_trap] (
	[eid] ASC,
	[generic] ASC,
	[specific] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[emevt_trap].[emevt_trap_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [emevt_trap_idx1] ON [dbo].[emevt_trap] (
	[mibname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[engine_config].[$engin_u0000355700000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$engin_u0000355700000000] ON [dbo].[engine_config] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package].[ent_package_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ent_package_idx_01] ON [dbo].[enterprise_package] (
	[ep_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package_history].[ent_package_his_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ent_package_his_idx_01] ON [dbo].[enterprise_package_history] (
	[chrono1] ASC,
	[chrono2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package_history].[ent_package_his_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ent_package_his_idx_02] ON [dbo].[enterprise_package_history] (
	[product_package_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package_history].[ent_package_his_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ent_package_his_idx_03] ON [dbo].[enterprise_package_history] (
	[action] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package_history].[ent_package_his_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ent_package_his_idx_04] ON [dbo].[enterprise_package_history] (
	[product_package_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package_status].[ndx_ent_package_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ndx_ent_package_status] ON [dbo].[enterprise_package_status] (
	[ep_id] ASC,
	[eccm_configurationid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[entry].[baseidx_entry].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_entry] ON [dbo].[entry] (
	[eid] ASC,
	[aid] ASC,
	[vid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_constants].[es_constants_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [es_constants_x0] ON [dbo].[es_constants] (
	[propertyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_constants].[es_constants_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [es_constants_x1] ON [dbo].[es_constants] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_nodes].[es_nodes_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [es_nodes_x0] ON [dbo].[es_nodes] (
	[node_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_nodes].[es_nodes_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_nodes_x1] ON [dbo].[es_nodes] (
	[link_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_nodes].[es_nodes_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_nodes_x2] ON [dbo].[es_nodes] (
	[parent_node_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_nodes].[es_nodes_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_nodes_x3] ON [dbo].[es_nodes] (
	[root_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_nodes].[es_nodes_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_nodes_x4] ON [dbo].[es_nodes] (
	[tree_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_responses].[es_responses_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [es_responses_x0] ON [dbo].[es_responses] (
	[parent_node_id] ASC,
	[response_link_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_responses].[es_responses_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_responses_x1] ON [dbo].[es_responses] (
	[parent_node_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_responses].[es_responses_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_responses_x2] ON [dbo].[es_responses] (
	[response_link_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_responses].[es_responses_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_responses_x3] ON [dbo].[es_responses] (
	[response_link_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_sessions].[es_sessions_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [es_sessions_x0] ON [dbo].[es_sessions] (
	[session_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_sessions].[es_sessions_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_sessions_x1] ON [dbo].[es_sessions] (
	[external_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_sessions].[es_sessions_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [es_sessions_x2] ON [dbo].[es_sessions] (
	[tree_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[event_log].[event_log_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [event_log_x0] ON [dbo].[event_log] (
	[session_id] ASC,
	[sd_obj_id] ASC,
	[event] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[event_log].[event_log_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [event_log_x1] ON [dbo].[event_log] (
	[sd_obj_type] ASC,
	[sd_obj_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[event_log].[event_log_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [event_log_x2] ON [dbo].[event_log] (
	[kd_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[eventlog].[eventlog_i1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [eventlog_i1] ON [dbo].[eventlog] (
	[ieventid] ASC,
	[datetimestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evt].[evt_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [evt_x0] ON [dbo].[evt] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evt_dly].[evt_dly_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [evt_dly_x0] ON [dbo].[evt_dly] (
	[obj_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evtdlytp].[evtdlytp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [evtdlytp_x0] ON [dbo].[evtdlytp] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[filter].[baseidx_filter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_filter] ON [dbo].[filter] (
	[filterid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[filter].[filter_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [filter_idx_01] ON [dbo].[filter] (
	[owner] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[filter].[filter_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [filter_idx_02] ON [dbo].[filter] (
	[name] ASC,
	[owner] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frcircuitid].[baseidx_frcircuitid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_frcircuitid] ON [dbo].[frcircuitid] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[frcircuitifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frcircuitstats].[baseidx_frcircuitstats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_frcircuitstats] ON [dbo].[frcircuitstats] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[frcircuitifindex] ASC,
	[frcircuitdlci] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frcircuitstats].[frcircuitstatstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [frcircuitstatstime] ON [dbo].[frcircuitstats] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frdlcmiid].[baseidx_frdlcmiid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_frdlcmiid] ON [dbo].[frdlcmiid] (
	[probe_addr] ASC,
	[frdlcmiifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frmgrp].[frmgrp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [frmgrp_x0] ON [dbo].[frmgrp] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_identifier].[baseidx_fun_identifier].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_identifier] ON [dbo].[fun_identifier] (
	[value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_ixfcols].[baseidx_fun_ixfcols].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_ixfcols] ON [dbo].[fun_ixfcols] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_jas].[baseidx_fun_jas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_jas] ON [dbo].[fun_jas] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_lobpaths].[baseidx_fun_lobpaths].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_lobpaths] ON [dbo].[fun_lobpaths] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_nesttblpaths].[baseidx_fun_nesttblpaths].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_nesttblpaths] ON [dbo].[fun_nesttblpaths] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_nesttblsto].[baseidx_fun_nesttblsto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_nesttblsto] ON [dbo].[fun_nesttblsto] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_ora].[baseidx_fun_ora].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_ora] ON [dbo].[fun_ora] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_outpaths].[baseidx_fun_outpaths].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_outpaths] ON [dbo].[fun_outpaths] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_packedcols].[baseidx_fun_packedcols].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_packedcols] ON [dbo].[fun_packedcols] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_partitions].[baseidx_fun_partitions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_partitions] ON [dbo].[fun_partitions] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_sortpaths].[baseidx_fun_sortpaths].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_sortpaths] ON [dbo].[fun_sortpaths] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_sqlserver].[baseidx_fun_sqlserver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_sqlserver] ON [dbo].[fun_sqlserver] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_template].[baseidx_fun_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_template] ON [dbo].[fun_template] (
	[fun_id] ASC,
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_udb].[baseidx_fun_udb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_udb] ON [dbo].[fun_udb] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[fun_varraypaths].[baseidx_fun_varraypaths].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_fun_varraypaths] ON [dbo].[fun_varraypaths] (
	[fun_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_ext].[g_chg_ext_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_chg_ext_x0] ON [dbo].[g_chg_ext] (
	[last_mod_dt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_ext].[g_chg_ext_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_chg_ext_x1] ON [dbo].[g_chg_ext] (
	[remote_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_queue].[g_chg_queue_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_chg_queue_x0] ON [dbo].[g_chg_queue] (
	[open_date] ASC,
	[chg_ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_queue].[g_chg_queue_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_chg_queue_x1] ON [dbo].[g_chg_queue] (
	[remote_sys_id] ASC,
	[remote_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_queue].[g_chg_queue_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_chg_queue_x2] ON [dbo].[g_chg_queue] (
	[global_queue_id] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_queue].[g_chg_queue_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_chg_queue_x3] ON [dbo].[g_chg_queue] (
	[assignee] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_queue].[g_chg_queue_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_chg_queue_x4] ON [dbo].[g_chg_queue] (
	[group_id] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_queue].[g_chg_queue_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_chg_queue_x5] ON [dbo].[g_chg_queue] (
	[category] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_contact].[g_contact_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_contact_x0] ON [dbo].[g_contact] (
	[last_name] ASC,
	[first_name] ASC,
	[middle_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_contact].[g_contact_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_contact_x1] ON [dbo].[g_contact] (
	[remote_sys_id] ASC,
	[remote_id] ASC,
	[last_name] ASC,
	[first_name] ASC,
	[middle_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_contact].[g_contact_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_contact_x2] ON [dbo].[g_contact] (
	[userid] ASC,
	[remote_sys_id] ASC,
	[remote_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_contact].[g_contact_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_contact_x3] ON [dbo].[g_contact] (
	[pri_phone_number] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_contact].[g_contact_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_contact_x4] ON [dbo].[g_contact] (
	[email_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_contact].[g_contact_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_contact_x5] ON [dbo].[g_contact] (
	[contact_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_ext].[g_iss_ext_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_iss_ext_x0] ON [dbo].[g_iss_ext] (
	[last_mod_dt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_ext].[g_iss_ext_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_iss_ext_x1] ON [dbo].[g_iss_ext] (
	[remote_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_queue].[g_iss_queue_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_iss_queue_x0] ON [dbo].[g_iss_queue] (
	[open_date] ASC,
	[ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_queue].[g_iss_queue_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_iss_queue_x1] ON [dbo].[g_iss_queue] (
	[remote_sys_id] ASC,
	[remote_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_queue].[g_iss_queue_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_iss_queue_x2] ON [dbo].[g_iss_queue] (
	[global_queue_id] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_queue].[g_iss_queue_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_iss_queue_x3] ON [dbo].[g_iss_queue] (
	[assignee] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_queue].[g_iss_queue_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_iss_queue_x4] ON [dbo].[g_iss_queue] (
	[group_id] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_queue].[g_iss_queue_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_iss_queue_x5] ON [dbo].[g_iss_queue] (
	[category] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_queue].[g_iss_queue_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_iss_queue_x6] ON [dbo].[g_iss_queue] (
	[product] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_loc].[g_loc_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_loc_x0] ON [dbo].[g_loc] (
	[loc_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_loc].[g_loc_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_loc_x1] ON [dbo].[g_loc] (
	[remote_sys_id] ASC,
	[remote_id] ASC,
	[loc_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_org].[g_org_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_org_x0] ON [dbo].[g_org] (
	[org_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_org].[g_org_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_org_x1] ON [dbo].[g_org] (
	[remote_sys_id] ASC,
	[remote_id] ASC,
	[org_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_product].[g_product_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_product_x0] ON [dbo].[g_product] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_product].[g_product_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_product_x1] ON [dbo].[g_product] (
	[remote_sys_id] ASC,
	[remote_id] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_queue_names].[g_queue_names_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_queue_names_x0] ON [dbo].[g_queue_names] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_ext].[g_req_ext_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_req_ext_x0] ON [dbo].[g_req_ext] (
	[last_mod_dt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_ext].[g_req_ext_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_req_ext_x1] ON [dbo].[g_req_ext] (
	[remote_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_queue].[g_req_queue_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_req_queue_x0] ON [dbo].[g_req_queue] (
	[open_date] ASC,
	[ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_queue].[g_req_queue_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_req_queue_x1] ON [dbo].[g_req_queue] (
	[remote_sys_id] ASC,
	[remote_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_queue].[g_req_queue_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_req_queue_x2] ON [dbo].[g_req_queue] (
	[global_queue_id] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_queue].[g_req_queue_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_req_queue_x3] ON [dbo].[g_req_queue] (
	[assignee] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_queue].[g_req_queue_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_req_queue_x4] ON [dbo].[g_req_queue] (
	[group_id] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_queue].[g_req_queue_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [g_req_queue_x5] ON [dbo].[g_req_queue] (
	[category] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_srvr].[g_srvr_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_srvr_x0] ON [dbo].[g_srvr] (
	[remote_sys_id] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_srvr].[g_srvr_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_srvr_x1] ON [dbo].[g_srvr] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_srvr].[g_srvr_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_srvr_x2] ON [dbo].[g_srvr] (
	[global_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_tbl_map].[g_tbl_map_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_tbl_map_x0] ON [dbo].[g_tbl_map] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_tbl_rule].[g_tbl_rule_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [g_tbl_rule_x0] ON [dbo].[g_tbl_rule] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[gla_hours].[xif57_gla_hours].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif57_gla_hours] ON [dbo].[gla_hours] (
	[obj_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[gla_objects].[xif39gla_objects].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif39gla_objects] ON [dbo].[gla_objects] (
	[scan_index] ASC,
	[agent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[gla_sdamaps].[xif49gla_sdamaps].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif49gla_sdamaps] ON [dbo].[gla_sdamaps] (
	[agent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[groupaccesslist].[baseidx_groupaccesslist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_groupaccesslist] ON [dbo].[groupaccesslist] (
	[grpid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[grp_loc].[grp_loc_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [grp_loc_x0] ON [dbo].[grp_loc] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[grp_loc].[grp_loc_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [grp_loc_x1] ON [dbo].[grp_loc] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[grpmem].[grpmem_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [grpmem_x0] ON [dbo].[grpmem] (
	[group_id] ASC,
	[member] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[grpmem].[grpmem_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [grpmem_x1] ON [dbo].[grpmem] (
	[group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[grpmem].[grpmem_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [grpmem_x2] ON [dbo].[grpmem] (
	[member] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARACTION].[HARACTION_RTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARACTION_RTID_IND] ON [dbo].[HARACTION] (
	[resourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallchildrenpath].[HARACP_CHILDVERSION].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARACP_CHILDVERSION] ON [dbo].[harallchildrenpath] (
	[childitemid] ASC,
	[childversionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallchildrenpath].[HARACP_ITEMVERSION].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARACP_ITEMVERSION] ON [dbo].[harallchildrenpath] (
	[itemobjid] ASC,
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallchildrenpath].[HARALLCHILDRENPATH_CHILDITEM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARALLCHILDRENPATH_CHILDITEM] ON [dbo].[harallchildrenpath] (
	[childitemid] ASC,
	[childversionobjid] ASC,
	[itemobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallchildrenpath].[HARALLCHILDRENPATH_CHILDV_IDX].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARALLCHILDRENPATH_CHILDV_IDX] ON [dbo].[harallchildrenpath] (
	[childversionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallchildrenpath].[HARALLCHILDRENPATH_ITEMCHILD].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARALLCHILDRENPATH_ITEMCHILD] ON [dbo].[harallchildrenpath] (
	[itemobjid] ASC,
	[childitemid] ASC,
	[versionobjid] ASC,
	[childversionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallchildrenpath].[HARALLCHILDRENPATH_VERID_IDX].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARALLCHILDRENPATH_VERID_IDX] ON [dbo].[harallchildrenpath] (
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallusers].[HARALLUSERS_OBJIDNAME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARALLUSERS_OBJIDNAME] ON [dbo].[harallusers] (
	[usrobjid] ASC,
	[username] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harapprove].[harapprove_spid_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harapprove_spid_idx] ON [dbo].[harapprove] (
	[stateobjid] ASC,
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harapprovehist].[harapprhist_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harapprhist_ind] ON [dbo].[harapprovehist] (
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harapprovelist].[baseidx_harapprovelist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_harapprovelist] ON [dbo].[harapprovelist] (
	[processobjid] ASC,
	[stateobjid] ASC,
	[isgroup] ASC,
	[usrobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harapprovelist].[HARAPPROVELIST_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARAPPROVELIST_IND] ON [dbo].[harapprovelist] (
	[processobjid] ASC,
	[stateobjid] ASC,
	[isgroup] ASC,
	[usrobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harapprovelist].[HARAPPROVELIST_STGRP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAPPROVELIST_STGRP] ON [dbo].[harapprovelist] (
	[stateobjid] ASC,
	[isgroup] ASC)
INCLUDE (
	[processobjid],
	[usrgrpobjid],
	[usrobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harapprovelist].[harapprovelist_usrid_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harapprovelist_usrid_ind] ON [dbo].[harapprovelist] (
	[usrobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harassocpkg].[baseidx_harassocpkg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_harassocpkg] ON [dbo].[harassocpkg] (
	[formobjid] ASC,
	[assocpkgid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harassocpkg].[HARASSOCPKG_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARASSOCPKG_IND] ON [dbo].[harassocpkg] (
	[assocpkgid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENT].[HARAUDITEVENT_ACTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENT_ACTID_IND] ON [dbo].[HARAUDITEVENT] (
	[actionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENT].[HARAUDITEVENT_EVTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENT_EVTID_IND] ON [dbo].[HARAUDITEVENT] (
	[eventtime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENT].[HARAUDITEVENT_RESID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENT_RESID_IND] ON [dbo].[HARAUDITEVENT] (
	[resourceobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENT].[HARAUDITEVENT_RTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENT_RTID_IND] ON [dbo].[HARAUDITEVENT] (
	[resourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL1].[HARAUDITEVENTRSRCL1_RESID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENTRSRCL1_RESID_IND] ON [dbo].[HARAUDITEVENTRESOURCEL1] (
	[resourceobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL1].[HARAUDITEVENTRSRCL1_RTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENTRSRCL1_RTID_IND] ON [dbo].[HARAUDITEVENTRESOURCEL1] (
	[resourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL2].[HARAUDITEVENTRSRCL2_RESID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENTRSRCL2_RESID_IND] ON [dbo].[HARAUDITEVENTRESOURCEL2] (
	[resourceobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL2].[HARAUDITEVENTRSRCL2_RTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENTRSRCL2_RTID_IND] ON [dbo].[HARAUDITEVENTRESOURCEL2] (
	[resourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL3].[HARAUDITEVENTRSRCL3_RESID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENTRSRCL3_RESID_IND] ON [dbo].[HARAUDITEVENTRESOURCEL3] (
	[resourceobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL3].[HARAUDITEVENTRSRCL3_RTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENTRSRCL3_RTID_IND] ON [dbo].[HARAUDITEVENTRESOURCEL3] (
	[resourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL4].[HARAUDITEVENTRSRCL4_RESID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENTRSRCL4_RESID_IND] ON [dbo].[HARAUDITEVENTRESOURCEL4] (
	[resourceobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL4].[HARAUDITEVENTRSRCL4_RTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARAUDITEVENTRSRCL4_RTID_IND] ON [dbo].[HARAUDITEVENTRESOURCEL4] (
	[resourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harbranch].[HARBRANCH_ISMERGED].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARBRANCH_ISMERGED] ON [dbo].[harbranch] (
	[ismerged] ASC)
INCLUDE (
	[branchobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harbranch].[HARBRANCH_ITEMID_FK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARBRANCH_ITEMID_FK] ON [dbo].[harbranch] (
	[itemobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harbranch].[harbranch_itemid_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harbranch_itemid_ind] ON [dbo].[harbranch] (
	[itemobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harbranch].[HARBRANCH_PKG].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARBRANCH_PKG] ON [dbo].[harbranch] (
	[packageobjid] ASC,
	[itemobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardware_sd_server_matrix].[xif1hardware_sd_server_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1hardware_sd_server_matrix] ON [dbo].[hardware_sd_server_matrix] (
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardware_sd_server_matrix].[xif2hardware_sd_server_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2hardware_sd_server_matrix] ON [dbo].[hardware_sd_server_matrix] (
	[software_delivery_server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardware_software_dvy_jb_file].[xif1hard_soft_delivery_job_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1hard_soft_delivery_job_file] ON [dbo].[hardware_software_dvy_jb_file] (
	[asset_software_delivery_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardware_software_dvy_jb_file].[xif2hard_soft_delivery_job_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2hard_soft_delivery_job_file] ON [dbo].[hardware_software_dvy_jb_file] (
	[software_delivery_job_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harenvironment].[HARENVIRONMENT_ACTIVE_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARENVIRONMENT_ACTIVE_IND] ON [dbo].[harenvironment] (
	[envisactive] ASC,
	[isarchive] ASC,
	[envobjid] ASC)
INCLUDE (
	[archiveby],
	[archivefile],
	[archivemachine],
	[archivetime],
	[baselineviewid],
	[creationtime],
	[creatorid],
	[environmentname],
	[modifiedtime],
	[modifierid],
	[note]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harenvironment].[HARENVIRONMENT_ARCHIVE_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARENVIRONMENT_ARCHIVE_IND] ON [dbo].[harenvironment] (
	[isarchive] ASC,
	[envobjid] ASC,
	[envisactive] ASC)
INCLUDE (
	[archiveby],
	[archivefile],
	[archivemachine],
	[archivetime],
	[baselineviewid],
	[creationtime],
	[creatorid],
	[environmentname],
	[modifiedtime],
	[modifierid],
	[note]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harenvironment].[HARENVIRONMENT_BASELINE_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARENVIRONMENT_BASELINE_IND] ON [dbo].[harenvironment] (
	[baselineviewid] ASC)
INCLUDE (
	[environmentname]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harenvironment].[harenvironment_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [harenvironment_ind] ON [dbo].[harenvironment] (
	[environmentname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harform].[harform_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [harform_ind] ON [dbo].[harform] (
	[formname] ASC,
	[formtypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformattachment].[baseidx_harformattachment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_harformattachment] ON [dbo].[harformattachment] (
	[attachmentobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformattachment].[HARFORMATTACHMENT_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARFORMATTACHMENT_IND] ON [dbo].[harformattachment] (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformattachment].[HARFORMATTACHMENT_IND2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARFORMATTACHMENT_IND2] ON [dbo].[harformattachment] (
	[attachmentname] ASC,
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformhistory].[baseidx_harformhistory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_harformhistory] ON [dbo].[harformhistory] (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformhistory].[HARFORMHIST_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARFORMHIST_IND] ON [dbo].[harformhistory] (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformtype].[HARFORMTYPE_TABLENAME_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARFORMTYPE_TABLENAME_IND] ON [dbo].[harformtype] (
	[formtablename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformtype].[HARFORMTYPE_TYPENAME_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARFORMTYPE_TYPENAME_IND] ON [dbo].[harformtype] (
	[formtypename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformtypedefs].[HARFORMTYPEDEFS_ALT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARFORMTYPEDEFS_ALT] ON [dbo].[harformtypedefs] (
	[formtypeobjid] ASC,
	[columnname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformtypedefs].[HARFORMTYPEDEFS_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARFORMTYPEDEFS_IND] ON [dbo].[harformtypedefs] (
	[formtypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARGLOBALAUDITPOLICY].[HARGLOBALAUDITPOLICY_ACTID_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARGLOBALAUDITPOLICY_ACTID_IND] ON [dbo].[HARGLOBALAUDITPOLICY] (
	[actionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARGLOBALAUDITPOLICY].[HARGLOBALAUDITPOLICY_ENABLED].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARGLOBALAUDITPOLICY_ENABLED] ON [dbo].[HARGLOBALAUDITPOLICY] (
	[enabled] ASC)
INCLUDE (
	[actionobjid],
	[onfailure],
	[onsuccess]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritemaccess].[HARITEMACCESS_USRGRP].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARITEMACCESS_USRGRP] ON [dbo].[haritemaccess] (
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritemaccess].[haritemaccess_view].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [haritemaccess_view] ON [dbo].[haritemaccess] (
	[viewaccess] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARITEMNAME].[HARITEMNAME_ITEMNAME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARITEMNAME_ITEMNAME] ON [dbo].[HARITEMNAME] (
	[itemname] ASC,
	[nameobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARITEMNAME].[HARITEMNAME_ITEMNAMEUPPER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARITEMNAME_ITEMNAMEUPPER] ON [dbo].[HARITEMNAME] (
	[itemnameupper] ASC,
	[nameobjid] ASC)
INCLUDE (
	[itemname]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARITEMNAME].[HARITEMNAME_OBJIDNAME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARITEMNAME_OBJIDNAME] ON [dbo].[HARITEMNAME] (
	[nameobjid] ASC,
	[itemname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritemrelationship].[haritemrelationship_refitm_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [haritemrelationship_refitm_idx] ON [dbo].[haritemrelationship] (
	[refitemid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritemrelationship].[haritemrelationship_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [haritemrelationship_rel] ON [dbo].[haritemrelationship] (
	[relationship] ASC,
	[refitemid] ASC,
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[haritems_idx_002].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [haritems_idx_002] ON [dbo].[haritems] (
	[parentobjid] ASC,
	[itemobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[haritems_idx_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [haritems_idx_type] ON [dbo].[haritems] (
	[itemtype] ASC,
	[itemobjid] ASC,
	[parentobjid] ASC,
	[itemname] ASC,
	[repositobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[HARITEMS_IND_TYPE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARITEMS_IND_TYPE] ON [dbo].[haritems] (
	[itemtype] ASC,
	[parentobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[haritems_itemname].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [haritems_itemname] ON [dbo].[haritems] (
	[itemname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[HARITEMS_PARENTTYPE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARITEMS_PARENTTYPE] ON [dbo].[haritems] (
	[parentobjid] ASC,
	[itemtype] ASC,
	[itemobjid] ASC,
	[modifierid] ASC,
	[creatorid] ASC,
	[itemname] ASC,
	[repositobjid] ASC,
	[creationtime] ASC,
	[modifiedtime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[HARITEMS_REPID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARITEMS_REPID] ON [dbo].[haritems] (
	[repositobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[HARITEMS_REPOSITOBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARITEMS_REPOSITOBJID] ON [dbo].[haritems] (
	[repositobjid] ASC,
	[itemobjid] ASC)
INCLUDE (
	[creationtime],
	[creatorid],
	[itemtype],
	[modifiedtime],
	[modifierid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[HARITERMS_ITEMNAMEUPPPER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARITERMS_ITEMNAMEUPPPER] ON [dbo].[haritems] (
	[itemnameupper] ASC,
	[parentobjid] ASC,
	[itemobjid] ASC,
	[itemname] ASC,
	[repositobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harlinkedprocess].[HARLINKEDPROCESS_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARLINKEDPROCESS_IND] ON [dbo].[harlinkedprocess] (
	[parentprocobjid] ASC,
	[processname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harlinkedprocess].[HARLINKEDPROCESS_PARENT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARLINKEDPROCESS_PARENT] ON [dbo].[harlinkedprocess] (
	[parentprocobjid] ASC,
	[processprelink] ASC,
	[processorder] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harlinkedprocess].[HARLINKEDPROCESS_POBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARLINKEDPROCESS_POBJID] ON [dbo].[harlinkedprocess] (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harlinkedprocess].[HARLINKEDPROCESS_STATEOBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARLINKEDPROCESS_STATEOBJID] ON [dbo].[harlinkedprocess] (
	[stateobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harnotifylist].[baseidx_harnotifylist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_harnotifylist] ON [dbo].[harnotifylist] (
	[processobjid] ASC,
	[parentprocobjid] ASC,
	[stateobjid] ASC,
	[isgroup] ASC,
	[usrobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harnotifylist].[HARNOTIFYLIST_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARNOTIFYLIST_IND] ON [dbo].[harnotifylist] (
	[processobjid] ASC,
	[stateobjid] ASC,
	[parentprocobjid] ASC,
	[isgroup] ASC,
	[usrobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harnotifylist].[HARNOTIFYLIST_PARENTPROCOBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARNOTIFYLIST_PARENTPROCOBJID] ON [dbo].[harnotifylist] (
	[parentprocobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harnotifylist].[harnotifylist_spid_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harnotifylist_spid_ind] ON [dbo].[harnotifylist] (
	[stateobjid] ASC,
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harnotifylist].[harnotifylist_usrgrp_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harnotifylist_usrgrp_ind] ON [dbo].[harnotifylist] (
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harnotifylist].[harnotifylist_usrid_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harnotifylist_usrid_ind] ON [dbo].[harnotifylist] (
	[usrobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackage].[harpackage_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [harpackage_ind] ON [dbo].[harpackage] (
	[packagename] ASC,
	[envobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackage].[HARPACKAGE_IND_ENV].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARPACKAGE_IND_ENV] ON [dbo].[harpackage] (
	[envobjid] ASC,
	[stateobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackage].[harpackage_state_env_pobj].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harpackage_state_env_pobj] ON [dbo].[harpackage] (
	[stateobjid] ASC,
	[envobjid] ASC,
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackagegroup].[HARPKGGRP_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARPKGGRP_IND] ON [dbo].[harpackagegroup] (
	[envobjid] ASC,
	[pkggrpname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackagestatus].[harpackagestatus_c_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harpackagestatus_c_idx] ON [dbo].[harpackagestatus] (
	[clientname] ASC,
	[statusinfo] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackagestatus].[HARPACKAGESTATUS_S_IDX].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARPACKAGESTATUS_S_IDX] ON [dbo].[harpackagestatus] (
	[servername] ASC,
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpathfullname].[HARPATHFULLNAME_PATH].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARPATHFULLNAME_PATH] ON [dbo].[harpathfullname] (
	[pathfullname] ASC,
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpathfullname].[HARPATHFULLNAME_PUPPER].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARPATHFULLNAME_PUPPER] ON [dbo].[harpathfullname] (
	[pathfullnameupper] ASC,
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpkghistory].[baseidx_harpkghistory].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_harpkghistory] ON [dbo].[harpkghistory] (
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpkghistory].[HARPKGHIST_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARPKGHIST_IND] ON [dbo].[harpkghistory] (
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpkghistory].[HARPKGHISTORY_ACTION_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARPKGHISTORY_ACTION_IND] ON [dbo].[harpkghistory] (
	[action] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpkgsinpkggrp].[HARPKGSINPKGGRP_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARPKGSINPKGGRP_IND] ON [dbo].[harpkgsinpkggrp] (
	[pkggrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harrepinview].[HARREPINVIEW_REPID_FK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARREPINVIEW_REPID_FK] ON [dbo].[harrepinview] (
	[repositobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harrepository].[HARREPOSITORY_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARREPOSITORY_IND] ON [dbo].[harrepository] (
	[repositname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARSEQTABLE].[HARSEQTABLE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARSEQTABLE] ADD CONSTRAINT [HARSEQTABLE_PK] PRIMARY KEY NONCLUSTERED (
	[CTR] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstate].[HARSTATE_ENVOBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARSTATE_ENVOBJID] ON [dbo].[harstate] (
	[envobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstate].[harstate_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [harstate_ind] ON [dbo].[harstate] (
	[statename] ASC,
	[envobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstate].[HARSTATE_LIST].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARSTATE_LIST] ON [dbo].[harstate] (
	[envobjid] ASC,
	[stateobjid] ASC,
	[creatorid] ASC,
	[modifierid] ASC,
	[viewobjid] ASC,
	[statename] ASC,
	[stateorder] ASC,
	[snapshot] ASC,
	[locationx] ASC,
	[locationy] ASC,
	[creationtime] ASC,
	[modifiedtime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstateprocess].[HARSTATEPROC_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARSTATEPROC_IND] ON [dbo].[harstateprocess] (
	[stateobjid] ASC,
	[processname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstateprocess].[HARSTATEPROC_POBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARSTATEPROC_POBJID] ON [dbo].[harstateprocess] (
	[processobjid] ASC,
	[processname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstateprocess].[harstateprocess_pobjid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [harstateprocess_pobjid] ON [dbo].[harstateprocess] (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstateprocessaccess].[HARSTATEPROCESSACCESS_PUE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARSTATEPROCESSACCESS_PUE] ON [dbo].[harstateprocessaccess] (
	[processobjid] ASC,
	[usrgrpobjid] ASC,
	[executeaccess] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harudp].[HARUDP_PARENTPROCOBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUDP_PARENTPROCOBJID] ON [dbo].[harudp] (
	[parentprocobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harudp].[HARUDP_PSOBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARUDP_PSOBJID] ON [dbo].[harudp] (
	[processobjid] ASC,
	[processname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harudp].[HARUDP_PSTATEOBJID].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARUDP_PSTATEOBJID] ON [dbo].[harudp] (
	[processobjid] ASC,
	[stateobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusdcomputernames].[HARUSDCOMPUTERNAMES_NAME_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSDCOMPUTERNAMES_NAME_IND] ON [dbo].[harusdcomputernames] (
	[computername] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusddeployinfo].[HARUSDDEPLOYINFO_ATTACH_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSDDEPLOYINFO_ATTACH_IND] ON [dbo].[harusddeployinfo] (
	[attachmentobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusddeployinfo].[HARUSDDEPLOYINFO_FRM_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSDDEPLOYINFO_FRM_IND] ON [dbo].[harusddeployinfo] (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusddeployinfo].[HARUSDDEPLOYINFO_PKG_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSDDEPLOYINFO_PKG_IND] ON [dbo].[harusddeployinfo] (
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusdgroupnames].[HARUSDGROUPNAMES_NAME_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSDGROUPNAMES_NAME_IND] ON [dbo].[harusdgroupnames] (
	[groupname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusdpackageinfo].[HARUSDPACKAGEINFO_FRM_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSDPACKAGEINFO_FRM_IND] ON [dbo].[harusdpackageinfo] (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusdpackagenames].[HARUSDPACKAGENAMES_NAME_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSDPACKAGENAMES_NAME_IND] ON [dbo].[harusdpackagenames] (
	[nameversion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusdplatforminfo].[HARUSDPLATFORMINFO_FRM_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSDPLATFORMINFO_FRM_IND] ON [dbo].[harusdplatforminfo] (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haruser].[HARUSER_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARUSER_IND] ON [dbo].[haruser] (
	[username] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haruserdata].[baseidx_haruserdata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_haruserdata] ON [dbo].[haruserdata] (
	[usrobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusergroup].[HARUSERGROUP_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARUSERGROUP_IND] ON [dbo].[harusergroup] (
	[usergroupname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusersingroup].[HARUSERSINGROUP_BASELINE_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARUSERSINGROUP_BASELINE_IND] ON [dbo].[harusersingroup] (
	[usrgrpobjid] ASC)
INCLUDE (
	[usrobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusersingroup].[harusersingroup_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harusersingroup_grp] ON [dbo].[harusersingroup] (
	[usrgrpobjid] ASC,
	[usrobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversiondata].[HARVERSIONDATA_ITMID_FK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONDATA_ITMID_FK] ON [dbo].[harversiondata] (
	[itemobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversiondelta].[harversiondelta_parent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harversiondelta_parent] ON [dbo].[harversiondelta] (
	[parentversiondataid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversioninview].[harversioninview_ver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harversioninview_ver] ON [dbo].[harversioninview] (
	[versionobjid] ASC,
	[viewobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversioninview].[HARVERSIONINVIEW_VIEW].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONINVIEW_VIEW] ON [dbo].[harversioninview] (
	[viewobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversioninview].[HARVIV_VERS_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVIV_VERS_IND] ON [dbo].[harversioninview] (
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSION_NAMEIDPATHID_IDX].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSION_NAMEIDPATHID_IDX] ON [dbo].[harversions] (
	[PATHVERSIONID] ASC,
	[ITEMNAMEID] ASC)
INCLUDE (
	[itemobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSION_PKGBRANCHSTAT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSION_PKGBRANCHSTAT] ON [dbo].[harversions] (
	[packageobjid] ASC,
	[inbranch] ASC,
	[versionstatus] ASC,
	[ITEMTYPE] ASC)
INCLUDE (
	[ITEMNAMEID],
	[itemobjid],
	[PATHVERSIONID],
	[versionobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_DATA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_DATA] ON [dbo].[harversions] (
	[versiondataobjid] ASC)
INCLUDE (
	[versionobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_INBRTYPSTAT].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_INBRTYPSTAT] ON [dbo].[harversions] (
	[inbranch] ASC,
	[ITEMTYPE] ASC,
	[versionstatus] ASC)
INCLUDE (
	[itemobjid],
	[mappedversion],
	[mergedversionid],
	[packageobjid],
	[parentversionid],
	[versionobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_ITEM_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_ITEM_IND] ON [dbo].[harversions] (
	[itemobjid] ASC,
	[versionobjid] ASC,
	[PATHVERSIONID] ASC,
	[REFACTOR_BY] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_ITEMMAPPED].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_ITEMMAPPED] ON [dbo].[harversions] (
	[itemobjid] ASC,
	[mappedversion] ASC,
	[versionobjid] ASC,
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_MERGED_IDX].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_MERGED_IDX] ON [dbo].[harversions] (
	[mergedversionid] ASC,
	[versionobjid] ASC,
	[packageobjid] ASC,
	[parentversionid] ASC,
	[inbranch] ASC)
INCLUDE (
	[mappedversion]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_NAMEITEM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_NAMEITEM] ON [dbo].[harversions] (
	[ITEMNAMEID] ASC,
	[itemobjid] ASC,
	[versionobjid] ASC,
	[versionstatus] ASC,
	[inbranch] ASC,
	[PATHVERSIONID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_PAR_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_PAR_IND] ON [dbo].[harversions] (
	[parentversionid] ASC,
	[versionobjid] ASC,
	[packageobjid] ASC,
	[mergedversionid] ASC,
	[inbranch] ASC,
	[mappedversion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_PKG_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_PKG_IND] ON [dbo].[harversions] (
	[packageobjid] ASC,
	[modifierid] ASC,
	[creatorid] ASC,
	[versionstatus] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_REFACTORBY].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_REFACTORBY] ON [dbo].[harversions] (
	[REFACTOR_BY] ASC,
	[versionstatus] ASC)
INCLUDE (
	[itemobjid],
	[ITEMTYPE],
	[versionobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_STATUS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_STATUS] ON [dbo].[harversions] (
	[versionstatus] ASC,
	[itemobjid] ASC,
	[versionobjid] ASC,
	[REFACTOR_BY] ASC)
INCLUDE (
	[ITEMTYPE],
	[packageobjid]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_VC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_VC] ON [dbo].[harversions] (
	[itemobjid] ASC,
	[versionobjid] ASC,
	[versionstatus] ASC,
	[inbranch] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_VERITEM].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_VERITEM] ON [dbo].[harversions] (
	[versionobjid] ASC,
	[itemobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_VSTATUS].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONS_VSTATUS] ON [dbo].[harversions] (
	[itemobjid] ASC,
	[versionstatus] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARVERSIONTRACKING].[HARVERSIONTRACKING_FK_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVERSIONTRACKING_FK_IND] ON [dbo].[HARVERSIONTRACKING] (
	[VERSIONOBJID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harvest_subpackage_actions].[har_subpack_act_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [har_subpack_act_idx_01] ON [dbo].[harvest_subpackage_actions] (
	[ep_id] ASC,
	[sp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harview].[harview_baseline].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [harview_baseline] ON [dbo].[harview] (
	[viewobjid] ASC,
	[baselineviewid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harview].[HARVIEW_ENV_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVIEW_ENV_IND] ON [dbo].[harview] (
	[envobjid] ASC)
INCLUDE (
	[viewobjid],
	[viewtype]
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harview].[HARVIEW_NAME_IND].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARVIEW_NAME_IND] ON [dbo].[harview] (
	[viewname] ASC,
	[envobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harview].[HARVIEW_OBJIDNAME].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [HARVIEW_OBJIDNAME] ON [dbo].[harview] (
	[viewobjid] ASC,
	[viewname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harview].[harview_viewobjid_env].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [harview_viewobjid_env] ON [dbo].[harview] (
	[envobjid] ASC,
	[viewobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harview].[HARVIEW_VIEWTYPE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [HARVIEW_VIEWTYPE] ON [dbo].[harview] (
	[viewtype] ASC,
	[envobjid] ASC,
	[viewobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hier].[hier_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [hier_x0] ON [dbo].[hier] (
	[hier_parent] ASC,
	[hier_child] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_attribute].[baseidx_iam_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_iam_attribute] ON [dbo].[iam_attribute] (
	[object_guid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_attribute].[xif1iam_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1iam_attribute] ON [dbo].[iam_attribute] (
	[attribute_shortvalue] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_attribute].[xif2iam_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2iam_attribute] ON [dbo].[iam_attribute] (
	[attribute_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_attribute].[xif4iam_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4iam_attribute] ON [dbo].[iam_attribute] (
	[attribute_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_event].[xif1iam_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1iam_event] ON [dbo].[iam_event] (
	[attribute_shortvalue] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_event].[xif2iam_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2iam_event] ON [dbo].[iam_event] (
	[attribute_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_event].[xif3iam_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3iam_event] ON [dbo].[iam_event] (
	[event_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_object].[xif1iam_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1iam_object] ON [dbo].[iam_object] (
	[product_instance_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_object].[xif2iam_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2iam_object] ON [dbo].[iam_object] (
	[object_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_object].[xif4iam_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4iam_object] ON [dbo].[iam_object] (
	[object_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_object].[xif5iam_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif5iam_object] ON [dbo].[iam_object] (
	[object_link] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_object].[xiu1iam_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xiu1iam_object] ON [dbo].[iam_object] (
	[location_name] ASC,
	[object_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_grp].[icat_grp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [icat_grp_x0] ON [dbo].[icat_grp] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_grp].[icat_grp_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [icat_grp_x1] ON [dbo].[icat_grp] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_loc].[icat_loc_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [icat_loc_x0] ON [dbo].[icat_loc] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_loc].[icat_loc_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [icat_loc_x1] ON [dbo].[icat_loc] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_wrkshft].[icat_wrkshft_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [icat_wrkshft_x0] ON [dbo].[icat_wrkshft] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_wrkshft].[icat_wrkshft_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [icat_wrkshft_x1] ON [dbo].[icat_wrkshft] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[idmanager].[baseidx_idmanager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_idmanager] ON [dbo].[idmanager] (
	[idname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[impact].[impact_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [impact_x0] ON [dbo].[impact] (
	[enum] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[impact].[impact_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [impact_x1] ON [dbo].[impact] (
	[sym] ASC,
	[enum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[index_doc_links].[index_doc_links_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [index_doc_links_x0] ON [dbo].[index_doc_links] (
	[doc_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[index_doc_links].[index_doc_links_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [index_doc_links_x1] ON [dbo].[index_doc_links] (
	[index_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[index_doc_links].[index_doc_links_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [index_doc_links_x2] ON [dbo].[index_doc_links] (
	[relational_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[info].[baseidx_info].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_info] ON [dbo].[info] (
	[maxeid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[infolng].[infolng_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [infolng_sk1] ON [dbo].[infolng] (
	[itval] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[infolng].[infolng_sk2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [infolng_sk2] ON [dbo].[infolng] (
	[itprnmid] ASC,
	[itrootid] ASC,
	[itrtnmid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[infolng].[infolng_sk6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [infolng_sk6] ON [dbo].[infolng] (
	[itrootid] ASC,
	[itprnmid] ASC,
	[itdate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[infoqlt].[baseidx_infoqlt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_infoqlt] ON [dbo].[infoqlt] (
	[itident] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[infoqlt].[iqlt_groups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [iqlt_groups] ON [dbo].[infoqlt] (
	[itprnmid] ASC,
	[itrtnmid] ASC,
	[itident] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[instance_history].[baseidx_instance_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_instance_history] ON [dbo].[instance_history] (
	[processid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[instance_history].[instance_history_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [instance_history_ind1] ON [dbo].[instance_history] (
	[productid] ASC,
	[processid] ASC,
	[nodeid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[instances].[instances_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [instances_ind1] ON [dbo].[instances] (
	[productid] ASC,
	[definitionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[interface].[interface_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [interface_x0] ON [dbo].[interface] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[interfacechange].[baseidx_interfacechange].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_interfacechange] ON [dbo].[interfacechange] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[ifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_default_item].[inv_default_item_idx0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_default_item_idx0] ON [dbo].[inv_default_item] (
	[item_parent_name_id] ASC,
	[item_name_id] ASC,
	[item_root_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_default_tree].[inv_default_tree_index1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_default_tree_index1] ON [dbo].[inv_default_tree] (
	[object_uuid] ASC,
	[item_root_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_default_tree].[inv_default_tree_index2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_default_tree_index2] ON [dbo].[inv_default_tree] (
	[object_uuid] ASC,
	[item_parent_id] ASC,
	[item_name_id] ASC,
	[item_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_externaldevice_item].[baseidx_inv_externaldevice_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_inv_externaldevice_item] ON [dbo].[inv_externaldevice_item] (
	[object_uuid] ASC,
	[item_parent_id] ASC,
	[item_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_externaldevice_tree].[baseidx_inv_externaldevice_tree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_inv_externaldevice_tree] ON [dbo].[inv_externaldevice_tree] (
	[object_uuid] ASC,
	[item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_externaldevice_tree].[inv_externaldevice_tree_index1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_externaldevice_tree_index1] ON [dbo].[inv_externaldevice_tree] (
	[object_uuid] ASC,
	[item_root_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_externaldevice_tree].[inv_externaldevice_tree_index2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_externaldevice_tree_index2] ON [dbo].[inv_externaldevice_tree] (
	[object_uuid] ASC,
	[item_parent_id] ASC,
	[item_name_id] ASC,
	[item_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_item].[inv_generalinventory_browse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_generalinventory_browse] ON [dbo].[inv_generalinventory_item] (
	[item_root_name_id] ASC,
	[item_parent_name_id] ASC,
	[item_index] ASC,
	[domain_uuid] ASC,
	[item_type] ASC,
	[item_format] ASC,
	[item_name_id] ASC,
	[item_value_text] ASC,
	[item_value_long] ASC,
	[item_value_double] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_item].[inv_generalinventory_item_idx0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_generalinventory_item_idx0] ON [dbo].[inv_generalinventory_item] (
	[item_parent_name_id] ASC,
	[item_name_id] ASC,
	[item_root_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_item].[inv_generalinventory_item_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_generalinventory_item_idx1] ON [dbo].[inv_generalinventory_item] (
	[auto_rep_version] ASC,
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_tree].[inv_generalinventory_browse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_generalinventory_browse] ON [dbo].[inv_generalinventory_tree] (
	[item_root_name_id] ASC,
	[item_parent_name_id] ASC,
	[item_indent] ASC,
	[item_flag] ASC,
	[domain_uuid] ASC,
	[item_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_tree].[inv_generalinventory_tree_index1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_generalinventory_tree_index1] ON [dbo].[inv_generalinventory_tree] (
	[object_uuid] ASC,
	[item_root_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_tree].[inv_generalinventory_tree_index2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_generalinventory_tree_index2] ON [dbo].[inv_generalinventory_tree] (
	[object_uuid] ASC,
	[item_parent_id] ASC,
	[item_name_id] ASC,
	[item_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_tree].[inv_generalinventory_tree_index3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_generalinventory_tree_index3] ON [dbo].[inv_generalinventory_tree] (
	[auto_rep_version] ASC,
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_tree].[inv_rep_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_rep_idx1] ON [dbo].[inv_generalinventory_tree] (
	[object_uuid] ASC,
	[item_id] ASC,
	[item_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_performance_item].[inv_performance_item_idx0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [inv_performance_item_idx0] ON [dbo].[inv_performance_item] (
	[item_parent_name_id] ASC,
	[item_name_id] ASC,
	[item_root_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[investigation].[$inves_u0000355a00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$inves_u0000355a00000000] ON [dbo].[investigation] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[invgene].[invgene_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [invgene_sk1] ON [dbo].[invgene] (
	[gid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[invgene].[invgene_sk2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [invgene_sk2] ON [dbo].[invgene] (
	[iconkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iss_template].[iss_template_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [iss_template_x0] ON [dbo].[iss_template] (
	[template_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iss_template].[iss_template_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [iss_template_x1] ON [dbo].[iss_template] (
	[template_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issalg].[issalg_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issalg_x0] ON [dbo].[issalg] (
	[issue_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issalg].[issalg_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issalg_x1] ON [dbo].[issalg] (
	[time_stamp] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[isscat].[isscat_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [isscat_x0] ON [dbo].[isscat] (
	[sym] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[isscat].[isscat_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [isscat_x1] ON [dbo].[isscat] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[isscat].[isscat_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [isscat_x2] ON [dbo].[isscat] (
	[sym] ASC,
	[owning_contract] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[isscat].[isscat_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [isscat_x3] ON [dbo].[isscat] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issprp].[issprp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issprp_x0] ON [dbo].[issprp] (
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issprp].[issprp_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issprp_x1] ON [dbo].[issprp] (
	[owning_iss] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issstat].[issstat_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [issstat_x0] ON [dbo].[issstat] (
	[sym] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issstat].[issstat_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [issstat_x1] ON [dbo].[issstat] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issstat].[issstat_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [issstat_x2] ON [dbo].[issstat] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [issue_x0] ON [dbo].[issue] (
	[open_date] ASC,
	[ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x1] ON [dbo].[issue] (
	[requestor] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x10].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x10] ON [dbo].[issue] (
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x11] ON [dbo].[issue] (
	[parent] ASC,
	[ref_num] ASC,
	[open_date] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x12].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x12] ON [dbo].[issue] (
	[template_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x13].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x13] ON [dbo].[issue] (
	[close_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x14].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x14] ON [dbo].[issue] (
	[resolve_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x2] ON [dbo].[issue] (
	[log_agent] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [issue_x3] ON [dbo].[issue] (
	[ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x4] ON [dbo].[issue] (
	[assignee] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x5] ON [dbo].[issue] (
	[group_id] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x6] ON [dbo].[issue] (
	[category] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x7] ON [dbo].[issue] (
	[priority] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x8] ON [dbo].[issue] (
	[persid] ASC,
	[ref_num] ASC,
	[open_date] ASC,
	[active_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[issue_x9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [issue_x9] ON [dbo].[issue] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[isswf].[isswf_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [isswf_x0] ON [dbo].[isswf] (
	[object_id] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[isswf].[isswf_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [isswf_x1] ON [dbo].[isswf] (
	[assignee] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[itfcconfig].[baseidx_itfcconfig].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_itfcconfig] ON [dbo].[itfcconfig] (
	[probe_addr] ASC,
	[itfcindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[itfcconfig].[itfc_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [itfc_index] ON [dbo].[itfcconfig] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[itfcindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[itfcconfighist].[baseidx_itfcconfighist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_itfcconfighist] ON [dbo].[itfcconfighist] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[itfcindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_psr1].[jmo_psr1_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [jmo_psr1_idx_01] ON [dbo].[jmo_psr1] (
	[psr_pscd] ASC,
	[psr_pjob] ASC,
	[psr_pjno] ASC,
	[psr_pqua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_psrm].[jmo_psrm_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [jmo_psrm_idx_01] ON [dbo].[jmo_psrm] (
	[psr_pscd] ASC,
	[psr_pjob] ASC,
	[psr_pjno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_psrm].[jmo_psrm_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [jmo_psrm_idx_02] ON [dbo].[jmo_psrm] (
	[psr_pjob] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_psrt].[jmo_psrt_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [jmo_psrt_idx_01] ON [dbo].[jmo_psrt] (
	[psr_pscd] ASC,
	[psr_pjob] ASC,
	[psr_pjno] ASC,
	[psr_pqua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[job_object].[baseidx_job_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_job_object] ON [dbo].[job_object] (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[job_template].[baseidx_job_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_job_template] ON [dbo].[job_template] (
	[templateid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[job_template].[job_template_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [job_template_idx_01] ON [dbo].[job_template] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[joborder].[joborder_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [joborder_sk1] ON [dbo].[joborder] (
	[unitid] ASC,
	[udomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[joborder].[joborder_sk2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [joborder_sk2] ON [dbo].[joborder] (
	[jobid] ASC,
	[unitid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jobvisionpassword].[baseidx_jobvisionpassword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_jobvisionpassword] ON [dbo].[jobvisionpassword] (
	[password] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jobvisionvalues].[baseidx_jobvisionvalues].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_jobvisionvalues] ON [dbo].[jobvisionvalues] (
	[jv_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jv_box_job].[baseidx_jv_box_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_jv_box_job] ON [dbo].[jv_box_job] (
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jv_command_job].[baseidx_jv_command_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_jv_command_job] ON [dbo].[jv_command_job] (
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jv_fw_job].[baseidx_jv_fw_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_jv_fw_job] ON [dbo].[jv_fw_job] (
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jv_job].[baseidx_jv_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_jv_job] ON [dbo].[jv_job] (
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jv_keymaster].[baseidx_jv_keymaster].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_jv_keymaster] ON [dbo].[jv_keymaster] (
	[hostid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kd_attmnt].[kd_attmnt_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kd_attmnt_x0] ON [dbo].[kd_attmnt] (
	[doc_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kd_attmnt].[kd_attmnt_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kd_attmnt_x1] ON [dbo].[kd_attmnt] (
	[attmnt_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kdlinks].[kdlinks_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kdlinks_x0] ON [dbo].[kdlinks] (
	[kd] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kdlinks].[kdlinks_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kdlinks_x1] ON [dbo].[kdlinks] (
	[sd_obj_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kdlinks].[kdlinks_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kdlinks_x2] ON [dbo].[kdlinks] (
	[sd_obj_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kdlinks].[kdlinks_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kdlinks_x3] ON [dbo].[kdlinks] (
	[link_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kdlinks].[kdlinks_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kdlinks_x4] ON [dbo].[kdlinks] (
	[last_mod_by] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kdlinks].[kdlinks_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kdlinks_x5] ON [dbo].[kdlinks] (
	[cr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kdlinks].[kdlinks_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kdlinks_x6] ON [dbo].[kdlinks] (
	[iss] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[km_kword].[km_kword_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [km_kword_x0] ON [dbo].[km_kword] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[km_lrel].[km_lrel_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [km_lrel_x0] ON [dbo].[km_lrel] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[km_lrel].[km_lrel_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [km_lrel_x1] ON [dbo].[km_lrel] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_control].[kpi_control_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_control_idx1] ON [dbo].[kpi_control] (
	[kpi_id] ASC,
	[datetime] ASC,
	[dimension_2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_data].[kpi_data_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_data_idx1] ON [dbo].[kpi_data] (
	[kpi_id] ASC,
	[datetime] ASC,
	[dimension_2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_data].[kpi_data_idx2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_data_idx2] ON [dbo].[kpi_data] (
	[kpi_id] ASC,
	[datetime] ASC,
	[chart_element_label] ASC,
	[dimension_1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_exception_ack].[kpi_exception_ack_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_exception_ack_idx1] ON [dbo].[kpi_exception_ack] (
	[kpi_exception_id] ASC,
	[portal_user] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_exception_ack].[XPKkpi_exception_ack].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XPKkpi_exception_ack] ON [dbo].[kpi_exception_ack] (
	[kpi_exception_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_exceptions].[kpi_exceptions_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_exceptions_idx1] ON [dbo].[kpi_exceptions] (
	[kpi_id] ASC,
	[datetime] ASC,
	[exception_name_template] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_exceptions].[XPKkpi_exceptions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [XPKkpi_exceptions] ON [dbo].[kpi_exceptions] (
	[kpi_exception_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_infer_summary_docs].[kpi_infer_summary_docs_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_infer_summary_docs_idx1] ON [dbo].[kpi_infer_summary_docs] (
	[log_date] ASC,
	[raw_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_names].[kpi_names_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_names_idx1] ON [dbo].[kpi_names] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_process_stats].[kpi_process_stats_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_process_stats_idx1] ON [dbo].[kpi_process_stats] (
	[log_date] ASC,
	[msg_name_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_values].[kpi_values_idx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kpi_values_idx1] ON [dbo].[kpi_values] (
	[value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kt_report_card].[kt_report_card_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [kt_report_card_x0] ON [dbo].[kt_report_card] (
	[subject_id] ASC,
	[past_days] ASC,
	[org_statistics] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kt_report_card].[kt_report_card_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kt_report_card_x1] ON [dbo].[kt_report_card] (
	[total_votes] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kt_report_card].[kt_report_card_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kt_report_card_x2] ON [dbo].[kt_report_card] (
	[avg_rating] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kt_report_card].[kt_report_card_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [kt_report_card_x3] ON [dbo].[kt_report_card] (
	[user_slv_cnt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lac_filenames].[baseidx_lac_filenames].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lac_filenames] ON [dbo].[lac_filenames] (
	[strid] ASC,
	[serverid] ASC,
	[database_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lac_filter_names].[baseidx_lac_filter_names].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_lac_filter_names] ON [dbo].[lac_filter_names] (
	[filter_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lac_filter_objects].[baseidx_lac_filter_objects].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lac_filter_objects] ON [dbo].[lac_filter_objects] (
	[filter_name] ASC,
	[serverid] ASC,
	[database_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lac_job_output].[baseidx_lac_job_output].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lac_job_output] ON [dbo].[lac_job_output] (
	[strid] ASC,
	[serverid] ASC,
	[groupid] ASC,
	[jobid] ASC,
	[run_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lac_job_parms].[baseidx_lac_job_parms].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_lac_job_parms] ON [dbo].[lac_job_parms] (
	[strid] ASC,
	[serverid] ASC,
	[database_name] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lac_strategy_parms].[baseidx_lac_strategy_parms].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_lac_strategy_parms] ON [dbo].[lac_strategy_parms] (
	[strid] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lac_transactions].[baseidx_lac_transactions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lac_transactions] ON [dbo].[lac_transactions] (
	[strid] ASC,
	[serverid] ASC,
	[database_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ldapactors_worklist].[ldapactors_worklist_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ldapactors_worklist_ind1] ON [dbo].[ldapactors_worklist] (
	[productid] ASC,
	[users] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ldapactors_worklist].[ldapactors_worklist_ind2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ldapactors_worklist_ind2] ON [dbo].[ldapactors_worklist] (
	[productid] ASC,
	[workitemid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[linkjob].[linkjob_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [linkjob_sk1] ON [dbo].[linkjob] (
	[object_uuid] ASC,
	[object_domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[list].[baseidx_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_list] ON [dbo].[list] (
	[listid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[list].[list_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [list_idx_01] ON [dbo].[list] (
	[name] ASC,
	[owner] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[list].[list_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [list_idx_02] ON [dbo].[list] (
	[owner] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[listnodes].[baseidx_listnodes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_listnodes] ON [dbo].[listnodes] (
	[listid] ASC,
	[instanceid] ASC,
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[listproperties].[baseidx_listproperties].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_listproperties] ON [dbo].[listproperties] (
	[listid] ASC,
	[propertytype] ASC,
	[propertyid] ASC,
	[altpropid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[listproperties].[listproperties_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [listproperties_idx_01] ON [dbo].[listproperties] (
	[listid] ASC,
	[colno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[long_texts].[long_texts_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [long_texts_x0] ON [dbo].[long_texts] (
	[ref_persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[long_texts].[long_texts_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [long_texts_x1] ON [dbo].[long_texts] (
	[cnt_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lrel].[lrel_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lrel_x0] ON [dbo].[lrel] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lrel].[lrel_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lrel_x1] ON [dbo].[lrel] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyfileserverclients].[baseidx_lsyfileserverclients].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsyfileserverclients] ON [dbo].[lsyfileserverclients] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC,
	[servernetaddr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyfileserverclients].[lsyfileserverclientstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lsyfileserverclientstime] ON [dbo].[lsyfileserverclients] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyfileserverid].[baseidx_lsyfileserverid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_lsyfileserverid] ON [dbo].[lsyfileserverid] (
	[probe_addr] ASC,
	[probeindex] ASC,
	[fileserverkeyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyfileserverid].[lsyfileserverid_stindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lsyfileserverid_stindex] ON [dbo].[lsyfileserverid] (
	[fileserverservicetype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyfileserverstats].[baseidx_lsyfileserverstats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsyfileserverstats] ON [dbo].[lsyfileserverstats] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC,
	[fileserverkeyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyfileserverstats].[lsyfileserverstatstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lsyfileserverstatstime] ON [dbo].[lsyfileserverstats] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyhopdelay].[baseidx_lsyhopdelay].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsyhopdelay] ON [dbo].[lsyhopdelay] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[lsyprobeindex] ASC,
	[hopdelayindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyhopdelayid].[baseidx_lsyhopdelayid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsyhopdelayid] ON [dbo].[lsyhopdelayid] (
	[probe_addr] ASC,
	[lsyprobeindex] ASC,
	[hopdelayindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsylanprotocols].[baseidx_lsylanprotocols].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsylanprotocols] ON [dbo].[lsylanprotocols] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC,
	[protocoltypecategory] ASC,
	[protocoltypesubcategory] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsylanutilization].[baseidx_lsylanutilization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsylanutilization] ON [dbo].[lsylanutilization] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsynetnames].[baseidx_lsynetnames].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsynetnames] ON [dbo].[lsynetnames] (
	[probe_addr] ASC,
	[probeindex] ASC,
	[servicetype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyprobeid].[baseidx_lsyprobeid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_lsyprobeid] ON [dbo].[lsyprobeid] (
	[probe_addr] ASC,
	[probeindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsyprotocoltypes].[baseidx_lsyprotocoltypes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsyprotocoltypes] ON [dbo].[lsyprotocoltypes] (
	[protocoltype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytermserverclients].[baseidx_lsytermserverclients].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsytermserverclients] ON [dbo].[lsytermserverclients] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC,
	[servernetaddr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytermserverclients].[lsytermserverclientstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lsytermserverclientstime] ON [dbo].[lsytermserverclients] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytermserverid].[baseidx_lsytermserverid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_lsytermserverid] ON [dbo].[lsytermserverid] (
	[probe_addr] ASC,
	[probeindex] ASC,
	[termserverkeyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytermserverid].[lsytermserverid_stindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lsytermserverid_stindex] ON [dbo].[lsytermserverid] (
	[termserverservicetype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytermserverstats].[baseidx_lsytermserverstats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsytermserverstats] ON [dbo].[lsytermserverstats] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC,
	[termserverkeyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytermserverstats].[lsytermserverstatstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [lsytermserverstatstime] ON [dbo].[lsytermserverstats] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytopncast].[baseidx_lsytopncast].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsytopncast] ON [dbo].[lsytopncast] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytopnlinkerr].[baseidx_lsytopnlinkerr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsytopnlinkerr] ON [dbo].[lsytopnlinkerr] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytopnmatrix].[baseidx_lsytopnmatrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsytopnmatrix] ON [dbo].[lsytopnmatrix] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytopnnetrsp].[baseidx_lsytopnnetrsp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsytopnnetrsp] ON [dbo].[lsytopnnetrsp] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytopnroute].[baseidx_lsytopnroute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsytopnroute] ON [dbo].[lsytopnroute] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lsytopnroutedelay].[baseidx_lsytopnroutedelay].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_lsytopnroutedelay] ON [dbo].[lsytopnroutedelay] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[probeindex] ASC,
	[losubnet] ASC,
	[hisubnet] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[m2if].[baseidx_m2if].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_m2if] ON [dbo].[m2if] (
	[probe_addr] ASC,
	[dbindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[m2if].[m2if_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [m2if_index] ON [dbo].[m2if] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[dbindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[m2ifstats].[baseidx_m2ifstats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_m2ifstats] ON [dbo].[m2ifstats] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[ifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[m2ifstats].[m2ifstats_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [m2ifstats_index] ON [dbo].[m2ifstats] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[ifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[m2ifstats].[m2ifstatstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [m2ifstatstime] ON [dbo].[m2ifstats] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[m2ipstats].[baseidx_m2ipstats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_m2ipstats] ON [dbo].[m2ipstats] (
	[probe_addr] ASC,
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[m2ipstats].[m2ipstatstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [m2ipstatstime] ON [dbo].[m2ipstats] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mactoip].[baseidx_mactoip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_mactoip] ON [dbo].[mactoip] (
	[macaddress] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[managed_survey].[managed_survey_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [managed_survey_x0] ON [dbo].[managed_survey] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[management_asset_group].[baseidx_management_asset_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_management_asset_group] ON [dbo].[management_asset_group] (
	[assetnode] ASC,
	[id] ASC,
	[name] ASC,
	[asset] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[management_asset_group].[management_asset_grp_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [management_asset_grp_idx_01] ON [dbo].[management_asset_group] (
	[asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[management_groupid].[baseidx_management_groupid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_management_groupid] ON [dbo].[management_groupid] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[management_groups].[baseidx_management_groups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_management_groups] ON [dbo].[management_groups] (
	[id] ASC,
	[stationid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mgsalg].[mgsalg_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [mgsalg_x0] ON [dbo].[mgsalg] (
	[mgs_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mgsalg].[mgsalg_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [mgsalg_x1] ON [dbo].[mgsalg] (
	[time_stamp] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mgsstat].[mgsstat_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [mgsstat_x0] ON [dbo].[mgsstat] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mgsstat].[mgsstat_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [mgsstat_x1] ON [dbo].[mgsstat] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mibdefinition].[xie1mibdefinition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1mibdefinition] ON [dbo].[mibdefinition] (
	[description] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_server].[server_name_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [server_name_ind] ON [dbo].[mit_server] (
	[server_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_server].[server_type_ind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [server_type_ind] ON [dbo].[mit_server] (
	[server_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[monitorappl].[baseidx_monitorappl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_monitorappl] ON [dbo].[monitorappl] (
	[servicetype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[name].[baseidx_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_name] ON [dbo].[name] (
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nbarprotocol_cfg].[baseidx_nbarprotocol_cfg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_nbarprotocol_cfg] ON [dbo].[nbarprotocol_cfg] (
	[probe_addr] ASC,
	[supportedprotocolsindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nbarprotocol_stat].[baseidx_nbarprotocol_stat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_nbarprotocol_stat] ON [dbo].[nbarprotocol_stat] (
	[probe_addr] ASC,
	[allstatsprotocolsindex] ASC,
	[ifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nbarprotocol_stat].[nbarprotocol_statindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [nbarprotocol_statindex] ON [dbo].[nbarprotocol_stat] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nbarprotocolstatus_cfg].[baseidx_nbarprotocolstatus_cfg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_nbarprotocolstatus_cfg] ON [dbo].[nbarprotocolstatus_cfg] (
	[probe_addr] ASC,
	[ifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nbarprotocolstatus_stat].[baseidx_nbarprotocolstatus_stat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_nbarprotocolstatus_stat] ON [dbo].[nbarprotocolstatus_stat] (
	[probe_addr] ASC,
	[ifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nbarprotocolstatus_stat].[nbarprotocolstatus_stat_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [nbarprotocolstatus_stat_index] ON [dbo].[nbarprotocolstatus_stat] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncipc].[ncipc_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ncipc_sk1] ON [dbo].[ncipc] (
	[ipcsid] ASC,
	[sdomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncipc].[ncipc_sk3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ncipc_sk3] ON [dbo].[ncipc] (
	[ipcdate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncipc].[ncipc_sk4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ncipc_sk4] ON [dbo].[ncipc] (
	[ipctype] ASC,
	[ipctypex] ASC,
	[udomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncjobcfg].[ncjobcfg_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ncjobcfg_idx_01] ON [dbo].[ncjobcfg] (
	[job_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncjobcfg].[ncjobcfg_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ncjobcfg_sk1] ON [dbo].[ncjobcfg] (
	[joflag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncmodcfg].[ncmodcfg_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ncmodcfg_idx_01] ON [dbo].[ncmodcfg] (
	[module_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nctngref].[nctngref_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [nctngref_sk1] ON [dbo].[nctngref] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_alert].[alert_fieldindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [alert_fieldindex] ON [dbo].[network_alert] (
	[fieldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_alert].[alertfieldindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [alertfieldindex] ON [dbo].[network_alert] (
	[fieldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_alert].[alerttime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [alerttime] ON [dbo].[network_alert] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_alert].[baseidx_network_alert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_network_alert] ON [dbo].[network_alert] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[rsrcindex] ASC,
	[rsrcotherindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_groupid].[baseidx_network_groupid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_network_groupid] ON [dbo].[network_groupid] (
	[grptype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_groups].[baseidx_network_groups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_network_groups] ON [dbo].[network_groups] (
	[grpid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_probe].[baseidx_network_probe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_network_probe] ON [dbo].[network_probe] (
	[server_addr] ASC,
	[probe_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_probe].[network_probe_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [network_probe_index] ON [dbo].[network_probe] (
	[server_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_probe].[probeflag].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [probeflag] ON [dbo].[network_probe] (
	[collect_flags] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[neugentalerts].[baseidx_neugentalerts].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_neugentalerts] ON [dbo].[neugentalerts] (
	[alertnum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[neugentalerts].[neugentalerts_timeindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [neugentalerts_timeindex] ON [dbo].[neugentalerts] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[neugentexceptions].[baseidx_neugentexceptions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_neugentexceptions] ON [dbo].[neugentexceptions] (
	[alertnum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[neugentexceptions].[neugentexceptions_alertindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [neugentexceptions_alertindex] ON [dbo].[neugentexceptions] (
	[alertnum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[neugentreport].[baseidx_neugentreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_neugentreport] ON [dbo].[neugentreport] (
	[dattype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nonavail].[baseidx_nonavail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_nonavail] ON [dbo].[nonavail] (
	[probe_addr] ASC,
	[ifindex] ASC,
	[rsrcotherindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nonhealth].[baseidx_nonhealth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_nonhealth] ON [dbo].[nonhealth] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[not_log].[not_log_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [not_log_x0] ON [dbo].[not_log] (
	[nlh_c_addressee] ASC,
	[nlh_start] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[not_log].[not_log_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [not_log_x1] ON [dbo].[not_log] (
	[nlh_status] ASC,
	[nlh_c_addressee] ASC,
	[cmth_used] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[not_log].[not_log_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [not_log_x2] ON [dbo].[not_log] (
	[cntxt_obj] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[notification].[notification_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [notification_x0] ON [dbo].[notification] (
	[analyst_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[notification].[notification_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [notification_x1] ON [dbo].[notification] (
	[doc_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[notification].[notification_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [notification_x2] ON [dbo].[notification] (
	[ntf_level] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[noturg].[noturg_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [noturg_x0] ON [dbo].[noturg] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nr_com].[nr_com_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [nr_com_x0] ON [dbo].[nr_com] (
	[com_par_id] ASC,
	[com_dt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ntfl].[ntfl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ntfl_x0] ON [dbo].[ntfl] (
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_comments].[o_comments_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_comments_x0] ON [dbo].[o_comments] (
	[doc_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_comments].[o_comments_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_comments_x1] ON [dbo].[o_comments] (
	[ver_count] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_comments].[o_comments_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_comments_x2] ON [dbo].[o_comments] (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_comments].[o_comments_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_comments_x3] ON [dbo].[o_comments] (
	[comment_timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_events].[o_events_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_events_x0] ON [dbo].[o_events] (
	[entity_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_events].[o_events_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_events_x1] ON [dbo].[o_events] (
	[ver_count] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_events].[o_events_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_events_x2] ON [dbo].[o_events] (
	[wf_action_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_events].[o_events_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_events_x3] ON [dbo].[o_events] (
	[wf_user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_indexes].[o_indexes_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_indexes_x0] ON [dbo].[o_indexes] (
	[caption] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_indexes].[o_indexes_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_indexes_x1] ON [dbo].[o_indexes] (
	[permission_index_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_indexes].[o_indexes_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_indexes_x2] ON [dbo].[o_indexes] (
	[parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_indexes].[o_indexes_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_indexes_x3] ON [dbo].[o_indexes] (
	[relational_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_indexes].[o_indexes_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_indexes_x4] ON [dbo].[o_indexes] (
	[read_pgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_indexes].[o_indexes_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_indexes_x5] ON [dbo].[o_indexes] (
	[write_pgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_indexes].[o_indexes_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [o_indexes_x6] ON [dbo].[o_indexes] (
	[owner_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[objclasses].[objclasses_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [objclasses_ind1] ON [dbo].[objclasses] (
	[productid] ASC,
	[lastcheckin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[objectudp].[baseidx_objectudp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_objectudp] ON [dbo].[objectudp] (
	[objectid] ASC,
	[udpid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ols_area_def].[UQ__ols_area__4823FDB25D0E375A].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ols_area_def] ADD CONSTRAINT [UQ__ols_area__4823FDB25D0E375A] UNIQUE NONCLUSTERED (
	[label] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ols_area_def].[UQ__ols_area__985D6D6A5FEAA405].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ols_area_def] ADD CONSTRAINT [UQ__ols_area__985D6D6A5FEAA405] UNIQUE NONCLUSTERED (
	[area_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[openunit].[openunit_sk1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [openunit_sk1] ON [dbo].[openunit] (
	[opunit] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[opr_conview].[baseidx_opr_conview].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_opr_conview] ON [dbo].[opr_conview] (
	[opr_conv_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[opr_convusr].[baseidx_opr_convusr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_opr_convusr] ON [dbo].[opr_convusr] (
	[opr_convusr_name] ASC,
	[opr_convusr_user] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[opra_act].[baseidx_opra_act].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_opra_act] ON [dbo].[opra_act] (
	[opra_act_token] ASC,
	[opra_act_seqno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[opra_msg].[baseidx_opra_msg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_opra_msg] ON [dbo].[opra_msg] (
	[opra_msg_tkn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[options].[options_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [options_x0] ON [dbo].[options] (
	[app_name] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[p_groups].[p_groups_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [p_groups_x0] ON [dbo].[p_groups] (
	[grp_list_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_grp].[pcat_grp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pcat_grp_x0] ON [dbo].[pcat_grp] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_grp].[pcat_grp_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pcat_grp_x1] ON [dbo].[pcat_grp] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_loc].[pcat_loc_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pcat_loc_x0] ON [dbo].[pcat_loc] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_loc].[pcat_loc_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pcat_loc_x1] ON [dbo].[pcat_loc] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_wrkshft].[pcat_wrkshft_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pcat_wrkshft_x0] ON [dbo].[pcat_wrkshft] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_wrkshft].[pcat_wrkshft_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pcat_wrkshft_x1] ON [dbo].[pcat_wrkshft] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_bpv].[baseidx_pd_bpv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_pd_bpv] ON [dbo].[pd_bpv] (
	[bpv_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_bpv].[unique_bpv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [unique_bpv] ON [dbo].[pd_bpv] (
	[bpv_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_bpv_def].[baseidx_pd_bpv_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_pd_bpv_def] ON [dbo].[pd_bpv_def] (
	[bpv_id] ASC,
	[machine_id] ASC,
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_cluster_def].[baseidx_pd_cluster_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_pd_cluster_def] ON [dbo].[pd_cluster_def] (
	[parent_id] ASC,
	[child_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_cluster_ext].[baseidx_pd_cluster_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_pd_cluster_ext] ON [dbo].[pd_cluster_ext] (
	[machine_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_day].[idx_pd_day_date2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_pd_day_date2] ON [dbo].[pd_day] (
	[current_date_int] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_day].[pd_day_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_day] ADD CONSTRAINT [pd_day_pk] PRIMARY KEY NONCLUSTERED (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_day].[unique_day].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [unique_day] ON [dbo].[pd_day] (
	[current_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_machine].[idx_pd_machine1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [idx_pd_machine1] ON [dbo].[pd_machine] (
	[asset_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_machine].[pd_machine_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_machine] ADD CONSTRAINT [pd_machine_pk] PRIMARY KEY NONCLUSTERED (
	[machine_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_machine].[unique_machine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [unique_machine] ON [dbo].[pd_machine] (
	[machine_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_machine_ext].[baseidx_pd_machine_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_pd_machine_ext] ON [dbo].[pd_machine_ext] (
	[machine_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_resource].[pd_resource_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_resource] ADD CONSTRAINT [pd_resource_pk] PRIMARY KEY NONCLUSTERED (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_resource].[unique_resource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [unique_resource] ON [dbo].[pd_resource] (
	[res_type] ASC,
	[res_subtype] ASC,
	[res_instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_time].[$pd_ti_u0000148a00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$pd_ti_u0000148a00000000] ON [dbo].[pd_time] (
	[time_value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_time].[pd_time_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_time] ADD CONSTRAINT [pd_time_pk] PRIMARY KEY NONCLUSTERED (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[permit_profile].[baseidx_permit_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_permit_profile] ON [dbo].[permit_profile] (
	[usernode] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[permit_profile].[permit_profile_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [permit_profile_idx_01] ON [dbo].[permit_profile] (
	[usernode] ASC,
	[userid] ASC,
	[usertype] ASC,
	[assetid] ASC,
	[assetnode] ASC,
	[assettype] ASC,
	[accesstype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[permit_profile].[permit_profile_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [permit_profile_idx_02] ON [dbo].[permit_profile] (
	[assetid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[permit_profile].[permit_profile_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [permit_profile_idx_03] ON [dbo].[permit_profile] (
	[usernode] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[permit_profile].[permit_profile_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [permit_profile_idx_04] ON [dbo].[permit_profile] (
	[userid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[perscon].[perscon_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [perscon_x0] ON [dbo].[perscon] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[policytable].[baseidx_policytable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_policytable] ON [dbo].[policytable] (
	[policyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[polidef].[polidef_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [polidef_idx_01] ON [dbo].[polidef] (
	[policy_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_audience].[xpkaudience].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_audience] ADD CONSTRAINT [xpkaudience] PRIMARY KEY NONCLUSTERED (
	[audience_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_dftpage].[baseidx_por_dftpage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_dftpage] ON [dbo].[por_dftpage] (
	[group_objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_dftpage].[dpagegrpobkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dpagegrpobkey] ON [dbo].[por_dftpage] (
	[group_objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_dftpage].[dpageusrobkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [dpageusrobkey] ON [dbo].[por_dftpage] (
	[user_objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion].[baseidx_por_discussion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_discussion] ON [dbo].[por_discussion] (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion].[discchanged].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [discchanged] ON [dbo].[por_discussion] (
	[changed] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion].[discdepth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [discdepth] ON [dbo].[por_discussion] (
	[depth] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion].[discobkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [discobkey] ON [dbo].[por_discussion] (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion].[discownerid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [discownerid] ON [dbo].[por_discussion] (
	[ownerid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion].[discpathid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [discpathid] ON [dbo].[por_discussion] (
	[pathid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion_nfy].[baseidx_por_discussion_nfy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_discussion_nfy] ON [dbo].[por_discussion_nfy] (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion_nfy].[discnfyobkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [discnfyobkey] ON [dbo].[por_discussion_nfy] (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion_nfy].[discnfypathid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [discnfypathid] ON [dbo].[por_discussion_nfy] (
	[pathid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_discussion_nfy].[discnfyuserid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [discnfyuserid] ON [dbo].[por_discussion_nfy] (
	[userid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_distrib_item].[xpkdistribution_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_distrib_item] ADD CONSTRAINT [xpkdistribution_item] PRIMARY KEY NONCLUSTERED (
	[distrib_item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_distrib_order].[xpkdistribution_order].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_distrib_order] ADD CONSTRAINT [xpkdistribution_order] PRIMARY KEY NONCLUSTERED (
	[distrib_order_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_distrib_order_state].[xpkdistribution_order_state].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_distrib_order_state] ADD CONSTRAINT [xpkdistribution_order_state] PRIMARY KEY NONCLUSTERED (
	[distrib_order_state_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_distrib_summary].[xpkdistribution_summary].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_distrib_summary] ADD CONSTRAINT [xpkdistribution_summary] PRIMARY KEY NONCLUSTERED (
	[wp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_document].[docdoctype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [docdoctype] ON [dbo].[por_document] (
	[doctype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_document].[docexpires].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [docexpires] ON [dbo].[por_document] (
	[expires] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_document].[docfilename].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [docfilename] ON [dbo].[por_document] (
	[filename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_document].[docisrequired].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [docisrequired] ON [dbo].[por_document] (
	[isrequired] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_document].[doclocation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [doclocation] ON [dbo].[por_document] (
	[location] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_document].[docreluri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [docreluri] ON [dbo].[por_document] (
	[relativeuri] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_document].[docshortcut].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [docshortcut] ON [dbo].[por_document] (
	[shortcut] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_global].[baseidx_por_global].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_global] ON [dbo].[por_global] (
	[zipremote] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_mime_type_mapping].[$por_m_u0000365f00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$por_m_u0000365f00000000] ON [dbo].[por_mime_type_mapping] (
	[mime_type] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_mime_type_mapping].[xak1por_mime_type_mapping].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1por_mime_type_mapping] ON [dbo].[por_mime_type_mapping] (
	[mime_type] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_mime_type_mapping].[xpkmime_type_mapping].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_mime_type_mapping] ADD CONSTRAINT [xpkmime_type_mapping] PRIMARY KEY NONCLUSTERED (
	[mime_type_maping_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_objectrepos].[objobjectname].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [objobjectname] ON [dbo].[por_objectrepos] (
	[objectname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_objectrepos].[objownerid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [objownerid] ON [dbo].[por_objectrepos] (
	[ownerid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_objectrepos].[objpassword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [objpassword] ON [dbo].[por_objectrepos] (
	[password] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_objectrepos].[objtypekey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [objtypekey] ON [dbo].[por_objectrepos] (
	[objecttypekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_pagecols].[pagecol_pageid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pagecol_pageid] ON [dbo].[por_pagecols] (
	[portalpage_id_fk] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_pagecomps].[baseidx_por_pagecomps].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_pagecomps] ON [dbo].[por_pagecomps] (
	[component_title] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_pagecomps].[compsdocidfk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [compsdocidfk] ON [dbo].[por_pagecomps] (
	[document_id_fk] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_pagecomps].[pagecomps_colid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pagecomps_colid] ON [dbo].[por_pagecomps] (
	[compcolumnid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_pages].[pagesuserkeyfk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pagesuserkeyfk] ON [dbo].[por_pages] (
	[user_objectkey_fk] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portal_instance].[xpkportal_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_portal_instance] ADD CONSTRAINT [xpkportal_instance] PRIMARY KEY NONCLUSTERED (
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_applic].[$por_p_u000035f300000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$por_p_u000035f300000000] ON [dbo].[por_portlet_applic] (
	[portlet_applic_alias] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_applic].[xak1portlet_application].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1portlet_application] ON [dbo].[por_portlet_applic] (
	[portlet_applic_alias] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_applic].[xpkportlet_application].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_portlet_applic] ADD CONSTRAINT [xpkportlet_application] PRIMARY KEY NONCLUSTERED (
	[portlet_applic_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_defn].[$por_p_u0000360200000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$por_p_u0000360200000000] ON [dbo].[por_portlet_defn] (
	[portlet_defn_alias] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_defn].[xak1portlet_definition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1portlet_definition] ON [dbo].[por_portlet_defn] (
	[portlet_defn_alias] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_defn].[xpkportlet_definition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_portlet_defn] ADD CONSTRAINT [xpkportlet_definition] PRIMARY KEY NONCLUSTERED (
	[portlet_defn_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_entity].[$por_p_u0000360d00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$por_p_u0000360d00000000] ON [dbo].[por_portlet_entity] (
	[portlet_entity_alias] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_entity].[xak1portlet_entity].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1portlet_entity] ON [dbo].[por_portlet_entity] (
	[portlet_entity_alias] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_entity].[xpkportlet_entity].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_portlet_entity] ADD CONSTRAINT [xpkportlet_entity] PRIMARY KEY NONCLUSTERED (
	[portlet_entity_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_portlet_user_prefs].[xpkportlet_user_preferences].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_portlet_user_prefs] ADD CONSTRAINT [xpkportlet_user_preferences] PRIMARY KEY NONCLUSTERED (
	[portlet_user_prefs_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_preferences].[baseidx_por_preferences].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_preferences] ON [dbo].[por_preferences] (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_preferences].[prefname].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [prefname] ON [dbo].[por_preferences] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_preferences].[prefobjectkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [prefobjectkey] ON [dbo].[por_preferences] (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_preferences].[prefuserkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [prefuserkey] ON [dbo].[por_preferences] (
	[userkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_prefsconfig].[baseidx_por_prefsconfig].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_prefsconfig] ON [dbo].[por_prefsconfig] (
	[group_objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_prefsconfig].[prefcongrpkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [prefcongrpkey] ON [dbo].[por_prefsconfig] (
	[group_objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_property].[xpkproperty].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_property] ADD CONSTRAINT [xpkproperty] PRIMARY KEY NONCLUSTERED (
	[property_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_relationships].[baseidx_por_relationships].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_relationships] ON [dbo].[por_relationships] (
	[parentkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_relationships].[relchild].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [relchild] ON [dbo].[por_relationships] (
	[childkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_relationships].[relparent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [relparent] ON [dbo].[por_relationships] (
	[parentkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_relationships].[reltype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [reltype] ON [dbo].[por_relationships] (
	[relationshiptype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_session].[baseidx_por_session].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_session] ON [dbo].[por_session] (
	[sid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_session].[sesslastactime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sesslastactime] ON [dbo].[por_session] (
	[lastaccesstime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_session].[sesssid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sesssid] ON [dbo].[por_session] (
	[sid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_session].[sessuserkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sessuserkey] ON [dbo].[por_session] (
	[userkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_session].[sessusername].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sessusername] ON [dbo].[por_session] (
	[username] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_sessobjpw].[baseidx_por_sessobjpw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_sessobjpw] ON [dbo].[por_sessobjpw] (
	[sid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_sessobjpw].[sessobjpwsid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sessobjpwsid] ON [dbo].[por_sessobjpw] (
	[sid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_template].[tmpltdefptr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [tmpltdefptr] ON [dbo].[por_template] (
	[defptr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_templatelookup].[baseidx_por_templatelookup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_templatelookup] ON [dbo].[por_templatelookup] (
	[templatekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_templatelookup].[templateindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [templateindex] ON [dbo].[por_templatelookup] (
	[idx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_templatelookup].[templatekey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [templatekey] ON [dbo].[por_templatelookup] (
	[templatekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_translog].[baseidx_por_translog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_por_translog] ON [dbo].[por_translog] (
	[createdatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp].[$por_w_u0000361c00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$por_w_u0000361c00000000] ON [dbo].[por_wp] (
	[wp_alias] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp].[xak1workplace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1workplace] ON [dbo].[por_wp] (
	[wp_alias] ASC,
	[portal_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp].[xpkworkplace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wp] ADD CONSTRAINT [xpkworkplace] PRIMARY KEY NONCLUSTERED (
	[wp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp_fav].[xpkworkplace_favorites].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wp_fav] ADD CONSTRAINT [xpkworkplace_favorites] PRIMARY KEY NONCLUSTERED (
	[wp_fav_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp_fav_dflt].[xpkworkplace_favorites_default].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wp_fav_dflt] ADD CONSTRAINT [xpkworkplace_favorites_default] PRIMARY KEY NONCLUSTERED (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp_layout_data].[xpkworkplace_layout_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wp_layout_data] ADD CONSTRAINT [xpkworkplace_layout_data] PRIMARY KEY NONCLUSTERED (
	[layout_id] ASC,
	[wp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp_metadata].[xpkworkplace_metadata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wp_metadata] ADD CONSTRAINT [xpkworkplace_metadata] PRIMARY KEY NONCLUSTERED (
	[wp_metadata_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp_metadata_cat].[xpkworkplace_metadata_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wp_metadata_cat] ADD CONSTRAINT [xpkworkplace_metadata_category] PRIMARY KEY NONCLUSTERED (
	[cat_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp_portlet].[xpkworkplace_portlet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wp_portlet] ADD CONSTRAINT [xpkworkplace_portlet] PRIMARY KEY NONCLUSTERED (
	[wp_portlet_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wp_to_wp_fav].[xpkworkplace_to_workplace_fav].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wp_to_wp_fav] ADD CONSTRAINT [xpkworkplace_to_workplace_fav] PRIMARY KEY NONCLUSTERED (
	[wp_to_wp_fav_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wsrp_portlet_handle].[xpkwsrp_portlet_handle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wsrp_portlet_handle] ADD CONSTRAINT [xpkwsrp_portlet_handle] PRIMARY KEY NONCLUSTERED (
	[wsrp_reg_id] ASC,
	[portlet_alias_handle] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wsrp_prod].[xpkwsrp_producer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wsrp_prod] ADD CONSTRAINT [xpkwsrp_producer] PRIMARY KEY NONCLUSTERED (
	[wsrp_prod_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wsrp_reg].[xpkwsrp_registration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wsrp_reg] ADD CONSTRAINT [xpkwsrp_registration] PRIMARY KEY NONCLUSTERED (
	[wsrp_reg_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wsrp_reg_context].[xpkwsrp_registration_context].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wsrp_reg_context] ADD CONSTRAINT [xpkwsrp_registration_context] PRIMARY KEY NONCLUSTERED (
	[wsrp_reg_context_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_wsrp_reg_data].[xpkwsrp_registration_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_wsrp_reg_data] ADD CONSTRAINT [xpkwsrp_registration_data] PRIMARY KEY NONCLUSTERED (
	[wsrp_reg_data_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pri].[pri_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [pri_x0] ON [dbo].[pri] (
	[enum] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pri].[pri_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [pri_x1] ON [dbo].[pri] (
	[sym] ASC,
	[enum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[prob_ctg].[prob_ctg_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [prob_ctg_x0] ON [dbo].[prob_ctg] (
	[sym] ASC,
	[persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[prob_ctg].[prob_ctg_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [prob_ctg_x1] ON [dbo].[prob_ctg] (
	[persid] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[prob_ctg].[prob_ctg_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [prob_ctg_x2] ON [dbo].[prob_ctg] (
	[sym] ASC,
	[owning_contract] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[probeaccesslist].[baseidx_probeaccesslist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_probeaccesslist] ON [dbo].[probeaccesslist] (
	[userid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[probeaccesslist].[probeaccesslist_ix1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [probeaccesslist_ix1] ON [dbo].[probeaccesslist] (
	[probe_addr] ASC,
	[userid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[process_snapshots].[PK__process___CE3613B045F5C7D8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[process_snapshots] ADD CONSTRAINT [PK__process___CE3613B045F5C7D8] PRIMARY KEY NONCLUSTERED (
	[productid] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[process_snapshots].[process_snapshots_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [process_snapshots_ind1] ON [dbo].[process_snapshots] (
	[productid] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[process_snapshots].[process_snapshots_ind2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [process_snapshots_ind2] ON [dbo].[process_snapshots] (
	[productid] ASC,
	[definitionid] ASC,
	[versionid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[product].[product_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [product_x0] ON [dbo].[product] (
	[sym] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[productids].[productids_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [productids_ind1] ON [dbo].[productids] (
	[serverid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[productids].[productids_ind2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [productids_ind2] ON [dbo].[productids] (
	[lastcheckin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[provider_user].[provider_user_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [provider_user_idx_01] ON [dbo].[provider_user] (
	[provider_name] ASC,
	[product_code] ASC,
	[username] ASC,
	[provider_number] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[prp].[prp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [prp_x0] ON [dbo].[prp] (
	[object_id] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[prptpl].[prptpl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [prptpl_x0] ON [dbo].[prptpl] (
	[object_type] ASC,
	[object_attrname] ASC,
	[object_attrval] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[quick_tpl_types].[quick_tpl_types_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [quick_tpl_types_x0] ON [dbo].[quick_tpl_types] (
	[enum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rbooltab].[rbooltab_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [rbooltab_x0] ON [dbo].[rbooltab] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[region].[baseidx_region].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_region] ON [dbo].[region] (
	[regionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[region].[region_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [region_idx_01] ON [dbo].[region] (
	[regionname] ASC,
	[instancename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[region].[region_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [region_idx_02] ON [dbo].[region] (
	[regiontype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[region].[region_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [region_idx_03] ON [dbo].[region] (
	[parentregionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[region].[region_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [region_idx_04] ON [dbo].[region] (
	[parentboxid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rem_ref].[rem_ref_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [rem_ref_x0] ON [dbo].[rem_ref] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[repmeth].[repmeth_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [repmeth_x0] ON [dbo].[repmeth] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[reportdescr].[baseidx_reportdescr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_reportdescr] ON [dbo].[reportdescr] (
	[rptindex] ASC,
	[rptpart] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[resnonhealth].[baseidx_resnonhealth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_resnonhealth] ON [dbo].[resnonhealth] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[ifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[resnonhealth].[resnonhealth_timeidx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [resnonhealth_timeidx] ON [dbo].[resnonhealth] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[resource].[$resou_u0000354400000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$resou_u0000354400000000] ON [dbo].[resource] (
	[filename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[resourcemonitoring].[xie1resourcemonitoring].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1resourcemonitoring] ON [dbo].[resourcemonitoring] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[mibidx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[resourcemonitoring].[xie2resourcemonitoring].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie2resourcemonitoring] ON [dbo].[resourcemonitoring] (
	[probe_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[resourcemonitoring].[xie3resourcemonitoring].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie3resourcemonitoring] ON [dbo].[resourcemonitoring] (
	[mibidx] ASC,
	[probe_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[resourcename].[baseidx_resourcename].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_resourcename] ON [dbo].[resourcename] (
	[probe_addr] ASC,
	[rsrcindex] ASC,
	[rsrcotherindex] ASC,
	[rsrctype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[response].[response_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [response_x0] ON [dbo].[response] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[response].[response_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [response_x1] ON [dbo].[response] (
	[response_owner] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[response].[response_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [response_x2] ON [dbo].[response] (
	[cr_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[response].[response_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [response_x3] ON [dbo].[response] (
	[in_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[response].[response_x4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [response_x4] ON [dbo].[response] (
	[pr_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[response].[response_x5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [response_x5] ON [dbo].[response] (
	[chg_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[response].[response_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [response_x6] ON [dbo].[response] (
	[iss_flag] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmconfiguration].[baseidx_rmconfiguration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_rmconfiguration] ON [dbo].[rmconfiguration] (
	[optionname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmoaddress].[baseidx_rmoaddress].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_rmoaddress] ON [dbo].[rmoaddress] (
	[address] ASC,
	[inx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2addressmap].[baseidx_rmon2addressmap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmon2addressmap] ON [dbo].[rmon2addressmap] (
	[probe_addr] ASC,
	[protocoldirrmindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2alhost].[baseidx_rmon2alhost].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmon2alhost] ON [dbo].[rmon2alhost] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[protocoldirrmappindex] ASC,
	[alhostdatasource] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2alhost].[rmon2alhost_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rmon2alhost_index] ON [dbo].[rmon2alhost] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[alhostdatasource] ASC,
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2alhost].[rmon2alhosttime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rmon2alhosttime] ON [dbo].[rmon2alhost] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2nlmatrix].[baseidx_rmon2nlmatrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmon2nlmatrix] ON [dbo].[rmon2nlmatrix] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[protocoldirrmappindex] ASC,
	[nlmatrixdatasource] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2nlmatrix].[rmon2nlmatrix_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rmon2nlmatrix_index] ON [dbo].[rmon2nlmatrix] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[nlmatrixdatasource] ASC,
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2nlmatrix].[rmon2nlmatrixtime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rmon2nlmatrixtime] ON [dbo].[rmon2nlmatrix] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2protocoldist].[baseidx_rmon2protocoldist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmon2protocoldist] ON [dbo].[rmon2protocoldist] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[protocoldirrmindex] ASC,
	[protocoldistdatasource] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2protocoldist].[rmon2protocoldisttime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rmon2protocoldisttime] ON [dbo].[rmon2protocoldist] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2protocoldistcontrol].[baseidx_rmon2protocoldistcontrol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmon2protocoldistcontrol] ON [dbo].[rmon2protocoldistcontrol] (
	[probe_addr] ASC,
	[protocoldistcontrolindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2protocolid].[baseidx_rmon2protocolid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_rmon2protocolid] ON [dbo].[rmon2protocolid] (
	[protocoldirrmindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2protocolid].[rm2protocolid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [rm2protocolid] ON [dbo].[rmon2protocolid] (
	[protocoldirid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmon2protocolproperties].[baseidx_rmon2protocolproperties].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmon2protocolproperties] ON [dbo].[rmon2protocolproperties] (
	[probe_addr] ASC,
	[protocoldirrmindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmonetherstatsid].[baseidx_rmonetherstatsid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmonetherstatsid] ON [dbo].[rmonetherstatsid] (
	[probe_addr] ASC,
	[etherstatsindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmonetherstatsstats].[baseidx_rmonetherstatsstats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmonetherstatsstats] ON [dbo].[rmonetherstatsstats] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[etherstatsindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmonetherstatsstats].[rmonetherstatsstatstime].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rmonetherstatsstatstime] ON [dbo].[rmonetherstatsstats] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmonhostcontrol].[baseidx_rmonhostcontrol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmonhostcontrol] ON [dbo].[rmonhostcontrol] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[hostcontrolindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmonhosttopnstat].[baseidx_rmonhosttopnstat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmonhosttopnstat] ON [dbo].[rmonhosttopnstat] (
	[probe_addr] ASC,
	[intervaldatetime] ASC,
	[hostcontrolindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmonrptquerydata].[baseidx_rmonrptquerydata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmonrptquerydata] ON [dbo].[rmonrptquerydata] (
	[spid] ASC,
	[rpid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rmonrptquerytempdata].[baseidx_rmonrptquerytempdata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rmonrptquerytempdata] ON [dbo].[rmonrptquerytempdata] (
	[spid] ASC,
	[rpid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rootcause].[rootcause_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [rootcause_x0] ON [dbo].[rootcause] (
	[sym] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rptmth].[rptmth_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rptmth_x0] ON [dbo].[rptmth] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rptree].[rptree_idx0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rptree_idx0] ON [dbo].[rptree] (
	[root] ASC,
	[ownerid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rttctrladmin_cfg].[baseidx_rttctrladmin_cfg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rttctrladmin_cfg] ON [dbo].[rttctrladmin_cfg] (
	[probe_addr] ASC,
	[ctrladminindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rttctrladmin_cfg].[rttctrladmin_cfg_typeindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rttctrladmin_cfg_typeindex] ON [dbo].[rttctrladmin_cfg] (
	[ctrladminrtttype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rttechoadmin_cfg].[baseidx_rttechoadmin_cfg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rttechoadmin_cfg] ON [dbo].[rttechoadmin_cfg] (
	[probe_addr] ASC,
	[echoadminprotocol] ASC,
	[ctrladminindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rttjitter_stat].[baseidx_rttjitter_stat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rttjitter_stat] ON [dbo].[rttjitter_stat] (
	[probe_addr] ASC,
	[jitterstatsstarttimeindex] ASC,
	[ctrladminindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rttjitter_stat].[rttjitter_stat_timeindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rttjitter_stat_timeindex] ON [dbo].[rttjitter_stat] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rttstatscapture_stat].[baseidx_rttstatscapture_stat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rttstatscapture_stat] ON [dbo].[rttstatscapture_stat] (
	[probe_addr] ASC,
	[statscapturestarttimeindex] ASC,
	[ctrladminindex] ASC,
	[statscapturedistindex] ASC,
	[statscapturehopindex] ASC,
	[statscapturepathindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rttstatscoll_stat].[baseidx_rttstatscoll_stat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_rttstatscoll_stat] ON [dbo].[rttstatscoll_stat] (
	[probe_addr] ASC,
	[ctrladminindex] ASC,
	[statscapturehopindex] ASC,
	[statscapturepathindex] ASC,
	[statscapturestarttimeindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rttstatscoll_stat].[rttstatscoll_stat_timeindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [rttstatscoll_stat_timeindex] ON [dbo].[rttstatscoll_stat] (
	[intervaldatetime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sapolicy].[sapolicy_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [sapolicy_x0] ON [dbo].[sapolicy] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[saprobtyp].[saprobtyp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [saprobtyp_x0] ON [dbo].[saprobtyp] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_app_bp_kpi].[baseidx_scc_app_bp_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_app_bp_kpi] ON [dbo].[scc_app_bp_kpi] (
	[bpname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_app_hist].[baseidx_scc_app_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_app_hist] ON [dbo].[scc_app_hist] (
	[appuuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_app_loc_kpi].[baseidx_scc_app_loc_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_app_loc_kpi] ON [dbo].[scc_app_loc_kpi] (
	[locname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_app_org_kpi].[baseidx_scc_app_org_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_app_org_kpi] ON [dbo].[scc_app_org_kpi] (
	[orgname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_app_prop].[baseidx_scc_app_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_app_prop] ON [dbo].[scc_app_prop] (
	[appuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_app_total_kpi].[baseidx_scc_app_total_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_app_total_kpi] ON [dbo].[scc_app_total_kpi] (
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_app_type_kpi].[baseidx_scc_app_type_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_app_type_kpi] ON [dbo].[scc_app_type_kpi] (
	[type] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_asset_bp_kpi].[baseidx_scc_asset_bp_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_asset_bp_kpi] ON [dbo].[scc_asset_bp_kpi] (
	[bpname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_asset_hist].[baseidx_scc_asset_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_asset_hist] ON [dbo].[scc_asset_hist] (
	[assetuuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_asset_loc_kpi].[baseidx_scc_asset_loc_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_asset_loc_kpi] ON [dbo].[scc_asset_loc_kpi] (
	[locname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_asset_org_kpi].[baseidx_scc_asset_org_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_asset_org_kpi] ON [dbo].[scc_asset_org_kpi] (
	[orgname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_asset_prop].[baseidx_scc_asset_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_asset_prop] ON [dbo].[scc_asset_prop] (
	[assetuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_asset_total_kpi].[baseidx_scc_asset_total_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_asset_total_kpi] ON [dbo].[scc_asset_total_kpi] (
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_asset_type_kpi].[baseidx_scc_asset_type_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_asset_type_kpi] ON [dbo].[scc_asset_type_kpi] (
	[type] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_asset_vendor_kpi].[baseidx_scc_asset_vendor_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_asset_vendor_kpi] ON [dbo].[scc_asset_vendor_kpi] (
	[vendor] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_bp_prop].[baseidx_scc_bp_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_bp_prop] ON [dbo].[scc_bp_prop] (
	[bpuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_cfg_prop].[baseidx_scc_cfg_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_cfg_prop] ON [dbo].[scc_cfg_prop] (
	[cfguuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_exbox_hist].[baseidx_scc_exbox_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_exbox_hist] ON [dbo].[scc_exbox_hist] (
	[appuuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_exbox_prop].[baseidx_scc_exbox_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_exbox_prop] ON [dbo].[scc_exbox_prop] (
	[appuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_exusr_hist].[baseidx_scc_exusr_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_exusr_hist] ON [dbo].[scc_exusr_hist] (
	[exusrname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_exusr_prop].[baseidx_scc_exusr_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_exusr_prop] ON [dbo].[scc_exusr_prop] (
	[exusrname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_hs_prop].[baseidx_scc_hs_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_hs_prop] ON [dbo].[scc_hs_prop] (
	[hsuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_hscfg_prop].[baseidx_scc_hscfg_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_hscfg_prop] ON [dbo].[scc_hscfg_prop] (
	[hscfguuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_lib_hist].[baseidx_scc_lib_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_lib_hist] ON [dbo].[scc_lib_hist] (
	[libuuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_lib_prop].[baseidx_scc_lib_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_lib_prop] ON [dbo].[scc_lib_prop] (
	[libuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_loc_prop].[baseidx_scc_loc_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_loc_prop] ON [dbo].[scc_loc_prop] (
	[locuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_managed_cfg_prop].[baseidx_scc_managed_cfg_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_managed_cfg_prop] ON [dbo].[scc_managed_cfg_prop] (
	[assettype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_mda_hist].[baseidx_scc_mda_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_mda_hist] ON [dbo].[scc_mda_hist] (
	[mdauuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_mda_prop].[baseidx_scc_mda_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_mda_prop] ON [dbo].[scc_mda_prop] (
	[mdauuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_msg_prop].[baseidx_scc_msg_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_msg_prop] ON [dbo].[scc_msg_prop] (
	[msguuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_org_prop].[baseidx_scc_org_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_org_prop] ON [dbo].[scc_org_prop] (
	[orguuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_snp_hist].[baseidx_scc_snp_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_snp_hist] ON [dbo].[scc_snp_hist] (
	[snpuuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_snp_prop].[baseidx_scc_snp_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_snp_prop] ON [dbo].[scc_snp_prop] (
	[snpuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_srv_bp_kpi].[baseidx_scc_srv_bp_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_srv_bp_kpi] ON [dbo].[scc_srv_bp_kpi] (
	[bpname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_srv_hist].[baseidx_scc_srv_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_srv_hist] ON [dbo].[scc_srv_hist] (
	[srvuuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_srv_loc_kpi].[baseidx_scc_srv_loc_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_srv_loc_kpi] ON [dbo].[scc_srv_loc_kpi] (
	[locname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_srv_org_kpi].[baseidx_scc_srv_org_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_srv_org_kpi] ON [dbo].[scc_srv_org_kpi] (
	[orgname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_srv_prop].[baseidx_scc_srv_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_srv_prop] ON [dbo].[scc_srv_prop] (
	[srvuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_srv_total_kpi].[baseidx_scc_srv_total_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_srv_total_kpi] ON [dbo].[scc_srv_total_kpi] (
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_srv_type_kpi].[baseidx_scc_srv_type_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_srv_type_kpi] ON [dbo].[scc_srv_type_kpi] (
	[type] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_swt_hist].[baseidx_scc_swt_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_swt_hist] ON [dbo].[scc_swt_hist] (
	[swtuuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_swt_prop].[baseidx_scc_swt_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_swt_prop] ON [dbo].[scc_swt_prop] (
	[swtuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_bp_kpi].[baseidx_scc_sys_bp_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_bp_kpi] ON [dbo].[scc_sys_bp_kpi] (
	[bpname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_hist].[baseidx_scc_sys_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_hist] ON [dbo].[scc_sys_hist] (
	[sysuuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_loc_kpi].[baseidx_scc_sys_loc_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_loc_kpi] ON [dbo].[scc_sys_loc_kpi] (
	[locname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_org_kpi].[baseidx_scc_sys_org_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_org_kpi] ON [dbo].[scc_sys_org_kpi] (
	[orgname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_os_kpi].[baseidx_scc_sys_os_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_os_kpi] ON [dbo].[scc_sys_os_kpi] (
	[os] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_prop].[baseidx_scc_sys_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_prop] ON [dbo].[scc_sys_prop] (
	[sysuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_tier_kpi].[baseidx_scc_sys_tier_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_tier_kpi] ON [dbo].[scc_sys_tier_kpi] (
	[tier] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_total_kpi].[baseidx_scc_sys_total_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_total_kpi] ON [dbo].[scc_sys_total_kpi] (
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_sys_type_kpi].[baseidx_scc_sys_type_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_sys_type_kpi] ON [dbo].[scc_sys_type_kpi] (
	[type] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_bp_kpi].[baseidx_scc_vfs_bp_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_bp_kpi] ON [dbo].[scc_vfs_bp_kpi] (
	[bpname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_hist].[baseidx_scc_vfs_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_hist] ON [dbo].[scc_vfs_hist] (
	[voluuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_loc_kpi].[baseidx_scc_vfs_loc_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_loc_kpi] ON [dbo].[scc_vfs_loc_kpi] (
	[locname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_org_kpi].[baseidx_scc_vfs_org_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_org_kpi] ON [dbo].[scc_vfs_org_kpi] (
	[orgname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_os_kpi].[baseidx_scc_vfs_os_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_os_kpi] ON [dbo].[scc_vfs_os_kpi] (
	[volos] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_prop].[baseidx_scc_vfs_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_prop] ON [dbo].[scc_vfs_prop] (
	[voluuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_tier_kpi].[baseidx_scc_vfs_tier_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_tier_kpi] ON [dbo].[scc_vfs_tier_kpi] (
	[voltier] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_total_kpi].[baseidx_scc_vfs_total_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_total_kpi] ON [dbo].[scc_vfs_total_kpi] (
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vfs_type_kpi].[baseidx_scc_vfs_type_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vfs_type_kpi] ON [dbo].[scc_vfs_type_kpi] (
	[voltype] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_app_kpi].[baseidx_scc_vol_app_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_app_kpi] ON [dbo].[scc_vol_app_kpi] (
	[appname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_app_rel].[baseidx_scc_vol_app_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_app_rel] ON [dbo].[scc_vol_app_rel] (
	[appuuid] ASC,
	[voluuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_bp_kpi].[baseidx_scc_vol_bp_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_bp_kpi] ON [dbo].[scc_vol_bp_kpi] (
	[bpname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_hist].[baseidx_scc_vol_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_hist] ON [dbo].[scc_vol_hist] (
	[voluuid] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_loc_kpi].[baseidx_scc_vol_loc_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_loc_kpi] ON [dbo].[scc_vol_loc_kpi] (
	[locname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_org_kpi].[baseidx_scc_vol_org_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_org_kpi] ON [dbo].[scc_vol_org_kpi] (
	[orgname] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_os_kpi].[baseidx_scc_vol_os_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_os_kpi] ON [dbo].[scc_vol_os_kpi] (
	[os] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_prop].[baseidx_scc_vol_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_prop] ON [dbo].[scc_vol_prop] (
	[voluuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_tier_kpi].[baseidx_scc_vol_tier_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_tier_kpi] ON [dbo].[scc_vol_tier_kpi] (
	[tier] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_total_kpi].[baseidx_scc_vol_total_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_total_kpi] ON [dbo].[scc_vol_total_kpi] (
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[scc_vol_type_kpi].[baseidx_scc_vol_type_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_scc_vol_type_kpi] ON [dbo].[scc_vol_type_kpi] (
	[type] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sd_server_download_file].[xif1sd_server_download_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1sd_server_download_file] ON [dbo].[sd_server_download_file] (
	[software_delivery_server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sd_server_download_file].[xif2sd_server_download_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2sd_server_download_file] ON [dbo].[sd_server_download_file] (
	[download_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sdsc_map].[sdsc_map_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sdsc_map_x0] ON [dbo].[sdsc_map] (
	[map_contract] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sdsc_map].[sdsc_map_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [sdsc_map_x1] ON [dbo].[sdsc_map] (
	[map_contract] ASC,
	[map_persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[search].[baseidx_search].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_search] ON [dbo].[search] (
	[aid] ASC,
	[normkey] ASC,
	[eid] ASC,
	[vid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[search].[isearch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [isearch] ON [dbo].[search] (
	[eid] ASC,
	[aid] ASC,
	[vid] ASC,
	[normkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[secure_job].[$secur_u0000355300000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$secur_u0000355300000000] ON [dbo].[secure_job] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[securitypredicate].[securitypredicate_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [securitypredicate_ind1] ON [dbo].[securitypredicate] (
	[productid] ASC,
	[definitionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[seosdata].[baseidx_seosdata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_seosdata] ON [dbo].[seosdata] (
	[entryid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[seosdata].[ix_computername].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_computername] ON [dbo].[seosdata] (
	[computername] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[seosdata].[ix_timestamp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_timestamp] ON [dbo].[seosdata] (
	[timstamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[seosdata].[ix_username].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_username] ON [dbo].[seosdata] (
	[username] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[seqctl].[seqctl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [seqctl_x0] ON [dbo].[seqctl] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[seqctl].[seqctl_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [seqctl_x1] ON [dbo].[seqctl] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[serviceproviders].[serviceproviders_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [serviceproviders_ind1] ON [dbo].[serviceproviders] (
	[productid] ASC,
	[adapter] ASC,
	[serviceprovider] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sessionlength].[sessionlengthindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sessionlengthindex] ON [dbo].[sessionlength] (
	[start_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sevrty].[sevrty_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [sevrty_x0] ON [dbo].[sevrty] (
	[sym] ASC,
	[enum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sevrty].[sevrty_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [sevrty_x1] ON [dbo].[sevrty] (
	[enum] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[show_obj].[show_obj_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [show_obj_x0] ON [dbo].[show_obj] (
	[obj_persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_prop].[baseidx_si_ci_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_si_ci_prop] ON [dbo].[si_ci_prop] (
	[ci_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_prop].[ix_si_ci_prop_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_ci_prop_1] ON [dbo].[si_ci_prop] (
	[parent_uuid] ASC,
	[vendor_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_prop].[ix_si_ci_prop_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_ci_prop_2] ON [dbo].[si_ci_prop] (
	[uam_dom_id] ASC,
	[uam_uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_prop].[ix_si_ci_prop_3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_ci_prop_3] ON [dbo].[si_ci_prop] (
	[ci_family] ASC,
	[vendor_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_rec_rel].[baseidx_si_ci_rec_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_si_ci_rec_rel] ON [dbo].[si_ci_rec_rel] (
	[rec_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_rec_rel].[ix_si_ci_rec_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_ci_rec_rel] ON [dbo].[si_ci_rec_rel] (
	[ci_uuid] ASC,
	[assignee_org] ASC,
	[customer_org] ASC,
	[rec_ref_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_rec_rel].[xak1si_ci_rec_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xak1si_ci_rec_rel] ON [dbo].[si_ci_rec_rel] (
	[rec_uuid] ASC,
	[assignee_org] ASC,
	[assignee_loc] ASC,
	[rec_category] ASC,
	[rec_ref_num] ASC,
	[ci_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_rec_rel].[xif2si_ci_rec_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2si_ci_rec_rel] ON [dbo].[si_ci_rec_rel] (
	[rec_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_cnt_org_rel].[baseidx_si_cnt_org_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_si_cnt_org_rel] ON [dbo].[si_cnt_org_rel] (
	[cnt_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_cnt_org_rel].[ix_si_cnt_org_rel_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_cnt_org_rel_1] ON [dbo].[si_cnt_org_rel] (
	[rel_org_name] ASC,
	[rel_org_location] ASC,
	[org_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_cnt_org_rel].[xif2si_cnt_org_rel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2si_cnt_org_rel] ON [dbo].[si_cnt_org_rel] (
	[org_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_contact_prop].[baseidx_si_contact_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_si_contact_prop] ON [dbo].[si_contact_prop] (
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_contact_prop].[xak1si_contact_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1si_contact_prop] ON [dbo].[si_contact_prop] (
	[location] ASC,
	[combo_name] ASC,
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_contact_prop].[xak2si_contact_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak2si_contact_prop] ON [dbo].[si_contact_prop] (
	[uspsd_org_uuid] ASC,
	[usi_org_uuid] ASC,
	[manager_uuid] ASC,
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_contact_prop].[xak3si_contact_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak3si_contact_prop] ON [dbo].[si_contact_prop] (
	[active] ASC,
	[location] ASC,
	[type] ASC,
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_contact_prop].[xak4si_contact_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak4si_contact_prop] ON [dbo].[si_contact_prop] (
	[active] ASC,
	[type] ASC,
	[combo_name] ASC,
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_contact_prop].[xak5si_contact_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak5si_contact_prop] ON [dbo].[si_contact_prop] (
	[uspsd_org_name] ASC,
	[combo_name] ASC,
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_financial_prop].[baseidx_si_financial_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_si_financial_prop] ON [dbo].[si_financial_prop] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_financial_prop].[ix_si_financial_prop_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_financial_prop_1] ON [dbo].[si_financial_prop] (
	[type] ASC,
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_financial_prop].[ix_si_financial_prop_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_financial_prop_2] ON [dbo].[si_financial_prop] (
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_kpi_hist].[baseidx_si_kpi_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_si_kpi_hist] ON [dbo].[si_kpi_hist] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_kpi_hist].[xak1si_kpi_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1si_kpi_hist] ON [dbo].[si_kpi_hist] (
	[uuid] ASC,
	[last_update_date] ASC,
	[kpi_uuid] ASC,
	[data_sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_kpi_prop].[baseidx_si_kpi_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_si_kpi_prop] ON [dbo].[si_kpi_prop] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_kpi_prop].[xak1si_kpi_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1si_kpi_prop] ON [dbo].[si_kpi_prop] (
	[name] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_legdoc_ci_rel].[IX_si_legdoc_ci_rel_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_si_legdoc_ci_rel_1] ON [dbo].[si_legdoc_ci_rel] (
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_legdoc_prop].[IX_si_legdoc_prop_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_si_legdoc_prop_1] ON [dbo].[si_legdoc_prop] (
	[legdoc_uuid] ASC,
	[data_source] ASC,
	[term_dt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_log_prop].[baseidx_si_log_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_si_log_prop] ON [dbo].[si_log_prop] (
	[rec_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_log_prop].[ix_si_log_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_log_prop] ON [dbo].[si_log_prop] (
	[rec_uuid] ASC,
	[type] ASC,
	[assignee_loc] ASC,
	[assignee_group] ASC,
	[assignee_org] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_log_prop].[ix_si_log_prop_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_log_prop_1] ON [dbo].[si_log_prop] (
	[type] ASC,
	[rec_state] ASC,
	[rec_uuid] ASC,
	[rec_type] ASC,
	[rec_category] ASC,
	[actual_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_log_prop].[ix_si_log_prop_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_log_prop_2] ON [dbo].[si_log_prop] (
	[type] ASC,
	[rec_state] ASC,
	[rec_status] ASC,
	[rec_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_org_prop].[baseidx_si_org_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_si_org_prop] ON [dbo].[si_org_prop] (
	[org_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_org_prop].[ix_si_org_prop_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_org_prop_1] ON [dbo].[si_org_prop] (
	[primary_contact_name] ASC,
	[location] ASC,
	[org_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_org_prop].[ix_si_org_prop_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_org_prop_2] ON [dbo].[si_org_prop] (
	[parent_org_uuid] ASC,
	[org_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_org_prop].[ix_si_org_prop_3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_org_prop_3] ON [dbo].[si_org_prop] (
	[name] ASC,
	[org_uuid] ASC,
	[manager] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_pri_prop].[IX_si_pri_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [IX_si_pri_prop] ON [dbo].[si_pri_prop] (
	[data_source] ASC,
	[enum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[baseidx_si_rec_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_si_rec_prop] ON [dbo].[si_rec_prop] (
	[persid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[ix_si_rec_prop_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_si_rec_prop_1] ON [dbo].[si_rec_prop] (
	[active] ASC,
	[state] ASC,
	[category] ASC,
	[rec_uuid] ASC,
	[open_date] ASC,
	[ref_num] ASC,
	[time_to_violate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[ix_si_rec_prop_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_rec_prop_2] ON [dbo].[si_rec_prop] (
	[open_date] ASC,
	[close_date] ASC,
	[rec_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[ix_si_rec_prop_3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_rec_prop_3] ON [dbo].[si_rec_prop] (
	[assigned_org] ASC,
	[rec_uuid] ASC,
	[violate_status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[ix_si_rec_prop_4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_rec_prop_4] ON [dbo].[si_rec_prop] (
	[customer_loc] ASC,
	[rec_uuid] ASC,
	[violate_status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[ix_si_rec_prop_5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_rec_prop_5] ON [dbo].[si_rec_prop] (
	[customer_org] ASC,
	[rec_uuid] ASC,
	[violate_status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[ix_si_rec_prop_7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_rec_prop_7] ON [dbo].[si_rec_prop] (
	[group_name] ASC,
	[rec_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[ix_si_rec_prop_8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_rec_prop_8] ON [dbo].[si_rec_prop] (
	[time_to_violate] ASC,
	[rec_uuid] ASC,
	[si_sla_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_survey_kpi].[baseidx_si_survey_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_si_survey_kpi] ON [dbo].[si_survey_kpi] (
	[answer_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_survey_kpi].[xak1si_survey_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1si_survey_kpi] ON [dbo].[si_survey_kpi] (
	[answer_dt] ASC,
	[tracking_object_id] ASC,
	[answer_id] ASC,
	[question_id] ASC,
	[owning_survey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_survey_kpi].[xak2si_survey_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak2si_survey_kpi] ON [dbo].[si_survey_kpi] (
	[answer_dt] ASC,
	[owning_survey] ASC,
	[question_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_survey_kpi].[xak3si_survey_kpi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak3si_survey_kpi] ON [dbo].[si_survey_kpi] (
	[answer_dt] ASC,
	[answer_id] ASC,
	[question_id] ASC,
	[survey_name] ASC,
	[tracking_object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_wf_prop].[baseidx_si_wf_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_si_wf_prop] ON [dbo].[si_wf_prop] (
	[wf_uuid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_wf_prop].[ix_si_wf_prop_1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_wf_prop_1] ON [dbo].[si_wf_prop] (
	[rec_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_wf_prop].[ix_si_wf_prop_2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_wf_prop_2] ON [dbo].[si_wf_prop] (
	[rec_category] ASC,
	[rec_uuid] ASC,
	[wf_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_wf_prop].[ix_si_wf_prop_3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_wf_prop_3] ON [dbo].[si_wf_prop] (
	[rec_end_user_loc] ASC,
	[rec_end_user_org] ASC,
	[wf_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_wf_prop].[ix_si_wf_prop_5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_wf_prop_5] ON [dbo].[si_wf_prop] (
	[rec_category] ASC,
	[task_type] ASC,
	[violate_status] ASC,
	[wf_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_wf_prop].[ix_si_wf_prop_6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ix_si_wf_prop_6] ON [dbo].[si_wf_prop] (
	[rec_category] ASC,
	[task_type] ASC,
	[wf_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[simpleevent].[baseidx_simpleevent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_simpleevent] ON [dbo].[simpleevent] (
	[processid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x0] ON [dbo].[skeletons] (
	[active_state] ASC,
	[read_pgroup] ASC,
	[owner_id] ASC,
	[assignee_id] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x1] ON [dbo].[skeletons] (
	[active_state] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x10].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x10] ON [dbo].[skeletons] (
	[hits] ASC,
	[modify_date] ASC,
	[read_pgroup] ASC,
	[owner_id] ASC,
	[assignee_id] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x11] ON [dbo].[skeletons] (
	[inherit_permission] ASC,
	[kd_permission_index_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x12].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x12] ON [dbo].[skeletons] (
	[user_def_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x13].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x13] ON [dbo].[skeletons] (
	[kd_permission_index_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x17].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x17] ON [dbo].[skeletons] (
	[owner_id] ASC,
	[active_state] ASC,
	[read_pgroup] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x18].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x18] ON [dbo].[skeletons] (
	[assignee_id] ASC,
	[active_state] ASC,
	[read_pgroup] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x19].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x19] ON [dbo].[skeletons] (
	[primary_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x2] ON [dbo].[skeletons] (
	[author_id] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x21].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x21] ON [dbo].[skeletons] (
	[published_date] ASC,
	[read_pgroup] ASC,
	[modify_date] ASC,
	[owner_id] ASC,
	[assignee_id] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x24].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x24] ON [dbo].[skeletons] (
	[sd_accepted_hits] ASC,
	[modify_date] ASC,
	[read_pgroup] ASC,
	[owner_id] ASC,
	[assignee_id] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x3] ON [dbo].[skeletons] (
	[bu_result] ASC,
	[modify_date] ASC,
	[read_pgroup] ASC,
	[owner_id] ASC,
	[assignee_id] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x32].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x32] ON [dbo].[skeletons] (
	[wf_template] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x35].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x35] ON [dbo].[skeletons] (
	[indexed] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x42].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x42] ON [dbo].[skeletons] (
	[current_action_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x6] ON [dbo].[skeletons] (
	[doc_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[skeletons_x8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [skeletons_x8] ON [dbo].[skeletons] (
	[expiration_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[slatpl].[slatpl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [slatpl_x0] ON [dbo].[slatpl] (
	[object_type] ASC,
	[service_type] ASC,
	[elapsed] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[slatpl].[slatpl_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [slatpl_x1] ON [dbo].[slatpl] (
	[event] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_file_params].[xif1software_dlry_file_params].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1software_dlry_file_params] ON [dbo].[software_delivery_file_params] (
	[application_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_file_params].[xif2software_dlry_file_params].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2software_dlry_file_params] ON [dbo].[software_delivery_file_params] (
	[download_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_job].[xif1software_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1software_delivery_job] ON [dbo].[software_delivery_job] (
	[test_dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_job].[xif2software_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2software_delivery_job] ON [dbo].[software_delivery_job] (
	[test_status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_job].[xif3software_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3software_delivery_job] ON [dbo].[software_delivery_job] (
	[job_status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_job].[xif4software_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4software_delivery_job] ON [dbo].[software_delivery_job] (
	[depends_on_software_dlvy_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_job_file].[xif1software_delivery_job_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xif1software_delivery_job_file] ON [dbo].[software_delivery_job_file] (
	[software_delivery_job_id] ASC,
	[download_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_job_file].[xif2software_delivery_job_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2software_delivery_job_file] ON [dbo].[software_delivery_job_file] (
	[download_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[splmac].[splmac_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [splmac_x0] ON [dbo].[splmac] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[splmactp].[splmactp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [splmactp_x0] ON [dbo].[splmactp] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sql_tab].[sql_tab_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sql_tab_x0] ON [dbo].[sql_tab] (
	[sql_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[srv_desc].[srv_desc_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [srv_desc_x0] ON [dbo].[srv_desc] (
	[sym] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[srv_desc].[srv_desc_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [srv_desc_x1] ON [dbo].[srv_desc] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[srv_desc].[srv_desc_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [srv_desc_x2] ON [dbo].[srv_desc] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[srvr_aliases].[srvr_aliases_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [srvr_aliases_x0] ON [dbo].[srvr_aliases] (
	[alias_name] ASC,
	[zone_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[srvr_zones].[srvr_zones_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [srvr_zones_x0] ON [dbo].[srvr_zones] (
	[zone_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[station].[baseidx_station].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_station] ON [dbo].[station] (
	[id] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[stats].[baseidx_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_stats] ON [dbo].[stats] (
	[processid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[stats].[stats_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [stats_ind1] ON [dbo].[stats] (
	[productid] ASC,
	[workitemid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[strlst].[baseidx_strlst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_strlst] ON [dbo].[strlst] (
	[_slid] ASC,
	[slentry] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[subattr].[baseidx_subattr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_subattr] ON [dbo].[subattr] (
	[cid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[subsearch].[baseidx_subsearch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_subsearch] ON [dbo].[subsearch] (
	[aid] ASC,
	[cid] ASC,
	[normkey] ASC,
	[eid] ASC,
	[vid] ASC,
	[cvid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[subsearch].[isubsearch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [isubsearch] ON [dbo].[subsearch] (
	[eid] ASC,
	[aid] ASC,
	[cid] ASC,
	[vid] ASC,
	[cvid] ASC,
	[normkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey].[survey_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [survey_x0] ON [dbo].[survey] (
	[object_type] ASC,
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_answer].[survey_answer_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [survey_answer_x0] ON [dbo].[survey_answer] (
	[own_srvy_question] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_atpl].[survey_atpl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [survey_atpl_x0] ON [dbo].[survey_atpl] (
	[own_srvy_question] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_qtpl].[survey_qtpl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [survey_qtpl_x0] ON [dbo].[survey_qtpl] (
	[owning_survey] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_question].[survey_question_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [survey_question_x0] ON [dbo].[survey_question] (
	[owning_survey] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_tpl].[survey_tpl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [survey_tpl_x0] ON [dbo].[survey_tpl] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[svc_contract].[svc_contract_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [svc_contract_x0] ON [dbo].[svc_contract] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[svc_contract].[svc_contract_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [svc_contract_x1] ON [dbo].[svc_contract] (
	[contract_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[templatebob].[baseidx_templatebob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_templatebob] ON [dbo].[templatebob] (
	[templateid] ASC,
	[templatejobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[templatebob1].[baseidx_templatebob1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_templatebob1] ON [dbo].[templatebob1] (
	[templateid] ASC,
	[templatejobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[templatebob2].[baseidx_templatebob2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_templatebob2] ON [dbo].[templatebob2] (
	[templateid] ASC,
	[templatejobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[templateparameters].[baseidx_templateparameters].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_templateparameters] ON [dbo].[templateparameters] (
	[templateid] ASC,
	[udpid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[templateudpvalues].[baseidx_templateudpvalues].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_templateudpvalues] ON [dbo].[templateudpvalues] (
	[templateid] ASC,
	[udpid] ASC,
	[objectid] ASC,
	[instanceid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[templateworkloadjob1].[baseidx_templateworkloadjob1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_templateworkloadjob1] ON [dbo].[templateworkloadjob1] (
	[templateid] ASC,
	[templatejobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[templateworkloadjob2].[baseidx_templateworkloadjob2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_templateworkloadjob2] ON [dbo].[templateworkloadjob2] (
	[templateid] ASC,
	[templatejobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[thresholdconst].[baseidx_thresholdconst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_thresholdconst] ON [dbo].[thresholdconst] (
	[fieldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[thresholds].[baseidx_thresholds].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_thresholds] ON [dbo].[thresholds] (
	[probe_addr] ASC,
	[rsrcindex] ASC,
	[rsrcotherindex] ASC,
	[fieldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[thresholds].[thresholds_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [thresholds_index] ON [dbo].[thresholds] (
	[fieldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[timedevent].[baseidx_timedevent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_timedevent] ON [dbo].[timedevent] (
	[eventtime] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[timedevent].[timedevent_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [timedevent_ind1] ON [dbo].[timedevent] (
	[productid] ASC,
	[processid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tn].[tn_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [tn_x0] ON [dbo].[tn] (
	[tn_sys] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tn].[tn_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [tn_x1] ON [dbo].[tn] (
	[tn_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_address_type].[x_tng_address_type_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x_tng_address_type_desc] ON [dbo].[tng_address_type] (
	[address_description] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_adminstatus].[x_tng_adminstatus_admin_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x_tng_adminstatus_admin_text] ON [dbo].[tng_adminstatus] (
	[admin_text] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_alarmset].[$tng_a_u00000c4700000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$tng_a_u00000c4700000000] ON [dbo].[tng_alarmset] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_alarmset].[baseidx_tng_alarmset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_alarmset] ON [dbo].[tng_alarmset] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_alarmset_entry].[baseidx_tng_alarmset_entry].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_alarmset_entry] ON [dbo].[tng_alarmset_entry] (
	[alarmset_name] ASC,
	[status_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_browser_menu].[baseidx_tng_browser_menu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_browser_menu] ON [dbo].[tng_browser_menu] (
	[name] ASC,
	[sequence_no] ASC,
	[label] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_browser_method].[baseidx_tng_browser_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_browser_method] ON [dbo].[tng_browser_method] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_city].[baseidx_tng_city].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_city] ON [dbo].[tng_city] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_class].[x_tng_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x_tng_name] ON [dbo].[tng_class] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_conflict_object].[baseidx_tng_conflict_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_conflict_object] ON [dbo].[tng_conflict_object] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_country].[baseidx_tng_country].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_country] ON [dbo].[tng_country] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dbpv].[baseidx_tng_dbpv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_dbpv] ON [dbo].[tng_dbpv] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dbserver_connectinfo].[baseidx_tng_dbserver_connectinfo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_dbserver_connectinfo] ON [dbo].[tng_dbserver_connectinfo] (
	[client_pid] ASC,
	[client_host_name] ASC,
	[connection_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dbserver_connectinfo].[x_tng_dbserver_connectinfo_key].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x_tng_dbserver_connectinfo_key] ON [dbo].[tng_dbserver_connectinfo] (
	[client_pid] ASC,
	[client_host_name] ASC,
	[connection_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dhcp_scope].[baseidx_tng_dhcp_scope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_dhcp_scope] ON [dbo].[tng_dhcp_scope] (
	[starting_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_discovery_ipsubnet].[tng_ca_x_ipsubnet_addr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [tng_ca_x_ipsubnet_addr] ON [dbo].[tng_discovery_ipsubnet] (
	[subnet_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_discovery_ipsubnet].[tng_ca_x_ipsubnet_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tng_ca_x_ipsubnet_name] ON [dbo].[tng_discovery_ipsubnet] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dsm_class_scope].[baseidx_tng_dsm_class_scope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_dsm_class_scope] ON [dbo].[tng_dsm_class_scope] (
	[dsmserver] ASC,
	[classname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dsm_comm_scope].[baseidx_tng_dsm_comm_scope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_dsm_comm_scope] ON [dbo].[tng_dsm_comm_scope] (
	[dsmserver] ASC,
	[ipmask] ASC,
	[nodeclassname] ASC,
	[agentclassname] ASC,
	[getcommstring] ASC,
	[setcommstring] ASC,
	[portnumber] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dsm_ip_scope].[baseidx_tng_dsm_ip_scope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_dsm_ip_scope] ON [dbo].[tng_dsm_ip_scope] (
	[dsmserver] ASC,
	[ipmask] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dsm_mo_scope].[baseidx_tng_dsm_mo_scope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_dsm_mo_scope] ON [dbo].[tng_dsm_mo_scope] (
	[dsmserver] ASC,
	[ipmask] ASC,
	[agentclassname] ASC,
	[agentinstancename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dsm_poll_scope].[baseidx_tng_dsm_poll_scope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_dsm_poll_scope] ON [dbo].[tng_dsm_poll_scope] (
	[dsmserver] ASC,
	[ipmask] ASC,
	[nodeclassname] ASC,
	[agentclassname] ASC,
	[interval] ASC,
	[timeout] ASC,
	[retries] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_field_definition].[baseidx_tng_field_definition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_field_definition] ON [dbo].[tng_field_definition] (
	[field_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_field_storage].[$tng_f_u00000c9400000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$tng_f_u00000c9400000000] ON [dbo].[tng_field_storage] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_field_storage].[baseidx_tng_field_storage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_field_storage] ON [dbo].[tng_field_storage] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_geomap].[baseidx_tng_geomap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_geomap] ON [dbo].[tng_geomap] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_icon_2d].[baseidx_tng_icon_2d].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_icon_2d] ON [dbo].[tng_icon_2d] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_icon_3d].[baseidx_tng_icon_3d].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_icon_3d] ON [dbo].[tng_icon_3d] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_inclusion].[baseidx_tng_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_inclusion] ON [dbo].[tng_inclusion] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_inclusion].[x_tng_inclusion_child_parent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_inclusion_child_parent] ON [dbo].[tng_inclusion] (
	[child_uuid] ASC,
	[parent_uuid] ASC,
	[parent_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_inclusion].[x_tng_inclusion_child_seq_no].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_inclusion_child_seq_no] ON [dbo].[tng_inclusion] (
	[child_sequence_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_inclusion].[x_tng_inclusion_child_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_inclusion_child_uuid] ON [dbo].[tng_inclusion] (
	[child_uuid] ASC,
	[uuid] ASC,
	[child_sequence_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_inclusion].[x_tng_inclusion_hidden].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_inclusion_hidden] ON [dbo].[tng_inclusion] (
	[hidden] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_inclusion].[x_tng_inclusion_parent_child].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_inclusion_parent_child] ON [dbo].[tng_inclusion] (
	[parent_uuid] ASC,
	[child_uuid] ASC,
	[uuid] ASC,
	[child_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_inclusion].[x_tng_inclusion_puuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_inclusion_puuid] ON [dbo].[tng_inclusion] (
	[parent_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_interface_type].[baseidx_tng_interface_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_interface_type] ON [dbo].[tng_interface_type] (
	[interface_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_ip_discovery_history].[baseidx_tng_ip_discovery_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_ip_discovery_history] ON [dbo].[tng_ip_discovery_history] (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_ip_interface].[baseidx_tng_ip_interface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_ip_interface] ON [dbo].[tng_ip_interface] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_ip_subnet].[baseidx_tng_ip_subnet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_ip_subnet] ON [dbo].[tng_ip_subnet] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_jasmine_menu_action].[baseidx_tng_jasmine_menu_action].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_jasmine_menu_action] ON [dbo].[tng_jasmine_menu_action] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_jii_inclusion].[baseidx_tng_jii_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_jii_inclusion] ON [dbo].[tng_jii_inclusion] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_jii_inclusion].[x_tng_jii_inclusion_child_svr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_jii_inclusion_child_svr] ON [dbo].[tng_jii_inclusion] (
	[child_jii_server] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_jii_inclusion].[x_tng_jii_inclusion_child_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_jii_inclusion_child_uuid] ON [dbo].[tng_jii_inclusion] (
	[child_jii_objid] ASC,
	[uuid] ASC,
	[child_sequence_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_key_change_hist].[baseidx_tng_key_change_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_key_change_hist] ON [dbo].[tng_key_change_hist] (
	[sequence_no_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_key_prop_status_hist].[baseidx_tng_key_prop_status_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_key_prop_status_hist] ON [dbo].[tng_key_prop_status_hist] (
	[sequence_no_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_key_status_hist].[baseidx_tng_key_status_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_key_status_hist] ON [dbo].[tng_key_status_hist] (
	[sequence_no_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_link].[baseidx_tng_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_link] ON [dbo].[tng_link] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_link].[x_tng_link_class_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_link_class_name] ON [dbo].[tng_link] (
	[class_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_link].[x_tng_link_com_ans_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_link_com_ans_uuid] ON [dbo].[tng_link] (
	[common_ancestor_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_link].[x_tng_link_dest_seq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_link_dest_seq] ON [dbo].[tng_link] (
	[dest_seq] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_link].[x_tng_link_dest_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_link_dest_uuid] ON [dbo].[tng_link] (
	[dest_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_link].[x_tng_link_source_seq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_link_source_seq] ON [dbo].[tng_link] (
	[source_seq] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_link].[x_tng_link_source_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_link_source_uuid] ON [dbo].[tng_link] (
	[source_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_locale_info].[baseidx_tng_locale_info].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_locale_info] ON [dbo].[tng_locale_info] (
	[key_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_mac_address].[baseidx_tng_mac_address].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_mac_address] ON [dbo].[tng_mac_address] (
	[mac_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_managedobject].[baseidx_tng_managedobject].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_managedobject] ON [dbo].[tng_managedobject] (
	[name] ASC,
	[class_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_managedobject].[x_tng_manobj_macaddress].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_manobj_macaddress] ON [dbo].[tng_managedobject] (
	[mac_address] ASC,
	[class_name] ASC,
	[address_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_managedobject].[x1_tng_manobj_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x1_tng_manobj_uuid] ON [dbo].[tng_managedobject] (
	[uuid] ASC,
	[class_name] ASC,
	[name] ASC,
	[weight] ASC,
	[propagated_sev] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_managedobject].[x3_tng_manobj_hidden].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x3_tng_manobj_hidden] ON [dbo].[tng_managedobject] (
	[hidden] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_managedobject].[x4_tng_manobj_asset_uuid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x4_tng_manobj_asset_uuid] ON [dbo].[tng_managedobject] (
	[asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_managedobject].[x5_tng_manobj_address].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x5_tng_manobj_address] ON [dbo].[tng_managedobject] (
	[address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_managedobject].[x6_tng_manobj_clsname_add].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x6_tng_manobj_clsname_add] ON [dbo].[tng_managedobject] (
	[class_name] ASC,
	[address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_managedobject].[x7_tng_manobj_ip_addr_hex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x7_tng_manobj_ip_addr_hex] ON [dbo].[tng_managedobject] (
	[ip_address_hex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_map_authority].[baseidx_tng_map_authority].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_map_authority] ON [dbo].[tng_map_authority] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_method].[baseidx_tng_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_method] ON [dbo].[tng_method] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_netpc_history].[baseidx_tng_netpc_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_netpc_history] ON [dbo].[tng_netpc_history] (
	[class_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_ov_enum].[baseidx_tng_ov_enum].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_ov_enum] ON [dbo].[tng_ov_enum] (
	[field_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_ov_field_def].[baseidx_tng_ov_field_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_tng_ov_field_def] ON [dbo].[tng_ov_field_def] (
	[class_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_overlapinterface].[baseidx_tng_overlapinterface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_overlapinterface] ON [dbo].[tng_overlapinterface] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_pollset].[baseidx_tng_pollset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_pollset] ON [dbo].[tng_pollset] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_property_definition].[x_tng_prop_def_class_id_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x_tng_prop_def_class_id_name] ON [dbo].[tng_property_definition] (
	[class_id] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_property_definition].[x_tng_prop_def_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x_tng_prop_def_id] ON [dbo].[tng_property_definition] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_status].[x_tng_status_status_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_tng_status_status_text] ON [dbo].[tng_status] (
	[status_no] ASC,
	[status_text] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_sysobjid].[baseidx_tng_sysobjid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_sysobjid] ON [dbo].[tng_sysobjid] (
	[class_name] ASC,
	[sysobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_tnd_geomap].[baseidx_tng_tnd_geomap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_tnd_geomap] ON [dbo].[tng_tnd_geomap] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_unclassified_tcp].[baseidx_tng_unclassified_tcp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_unclassified_tcp] ON [dbo].[tng_unclassified_tcp] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_user_menu].[baseidx_tng_user_menu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_user_menu] ON [dbo].[tng_user_menu] (
	[name] ASC,
	[sequence_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_vendor].[baseidx_tng_vendor].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tng_vendor] ON [dbo].[tng_vendor] (
	[vendor_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_vendor].[x_tng_vendor_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x_tng_vendor_name] ON [dbo].[tng_vendor] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_vendor].[x_tng_vendor_shortname].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [x_tng_vendor_shortname] ON [dbo].[tng_vendor] (
	[vendor_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[toc].[toc_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [toc_x0] ON [dbo].[toc] (
	[sym] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tree].[baseidx_tree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_tree] ON [dbo].[tree] (
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tree].[itree1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [itree1] ON [dbo].[tree] (
	[lev1] ASC,
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tree].[itree2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [itree2] ON [dbo].[tree] (
	[lev2] ASC,
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tree].[itree3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [itree3] ON [dbo].[tree] (
	[lev3] ASC,
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tree].[itree4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [itree4] ON [dbo].[tree] (
	[lev4] ASC,
	[eid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tskstat].[tskstat_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tskstat_x0] ON [dbo].[tskstat] (
	[sym] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tskstat].[tskstat_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tskstat_x1] ON [dbo].[tskstat] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tskstat].[tskstat_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tskstat_x2] ON [dbo].[tskstat] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tskty].[tskty_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tskty_x0] ON [dbo].[tskty] (
	[sym] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tskty].[tskty_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tskty_x1] ON [dbo].[tskty] (
	[code] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tskty].[tskty_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tskty_x2] ON [dbo].[tskty] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tspan].[tspan_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tspan_x0] ON [dbo].[tspan] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tspan].[tspan_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tspan_x1] ON [dbo].[tspan] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tz].[tz_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tz_x0] ON [dbo].[tz] (
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tz].[tz_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [tz_x1] ON [dbo].[tz] (
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_history].[baseidx_ucm_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_ucm_history] ON [dbo].[ucm_history] (
	[config_uuid] ASC,
	[asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_mib_miblabel].[ucm_mib_miblabelindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ucm_mib_miblabelindex] ON [dbo].[ucm_mib_miblabel] (
	[miblabel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_mib_tglabel].[ucm_mib_tblabelindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ucm_mib_tblabelindex] ON [dbo].[ucm_mib_tglabel] (
	[tgdesc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_mib_varlabel].[ucm_mib_varlabelindex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ucm_mib_varlabelindex] ON [dbo].[ucm_mib_varlabel] (
	[varlabel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ud_datasource_list].[ud_datasource_list_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ud_datasource_list_ak1] ON [dbo].[ud_datasource_list] (
	[dsserver] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ud_datasource_list].[ud_datasource_list_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ud_datasource_list_ak2] ON [dbo].[ud_datasource_list] (
	[dsdbname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ud_datasource_list].[ud_datasource_list_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ud_datasource_list_ak3] ON [dbo].[ud_datasource_list] (
	[dsengine] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ud_datasource_list].[ud_datasource_list_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ud_datasource_list_ak4] ON [dbo].[ud_datasource_list] (
	[laction] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ud_datasource_list].[ud_datasource_list_ak5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ud_datasource_list_ak5] ON [dbo].[ud_datasource_list] (
	[iproduct] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ud_orgdef_list].[ud_orgdef_list_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ud_orgdef_list_ak1] ON [dbo].[ud_orgdef_list] (
	[oluserlist] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ud_orgdef_list].[ud_orgdef_list_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ud_orgdef_list_ak2] ON [dbo].[ud_orgdef_list] (
	[oldiv] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ud_swcat_rule].[ud_swcat_rule_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ud_swcat_rule_ak1] ON [dbo].[ud_swcat_rule] (
	[scuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[udoinstance].[baseidx_udoinstance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_udoinstance] ON [dbo].[udoinstance] (
	[udoinstanceid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[udoinstance].[udoinstance_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [udoinstance_idx_01] ON [dbo].[udoinstance] (
	[regionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[udp].[baseidx_udp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_udp] ON [dbo].[udp] (
	[udpid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[udpselectionvalues].[baseidx_udpselectionvalues].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_udpselectionvalues] ON [dbo].[udpselectionvalues] (
	[udpid] ASC,
	[selectionvalue] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[udpselectionvalues].[udpselectionvalues_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [udpselectionvalues_idx_01] ON [dbo].[udpselectionvalues] (
	[udpid] ASC,
	[valueid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[udpvalues].[baseidx_udpvalues].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_udpvalues] ON [dbo].[udpvalues] (
	[objectid] ASC,
	[udpid] ASC,
	[instanceid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_audit_info].[audit_info_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [audit_info_PUC] ON [dbo].[ujo_audit_info] (
	[audit_info_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_config].[config_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [config_PUC] ON [dbo].[ujo_config] (
	[fld] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_event].[ujo_event_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_event_idx_01] ON [dbo].[ujo_event] (
	[que_status] ASC,
	[priority] ASC,
	[stamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_event].[ujo_event_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_event_idx_02] ON [dbo].[ujo_event] (
	[evt_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_event].[ujo_event_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_event_idx_03] ON [dbo].[ujo_event] (
	[joid] ASC,
	[run_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_event].[ujo_event_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_event_idx_04] ON [dbo].[ujo_event] (
	[event] ASC,
	[box_name] ASC,
	[run_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_event].[ujo_event_idx_05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_event_idx_05] ON [dbo].[ujo_event] (
	[event_time_gmt] ASC,
	[que_status] ASC,
	[que_status_stamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_event].[ujo_event_idx_06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_event_idx_06] ON [dbo].[ujo_event] (
	[joid] ASC,
	[que_status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_designator].[ujo_ha_designator_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ujo_ha_designator_idx_01] ON [dbo].[ujo_ha_designator] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_process].[ujo_ha_process_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ujo_ha_process_idx_01] ON [dbo].[ujo_ha_process] (
	[ha_designator_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_process].[ujo_ha_process_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ujo_ha_process_idx_02] ON [dbo].[ujo_ha_process] (
	[ha_status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_state].[ujo_ha_state_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ujo_ha_state_idx_01] ON [dbo].[ujo_ha_state] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_status].[ujo_ha_status_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ujo_ha_status_idx_01] ON [dbo].[ujo_ha_status] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job].[ujo_job_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ujo_job_idx_01] ON [dbo].[ujo_job] (
	[job_name] ASC,
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job].[ujo_job_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_job_idx_02] ON [dbo].[ujo_job] (
	[box_joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_cond].[ujo_job_cond_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_job_cond_idx_01] ON [dbo].[ujo_job_cond] (
	[cond_mode] ASC,
	[cond_job_name] ASC,
	[joid] ASC,
	[over_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_cond].[ujo_job_cond_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_job_cond_idx_02] ON [dbo].[ujo_job_cond] (
	[joid] ASC,
	[cond_mode] ASC,
	[over_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_cond].[ujo_job_cond_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_job_cond_idx_03] ON [dbo].[ujo_job_cond] (
	[cond_job_name] ASC,
	[type] ASC,
	[cond_job_AUTOSERV] ASC,
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_runs].[job_runs_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [job_runs_PUC] ON [dbo].[ujo_job_runs] (
	[joid] ASC,
	[run_num] ASC,
	[ntry] ASC,
	[machine] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_runs].[ujo_job_runs_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_job_runs_idx_01] ON [dbo].[ujo_job_runs] (
	[evt_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_runs].[ujo_job_runs_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_job_runs_idx_02] ON [dbo].[ujo_job_runs] (
	[machine] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_keymaster].[keymaster_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [keymaster_PUC] ON [dbo].[ujo_keymaster] (
	[hostid] ASC,
	[hostname] ASC,
	[product] ASC,
	[type] ASC,
	[server] ASC,
	[dakey] ASC,
	[not_used] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_msg_ack].[msg_ack_PC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [msg_ack_PC] ON [dbo].[ujo_msg_ack] (
	[eoid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_proc_event].[ujo_proc_event_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_proc_event_idx_01] ON [dbo].[ujo_proc_event] (
	[que_status] ASC,
	[priority] ASC,
	[stamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_proc_event].[ujo_proc_event_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_proc_event_idx_02] ON [dbo].[ujo_proc_event] (
	[evt_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_proc_event].[ujo_proc_event_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_proc_event_idx_03] ON [dbo].[ujo_proc_event] (
	[joid] ASC,
	[run_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_proc_event].[ujo_proc_event_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ujo_proc_event_idx_04] ON [dbo].[ujo_proc_event] (
	[event] ASC,
	[box_name] ASC,
	[run_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_sys_ha_state].[ujo_sys_ha_state_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ujo_sys_ha_state_idx_01] ON [dbo].[ujo_sys_ha_state] (
	[ha_state_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ump_alertfilter].[$ump_a_u000037b300000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$ump_a_u000037b300000000] ON [dbo].[ump_alertfilter] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ump_alertgroup].[$ump_a_u000037b600000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$ump_a_u000037b600000000] ON [dbo].[ump_alertgroup] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ump_emfilter].[$ump_e_u000037ad00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$ump_e_u000037ad00000000] ON [dbo].[ump_emfilter] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ump_emgroup].[$ump_e_u000037b000000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [$ump_e_u000037b000000000] ON [dbo].[ump_emgroup] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_error].[und_error_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_error_idx] ON [dbo].[und_error] (
	[probe_id] ASC,
	[task_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_job].[und_job_dt_created_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_job_dt_created_idx] ON [dbo].[und_job] (
	[dt_created] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_job].[und_job_status_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_job_status_idx] ON [dbo].[und_job] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_probe].[und_probe_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_probe_idx] ON [dbo].[und_probe] (
	[name] ASC,
	[nic_card] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_task].[und_task_job_status_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_task_job_status_idx] ON [dbo].[und_task] (
	[job_id] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_task].[und_task_probe_dt_start_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_task_probe_dt_start_idx] ON [dbo].[und_task] (
	[probe_id] ASC,
	[dt_start] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_task].[und_task_status_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_task_status_idx] ON [dbo].[und_task] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_transaction].[und_trans_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_trans_index] ON [dbo].[und_transaction] (
	[job_id] ASC,
	[task_id] ASC,
	[probe_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_transaction].[und_trans_ip_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_trans_ip_idx] ON [dbo].[und_transaction] (
	[job_id] ASC,
	[from_ip] ASC,
	[to_ip] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_transaction].[und_trans_mac_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [und_trans_mac_idx] ON [dbo].[und_transaction] (
	[job_id] ASC,
	[from_mac] ASC,
	[to_mac] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_user].[und_user_name_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [und_user_name_idx] ON [dbo].[und_user] (
	[user_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_patch].[xif1upm_baseline_patch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1upm_baseline_patch] ON [dbo].[upm_baseline_patch] (
	[baseline_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_patch].[xif2upm_baseline_patch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2upm_baseline_patch] ON [dbo].[upm_baseline_patch] (
	[install_pkg_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_sw].[xie1upm_baseline_sw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1upm_baseline_sw] ON [dbo].[upm_baseline_sw] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_sw].[xie2upm_baseline_sw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie2upm_baseline_sw] ON [dbo].[upm_baseline_sw] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_sw].[xie3upm_baseline_sw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie3upm_baseline_sw] ON [dbo].[upm_baseline_sw] (
	[pmode] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_sw].[xif1upm_baseline_sw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1upm_baseline_sw] ON [dbo].[upm_baseline_sw] (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_deployment].[xie1upm_deployment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1upm_deployment] ON [dbo].[upm_deployment] (
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_deployment].[xie2upm_deployment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie2upm_deployment] ON [dbo].[upm_deployment] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_deployment].[xif1upm_deployment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1upm_deployment] ON [dbo].[upm_deployment] (
	[install_pkg_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_portlet_content].[xif1upm_portlet_content].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1upm_portlet_content] ON [dbo].[upm_portlet_content] (
	[user_uuid] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_ab_computer].[urc_ab_computer_i1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [urc_ab_computer_i1] ON [dbo].[urc_ab_computer] (
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_ab_group_def].[urc_ab_group_def_i1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [urc_ab_group_def_i1] ON [dbo].[urc_ab_group_def] (
	[sub_root_item] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_ab_group_def].[urc_ab_group_def_i2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [urc_ab_group_def_i2] ON [dbo].[urc_ab_group_def] (
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_ab_permission].[urc_ab_permission_i1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [urc_ab_permission_i1] ON [dbo].[urc_ab_permission] (
	[uidaddressbook] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_active_session].[urc_active_session_i1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [urc_active_session_i1] ON [dbo].[urc_active_session] (
	[datesessionstarted] ASC,
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_active_session].[urc_active_session_i2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [urc_active_session_i2] ON [dbo].[urc_active_session] (
	[uidparent] ASC,
	[iduration] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urgncy].[urgncy_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [urgncy_x0] ON [dbo].[urgncy] (
	[sym] ASC,
	[enum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urgncy].[urgncy_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [urgncy_x1] ON [dbo].[urgncy] (
	[enum] ASC,
	[sym] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_actproc].[usd_rsw_actproc_app_name_unique].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [usd_rsw_actproc_app_name_unique] ON [dbo].[usd_actproc] (
	[rsw] ASC,
	[itemname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_applic].[usd_applic0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usd_applic0] ON [dbo].[usd_applic] (
	[target] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_applic].[usd_applic1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usd_applic1] ON [dbo].[usd_applic] (
	[activity] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_applic].[usd_applic2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usd_applic2] ON [dbo].[usd_applic] (
	[installation] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_applic].[usd_applic3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usd_applic3] ON [dbo].[usd_applic] (
	[applicationgroup] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_applic].[usd_applic4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usd_applic4] ON [dbo].[usd_applic] (
	[actproc] ASC,
	[status] ASC,
	[task] ASC,
	[uninstallstate] ASC,
	[target] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_cmp_grp].[usd_cmp_grp_name_unique].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [usd_cmp_grp_name_unique] ON [dbo].[usd_cmp_grp] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_cont].[usd_cont_name_unique].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [usd_cont_name_unique] ON [dbo].[usd_cont] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_contfold].[usd_contfold_name_unique].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [usd_contfold_name_unique] ON [dbo].[usd_contfold] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_rsw].[usd_rsw_name_unique].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [usd_rsw_name_unique] ON [dbo].[usd_rsw] (
	[itemname] ASC,
	[itemversion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_swfold].[usd_swfold_name_unique].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [usd_swfold_name_unique] ON [dbo].[usd_swfold] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[user_acct_asset_group_matrix].[user_acct_asset_grp_mtx_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [user_acct_asset_grp_mtx_idx_01] ON [dbo].[user_acct_asset_group_matrix] (
	[user_account_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[user_group].[baseidx_user_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_user_group] ON [dbo].[user_group] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[user_group].[user_group_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [user_group_idx_01] ON [dbo].[user_group] (
	[usernode] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[user_group].[user_group_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [user_group_idx_02] ON [dbo].[user_group] (
	[usernode] ASC,
	[id] ASC,
	[gid] ASC,
	[name] ASC,
	[userid] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[user_preferences].[user_preferences_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [user_preferences_idx_01] ON [dbo].[user_preferences] (
	[preference_userid] ASC,
	[product_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[userprofiles].[baseidx_userprofiles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_userprofiles] ON [dbo].[userprofiles] (
	[user_index] ASC,
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usersec_profile].[baseidx_usersec_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_usersec_profile] ON [dbo].[usersec_profile] (
	[node] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usersec_profile].[usersec_profile_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usersec_profile_idx_01] ON [dbo].[usersec_profile] (
	[node] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_account].[usm_account_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_account_idx_01] ON [dbo].[usm_account] (
	[label] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_account].[usm_account_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_account_idx_02] ON [dbo].[usm_account] (
	[tenant_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_account].[usm_account_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_account_idx_03] ON [dbo].[usm_account] (
	[account_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_analysis].[usm_analysis_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_analysis_idx_01] ON [dbo].[usm_analysis] (
	[url] ASC,
	[access_group] ASC,
	[release_status] ASC,
	[period_start] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_billing_account].[usm_billing_account_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_billing_account_idx_01] ON [dbo].[usm_billing_account] (
	[account_label] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_billing_account].[usm_billing_account_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_billing_account_idx_02] ON [dbo].[usm_billing_account] (
	[domain] ASC,
	[billing_type] ASC,
	[text_1] ASC,
	[text_2] ASC,
	[enum_1] ASC,
	[account_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_configuration].[usm_configuration_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_configuration_idx_01] ON [dbo].[usm_configuration] (
	[domain] ASC,
	[group_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_cor_data].[usm_cor_data_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_cor_data_idx_01] ON [dbo].[usm_cor_data] (
	[parent_path] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_fiscal_period].[usm_fiscal_period_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_fiscal_period_idx_01] ON [dbo].[usm_fiscal_period] (
	[domain] ASC,
	[period] ASC,
	[start_date] ASC,
	[end_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_id_mapping].[usm_id_mapping_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_id_mapping_idx_01] ON [dbo].[usm_id_mapping] (
	[ican_type] ASC,
	[ican_id] ASC,
	[domain] ASC,
	[system_id] ASC,
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_keyword].[usm_keyword_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_keyword_idx_01] ON [dbo].[usm_keyword] (
	[keyword] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_attr_spec].[usm_metric_attr_spec_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_metric_attr_spec_idx_01] ON [dbo].[usm_metric_attr_spec] (
	[attribute_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_ierror].[usm_mr_ierror_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_ierror_idx_01] ON [dbo].[usm_mr_ierror] (
	[type] ASC,
	[ref_id] ASC,
	[file_row] ASC,
	[file_col] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_ievent_metric].[usm_mr_ievent_metric_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_ievent_metric_idx_01] ON [dbo].[usm_mr_ievent_metric] (
	[event_id] ASC,
	[metric_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_ifile].[usm_mr_ifile_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_ifile_idx_01] ON [dbo].[usm_mr_ifile] (
	[status] ASC,
	[upload_date] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_imap].[usm_mr_imap_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_imap_idx_01] ON [dbo].[usm_mr_imap] (
	[type] ASC,
	[mkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_imap].[usm_mr_imap_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_imap_idx_02] ON [dbo].[usm_mr_imap] (
	[type] ASC,
	[value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_import].[usm_mr_import_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_import_idx_01] ON [dbo].[usm_mr_import] (
	[status] ASC,
	[priority] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_iref].[usm_mr_iref_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_iref_idx_01] ON [dbo].[usm_mr_iref] (
	[file_id] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_iref].[usm_mr_iref_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_iref_idx_02] ON [dbo].[usm_mr_iref] (
	[type] ASC,
	[rbulk_id] ASC,
	[file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_iref].[usm_mr_iref_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_mr_iref_idx_03] ON [dbo].[usm_mr_iref] (
	[type] ASC,
	[ebulk_id] ASC,
	[file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering].[usm_offering_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_offering_idx_01] ON [dbo].[usm_offering] (
	[parent_id] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering].[usm_offering_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_offering_idx_02] ON [dbo].[usm_offering] (
	[is_leaf] ASC,
	[domain] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering].[usm_offering_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_offering_idx_03] ON [dbo].[usm_offering] (
	[base_offering] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering].[usm_offering_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_offering_idx_04] ON [dbo].[usm_offering] (
	[offering_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering_ratedef_inclusion].[usm_offer_ratedef_incl_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_offer_ratedef_incl_idx_01] ON [dbo].[usm_offering_ratedef_inclusion] (
	[parent_id] ASC,
	[rate_plan_id] ASC,
	[child_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering_ratedef_inclusion].[usm_offer_ratedef_incl_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_offer_ratedef_incl_idx_02] ON [dbo].[usm_offering_ratedef_inclusion] (
	[child_id] ASC,
	[parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering_rplan_inclusion].[usm_offer_rplan_incl_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_offer_rplan_incl_idx_01] ON [dbo].[usm_offering_rplan_inclusion] (
	[parent_id] ASC,
	[child_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_payment_method].[usm_payment_method_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_payment_method_idx_01] ON [dbo].[usm_payment_method] (
	[account_no] ASC,
	[status] ASC,
	[type_1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_payment_method].[usm_payment_method_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_payment_method_idx_02] ON [dbo].[usm_payment_method] (
	[account_no] ASC,
	[type_1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_queue_item].[usm_queue_item_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_queue_item_idx_01] ON [dbo].[usm_queue_item] (
	[created_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_queue_item].[usm_queue_item_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_queue_item_idx_02] ON [dbo].[usm_queue_item] (
	[priority_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_queue_item].[usm_queue_item_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_queue_item_idx_03] ON [dbo].[usm_queue_item] (
	[type] ASC,
	[owner] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_queue_item_detail].[usm_queue_item_detail_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_queue_item_detail_idx_01] ON [dbo].[usm_queue_item_detail] (
	[queue_item_id] ASC,
	[created_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rate_definition].[usm_rate_definition_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_rate_definition_idx_01] ON [dbo].[usm_rate_definition] (
	[rate_plan_id] ASC,
	[rate_row] ASC,
	[rate_col] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rate_definition].[usm_rate_definition_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_rate_definition_idx_02] ON [dbo].[usm_rate_definition] (
	[status] ASC,
	[changeto_item_id] ASC,
	[item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rate_definition].[usm_rate_definition_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_rate_definition_idx_03] ON [dbo].[usm_rate_definition] (
	[base_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rate_plan].[usm_rate_plan_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_rate_plan_idx_01] ON [dbo].[usm_rate_plan] (
	[rate_plan_type] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rate_plan].[usm_rate_plan_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_rate_plan_idx_02] ON [dbo].[usm_rate_plan] (
	[rate_plan_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rateplan_inclusion].[usm_rateplan_inclusion_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_rateplan_inclusion_idx_01] ON [dbo].[usm_rateplan_inclusion] (
	[parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rateplan_inheritance].[usm_rplan_inheritance_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_rplan_inheritance_idx_01] ON [dbo].[usm_rateplan_inheritance] (
	[base_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_group].[usm_report_group_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_report_group_idx_01] ON [dbo].[usm_report_group] (
	[parent_path] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request].[usm_request_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_request_idx_01] ON [dbo].[usm_request] (
	[req_by_user_id] ASC,
	[req_for_account_id] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request].[usm_request_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_request_idx_02] ON [dbo].[usm_request] (
	[req_by_user_id] ASC,
	[req_for_user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request].[usm_request_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_request_idx_03] ON [dbo].[usm_request] (
	[req_by_user_id] ASC,
	[req_for_user_id] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request_pending_action].[usm_request_pending_act_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_request_pending_act_idx_01] ON [dbo].[usm_request_pending_action] (
	[action_type] ASC,
	[object_id] ASC,
	[user_id] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request_pending_action].[usm_request_pending_act_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_request_pending_act_idx_02] ON [dbo].[usm_request_pending_action] (
	[user_id] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request_pending_action].[usm_request_pending_act_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_request_pending_act_idx_03] ON [dbo].[usm_request_pending_action] (
	[action_type] ASC,
	[object_type] ASC,
	[object_id] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request_pending_action].[usm_request_pending_act_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_request_pending_act_idx_04] ON [dbo].[usm_request_pending_action] (
	[user_id] ASC,
	[modified_by] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_service_event].[usm_service_event_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_service_event_idx_01] ON [dbo].[usm_service_event] (
	[start_time] ASC,
	[stop_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_settlement].[usm_settlement_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_settlement_idx_01] ON [dbo].[usm_settlement] (
	[enum_1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_statement].[usm_statement_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_statement_idx_01] ON [dbo].[usm_statement] (
	[statement_label] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_statement].[usm_statement_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_statement_idx_02] ON [dbo].[usm_statement] (
	[account_no] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_subscription_detail].[usm_subscription_detail_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_subscription_detail_idx_01] ON [dbo].[usm_subscription_detail] (
	[account_no] ASC,
	[status] ASC,
	[charge] ASC,
	[subscription_type] ASC,
	[enum_1] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_subscription_detail].[usm_subscription_detail_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_subscription_detail_idx_02] ON [dbo].[usm_subscription_detail] (
	[status] ASC,
	[offering_id] ASC,
	[rate_plan_id] ASC,
	[item_id] ASC,
	[account_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_subscription_detail].[usm_subscription_detail_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_subscription_detail_idx_03] ON [dbo].[usm_subscription_detail] (
	[status] ASC,
	[rate_plan_id] ASC,
	[item_id] ASC,
	[account_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_subscription_mgmt].[usm_subscription_mgmt_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_subscription_mgmt_idx_01] ON [dbo].[usm_subscription_mgmt] (
	[label] ASC,
	[scope] ASC,
	[type] ASC,
	[status] ASC,
	[subscription_type] ASC,
	[enum_4] ASC,
	[enum_1] ASC,
	[enum_2] ASC,
	[enum_3] ASC,
	[date_3] ASC,
	[date_2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_subscription_mgmt].[usm_subscription_mgmt_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_subscription_mgmt_idx_02] ON [dbo].[usm_subscription_mgmt] (
	[label] ASC,
	[scope] ASC,
	[type] ASC,
	[status] ASC,
	[subscription_type] ASC,
	[subscription_item] ASC,
	[subscription_item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_tenant].[usm_tenant_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_tenant_idx_01] ON [dbo].[usm_tenant] (
	[domain_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_tenant].[usm_tenant_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_tenant_idx_02] ON [dbo].[usm_tenant] (
	[tenant_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_tenant].[usm_tenant_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_tenant_idx_03] ON [dbo].[usm_tenant] (
	[tenant_id] ASC,
	[parent_tenant_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_transaction].[usm_transaction_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_transaction_idx_01] ON [dbo].[usm_transaction] (
	[account_no] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_transaction].[usm_transaction_idx_02].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_transaction_idx_02] ON [dbo].[usm_transaction] (
	[account_no] ASC,
	[post_date] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_transaction].[usm_transaction_idx_03].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_transaction_idx_03] ON [dbo].[usm_transaction] (
	[statement_id] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_transaction].[usm_transaction_idx_04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_transaction_idx_04] ON [dbo].[usm_transaction] (
	[account_no] ASC,
	[enum_2] ASC,
	[enum_3] ASC,
	[enum_4] ASC,
	[is_reverse] ASC,
	[type] ASC,
	[date_1] ASC,
	[date_2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_transaction].[usm_transaction_idx_05].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_transaction_idx_05] ON [dbo].[usm_transaction] (
	[account_no] ASC,
	[type] ASC,
	[status] ASC,
	[enum_4] ASC,
	[date_2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_transaction].[usm_transaction_idx_06].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usm_transaction_idx_06] ON [dbo].[usm_transaction] (
	[account_no] ASC,
	[statement_id] ASC,
	[status] ASC,
	[type] ASC,
	[enum_2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_owned_resource].[usp_owned_resource_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usp_owned_resource_x0] ON [dbo].[usp_owned_resource] (
	[nr_argis_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_owned_resource].[usp_owned_resource_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usp_owned_resource_x1] ON [dbo].[usp_owned_resource] (
	[nr_bms] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_owned_resource].[usp_owned_resource_x2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usp_owned_resource_x2] ON [dbo].[usp_owned_resource] (
	[nr_bmlabel] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_owned_resource].[usp_owned_resource_x3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usp_owned_resource_x3] ON [dbo].[usp_owned_resource] (
	[nr_bm_rep] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_preferences].[usp_preferences_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [usp_preferences_x0] ON [dbo].[usp_preferences] (
	[analyst_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_projex].[usp_projex_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usp_projex_x0] ON [dbo].[usp_projex] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_properties].[usp_properties_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [usp_properties_x0] ON [dbo].[usp_properties] (
	[property_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usq].[usq_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [usq_x1] ON [dbo].[usq] (
	[query_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ut_datasource_log].[ut_datasource_log_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ut_datasource_log_ak1] ON [dbo].[ut_datasource_log] (
	[dssourceuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ut_datasource_log].[ut_datasource_log_ak2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ut_datasource_log_ak2] ON [dbo].[ut_datasource_log] (
	[lactivity] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ut_datasource_log].[ut_datasource_log_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ut_datasource_log_ak3] ON [dbo].[ut_datasource_log] (
	[lactresult] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ut_datasource_log].[ut_datasource_log_ak4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ut_datasource_log_ak4] ON [dbo].[ut_datasource_log] (
	[lactdate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[viewgroups].[baseidx_viewgroups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_viewgroups] ON [dbo].[viewgroups] (
	[spid] ASC,
	[rptid] ASC,
	[grpindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[viewlanquerydata].[baseidx_viewlanquerydata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_viewlanquerydata] ON [dbo].[viewlanquerydata] (
	[spid] ASC,
	[rptid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[viewquerydata].[baseidx_viewquerydata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_viewquerydata] ON [dbo].[viewquerydata] (
	[spid] ASC,
	[rptid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[viewsettings].[baseidx_viewsettings].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_viewsettings] ON [dbo].[viewsettings] (
	[vuserindex] ASC,
	[vindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[watch].[baseidx_watch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_watch] ON [dbo].[watch] (
	[server_addr] ASC,
	[probe_addr] ASC,
	[rsrcindex] ASC,
	[rsrcotherindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wf].[wf_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [wf_x0] ON [dbo].[wf] (
	[object_id] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wf].[wf_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [wf_x1] ON [dbo].[wf] (
	[assignee] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wf_locks].[locks_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [locks_ind1] ON [dbo].[wf_locks] (
	[id] ASC,
	[productid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wftpl].[wftpl_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [wftpl_x0] ON [dbo].[wftpl] (
	[object_attrname] ASC,
	[object_attrval] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wftpl].[wftpl_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [wftpl_x1] ON [dbo].[wftpl] (
	[assignee] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wftpl_grp].[wftpl_grp_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [wftpl_grp_x0] ON [dbo].[wftpl_grp] (
	[l_persid] ASC,
	[l_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wftpl_grp].[wftpl_grp_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [wftpl_grp_x1] ON [dbo].[wftpl_grp] (
	[r_persid] ASC,
	[r_attr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wktriggerprofile].[baseidx_wktriggerprofile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_wktriggerprofile] ON [dbo].[wktriggerprofile] (
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workalert].[baseidx_workalert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_workalert] ON [dbo].[workalert] (
	[spid] ASC,
	[rpid] ASC,
	[probe_addr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workbench_provider].[workbench_provider_idx_01].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[workbench_provider] ADD CONSTRAINT [workbench_provider_idx_01] PRIMARY KEY NONCLUSTERED (
	[provider_name] ASC,
	[product_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workflow_configuration].[workflow_configuration_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [workflow_configuration_ind1] ON [dbo].[workflow_configuration] (
	[productid] ASC,
	[lastcheckin] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workflow_groups].[groups_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [groups_ind1] ON [dbo].[workflow_groups] (
	[productid] ASC,
	[actorname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workflow_groups].[groups_ind2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [groups_ind2] ON [dbo].[workflow_groups] (
	[productid] ASC,
	[groupname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workitems].[baseidx_workitems].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_workitems] ON [dbo].[workitems] (
	[processid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workitems].[workitems_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [workitems_ind1] ON [dbo].[workitems] (
	[productid] ASC,
	[processid] ASC,
	[nodeid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[worklist].[baseidx_worklist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_worklist] ON [dbo].[worklist] (
	[actor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[worklist].[worklist_ind1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [worklist_ind1] ON [dbo].[worklist] (
	[productid] ASC,
	[workitemid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[worklist].[worklist_ind2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [worklist_ind2] ON [dbo].[worklist] (
	[productid] ASC,
	[actor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workloadcommon].[baseidx_workloadcommon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_workloadcommon] ON [dbo].[workloadcommon] (
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workloadextendedprops].[baseidx_workloadextendedprops].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_workloadextendedprops] ON [dbo].[workloadextendedprops] (
	[jobid] ASC,
	[indexid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workloadjob].[baseidx_workloadjob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_workloadjob] ON [dbo].[workloadjob] (
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workloadjobset].[baseidx_workloadjobset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [baseidx_workloadjobset] ON [dbo].[workloadjobset] (
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_accesszone].[xak1wsm_accesszone].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1wsm_accesszone] ON [dbo].[wsm_accesszone] (
	[level_uuid] ASC,
	[accesszone_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_accesszone].[xif1wsm_accesszone].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_accesszone] ON [dbo].[wsm_accesszone] (
	[level_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_accesszone_coordinates].[xie1wsm_accesszone_coordinates].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xie1wsm_accesszone_coordinates] ON [dbo].[wsm_accesszone_coordinates] (
	[accesszone_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_accesszone_gui_attrib].[xif1wsm_accesszone_gui_attrib].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_accesszone_gui_attrib] ON [dbo].[wsm_accesszone_gui_attrib] (
	[accesszone_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_accesszone_gui_attrib].[xif2wsm_accesszone_gui_attrib].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_accesszone_gui_attrib] ON [dbo].[wsm_accesszone_gui_attrib] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_advanced_psk].[xwsm_advanced_psk_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_advanced_psk_name] ON [dbo].[wsm_advanced_psk] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_advanced_psk_sched].[xif1wsm_advanced_psk_sched].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_advanced_psk_sched] ON [dbo].[wsm_advanced_psk_sched] (
	[advanced_psk_sched_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_advanced_psk_sched].[xwsm_advpsk_schd_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_advpsk_schd_index] ON [dbo].[wsm_advanced_psk_sched] (
	[advanced_psk_sched_id] ASC,
	[start_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_advanced_wep_sched].[xif1wsm_advanced_wep_sched].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_advanced_wep_sched] ON [dbo].[wsm_advanced_wep_sched] (
	[advanced_wep_sched_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_advanced_wep_sched].[xwsm_advanced_wep_sched_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_advanced_wep_sched_index] ON [dbo].[wsm_advanced_wep_sched] (
	[start_time] ASC,
	[advanced_wep_sched_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_agent].[xif1wsm_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_agent] ON [dbo].[wsm_agent] (
	[manager_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_agent].[xif2wsm_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_agent] ON [dbo].[wsm_agent] (
	[current_user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_agent].[xif3wsm_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_agent] ON [dbo].[wsm_agent] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_agent].[xif4wsm_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_agent] ON [dbo].[wsm_agent] (
	[locale_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_agent].[xif5wsm_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif5wsm_agent] ON [dbo].[wsm_agent] (
	[time_zone_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_agent].[xif6wsm_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif6wsm_agent] ON [dbo].[wsm_agent] (
	[agent_status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_agent].[xwsm_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_agent] ON [dbo].[wsm_agent] (
	[device_id] ASC,
	[agent_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_attribute_type].[xwsm_attribute_type_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_attribute_type_name] ON [dbo].[wsm_attribute_type] (
	[attribute_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configprofile_type].[xwsm_configprofile_type_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_configprofile_type_name] ON [dbo].[wsm_configprofile_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_history].[xif1wsm_configuration_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_configuration_history] ON [dbo].[wsm_configuration_history] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_history].[xwsm_configuration_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xwsm_configuration_history] ON [dbo].[wsm_configuration_history] (
	[datetime] ASC,
	[action] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_item].[xif1wsm_configuration_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_configuration_item] ON [dbo].[wsm_configuration_item] (
	[config_object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_item].[xif2wsm_configuration_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_configuration_item] ON [dbo].[wsm_configuration_item] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_item].[xwsm_configuration_item_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_configuration_item_id] ON [dbo].[wsm_configuration_item] (
	[config_object_id] ASC,
	[config_item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_object].[xif1wsm_configuration_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_configuration_object] ON [dbo].[wsm_configuration_object] (
	[config_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_object].[xwsm_configuration_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_configuration_object] ON [dbo].[wsm_configuration_object] (
	[config_object_id] ASC,
	[config_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_profile].[xif1wsm_configuration_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_configuration_profile] ON [dbo].[wsm_configuration_profile] (
	[config_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_profile].[xif2wsm_configuration_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_configuration_profile] ON [dbo].[wsm_configuration_profile] (
	[templateuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_day].[xak1wsm_dc_day].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1wsm_dc_day] ON [dbo].[wsm_dc_day] (
	[current_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_resource].[xif1wsm_dc_resource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_resource] ON [dbo].[wsm_dc_resource] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_resource].[xif2wsm_dc_resource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_resource] ON [dbo].[wsm_dc_resource] (
	[templateuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_resource].[xwsm_dc_resource_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_resource_id] ON [dbo].[wsm_dc_resource] (
	[res_type] ASC,
	[res_subtype] ASC,
	[res_instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_time].[xwsm_dc_time_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_time_id] ON [dbo].[wsm_dc_time] (
	[time_value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[xif1wsm_dc_val_1day].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_1day] ON [dbo].[wsm_dc_val_1day] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[xif2wsm_dc_val_1day].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_1day] ON [dbo].[wsm_dc_val_1day] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[xif3wsm_dc_val_1day].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_1day] ON [dbo].[wsm_dc_val_1day] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[xif4wsm_dc_val_1day].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_1day] ON [dbo].[wsm_dc_val_1day] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[xwsm_dc_val_1day_idx].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_1day_idx] ON [dbo].[wsm_dc_val_1day] (
	[time_id] ASC,
	[res_id] ASC,
	[device_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[xif1wsm_dc_val_1hr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_1hr] ON [dbo].[wsm_dc_val_1hr] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[xif2wsm_dc_val_1hr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_1hr] ON [dbo].[wsm_dc_val_1hr] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[xif3wsm_dc_val_1hr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_1hr] ON [dbo].[wsm_dc_val_1hr] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[xif4wsm_dc_val_1hr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_1hr] ON [dbo].[wsm_dc_val_1hr] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[xwsm_dc_val_1hr_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_1hr_index] ON [dbo].[wsm_dc_val_1hr] (
	[device_id] ASC,
	[res_id] ASC,
	[time_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[xif1wsm_dc_val_1min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_1min] ON [dbo].[wsm_dc_val_1min] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[xif2wsm_dc_val_1min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_1min] ON [dbo].[wsm_dc_val_1min] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[xif3wsm_dc_val_1min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_1min] ON [dbo].[wsm_dc_val_1min] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[xif4wsm_dc_val_1min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_1min] ON [dbo].[wsm_dc_val_1min] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[xwsm_dc_val_1min_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_1min_index] ON [dbo].[wsm_dc_val_1min] (
	[device_id] ASC,
	[res_id] ASC,
	[time_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[xif1wsm_dc_val_1mnth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_1mnth] ON [dbo].[wsm_dc_val_1mnth] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[xif2wsm_dc_val_1mnth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_1mnth] ON [dbo].[wsm_dc_val_1mnth] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[xif3wsm_dc_val_1mnth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_1mnth] ON [dbo].[wsm_dc_val_1mnth] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[xif4wsm_dc_val_1mnth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_1mnth] ON [dbo].[wsm_dc_val_1mnth] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[xwsm_dc_val_1mnth_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_1mnth_index] ON [dbo].[wsm_dc_val_1mnth] (
	[device_id] ASC,
	[res_id] ASC,
	[time_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[xif1wsm_dc_val_1week].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_1week] ON [dbo].[wsm_dc_val_1week] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[xif2wsm_dc_val_1week].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_1week] ON [dbo].[wsm_dc_val_1week] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[xif3wsm_dc_val_1week].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_1week] ON [dbo].[wsm_dc_val_1week] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[xif4wsm_dc_val_1week].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_1week] ON [dbo].[wsm_dc_val_1week] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[xwsm_dc_val_1week_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_1week_index] ON [dbo].[wsm_dc_val_1week] (
	[device_id] ASC,
	[res_id] ASC,
	[time_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[xif1wsm_dc_val_1year].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_1year] ON [dbo].[wsm_dc_val_1year] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[xif2wsm_dc_val_1year].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_1year] ON [dbo].[wsm_dc_val_1year] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[xif3wsm_dc_val_1year].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_1year] ON [dbo].[wsm_dc_val_1year] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[xif4wsm_dc_val_1year].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_1year] ON [dbo].[wsm_dc_val_1year] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[xwsm_dc_val_1year_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_1year_index] ON [dbo].[wsm_dc_val_1year] (
	[device_id] ASC,
	[res_id] ASC,
	[time_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[xif1wsm_dc_val_30min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_30min] ON [dbo].[wsm_dc_val_30min] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[xif2wsm_dc_val_30min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_30min] ON [dbo].[wsm_dc_val_30min] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[xif3wsm_dc_val_30min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_30min] ON [dbo].[wsm_dc_val_30min] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[xif4wsm_dc_val_30min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_30min] ON [dbo].[wsm_dc_val_30min] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[xwsm_dc_val_30min_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_30min_index] ON [dbo].[wsm_dc_val_30min] (
	[device_id] ASC,
	[res_id] ASC,
	[time_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[xif1wsm_dc_val_5min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_5min] ON [dbo].[wsm_dc_val_5min] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[xif2wsm_dc_val_5min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_5min] ON [dbo].[wsm_dc_val_5min] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[xif3wsm_dc_val_5min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_5min] ON [dbo].[wsm_dc_val_5min] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[xif4wsm_dc_val_5min].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_5min] ON [dbo].[wsm_dc_val_5min] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[xwsm_dc_val_5min_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_5min_index] ON [dbo].[wsm_dc_val_5min] (
	[device_id] ASC,
	[res_id] ASC,
	[time_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[xif1wsm_dc_val_8hr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_dc_val_8hr] ON [dbo].[wsm_dc_val_8hr] (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[xif2wsm_dc_val_8hr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_dc_val_8hr] ON [dbo].[wsm_dc_val_8hr] (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[xif3wsm_dc_val_8hr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_dc_val_8hr] ON [dbo].[wsm_dc_val_8hr] (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[xif4wsm_dc_val_8hr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_dc_val_8hr] ON [dbo].[wsm_dc_val_8hr] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[xwsm_dc_val_8hr_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_dc_val_8hr_index] ON [dbo].[wsm_dc_val_8hr] (
	[device_id] ASC,
	[res_id] ASC,
	[time_id] ASC,
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device].[xak1wsm_device_hostname].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1wsm_device_hostname] ON [dbo].[wsm_device] (
	[hostname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device].[xif1wsm_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_device] ON [dbo].[wsm_device] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device].[xif2wsm_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_device] ON [dbo].[wsm_device] (
	[status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device].[xwsm_device_macaddress].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_device_macaddress] ON [dbo].[wsm_device] (
	[macaddress] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_attrib_def].[xif1wsm_device_attrib_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_device_attrib_def] ON [dbo].[wsm_device_attrib_def] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_attrib_def].[xwsm_device_attrib_def_key].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_device_attrib_def_key] ON [dbo].[wsm_device_attrib_def] (
	[attribute_id] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_attribute].[xif1wsm_device_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_device_attribute] ON [dbo].[wsm_device_attribute] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_attribute].[xif2wsm_device_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_device_attribute] ON [dbo].[wsm_device_attribute] (
	[attribute_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_gui_attributes].[xif1wsm_device_gui_attributes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_device_gui_attributes] ON [dbo].[wsm_device_gui_attributes] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_gui_attributes].[xif2wsm_device_gui_attributes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_device_gui_attributes] ON [dbo].[wsm_device_gui_attributes] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_relationship].[xif1wsm_device_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_device_relationship] ON [dbo].[wsm_device_relationship] (
	[device_id_sidea] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_relationship].[xif2wsm_device_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_device_relationship] ON [dbo].[wsm_device_relationship] (
	[device_id_sideb] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_relationship].[xif3wsm_device_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_device_relationship] ON [dbo].[wsm_device_relationship] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_type].[xwsm_device_type_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_device_type_name] ON [dbo].[wsm_device_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_engine].[xif1wsm_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_engine] ON [dbo].[wsm_engine] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_engine].[xif2wsm_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_engine] ON [dbo].[wsm_engine] (
	[time_zone_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_engine].[xif3wsm_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_engine] ON [dbo].[wsm_engine] (
	[locale_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_engine].[xif4wsm_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_engine] ON [dbo].[wsm_engine] (
	[status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_engine].[xif5wsm_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif5wsm_engine] ON [dbo].[wsm_engine] (
	[config_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_engine].[xwsm_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_engine] ON [dbo].[wsm_engine] (
	[manager_uuid] ASC,
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_events].[xif1wsm_events].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_events] ON [dbo].[wsm_events] (
	[eventdefinition_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_events].[xif2wsm_events].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_events] ON [dbo].[wsm_events] (
	[associated_device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_events].[xif3wsm_events].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_events] ON [dbo].[wsm_events] (
	[source_device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_events].[xif4wsm_events].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_events] ON [dbo].[wsm_events] (
	[status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_firmware_definition].[xwsm_firmware_definition_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_firmware_definition_name] ON [dbo].[wsm_firmware_definition] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_global_gui_configuration].[xif1wsm_global_gui_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_global_gui_config] ON [dbo].[wsm_global_gui_configuration] (
	[manager_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_global_gui_configuration].[xif2wsm_global_gui_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_global_gui_config] ON [dbo].[wsm_global_gui_configuration] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_global_gui_configuration].[xwsm_global_gui_config_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_global_gui_config_grp] ON [dbo].[wsm_global_gui_configuration] (
	[name] ASC,
	[group] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_icon_group].[xif1wsm_icon_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_icon_group] ON [dbo].[wsm_icon_group] (
	[status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_image].[xif1wsm_image].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_image] ON [dbo].[wsm_image] (
	[image_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_intrusion_rules].[xwsm_intrusionrules_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_intrusionrules_name] ON [dbo].[wsm_intrusion_rules] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_level].[xak1wsm_level].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1wsm_level] ON [dbo].[wsm_level] (
	[location_id] ASC,
	[level_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_level].[xif1wsm_level].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_level] ON [dbo].[wsm_level] (
	[location_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_level].[xif2wsm_level].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_level] ON [dbo].[wsm_level] (
	[image_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_level].[xif3wsm_level].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_level] ON [dbo].[wsm_level] (
	[propogation_model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_attribdef_to_model].[xif1wsm_link_attribdef_to_mode].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_attribdef_to_mode] ON [dbo].[wsm_link_attribdef_to_model] (
	[attribute_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_attribdef_to_model].[xif2wsm_link_attribdef_to_mode].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_attribdef_to_mode] ON [dbo].[wsm_link_attribdef_to_model] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_config_to_device].[xif1wsm_link_config_to_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_config_to_device] ON [dbo].[wsm_link_config_to_device] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_config_to_device].[xif2wsm_link_config_to_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_config_to_device] ON [dbo].[wsm_link_config_to_device] (
	[config_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_firmware_def_to_model].[xif2wsm_link_firmware_def_to_m].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_firmware_def_to_m] ON [dbo].[wsm_link_firmware_def_to_model] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_firmware_def_to_model].[xif3wsm_link_firmware_def_to_m].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_link_firmware_def_to_m] ON [dbo].[wsm_link_firmware_def_to_model] (
	[firmware_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_firmware_def_to_model].[xif4wsm_link_firmware_def_to_mod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_link_firmware_def_to_mod] ON [dbo].[wsm_link_firmware_def_to_model] (
	[rule_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_firmware_to_device].[xif1wsm_link_firmware_to_devic].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_firmware_to_devic] ON [dbo].[wsm_link_firmware_to_device] (
	[firmware_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_firmware_to_device].[xif2wsm_link_firmware_to_devic].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_firmware_to_devic] ON [dbo].[wsm_link_firmware_to_device] (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_icongrp_to_model].[xif1wsm_link_icongrp_to_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_icongrp_to_model] ON [dbo].[wsm_link_icongrp_to_model] (
	[icongroup_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_icongrp_to_model].[xif2wsm_link_icongrp_to_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_icongrp_to_model] ON [dbo].[wsm_link_icongrp_to_model] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_model_method_tmplate].[xif1wsm_link_model_method_tmpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_model_method_tmpl] ON [dbo].[wsm_link_model_method_tmplate] (
	[model_method_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_model_method_tmplate].[xif2wsm_link_model_method_tmpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_model_method_tmpl] ON [dbo].[wsm_link_model_method_tmplate] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_model_method_tmplate].[xif3wsm_link_model_method_tmplat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_link_model_method_tmplat] ON [dbo].[wsm_link_model_method_tmplate] (
	[rule_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_model_to_template].[xif1wsm_link_model_to_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_model_to_template] ON [dbo].[wsm_link_model_to_template] (
	[templateuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_model_to_template].[xif2wsm_link_model_to_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_model_to_template] ON [dbo].[wsm_link_model_to_template] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_model_to_template].[xif3wsm_link_model_to_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_link_model_to_template] ON [dbo].[wsm_link_model_to_template] (
	[rule_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_policy_to_policy].[xif1wsm_link_policy_to_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_policy_to_policy] ON [dbo].[wsm_link_policy_to_policy] (
	[policy_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_policy_to_policy].[xif2wsm_link_policy_to_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_policy_to_policy] ON [dbo].[wsm_link_policy_to_policy] (
	[assoc_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_frmware].[xif1wsm_link_rsrc_bundle_frmwa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_rsrc_bundle_frmwa] ON [dbo].[wsm_link_rsrc_bundle_frmware] (
	[bundleid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_frmware].[xif2wsm_link_rsrc_bundle_frmwa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_rsrc_bundle_frmwa] ON [dbo].[wsm_link_rsrc_bundle_frmware] (
	[firmware_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_tmplt].[xif1wsm_link_rsrc_bundle_tmplt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_link_rsrc_bundle_tmplt] ON [dbo].[wsm_link_rsrc_bundle_tmplt] (
	[bundleid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_tmplt].[xif2wsm_link_rsrc_bundle_tmplt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_link_rsrc_bundle_tmplt] ON [dbo].[wsm_link_rsrc_bundle_tmplt] (
	[templateuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_location].[xak1wsm_location].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1wsm_location] ON [dbo].[wsm_location] (
	[location_id] ASC,
	[ca_location_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_location].[xif1wsm_location].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_location] ON [dbo].[wsm_location] (
	[manager_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_location].[xif2wsm_location].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_location] ON [dbo].[wsm_location] (
	[ca_location_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_location].[xif3wsm_location].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_location] ON [dbo].[wsm_location] (
	[site_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model].[xif1wsm_supported_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_supported_model] ON [dbo].[wsm_model] (
	[device_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model].[xif2wsm_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_model] ON [dbo].[wsm_model] (
	[parent_model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model].[xif3wsm_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_model] ON [dbo].[wsm_model] (
	[manufacturer_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model].[xwsm_model_key].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_model_key] ON [dbo].[wsm_model] (
	[model_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model_method_template].[xwsm_modelmethodtemplate_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_modelmethodtemplate_name] ON [dbo].[wsm_model_method_template] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model_relationship].[xif1wsm_model_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_model_relationship] ON [dbo].[wsm_model_relationship] (
	[model_uuid_aside] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model_relationship].[xif2wsm_model_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_model_relationship] ON [dbo].[wsm_model_relationship] (
	[model_uuid_bside] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model_relationship].[xif3wsm_model_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_model_relationship] ON [dbo].[wsm_model_relationship] (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_propogation_model].[xwsm_prop_model_key].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_prop_model_key] ON [dbo].[wsm_propogation_model] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_propogation_model_ext].[xif1wsm_propogation_model_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_propogation_model_ext] ON [dbo].[wsm_propogation_model_ext] (
	[propogation_model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_propogation_model_ext].[xif2wsm_propogation_model_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_propogation_model_ext] ON [dbo].[wsm_propogation_model_ext] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_provisioning].[xif2wsm_provisioning].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_provisioning] ON [dbo].[wsm_provisioning] (
	[sched_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_relationship_attrib].[xif1wsm_relationship_attrib].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_relationship_attrib] ON [dbo].[wsm_relationship_attrib] (
	[device_id_sidea] ASC,
	[device_id_sideb] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_relationship_attrib].[xif2wsm_relationship_attrib].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_relationship_attrib] ON [dbo].[wsm_relationship_attrib] (
	[attribute_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_resource_bundle].[xwsm_resource_bundle_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_resource_bundle_name] ON [dbo].[wsm_resource_bundle] (
	[name] ASC,
	[locale_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_rule].[xwsm_rule_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_rule_name] ON [dbo].[wsm_rule] (
	[rulename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_status_definition].[xwsm_status_definition_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_status_definition_group] ON [dbo].[wsm_status_definition] (
	[status_id] ASC,
	[status_group] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_subnets].[xif1wsm_assigned_subnets].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_assigned_subnets] ON [dbo].[wsm_subnets] (
	[manager_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_task_attribute].[xif1wsm_task_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_task_attribute] ON [dbo].[wsm_task_attribute] (
	[manager_uuid] ASC,
	[taskid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_task_attribute].[xif2wsm_task_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_task_attribute] ON [dbo].[wsm_task_attribute] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_task_list].[xif1wsm_task_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_task_list] ON [dbo].[wsm_task_list] (
	[manager_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_task_list].[xif2wsm_task_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_task_list] ON [dbo].[wsm_task_list] (
	[task_sched_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_task_list].[xif3wsm_task_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_task_list] ON [dbo].[wsm_task_list] (
	[status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_template].[xif1wsm_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_template] ON [dbo].[wsm_template] (
	[template_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_template].[xwsm_template_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_template_name] ON [dbo].[wsm_template] (
	[name] ASC,
	[version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_template_type].[xwsm_template_type_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_template_type_name] ON [dbo].[wsm_template_type] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user].[xak1wsm_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xak1wsm_user] ON [dbo].[wsm_user] (
	[username] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user].[xif1wsm_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_user] ON [dbo].[wsm_user] (
	[userprofile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user_gui_config_item].[xif1wsm_user_gui_config_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_user_gui_config_item] ON [dbo].[wsm_user_gui_config_item] (
	[config_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user_gui_config_item].[xif2wsm_user_gui_config_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_user_gui_config_item] ON [dbo].[wsm_user_gui_config_item] (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user_gui_config_item].[xwsm_userguiconfigitem_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_userguiconfigitem_grp] ON [dbo].[wsm_user_gui_config_item] (
	[config_uuid] ASC,
	[group] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user_gui_configuration].[xif1wsm_user_gui_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_user_gui_configuration] ON [dbo].[wsm_user_gui_configuration] (
	[user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user_gui_configuration].[xif2wsm_user_gui_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_user_gui_configuration] ON [dbo].[wsm_user_gui_configuration] (
	[manager_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user_gui_configuration].[xwsm_user_gui_configuration_us].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_user_gui_configuration_us] ON [dbo].[wsm_user_gui_configuration] (
	[user_uuid] ASC,
	[manager_uuid] ASC,
	[config_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[xif1wsm_userprofile_assoc_deta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif1wsm_userprofile_assoc_deta] ON [dbo].[wsm_userprofile_assoc_detail] (
	[policy_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[xif2wsm_userprofile_assoc_deta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif2wsm_userprofile_assoc_deta] ON [dbo].[wsm_userprofile_assoc_detail] (
	[userprofile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[xif3wsm_userprofile_assoc_deta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif3wsm_userprofile_assoc_deta] ON [dbo].[wsm_userprofile_assoc_detail] (
	[rule_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[xif4wsm_userprofile_assoc_deta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xif4wsm_userprofile_assoc_deta] ON [dbo].[wsm_userprofile_assoc_detail] (
	[sched_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_userprofile_detail].[xwsm_userprofile_detail_name].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xwsm_userprofile_detail_name] ON [dbo].[wsm_userprofile_detail] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wspcol].[wspcol_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [wspcol_x1] ON [dbo].[wspcol] (
	[table_name] ASC,
	[column_name] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsptbl].[wsptbl_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [wsptbl_x1] ON [dbo].[wsptbl] (
	[table_name] ASC,
	[status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanodevice].[sanodevice_dx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sanodevice_dx1] ON [dbo].[wtanodevice] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanointerface].[sanointerface_dx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sanointerface_dx1] ON [dbo].[wtanointerface] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanointerface].[sanointerface_dx2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sanointerface_dx2] ON [dbo].[wtanointerface] (
	[device_name] ASC,
	[ifindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanointerface].[sanointerface_dx3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [sanointerface_dx3] ON [dbo].[wtanointerface] (
	[device_name] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmp].[baseidx_wtcacmo_hacmp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hacmp] ON [dbo].[wtcacmo_hacmp] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmp].[x_cacmo_hacmp_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hacmp_x] ON [dbo].[wtcacmo_hacmp] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmphost].[baseidx_wtcacmo_hacmphost].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hacmphost] ON [dbo].[wtcacmo_hacmphost] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmphost].[x_cacmo_hacmphost_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hacmphost_x] ON [dbo].[wtcacmo_hacmphost] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmpinterface].[baseidx_wtcacmo_hacmpinterface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hacmpinterface] ON [dbo].[wtcacmo_hacmpinterface] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmpinterface].[x_cacmo_hacmpinterface_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hacmpinterface_x] ON [dbo].[wtcacmo_hacmpinterface] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmpresource].[baseidx_wtcacmo_hacmpresource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hacmpresource] ON [dbo].[wtcacmo_hacmpresource] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmpresource].[x_cacmo_hacmpresource_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hacmpresource_x] ON [dbo].[wtcacmo_hacmpresource] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmpresourcegroup].[baseidx_wtcacmo_hacmpresourcegroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hacmpresourcegroup] ON [dbo].[wtcacmo_hacmpresourcegroup] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hacmpresourcegroup].[x_cacmo_hacmpresourcegroup_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hacmpresourcegroup_x] ON [dbo].[wtcacmo_hacmpresourcegroup] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpserviceguard].[baseidx_wtcacmo_hpserviceguard].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hpserviceguard] ON [dbo].[wtcacmo_hpserviceguard] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpserviceguard].[x_cacmo_hpserviceguard_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hpserviceguard_x] ON [dbo].[wtcacmo_hpserviceguard] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpsgfilesystem].[baseidx_wtcacmo_hpsgfilesystem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hpsgfilesystem] ON [dbo].[wtcacmo_hpsgfilesystem] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpsgfilesystem].[x_cacmo_hpsgfilesystem_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hpsgfilesystem_x] ON [dbo].[wtcacmo_hpsgfilesystem] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpsghost].[baseidx_wtcacmo_hpsghost].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hpsghost] ON [dbo].[wtcacmo_hpsghost] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpsghost].[x_cacmo_hpsghost_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hpsghost_x] ON [dbo].[wtcacmo_hpsghost] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpsgpackage].[baseidx_wtcacmo_hpsgpackage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hpsgpackage] ON [dbo].[wtcacmo_hpsgpackage] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpsgpackage].[x_cacmo_hpsgpackage_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hpsgpackage_x] ON [dbo].[wtcacmo_hpsgpackage] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpsgservice].[baseidx_wtcacmo_hpsgservice].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_hpsgservice] ON [dbo].[wtcacmo_hpsgservice] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_hpsgservice].[x_cacmo_hpsgservice_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_hpsgservice_x] ON [dbo].[wtcacmo_hpsgservice] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_schost].[baseidx_wtcacmo_schost].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_schost] ON [dbo].[wtcacmo_schost] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_schost].[x_cacmo_schost_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_schost_x] ON [dbo].[wtcacmo_schost] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_veritascluster].[baseidx_wtcacmo_veritascluster].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtcacmo_veritascluster] ON [dbo].[wtcacmo_veritascluster] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_veritascluster].[x_cacmo_veritascluster_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_cacmo_veritascluster_x] ON [dbo].[wtcacmo_veritascluster] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plmem].[baseidx_wtdro_plmem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtdro_plmem] ON [dbo].[wtdro_plmem] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plmem].[x_dro_plmem_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_dro_plmem_x] ON [dbo].[wtdro_plmem] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plpar].[baseidx_wtdro_plpar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtdro_plpar] ON [dbo].[wtdro_plpar] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plpar].[x_dro_plpar_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_dro_plpar_x] ON [dbo].[wtdro_plpar] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plpartition].[baseidx_wtdro_plpartition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtdro_plpartition] ON [dbo].[wtdro_plpartition] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plpartition].[x_dro_plpartition_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_dro_plpartition_x] ON [dbo].[wtdro_plpartition] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plprofile].[baseidx_wtdro_plprofile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtdro_plprofile] ON [dbo].[wtdro_plprofile] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plprofile].[x_dro_plprofile_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_dro_plprofile_x] ON [dbo].[wtdro_plprofile] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plslot].[baseidx_wtdro_plslot].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtdro_plslot] ON [dbo].[wtdro_plslot] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plslot].[x_dro_plslot_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_dro_plslot_x] ON [dbo].[wtdro_plslot] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend_domain].[baseidx_wtdro_sunfire_highend_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtdro_sunfire_highend_domain] ON [dbo].[wtdro_sunfire_highend_domain] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend_domain].[x_dro_sunfire_highend_domai_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_dro_sunfire_highend_domai_x] ON [dbo].[wtdro_sunfire_highend_domain] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_domain].[baseidx_wtdro_sunfire_midrange_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtdro_sunfire_midrange_domain] ON [dbo].[wtdro_sunfire_midrange_domain] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_domain].[x_dro_sunfire_midrange_doma_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_dro_sunfire_midrange_doma_x] ON [dbo].[wtdro_sunfire_midrange_domain] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmicrosoftadsdevice].[baseidx_wtmicrosoftadsdevice].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [baseidx_wtmicrosoftadsdevice] ON [dbo].[wtmicrosoftadsdevice] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmicrosoftadsdevice].[x_microsoftadsdevice_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_microsoftadsdevice_x] ON [dbo].[wtmicrosoftadsdevice] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmedia].[ssmedia_dx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmedia_dx1] ON [dbo].[wtssmedia] (
	[suuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmedia].[ssmedia_dx2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmedia_dx2] ON [dbo].[wtssmedia] (
	[address] ASC,
	[if_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmedia].[ssmedia_dx3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmedia_dx3] ON [dbo].[wtssmedia] (
	[mac_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmedia].[ssmedia_dx4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmedia_dx4] ON [dbo].[wtssmedia] (
	[nc_seg_class] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmedia].[ssmedia_dx5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmedia_dx5] ON [dbo].[wtssmedia] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmedia].[ssmedia_dx6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmedia_dx6] ON [dbo].[wtssmedia] (
	[tng_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmedia].[x_ssmedia_suuid_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_ssmedia_suuid_x] ON [dbo].[wtssmedia] (
	[suuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmodule].[ssmodule_dx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmodule_dx1] ON [dbo].[wtssmodule] (
	[parent_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmodule].[ssmodule_dx2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmodule_dx2] ON [dbo].[wtssmodule] (
	[module_serial] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmodule].[ssmodule_dx3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssmodule_dx3] ON [dbo].[wtssmodule] (
	[parent_uuid] ASC,
	[module_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssport].[ssport_dx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssport_dx1] ON [dbo].[wtssport] (
	[switch_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssport].[ssport_dx2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssport_dx2] ON [dbo].[wtssport] (
	[switch_address] ASC,
	[if_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssport].[ssport_dx3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssport_dx3] ON [dbo].[wtssport] (
	[parent_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssport].[ssport_dx4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssport_dx4] ON [dbo].[wtssport] (
	[switch_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssport].[ssport_dx5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssport_dx5] ON [dbo].[wtssport] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssroute].[x_ssroute_address_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_ssroute_address_x] ON [dbo].[wtssroute] (
	[address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssroute].[x_ssroute_next_hop_address_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_ssroute_next_hop_address_x] ON [dbo].[wtssroute] (
	[next_hop_address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssswitch].[ssswitch_dx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssswitch_dx1] ON [dbo].[wtssswitch] (
	[address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssswitch].[ssswitch_dx2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssswitch_dx2] ON [dbo].[wtssswitch] (
	[parent_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssswitch].[ssswitch_dx3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssswitch_dx3] ON [dbo].[wtssswitch] (
	[tng_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssswitch].[x_ssswitch_address_x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [x_ssswitch_address_x] ON [dbo].[wtssswitch] (
	[address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssvlan].[ssvlan_dx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssvlan_dx1] ON [dbo].[wtssvlan] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssvlan].[ssvlan_dx2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssvlan_dx2] ON [dbo].[wtssvlan] (
	[uuid] ASC,
	[vlan_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssvlan].[ssvlan_dx3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssvlan_dx3] ON [dbo].[wtssvlan] (
	[parent_uuid] ASC,
	[vlan_index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssvtpdomain].[ssvtpdomain_dx1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssvtpdomain_dx1] ON [dbo].[wtssvtpdomain] (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssvtpdomain].[ssvtpdomain_dx2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [ssvtpdomain_dx2] ON [dbo].[wtssvtpdomain] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[xent_map].[xent_map_x0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [xent_map_x0] ON [dbo].[xent_map] (
	[xentity_id] ASC,
	[xschema_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[xent_map].[xent_map_x1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE NONCLUSTERED INDEX [xent_map_x1] ON [dbo].[xent_map] (
	[ob_persid] ASC
) ON [PRIMARY]

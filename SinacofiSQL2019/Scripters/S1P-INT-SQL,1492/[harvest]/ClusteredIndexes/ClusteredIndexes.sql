
GO
--SqlScripter----[dbo].[acc_lvls].[XPKacc_lvls].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[acc_lvls] ADD CONSTRAINT [XPKacc_lvls] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[acctyp].[XPKacctyp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[acctyp] ADD CONSTRAINT [XPKacctyp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[act_log].[XPKact_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[act_log] ADD CONSTRAINT [XPKact_log] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[act_type].[XPKact_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[act_type] ADD CONSTRAINT [XPKact_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actbool].[XPKactbool].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[actbool] ADD CONSTRAINT [XPKactbool] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[action].[XPKaction].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[action] ADD CONSTRAINT [XPKaction] PRIMARY KEY CLUSTERED (
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actiongroup].[XPKactiongroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[actiongroup] ADD CONSTRAINT [XPKactiongroup] PRIMARY KEY CLUSTERED (
	[actiongroupid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actiontype].[XPKactiontype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[actiontype] ADD CONSTRAINT [XPKactiontype] PRIMARY KEY CLUSTERED (
	[actiontype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[actrbool].[XPKactrbool].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[actrbool] ADD CONSTRAINT [XPKactrbool] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[addmemo].[XPKaddmemo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[addmemo] ADD CONSTRAINT [XPKaddmemo] PRIMARY KEY CLUSTERED (
	[adid] ASC,
	[adtype] ASC,
	[part] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[addtext].[XPKaddtext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[addtext] ADD CONSTRAINT [XPKaddtext] PRIMARY KEY CLUSTERED (
	[adid] ASC,
	[adtype] ASC,
	[part] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[admin_tree].[XPKadmin_tree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[admin_tree] ADD CONSTRAINT [XPKadmin_tree] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[aec_hist_report_v2].[XPKaec_hist_report_v2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[aec_hist_report_v2] ADD CONSTRAINT [XPKaec_hist_report_v2] PRIMARY KEY CLUSTERED (
	[policyname] ASC,
	[rulename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[aec_policy].[XPKaec_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[aec_policy] ADD CONSTRAINT [XPKaec_policy] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fddef_prop].[ai_fddef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_fddef_prop_ak1] ON [dbo].[ai_fddef_prop] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_fsdef_prop].[ai_fsdef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_fsdef_prop_ak1] ON [dbo].[ai_fsdef_prop] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_hwdef_rel].[ai_hfdef_hwdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_hfdef_hwdef_rel_ak1] ON [dbo].[ai_hfdef_hwdef_rel] (
	[hfuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_instcnt_kpi].[ai_hfdef_instcnt_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hfdef_instcnt_kpi] ADD CONSTRAINT [ai_hfdef_instcnt_kpi_pk] PRIMARY KEY CLUSTERED (
	[hfuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hfdef_prop].[ai_hfdef_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hfdef_prop] ADD CONSTRAINT [ai_hfdef_prop_pk] PRIMARY KEY CLUSTERED (
	[hfuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_classdef_rel].[ai_hwdef_classdef_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_classdef_rel] ADD CONSTRAINT [ai_hwdef_classdef_rel_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_cpuperf_kpi].[ai_hwdef_cpuperf_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [ai_hwdef_cpuperf_kpi_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_createdate_kpi].[ai_hwdef_createdate_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_createdate_kpi] ADD CONSTRAINT [ai_hwdef_createdate_kpi_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_all_rel].[ai_hwdef_login_all_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_hwdef_login_all_rel_ak1] ON [dbo].[ai_hwdef_login_all_rel] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_lscandate_rel].[ai_hwdef_login_lscandate_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_login_lscandate_rel] ADD CONSTRAINT [ai_hwdef_login_lscandate_rel_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_maxscan_rel].[ai_hwdef_login_maxscan_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_login_maxscan_rel] ADD CONSTRAINT [ai_hwdef_login_maxscan_rel_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_login_rel].[ai_hwdef_login_rel_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_login_rel] ADD CONSTRAINT [ai_hwdef_login_rel_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_lscandate_kpi].[ai_hwdef_lscandate_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_lscandate_kpi] ADD CONSTRAINT [ai_hwdef_lscandate_kpi_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_mac_kpi].[ai_hwdef_mac_kpi_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_hwdef_mac_kpi_ak1] ON [dbo].[ai_hwdef_mac_kpi] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_osinstdate_kpi].[ai_hwdef_osinstdate_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_osinstdate_kpi] ADD CONSTRAINT [ai_hwdef_osinstdate_kpi_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_hwdef_prop].[ai_hwdef_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [ai_hwdef_prop_pk] PRIMARY KEY CLUSTERED (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_ipdef_prop].[ai_ipdef_prop_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_ipdef_prop_ak1] ON [dbo].[ai_ipdef_prop] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_orgdef_rel].[ai_orgdef_rel_ak3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_orgdef_rel_ak3] ON [dbo].[ai_orgdef_rel] (
	[orgnm] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_hwdef_rel].[ai_osdef_hwdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_osdef_hwdef_rel_ak1] ON [dbo].[ai_osdef_hwdef_rel] (
	[osuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_instcnt_kpi].[ai_osdef_instcnt_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_osdef_instcnt_kpi] ADD CONSTRAINT [ai_osdef_instcnt_kpi_pk] PRIMARY KEY CLUSTERED (
	[osuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_osdef_prop].[ai_osdef_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_osdef_prop] ADD CONSTRAINT [ai_osdef_prop_pk] PRIMARY KEY CLUSTERED (
	[osuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_pubdef_hwdef_rel].[ai_pubdef_hwdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_pubdef_hwdef_rel_ak1] ON [dbo].[ai_pubdef_hwdef_rel] (
	[pubuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_pubdef_instcnt_kpi].[ai_pubdef_instcnt_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_pubdef_instcnt_kpi] ADD CONSTRAINT [ai_pubdef_instcnt_kpi_pk] PRIMARY KEY CLUSTERED (
	[pubuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_pubdef_prop].[ai_pubdef_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_pubdef_prop] ADD CONSTRAINT [ai_pubdef_prop_pk] PRIMARY KEY CLUSTERED (
	[pubuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_hwdef_rel].[ai_swcat_hwdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_swcat_hwdef_rel_ak1] ON [dbo].[ai_swcat_hwdef_rel] (
	[scuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_instcnt_kpi].[ai_swcat_instcnt_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_swcat_instcnt_kpi] ADD CONSTRAINT [ai_swcat_instcnt_kpi_pk] PRIMARY KEY CLUSTERED (
	[scuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_prop].[ai_swcat_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_swcat_prop] ADD CONSTRAINT [ai_swcat_prop_pk] PRIMARY KEY CLUSTERED (
	[scuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swcat_swdef_rel].[ai_swcat_swdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_swcat_swdef_rel_ak1] ON [dbo].[ai_swcat_swdef_rel] (
	[scuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_hwdef_rel].[ai_swdef_hwdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_swdef_hwdef_rel_ak1] ON [dbo].[ai_swdef_hwdef_rel] (
	[swuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_instcnt_kpi].[ai_swdef_instcnt_kpi_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_swdef_instcnt_kpi] ADD CONSTRAINT [ai_swdef_instcnt_kpi_pk] PRIMARY KEY CLUSTERED (
	[swuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_swdef_prop].[ai_swdef_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_swdef_prop] ADD CONSTRAINT [ai_swdef_prop_pk] PRIMARY KEY CLUSTERED (
	[swuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_undef_hwdef_rel].[ai_undef_hwdef_rel_ak1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ai_undef_hwdef_rel_ak1] ON [dbo].[ai_undef_hwdef_rel] (
	[hwuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_orgtree_prop].[PK__ai_usrdef_orgtre__4F5D9FD3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_usrdef_orgtree_prop] ADD CONSTRAINT [PK__ai_usrdef_orgtre__4F5D9FD3] PRIMARY KEY CLUSTERED (
	[pmf] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ai_usrdef_prop].[ai_usrdef_prop_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ai_usrdef_prop] ADD CONSTRAINT [ai_usrdef_prop_pk] PRIMARY KEY CLUSTERED (
	[samid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_approved_licenses].[PK_am_approved_licenses].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[am_approved_licenses] ADD CONSTRAINT [PK_am_approved_licenses] PRIMARY KEY CLUSTERED (
	[license_uuid] ASC,
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_link_external_device].[XPKam_link_external_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[am_link_external_device] ADD CONSTRAINT [XPKam_link_external_device] PRIMARY KEY CLUSTERED (
	[link_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_link_object_folder].[XPKam_link_object_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[am_link_object_folder] ADD CONSTRAINT [XPKam_link_object_folder] PRIMARY KEY CLUSTERED (
	[folder_domain_id] ASC,
	[folder_id] ASC,
	[object_domain_id] ASC,
	[object_id] ASC,
	[object_type] ASC,
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_map].[XPKam_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[am_map] ADD CONSTRAINT [XPKam_map] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[am_object_folder].[XPKam_object_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[am_object_folder] ADD CONSTRAINT [XPKam_object_folder] PRIMARY KEY CLUSTERED (
	[folder_domain_id] ASC,
	[folder_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[amaccmap].[XPKamaccmap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[amaccmap] ADD CONSTRAINT [XPKamaccmap] PRIMARY KEY CLUSTERED (
	[acid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[amepdef].[XPKamepdef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[amepdef] ADD CONSTRAINT [XPKamepdef] PRIMARY KEY CLUSTERED (
	[epid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[amepjobs].[XPKamepjobs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[amepjobs] ADD CONSTRAINT [XPKamepjobs] PRIMARY KEY CLUSTERED (
	[epid] ASC,
	[epdomid] ASC,
	[epjtype] ASC,
	[epjorder] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[amlegacy_objects].[XPKamlegacy_objects].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[amlegacy_objects] ADD CONSTRAINT [XPKamlegacy_objects] PRIMARY KEY CLUSTERED (
	[old_domain_id] ASC,
	[old_id] ASC,
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[anima].[XPKanima].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[anima] ADD CONSTRAINT [XPKanima] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[application_option].[XPKapplication_option].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[application_option] ADD CONSTRAINT [XPKapplication_option] PRIMARY KEY CLUSTERED (
	[application_option_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[application_type].[XPKapplication_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[application_type] ADD CONSTRAINT [XPKapplication_type] PRIMARY KEY CLUSTERED (
	[application_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[applied_remediation].[XPKapplied_remediation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[applied_remediation] ADD CONSTRAINT [XPKapplied_remediation] PRIMARY KEY CLUSTERED (
	[applied_remediation_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[applied_remediation_status].[XPKapplied_remediation_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[applied_remediation_status] ADD CONSTRAINT [XPKapplied_remediation_status] PRIMARY KEY CLUSTERED (
	[applied_remed_status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[approvalaction].[XPKapprovalaction].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[approvalaction] ADD CONSTRAINT [XPKapprovalaction] PRIMARY KEY CLUSTERED (
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[appuknow].[XPKappuknow].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[appuknow] ADD CONSTRAINT [XPKappuknow] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[filepart] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arcpur_hist].[XPKarcpur_hist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arcpur_hist] ADD CONSTRAINT [XPKarcpur_hist] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arcpur_rule].[XPKarcpur_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arcpur_rule] ADD CONSTRAINT [XPKarcpur_rule] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_action].[XPKarg_action].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_action] ADD CONSTRAINT [XPKarg_action] PRIMARY KEY CLUSTERED (
	[acadid] ASC,
	[object_uuid] ASC,
	[ac1ivid] ASC,
	[acdatedt] ASC,
	[actimetm] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_actiondf].[XPKarg_actiondf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_actiondf] ADD CONSTRAINT [XPKarg_actiondf] PRIMARY KEY CLUSTERED (
	[adid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_actionlk].[XPKarg_actionlk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_actionlk] ADD CONSTRAINT [XPKarg_actionlk] PRIMARY KEY CLUSTERED (
	[lkacadid] ASC,
	[primary_object_uuid] ASC,
	[lkac1ivi] ASC,
	[lkacdadt] ASC,
	[lkactitm] ASC,
	[lkndid] ASC,
	[secondary_object_uuid] ASC,
	[lk2ivid] ASC,
	[lkinstnc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_argdeflt].[XPKarg_argdeflt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_argdeflt] ADD CONSTRAINT [XPKarg_argdeflt] PRIMARY KEY CLUSTERED (
	[dfid] ASC,
	[dfkey] ASC,
	[dfsubkey] ASC,
	[dftype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_assetver].[XPKarg_assetver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_assetver] ADD CONSTRAINT [XPKarg_assetver] PRIMARY KEY CLUSTERED (
	[own_resource_uuid] ASC,
	[avivid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_attachmt].[XPKarg_attachmt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_attachmt] ADD CONSTRAINT [XPKarg_attachmt] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[amid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_attribute_def].[XPKarg_attribute_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_attribute_def] ADD CONSTRAINT [XPKarg_attribute_def] PRIMARY KEY CLUSTERED (
	[class_name] ASC,
	[attribute_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_class_def].[XPKarg_class_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_class_def] ADD CONSTRAINT [XPKarg_class_def] PRIMARY KEY CLUSTERED (
	[class_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_controls].[XPKarg_controls].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_controls] ADD CONSTRAINT [XPKarg_controls] PRIMARY KEY CLUSTERED (
	[cnid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_costdet].[XPKarg_costdet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_costdet] ADD CONSTRAINT [XPKarg_costdet] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[cdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_drpdnlst].[XPKarg_drpdnlst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_drpdnlst] ADD CONSTRAINT [XPKarg_drpdnlst] PRIMARY KEY CLUSTERED (
	[dlldid] ASC,
	[dlkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefhdr].[XPKarg_evdefhdr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_evdefhdr] ADD CONSTRAINT [XPKarg_evdefhdr] PRIMARY KEY CLUSTERED (
	[evid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evdefny].[XPKarg_evdefny].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_evdefny] ADD CONSTRAINT [XPKarg_evdefny] PRIMARY KEY CLUSTERED (
	[enevid] ASC,
	[enid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evnotify].[XPKarg_evnotify].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_evnotify] ADD CONSTRAINT [XPKarg_evnotify] PRIMARY KEY CLUSTERED (
	[nyerid] ASC,
	[nyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_evrem].[XPKarg_evrem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_evrem] ADD CONSTRAINT [XPKarg_evrem] PRIMARY KEY CLUSTERED (
	[erid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_extension_rule_def].[XPKarg_extension_rule_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_extension_rule_def] ADD CONSTRAINT [XPKarg_extension_rule_def] PRIMARY KEY CLUSTERED (
	[rule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_extsys].[XPKarg_extsys].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_extsys] ADD CONSTRAINT [XPKarg_extsys] PRIMARY KEY CLUSTERED (
	[esid] ASC,
	[object_uuid] ASC,
	[esivid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_field_def].[XPKarg_field_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_field_def] ADD CONSTRAINT [XPKarg_field_def] PRIMARY KEY CLUSTERED (
	[table_name] ASC,
	[field_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtcrit].[XPKarg_filtcrit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_filtcrit] ADD CONSTRAINT [XPKarg_filtcrit] PRIMARY KEY CLUSTERED (
	[fcfeid] ASC,
	[fcid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtdata].[XPKarg_filtdata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_filtdata] ADD CONSTRAINT [XPKarg_filtdata] PRIMARY KEY CLUSTERED (
	[ftfeid] ASC,
	[ftfcid] ASC,
	[ftid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtdef].[XPKarg_filtdef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_filtdef] ADD CONSTRAINT [XPKarg_filtdef] PRIMARY KEY CLUSTERED (
	[feid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_filtind].[XPKarg_filtind].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_filtind] ADD CONSTRAINT [XPKarg_filtind] PRIMARY KEY CLUSTERED (
	[fnfeid] ASC,
	[fnfcid] ASC,
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hierarchy_def].[PK__arg_hier__8558943B44428990].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_hierarchy_def] ADD CONSTRAINT [PK__arg_hier__8558943B44428990] PRIMARY KEY CLUSTERED (
	[hierarchy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hierarchy_values].[PK__arg_hier__D3EA685C48131A74].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_hierarchy_values] ADD CONSTRAINT [PK__arg_hier__D3EA685C48131A74] PRIMARY KEY CLUSTERED (
	[hierarchy_value_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_history].[XPKarg_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_history] ADD CONSTRAINT [XPKarg_history] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[table_name] ASC,
	[field_name] ASC,
	[hsinstnc] ASC,
	[last_update_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hsnotify].[XPKarg_hsnotify].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_hsnotify] ADD CONSTRAINT [XPKarg_hsnotify] PRIMARY KEY CLUSTERED (
	[hnhrid] ASC,
	[hnid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_hsrem].[XPKarg_hsrem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_hsrem] ADD CONSTRAINT [XPKarg_hsrem] PRIMARY KEY CLUSTERED (
	[hrid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_index_def].[XPKarg_index_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_index_def] ADD CONSTRAINT [XPKarg_index_def] PRIMARY KEY CLUSTERED (
	[index_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_index_member].[XPKarg_index_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_index_member] ADD CONSTRAINT [XPKarg_index_member] PRIMARY KEY CLUSTERED (
	[index_name] ASC,
	[member_instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_intrface].[XPKarg_intrface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_intrface] ADD CONSTRAINT [XPKarg_intrface] PRIMARY KEY CLUSTERED (
	[ifdssys] ASC,
	[ifdatest] ASC,
	[ifdbnbr] ASC,
	[ifsrobj] ASC,
	[ifseq] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_intxref].[XPKarg_intxref].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_intxref] ADD CONSTRAINT [XPKarg_intxref] PRIMARY KEY CLUSTERED (
	[own_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_itemver].[XPKarg_itemver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_itemver] ADD CONSTRAINT [XPKarg_itemver] PRIMARY KEY CLUSTERED (
	[model_uuid] ASC,
	[ivid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_job].[PK_arg_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_job] ADD CONSTRAINT [PK_arg_job] PRIMARY KEY CLUSTERED (
	[job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_job_task].[PK_arg_job_task].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_job_task] ADD CONSTRAINT [PK_arg_job_task] PRIMARY KEY CLUSTERED (
	[job_id] ASC,
	[job_task_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_join_def].[XPKarg_join_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_join_def] ADD CONSTRAINT [XPKarg_join_def] PRIMARY KEY CLUSTERED (
	[join_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_join_member].[XPKarg_join_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_join_member] ADD CONSTRAINT [XPKarg_join_member] PRIMARY KEY CLUSTERED (
	[join_name] ASC,
	[member_instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_keydef].[XPKarg_keydef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_keydef] ADD CONSTRAINT [XPKarg_keydef] PRIMARY KEY CLUSTERED (
	[kdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_keyword].[XPKarg_keyword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_keyword] ADD CONSTRAINT [XPKarg_keyword] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[kwkdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legaldef].[XPKarg_legaldef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_legaldef] ADD CONSTRAINT [XPKarg_legaldef] PRIMARY KEY CLUSTERED (
	[lgid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legaldet].[XPKarg_legaldet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_legaldet] ADD CONSTRAINT [XPKarg_legaldet] PRIMARY KEY CLUSTERED (
	[legaldoc_uuid] ASC,
	[lttdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legaldoc].[XPKarg_legaldoc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_legaldoc] ADD CONSTRAINT [XPKarg_legaldoc] PRIMARY KEY CLUSTERED (
	[legaldoc_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legalpar].[XPKarg_legalpar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_legalpar] ADD CONSTRAINT [XPKarg_legalpar] PRIMARY KEY CLUSTERED (
	[legaldoc_uuid] ASC,
	[company_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legasset].[XPKarg_legasset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_legasset] ADD CONSTRAINT [XPKarg_legasset] PRIMARY KEY CLUSTERED (
	[legaldoc_uuid] ASC,
	[own_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_legasstc].[XPKarg_legasstc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_legasstc] ADD CONSTRAINT [XPKarg_legasstc] PRIMARY KEY CLUSTERED (
	[legaldoc_uuid] ASC,
	[own_resource_uuid] ASC,
	[lctdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_link_notification_attachmt].[PK__arg_link__4FCDF5644BE3AB58].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_link_notification_attachmt] ADD CONSTRAINT [PK__arg_link__4FCDF5644BE3AB58] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[amid] ASC,
	[nyerid] ASC,
	[nyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_linkdef].[XPKarg_linkdef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_linkdef] ADD CONSTRAINT [XPKarg_linkdef] PRIMARY KEY CLUSTERED (
	[ndadid] ASC,
	[ndid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_listdef].[XPKarg_listdef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_listdef] ADD CONSTRAINT [XPKarg_listdef] PRIMARY KEY CLUSTERED (
	[ldid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_ltcdef].[XPKarg_ltcdef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_ltcdef] ADD CONSTRAINT [XPKarg_ltcdef] PRIMARY KEY CLUSTERED (
	[tdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_map].[XPKarg_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_map] ADD CONSTRAINT [XPKarg_map] PRIMARY KEY CLUSTERED (
	[old_object_id_1] ASC,
	[old_object_id_2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_map_db].[XPKarg_map_db].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_map_db] ADD CONSTRAINT [XPKarg_map_db] PRIMARY KEY CLUSTERED (
	[old_table_name] ASC,
	[old_field_name] ASC,
	[new_table_name] ASC,
	[new_field_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_note_text].[XPKarg_note_text].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_note_text] ADD CONSTRAINT [XPKarg_note_text] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_notes].[XPKarg_notes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_notes] ADD CONSTRAINT [XPKarg_notes] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[noinstnc] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_paydet].[XPKarg_paydet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_paydet] ADD CONSTRAINT [XPKarg_paydet] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[pdcdid] ASC,
	[pdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_query_assignment].[XPKarg_query_assignment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_query_assignment] ADD CONSTRAINT [XPKarg_query_assignment] PRIMARY KEY CLUSTERED (
	[query_id] ASC,
	[assignment_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_query_def].[XPKarg_query_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_query_def] ADD CONSTRAINT [XPKarg_query_def] PRIMARY KEY CLUSTERED (
	[query_id] ASC,
	[instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_data].[XPKarg_reconcile_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_reconcile_data] ADD CONSTRAINT [XPKarg_reconcile_data] PRIMARY KEY CLUSTERED (
	[task_uuid] ASC,
	[reconcile_data_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_modification].[XPKarg_reconcile_modification].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_reconcile_modification] ADD CONSTRAINT [XPKarg_reconcile_modification] PRIMARY KEY CLUSTERED (
	[sys_name] ASC,
	[reconcile_modification_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_msg_queue].[XPKarg_reconcile_msg_queue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_reconcile_msg_queue] ADD CONSTRAINT [XPKarg_reconcile_msg_queue] PRIMARY KEY CLUSTERED (
	[task_uuid] ASC,
	[reconcile_msg_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_rule].[XPKarg_reconcile_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_reconcile_rule] ADD CONSTRAINT [XPKarg_reconcile_rule] PRIMARY KEY CLUSTERED (
	[task_uuid] ASC,
	[rule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_reconcile_task].[XPKarg_reconcile_task].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_reconcile_task] ADD CONSTRAINT [XPKarg_reconcile_task] PRIMARY KEY CLUSTERED (
	[task_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_roledef].[XPKarg_roledef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_roledef] ADD CONSTRAINT [XPKarg_roledef] PRIMARY KEY CLUSTERED (
	[rdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_script].[XPKarg_script].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_script] ADD CONSTRAINT [XPKarg_script] PRIMARY KEY CLUSTERED (
	[sctype] ASC,
	[scobtype] ASC,
	[instance] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_security].[XPKarg_security].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_security] ADD CONSTRAINT [XPKarg_security] PRIMARY KEY CLUSTERED (
	[serdid] ASC,
	[secnid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_stathist].[XPKarg_stathist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_stathist] ADD CONSTRAINT [XPKarg_stathist] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[shivid] ASC,
	[shstatus] ASC,
	[shstatdt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_strlst].[XPKarg_strlst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_strlst] ADD CONSTRAINT [XPKarg_strlst] PRIMARY KEY CLUSTERED (
	[slid] ASC,
	[slentry] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_table_def].[XPKarg_table_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_table_def] ADD CONSTRAINT [XPKarg_table_def] PRIMARY KEY CLUSTERED (
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_tclgdef].[XPKarg_tclgdef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_tclgdef] ADD CONSTRAINT [XPKarg_tclgdef] PRIMARY KEY CLUSTERED (
	[tllgid] ASC,
	[tltdid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_translation_list].[XPKarg_translation_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_translation_list] ADD CONSTRAINT [XPKarg_translation_list] PRIMARY KEY CLUSTERED (
	[translation_list_id] ASC,
	[translation_list_entry] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_xmlcache_in].[XPKarg_xmlcache_in].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_xmlcache_in] ADD CONSTRAINT [XPKarg_xmlcache_in] PRIMARY KEY CLUSTERED (
	[cache_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[arg_xmlcache_ss].[XPKarg_xmlcache_ss].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[arg_xmlcache_ss] ADD CONSTRAINT [XPKarg_xmlcache_ss] PRIMARY KEY CLUSTERED (
	[cache_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_event].[XPKasmo_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_event] ADD CONSTRAINT [XPKasmo_event] PRIMARY KEY CLUSTERED (
	[event_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_object].[XPKasmo_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_object] ADD CONSTRAINT [XPKasmo_object] PRIMARY KEY CLUSTERED (
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_platform].[XPKasmo_platform].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_platform] ADD CONSTRAINT [XPKasmo_platform] PRIMARY KEY CLUSTERED (
	[platform_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_roles].[$asmo__u00000f6400000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_roles] ADD CONSTRAINT [$asmo__u00000f6400000000] PRIMARY KEY CLUSTERED (
	[role_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_rpt].[XPKasmo_rpt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_rpt] ADD CONSTRAINT [XPKasmo_rpt] PRIMARY KEY CLUSTERED (
	[msg_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_rules].[$asmo__u00000f6a00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_rules] ADD CONSTRAINT [$asmo__u00000f6a00000000] PRIMARY KEY CLUSTERED (
	[rule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_state].[XPKasmo_state].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_state] ADD CONSTRAINT [XPKasmo_state] PRIMARY KEY CLUSTERED (
	[state_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_tasks].[$asmo__u00000e5400000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_tasks] ADD CONSTRAINT [$asmo__u00000e5400000000] PRIMARY KEY CLUSTERED (
	[task_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_type].[XPKasmo_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_type] ADD CONSTRAINT [XPKasmo_type] PRIMARY KEY CLUSTERED (
	[type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_users].[$asmo__u00000f6700000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_users] ADD CONSTRAINT [$asmo__u00000f6700000000] PRIMARY KEY CLUSTERED (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asmo_views].[$asmo__u00000f6d00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asmo_views] ADD CONSTRAINT [$asmo__u00000f6d00000000] PRIMARY KEY CLUSTERED (
	[view_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_detection_profile].[XPKasset_detection_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asset_detection_profile] ADD CONSTRAINT [XPKasset_detection_profile] PRIMARY KEY CLUSTERED (
	[asset_detection_profile_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_detection_profile_status].[XPKasset_detection_profile_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asset_detection_profile_status] ADD CONSTRAINT [XPKasset_detection_profile_status] PRIMARY KEY CLUSTERED (
	[asset_detect_profile_status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_group].[XPKasset_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asset_group] ADD CONSTRAINT [XPKasset_group] PRIMARY KEY CLUSTERED (
	[asset_group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_group_process_schedule].[XPKasset_group_process_schedule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asset_group_process_schedule] ADD CONSTRAINT [XPKasset_group_process_schedule] PRIMARY KEY CLUSTERED (
	[asset_grp_proc_sched_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_group_software_product].[XPKasset_group_software_product].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asset_group_software_product] ADD CONSTRAINT [XPKasset_group_software_product] PRIMARY KEY CLUSTERED (
	[asset_group_software_prod_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_software_delivery_job].[XPKasset_software_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asset_software_delivery_job] ADD CONSTRAINT [XPKasset_software_delivery_job] PRIMARY KEY CLUSTERED (
	[asset_software_delivery_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_vulnerability].[XPKasset_vulnerability].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asset_vulnerability] ADD CONSTRAINT [XPKasset_vulnerability] PRIMARY KEY CLUSTERED (
	[asset_vulnerability_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[asset_work_archive].[XPKasset_work_archive].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[asset_work_archive] ADD CONSTRAINT [XPKasset_work_archive] PRIMARY KEY CLUSTERED (
	[archive_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[atn].[XPKatn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[atn] ADD CONSTRAINT [XPKatn] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[atomic_cond].[XPKatomic_cond].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[atomic_cond] ADD CONSTRAINT [XPKatomic_cond] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[att_evt].[XPKatt_evt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[att_evt] ADD CONSTRAINT [XPKatt_evt] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attached_sla].[XPKattached_sla].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[attached_sla] ADD CONSTRAINT [XPKattached_sla] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt].[XPKattmnt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[attmnt] ADD CONSTRAINT [XPKattmnt] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_folder].[XPKattmnt_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[attmnt_folder] ADD CONSTRAINT [XPKattmnt_folder] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[attmnt_lrel].[XPKattmnt_lrel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[attmnt_lrel] ADD CONSTRAINT [XPKattmnt_lrel] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[atyp_asc].[XPKatyp_asc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[atyp_asc] ADD CONSTRAINT [XPKatyp_asc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[audit_log].[XPKaudit_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[audit_log] ADD CONSTRAINT [XPKaudit_log] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[audithis].[XPKaudithis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[audithis] ADD CONSTRAINT [XPKaudithis] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[exename] ASC,
	[sttotal] ASC,
	[vernr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_active_user_policy].[XPKbackup_active_user_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_active_user_policy] ADD CONSTRAINT [XPKbackup_active_user_policy] PRIMARY KEY CLUSTERED (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_agent_config].[XPKbackup_agent_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_agent_config] ADD CONSTRAINT [XPKbackup_agent_config] PRIMARY KEY CLUSTERED (
	[agent_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_alert].[XPKbackup_alert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_alert] ADD CONSTRAINT [XPKbackup_alert] PRIMARY KEY CLUSTERED (
	[alert_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_archive].[XPKbackup_archive].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_archive] ADD CONSTRAINT [XPKbackup_archive] PRIMARY KEY CLUSTERED (
	[archive_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_backed_up_file].[XPKbackup_backed_up_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_backed_up_file] ADD CONSTRAINT [XPKbackup_backed_up_file] PRIMARY KEY CLUSTERED (
	[backed_up_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_backed_up_file_revision].[XPKbackup_backed_up_file_revision].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_backed_up_file_revision] ADD CONSTRAINT [XPKbackup_backed_up_file_revision] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[backup_run_date] ASC,
	[backed_up_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_backed_up_folder].[XPKbackup_backed_up_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_backed_up_folder] ADD CONSTRAINT [XPKbackup_backed_up_folder] PRIMARY KEY CLUSTERED (
	[backed_up_folder_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_data_growth].[XPKbackup_data_growth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_data_growth] ADD CONSTRAINT [XPKbackup_data_growth] PRIMARY KEY CLUSTERED (
	[data_growth_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_email_def].[XPKbackup_email_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_email_def] ADD CONSTRAINT [XPKbackup_email_def] PRIMARY KEY CLUSTERED (
	[email_def_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_job].[XPKbackup_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_job] ADD CONSTRAINT [XPKbackup_job] PRIMARY KEY CLUSTERED (
	[job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_job_member].[XPKbackup_job_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_job_member] ADD CONSTRAINT [XPKbackup_job_member] PRIMARY KEY CLUSTERED (
	[member_id] ASC,
	[job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_policy_server].[XPKbackup_link_backup_policy_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_link_backup_policy_server] ADD CONSTRAINT [XPKbackup_link_backup_policy_server] PRIMARY KEY CLUSTERED (
	[server_id] ASC,
	[backup_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_set_policy].[XPKbackup_link_backup_set_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_link_backup_set_policy] ADD CONSTRAINT [XPKbackup_link_backup_set_policy] PRIMARY KEY CLUSTERED (
	[backup_policy_id] ASC,
	[backup_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_backup_set_user].[XPKbackup_link_backup_set_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_link_backup_set_user] ADD CONSTRAINT [XPKbackup_link_backup_set_user] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[backup_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_link_job_file_object].[XPKbackup_link_job_file_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_link_job_file_object] ADD CONSTRAINT [XPKbackup_link_job_file_object] PRIMARY KEY CLUSTERED (
	[job_id] ASC,
	[file_object_id] ASC,
	[object_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_login_history].[XPKbackup_login_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_login_history] ADD CONSTRAINT [XPKbackup_login_history] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[login_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_manager].[XPKbackup_manager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_manager] ADD CONSTRAINT [XPKbackup_manager] PRIMARY KEY CLUSTERED (
	[manager_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_msg_log].[XPKbackup_msg_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_msg_log] ADD CONSTRAINT [XPKbackup_msg_log] PRIMARY KEY CLUSTERED (
	[msg_log_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_msg_log_config].[XPKbackup_msg_log_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_msg_log_config] ADD CONSTRAINT [XPKbackup_msg_log_config] PRIMARY KEY CLUSTERED (
	[msg_log_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_network_throttle].[XPKbackup_network_throttle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_network_throttle] ADD CONSTRAINT [XPKbackup_network_throttle] PRIMARY KEY CLUSTERED (
	[network_throttle_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_performed_backup].[XPKbackup_performed_backup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_performed_backup] ADD CONSTRAINT [XPKbackup_performed_backup] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[backup_run_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_performed_restore].[XPKbackup_performed_restore].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_performed_restore] ADD CONSTRAINT [XPKbackup_performed_restore] PRIMARY KEY CLUSTERED (
	[restore_run_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_policy].[XPKbackup_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_policy] ADD CONSTRAINT [XPKbackup_policy] PRIMARY KEY CLUSTERED (
	[backup_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_query_based_policy].[XPKbackup_query_based_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_query_based_policy] ADD CONSTRAINT [XPKbackup_query_based_policy] PRIMARY KEY CLUSTERED (
	[query_based_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_restored_file].[XPKbackup_restored_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_restored_file] ADD CONSTRAINT [XPKbackup_restored_file] PRIMARY KEY CLUSTERED (
	[restore_run_date] ASC,
	[backed_up_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_schedule].[XPKbackup_schedule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_schedule] ADD CONSTRAINT [XPKbackup_schedule] PRIMARY KEY CLUSTERED (
	[schedule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server].[XPKbackup_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_server] ADD CONSTRAINT [XPKbackup_server] PRIMARY KEY CLUSTERED (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_server_config].[XPKbackup_server_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_server_config] ADD CONSTRAINT [XPKbackup_server_config] PRIMARY KEY CLUSTERED (
	[server_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_set].[XPKbackup_set].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_set] ADD CONSTRAINT [XPKbackup_set] PRIMARY KEY CLUSTERED (
	[backup_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_set_include_exclude].[XPKbackup_set_include_exclude].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_set_include_exclude] ADD CONSTRAINT [XPKbackup_set_include_exclude] PRIMARY KEY CLUSTERED (
	[backup_set_id] ASC,
	[include_exclude_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_set_inventory_selection_p].[XPKbackup_set_inventory_selection_p].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_set_inventory_selection_p] ADD CONSTRAINT [XPKbackup_set_inventory_selection_p] PRIMARY KEY CLUSTERED (
	[backup_set_id] ASC,
	[inventory_selection_path_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_statistic].[XPKbackup_statistic].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_statistic] ADD CONSTRAINT [XPKbackup_statistic] PRIMARY KEY CLUSTERED (
	[server_id] ASC,
	[statistic_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user].[XPKbackup_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_user] ADD CONSTRAINT [XPKbackup_user] PRIMARY KEY CLUSTERED (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user_drive].[XPKbackup_user_drive].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_user_drive] ADD CONSTRAINT [XPKbackup_user_drive] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[drive_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[backup_user_shell_folder].[XPKbackup_user_shell_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[backup_user_shell_folder] ADD CONSTRAINT [XPKbackup_user_shell_folder] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[shell_folder_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bckbin].[XPKbckbin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bckbin] ADD CONSTRAINT [XPKbckbin] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[bckid] ASC,
	[bdomid] ASC,
	[bkver] ASC,
	[bknr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bckdef].[XPKbckdef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bckdef] ADD CONSTRAINT [XPKbckdef] PRIMARY KEY CLUSTERED (
	[bckid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bckfile].[XPKbckfile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bckfile] ADD CONSTRAINT [XPKbckfile] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[bckid] ASC,
	[bdomid] ASC,
	[bkver] ASC,
	[bknr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bhvtpl].[XPKbhvtpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bhvtpl] ADD CONSTRAINT [XPKbhvtpl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bit_support].[XPKbit_support].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bit_support] ADD CONSTRAINT [XPKbit_support] PRIMARY KEY CLUSTERED (
	[bit_support_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bool_tab].[XPKbool_tab].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bool_tab] ADD CONSTRAINT [XPKbool_tab] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bp_standard_category].[XPKbp_standard_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bp_standard_category] ADD CONSTRAINT [XPKbp_standard_category] PRIMARY KEY CLUSTERED (
	[bp_standard_category_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bpwshft].[XPKbpwshft].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bpwshft] ADD CONSTRAINT [XPKbpwshft] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[bu_trans].[XPKbu_trans].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[bu_trans] ADD CONSTRAINT [XPKbu_trans] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[buscls].[XPKbuscls].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[buscls] ADD CONSTRAINT [XPKbuscls] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[buslrel].[XPKbuslrel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[buslrel] ADD CONSTRAINT [XPKbuslrel] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busrep].[XPKbusrep].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[busrep] ADD CONSTRAINT [XPKbusrep] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[busstat].[XPKbusstat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[busstat] ADD CONSTRAINT [XPKbusstat] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_acme_checkpoint].[XPKca_acme_checkpoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_acme_checkpoint] ADD CONSTRAINT [XPKca_acme_checkpoint] PRIMARY KEY CLUSTERED (
	[message_type_uuid] ASC,
	[message_version_number] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_agent].[XPKca_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_agent] ADD CONSTRAINT [XPKca_agent] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_agent_component].[XPKca_agent_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_agent_component] ADD CONSTRAINT [XPKca_agent_component] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[agent_comp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_application_registration].[XPKca_application_registration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_application_registration] ADD CONSTRAINT [XPKca_application_registration] PRIMARY KEY CLUSTERED (
	[product_code] ASC,
	[major_version] ASC,
	[minor_version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset].[XPKca_asset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_asset] ADD CONSTRAINT [XPKca_asset] PRIMARY KEY CLUSTERED (
	[asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset_class].[XPKca_asset_class].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_asset_class] ADD CONSTRAINT [XPKca_asset_class] PRIMARY KEY CLUSTERED (
	[logical_asset_uuid] ASC,
	[hierarchy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset_source_location].[XPKca_asset_source_location].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_asset_source_location] ADD CONSTRAINT [XPKca_asset_source_location] PRIMARY KEY CLUSTERED (
	[source_location_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset_subschema].[XPKca_asset_subschema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_asset_subschema] ADD CONSTRAINT [XPKca_asset_subschema] PRIMARY KEY CLUSTERED (
	[subschema_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_asset_type].[XPKca_asset_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_asset_type] ADD CONSTRAINT [XPKca_asset_type] PRIMARY KEY CLUSTERED (
	[asset_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_capacity_unit].[XPKca_capacity_unit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_capacity_unit] ADD CONSTRAINT [XPKca_capacity_unit] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_category_def].[XPKca_category_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_category_def] ADD CONSTRAINT [XPKca_category_def] PRIMARY KEY CLUSTERED (
	[category_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_category_member].[XPKca_category_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_category_member] ADD CONSTRAINT [XPKca_category_member] PRIMARY KEY CLUSTERED (
	[category_uuid] ASC,
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_class_ace].[XPKca_class_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_class_ace] ADD CONSTRAINT [XPKca_class_ace] PRIMARY KEY CLUSTERED (
	[security_profile_uuid] ASC,
	[class_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_class_def].[XPKca_class_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_class_def] ADD CONSTRAINT [XPKca_class_def] PRIMARY KEY CLUSTERED (
	[class_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_class_hierarchy].[XPKca_class_hierarchy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_class_hierarchy] ADD CONSTRAINT [XPKca_class_hierarchy] PRIMARY KEY CLUSTERED (
	[hierarchy_id] ASC,
	[child_class_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_company].[XPKca_company].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_company] ADD CONSTRAINT [XPKca_company] PRIMARY KEY CLUSTERED (
	[company_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_company_type].[XPKca_company_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_company_type] ADD CONSTRAINT [XPKca_company_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_config_item].[XPKca_config_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_config_item] ADD CONSTRAINT [XPKca_config_item] PRIMARY KEY CLUSTERED (
	[config_item_uuid] ASC,
	[asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_configuration_policy].[XPKca_configuration_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_configuration_policy] ADD CONSTRAINT [XPKca_configuration_policy] PRIMARY KEY CLUSTERED (
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact].[XPKca_contact].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_contact] ADD CONSTRAINT [XPKca_contact] PRIMARY KEY CLUSTERED (
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_contact_type].[XPKca_contact_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_contact_type] ADD CONSTRAINT [XPKca_contact_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_country].[XPKca_country].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_country] ADD CONSTRAINT [XPKca_country] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_currency_type].[XPKca_currency_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_currency_type] ADD CONSTRAINT [XPKca_currency_type] PRIMARY KEY CLUSTERED (
	[currency_type_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_directory_details].[XPKca_directory_details].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_directory_details] ADD CONSTRAINT [XPKca_directory_details] PRIMARY KEY CLUSTERED (
	[directory_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_directory_schema_map].[XPKca_directory_schema_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_directory_schema_map] ADD CONSTRAINT [XPKca_directory_schema_map] PRIMARY KEY CLUSTERED (
	[dir_schema_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_disc_event].[XPKca_disc_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_disc_event] ADD CONSTRAINT [XPKca_disc_event] PRIMARY KEY CLUSTERED (
	[event_index] ASC,
	[logical_asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware].[XPKca_discovered_hardware].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_discovered_hardware] ADD CONSTRAINT [XPKca_discovered_hardware] PRIMARY KEY CLUSTERED (
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware_ext_sys].[XPKca_discovered_hardware_ext_sys].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_discovered_hardware_ext_sys] ADD CONSTRAINT [XPKca_discovered_hardware_ext_sys] PRIMARY KEY CLUSTERED (
	[dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_hardware_network].[XPKca_discovered_hardware_network].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_discovered_hardware_network] ADD CONSTRAINT [XPKca_discovered_hardware_network] PRIMARY KEY CLUSTERED (
	[dis_hw_uuid] ASC,
	[mac_address] ASC,
	[dns_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_software].[XPKca_discovered_software].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_discovered_software] ADD CONSTRAINT [XPKca_discovered_software] PRIMARY KEY CLUSTERED (
	[dis_sw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_software_prop].[XPKca_discovered_software_prop].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_discovered_software_prop] ADD CONSTRAINT [XPKca_discovered_software_prop] PRIMARY KEY CLUSTERED (
	[dis_sw_prop_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_discovered_user].[XPKca_discovered_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_discovered_user] ADD CONSTRAINT [XPKca_discovered_user] PRIMARY KEY CLUSTERED (
	[user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_document].[XPKca_document].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_document] ADD CONSTRAINT [XPKca_document] PRIMARY KEY CLUSTERED (
	[doc_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_download_file].[XPKca_download_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_download_file] ADD CONSTRAINT [XPKca_download_file] PRIMARY KEY CLUSTERED (
	[download_file_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_dscv_class_combo_rules].[XPKca_dscv_class_combo_rules].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_dscv_class_combo_rules] ADD CONSTRAINT [XPKca_dscv_class_combo_rules] PRIMARY KEY CLUSTERED (
	[combination_id] ASC,
	[class_id] ASC,
	[hierarchy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_dscv_class_method_params].[XPKca_dscv_class_method_params].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_dscv_class_method_params] ADD CONSTRAINT [XPKca_dscv_class_method_params] PRIMARY KEY CLUSTERED (
	[method_id] ASC,
	[param_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_dscv_class_methods].[XPKca_dscv_class_methods].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_dscv_class_methods] ADD CONSTRAINT [XPKca_dscv_class_methods] PRIMARY KEY CLUSTERED (
	[method_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_dscv_class_relationships].[XPKca_dscv_class_relationships].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] ADD CONSTRAINT [XPKca_dscv_class_relationships] PRIMARY KEY CLUSTERED (
	[dst_class_id] ASC,
	[src_class_id] ASC,
	[src_hierarchy_id] ASC,
	[dst_hierarchy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_dscv_class_rules].[XPKca_dscv_class_rules].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_dscv_class_rules] ADD CONSTRAINT [XPKca_dscv_class_rules] PRIMARY KEY CLUSTERED (
	[classify_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_dscv_method_instances].[XPKca_dscv_method_instances].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_dscv_method_instances] ADD CONSTRAINT [XPKca_dscv_method_instances] PRIMARY KEY CLUSTERED (
	[classify_id] ASC,
	[method_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_engine].[XPKca_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_engine] ADD CONSTRAINT [XPKca_engine] PRIMARY KEY CLUSTERED (
	[engine_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_geo_coord_type].[XPKca_geo_coord_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_geo_coord_type] ADD CONSTRAINT [XPKca_geo_coord_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_group_ace].[XPKca_group_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_group_ace] ADD CONSTRAINT [XPKca_group_ace] PRIMARY KEY CLUSTERED (
	[group_def_uuid] ASC,
	[security_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_group_def].[XPKca_group_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_group_def] ADD CONSTRAINT [XPKca_group_def] PRIMARY KEY CLUSTERED (
	[group_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_group_member].[XPKca_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_group_member] ADD CONSTRAINT [XPKca_group_member] PRIMARY KEY CLUSTERED (
	[member_uuid] ASC,
	[group_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_hierarchy].[XPKca_hierarchy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_hierarchy] ADD CONSTRAINT [XPKca_hierarchy] PRIMARY KEY CLUSTERED (
	[hierarchy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_image_type].[XPKca_image_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_image_type] ADD CONSTRAINT [XPKca_image_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_install_package].[XPKca_install_package].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_install_package] ADD CONSTRAINT [XPKca_install_package] PRIMARY KEY CLUSTERED (
	[install_pkg_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_install_step].[XPKca_install_step].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_install_step] ADD CONSTRAINT [XPKca_install_step] PRIMARY KEY CLUSTERED (
	[install_pkg_uuid] ASC,
	[type] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_job_function].[XPKca_job_function].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_job_function] ADD CONSTRAINT [XPKca_job_function] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_job_title].[XPKca_job_title].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_job_title] ADD CONSTRAINT [XPKca_job_title] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_language].[XPKca_language].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_language] ADD CONSTRAINT [XPKca_language] PRIMARY KEY CLUSTERED (
	[lang_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_license_def].[XPKca_license_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_license_def] ADD CONSTRAINT [XPKca_license_def] PRIMARY KEY CLUSTERED (
	[lic_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_license_type].[XPKca_license_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_license_type] ADD CONSTRAINT [XPKca_license_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_company_location].[XPKca_link_company_location].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_company_location] ADD CONSTRAINT [XPKca_link_company_location] PRIMARY KEY CLUSTERED (
	[company_uuid] ASC,
	[location_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_config_item].[XPKca_link_config_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_config_item] ADD CONSTRAINT [XPKca_link_config_item] PRIMARY KEY CLUSTERED (
	[config_item_uuid_1] ASC,
	[asset_uuid_1] ASC,
	[config_item_uuid_2] ASC,
	[asset_uuid_2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_config_item_doc].[XPKca_link_config_item_doc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_config_item_doc] ADD CONSTRAINT [XPKca_link_config_item_doc] PRIMARY KEY CLUSTERED (
	[doc_uuid] ASC,
	[config_item_uuid] ASC,
	[asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_configured_service].[XPKca_link_configured_service].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_configured_service] ADD CONSTRAINT [XPKca_link_configured_service] PRIMARY KEY CLUSTERED (
	[named_config_uuid] ASC,
	[own_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_contact_user].[XPKca_link_contact_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_contact_user] ADD CONSTRAINT [XPKca_link_contact_user] PRIMARY KEY CLUSTERED (
	[contact_uuid] ASC,
	[user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_dir_details_map].[XPKca_link_dir_details_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_dir_details_map] ADD CONSTRAINT [XPKca_link_dir_details_map] PRIMARY KEY CLUSTERED (
	[dir_details_map_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_dis_hw].[XPKca_link_dis_hw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_dis_hw] ADD CONSTRAINT [XPKca_link_dis_hw] PRIMARY KEY CLUSTERED (
	[link_dis_hw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_dis_hw_user].[XPKca_link_dis_hw_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_dis_hw_user] ADD CONSTRAINT [XPKca_link_dis_hw_user] PRIMARY KEY CLUSTERED (
	[link_dis_hw_user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_dis_user_sec_profile].[XPKca_link_dis_user_sec_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_dis_user_sec_profile] ADD CONSTRAINT [XPKca_link_dis_user_sec_profile] PRIMARY KEY CLUSTERED (
	[user_uuid] ASC,
	[security_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_lic_def_domain].[XPKca_link_lic_def_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_lic_def_domain] ADD CONSTRAINT [XPKca_link_lic_def_domain] PRIMARY KEY CLUSTERED (
	[lic_def_uuid] ASC,
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_license_sw_def].[XPKca_link_license_sw_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_license_sw_def] ADD CONSTRAINT [XPKca_link_license_sw_def] PRIMARY KEY CLUSTERED (
	[license_uuid] ASC,
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_logical_asset_class_def].[XPKca_link_logical_asset_class_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_logical_asset_class_def] ADD CONSTRAINT [XPKca_link_logical_asset_class_def] PRIMARY KEY CLUSTERED (
	[class_id] ASC,
	[logical_asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_model_sw_def].[XPKca_link_model_sw_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_model_sw_def] ADD CONSTRAINT [XPKca_link_model_sw_def] PRIMARY KEY CLUSTERED (
	[model_uuid] ASC,
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_named_config_doc].[XPKca_link_named_config_doc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_named_config_doc] ADD CONSTRAINT [XPKca_link_named_config_doc] PRIMARY KEY CLUSTERED (
	[doc_uuid] ASC,
	[named_config_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_named_config_item].[XPKca_link_named_config_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_named_config_item] ADD CONSTRAINT [XPKca_link_named_config_item] PRIMARY KEY CLUSTERED (
	[named_config_uuid] ASC,
	[config_item_uuid] ASC,
	[asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_object_owner].[XPKca_link_object_owner].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_object_owner] ADD CONSTRAINT [XPKca_link_object_owner] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_sw_def].[XPKca_link_sw_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_sw_def] ADD CONSTRAINT [XPKca_link_sw_def] PRIMARY KEY CLUSTERED (
	[primary_sw_def_uuid] ASC,
	[secondary_sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_link_type].[XPKca_link_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_link_type] ADD CONSTRAINT [XPKca_link_type] PRIMARY KEY CLUSTERED (
	[link_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_locale].[XPKca_locale].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_locale] ADD CONSTRAINT [XPKca_locale] PRIMARY KEY CLUSTERED (
	[locale_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_location].[XPKca_location].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_location] ADD CONSTRAINT [XPKca_location] PRIMARY KEY CLUSTERED (
	[location_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_location_type].[XPKca_location_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_location_type] ADD CONSTRAINT [XPKca_location_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_logical_asset].[XPKca_logical_asset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_logical_asset] ADD CONSTRAINT [XPKca_logical_asset] PRIMARY KEY CLUSTERED (
	[logical_asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_logical_asset_property].[XPKca_logical_asset_property].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_logical_asset_property] ADD CONSTRAINT [XPKca_logical_asset_property] PRIMARY KEY CLUSTERED (
	[dns_name] ASC,
	[mac_address] ASC,
	[logical_asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_manager].[XPKca_manager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_manager] ADD CONSTRAINT [XPKca_manager] PRIMARY KEY CLUSTERED (
	[manager_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_manager_component].[XPKca_manager_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_manager_component] ADD CONSTRAINT [XPKca_manager_component] PRIMARY KEY CLUSTERED (
	[manager_comp_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_model_def].[XPKca_model_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_model_def] ADD CONSTRAINT [XPKca_model_def] PRIMARY KEY CLUSTERED (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_n_tier].[XPKca_n_tier].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_n_tier] ADD CONSTRAINT [XPKca_n_tier] PRIMARY KEY CLUSTERED (
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_named_configuration].[XPKca_named_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_named_configuration] ADD CONSTRAINT [XPKca_named_configuration] PRIMARY KEY CLUSTERED (
	[named_config_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_object_ace].[XPKca_object_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_object_ace] ADD CONSTRAINT [XPKca_object_ace] PRIMARY KEY CLUSTERED (
	[object_def_uuid] ASC,
	[security_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_organization].[XPKca_organization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_organization] ADD CONSTRAINT [XPKca_organization] PRIMARY KEY CLUSTERED (
	[organization_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_owned_resource].[XPKca_owned_resource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_owned_resource] ADD CONSTRAINT [XPKca_owned_resource] PRIMARY KEY CLUSTERED (
	[own_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_proc_os].[XPKca_proc_os].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_proc_os] ADD CONSTRAINT [XPKca_proc_os] PRIMARY KEY CLUSTERED (
	[proc_os_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_query_def].[XPKca_query_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_query_def] ADD CONSTRAINT [XPKca_query_def] PRIMARY KEY CLUSTERED (
	[query_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_query_def_contents].[XPKquery_def_contents].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_query_def_contents] ADD CONSTRAINT [XPKquery_def_contents] PRIMARY KEY CLUSTERED (
	[query_uuid] ASC,
	[sequence_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_query_pre_result].[XPKca_query_pre_result].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_query_pre_result] ADD CONSTRAINT [XPKca_query_pre_result] PRIMARY KEY CLUSTERED (
	[pre_result_uuid] ASC,
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_query_result].[XPKca_query_result].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_query_result] ADD CONSTRAINT [XPKca_query_result] PRIMARY KEY CLUSTERED (
	[query_uuid] ASC,
	[member_uuid] ASC,
	[query_version_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_query_version].[XPKca_query_version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_query_version] ADD CONSTRAINT [XPKca_query_version] PRIMARY KEY CLUSTERED (
	[query_version_uuid] ASC,
	[query_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_reg_control].[XPKca_reg_control].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_reg_control] ADD CONSTRAINT [XPKca_reg_control] PRIMARY KEY CLUSTERED (
	[control_uuid] ASC,
	[control_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_reg_intkeys].[XPKca_reg_intkeys].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_reg_intkeys] ADD CONSTRAINT [XPKca_reg_intkeys] PRIMARY KEY CLUSTERED (
	[intkeys_table] ASC,
	[intkeys_column] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_reg_lock].[XPKca_reg_lock].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_reg_lock] ADD CONSTRAINT [XPKca_reg_lock] PRIMARY KEY CLUSTERED (
	[ilock] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_replication_conf].[XPKca_replication_conf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_replication_conf] ADD CONSTRAINT [XPKca_replication_conf] PRIMARY KEY CLUSTERED (
	[replication_conf_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_replication_status].[XPKca_replication_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_replication_status] ADD CONSTRAINT [XPKca_replication_status] PRIMARY KEY CLUSTERED (
	[replication_conf_uuid] ASC,
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_requirement_spec].[XPKca_requirement_spec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_requirement_spec] ADD CONSTRAINT [XPKca_requirement_spec] PRIMARY KEY CLUSTERED (
	[owner_object_uuid] ASC,
	[requirement_spec_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_requirement_spec_group].[XPKca_requirement_spec_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_requirement_spec_group] ADD CONSTRAINT [XPKca_requirement_spec_group] PRIMARY KEY CLUSTERED (
	[owner_object_uuid] ASC,
	[requirement_spec_type] ASC,
	[group_sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_requirement_spec_item].[XPKca_requirement_spec_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_requirement_spec_item] ADD CONSTRAINT [XPKca_requirement_spec_item] PRIMARY KEY CLUSTERED (
	[owner_object_uuid] ASC,
	[requirement_spec_type] ASC,
	[group_sequence] ASC,
	[item_sequence_number] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_class].[XPKca_resource_class].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_resource_class] ADD CONSTRAINT [XPKca_resource_class] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_cost_center].[XPKca_resource_cost_center].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_resource_cost_center] ADD CONSTRAINT [XPKca_resource_cost_center] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_department].[XPKca_resource_department].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_resource_department] ADD CONSTRAINT [XPKca_resource_department] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_family].[XPKca_resource_family].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_resource_family] ADD CONSTRAINT [XPKca_resource_family] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_gl_code].[XPKca_resource_gl_code].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_resource_gl_code] ADD CONSTRAINT [XPKca_resource_gl_code] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_operating_system].[XPKca_resource_operating_system].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_resource_operating_system] ADD CONSTRAINT [XPKca_resource_operating_system] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_resource_status].[XPKca_resource_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_resource_status] ADD CONSTRAINT [XPKca_resource_status] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_sdi_ticket].[XPKca_sdi_ticket].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_sdi_ticket] ADD CONSTRAINT [XPKca_sdi_ticket] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[ticket_handle] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_security_class_def].[XPKca_security_class_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_security_class_def] ADD CONSTRAINT [XPKca_security_class_def] PRIMARY KEY CLUSTERED (
	[class_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_security_profile].[XPKca_security_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_security_profile] ADD CONSTRAINT [XPKca_security_profile] PRIMARY KEY CLUSTERED (
	[security_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_server].[XPKca_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_server] ADD CONSTRAINT [XPKca_server] PRIMARY KEY CLUSTERED (
	[server_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_server_component].[XPKca_server_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_server_component] ADD CONSTRAINT [XPKca_server_component] PRIMARY KEY CLUSTERED (
	[server_comp_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_server_push_status].[XPKca_server_push_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_server_push_status] ADD CONSTRAINT [XPKca_server_push_status] PRIMARY KEY CLUSTERED (
	[server_uuid] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_server_queue].[XPKca_server_queue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_server_queue] ADD CONSTRAINT [XPKca_server_queue] PRIMARY KEY CLUSTERED (
	[queue_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_settings].[XPKca_settings].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_settings] ADD CONSTRAINT [XPKca_settings] PRIMARY KEY CLUSTERED (
	[set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_site].[XPKca_site].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_site] ADD CONSTRAINT [XPKca_site] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def].[XPKca_software_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_software_def] ADD CONSTRAINT [XPKca_software_def] PRIMARY KEY CLUSTERED (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def_class_def_matrix].[XPKca_software_def_class_def_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_software_def_class_def_matrix] ADD CONSTRAINT [XPKca_software_def_class_def_matrix] PRIMARY KEY CLUSTERED (
	[class_id] ASC,
	[sw_def_uuid] ASC,
	[sw_def_class_def_matrix_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_def_types].[XPKca_software_def_types].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_software_def_types] ADD CONSTRAINT [XPKca_software_def_types] PRIMARY KEY CLUSTERED (
	[software_type_id] ASC,
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_license].[XPKca_software_license].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_software_license] ADD CONSTRAINT [XPKca_software_license] PRIMARY KEY CLUSTERED (
	[license_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_signature].[XPKca_software_signature].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_software_signature] ADD CONSTRAINT [XPKca_software_signature] PRIMARY KEY CLUSTERED (
	[signature_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_software_type].[XPKca_software_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_software_type] ADD CONSTRAINT [XPKca_software_type] PRIMARY KEY CLUSTERED (
	[software_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_source_type].[XPKca_source_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_source_type] ADD CONSTRAINT [XPKca_source_type] PRIMARY KEY CLUSTERED (
	[source_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_state_province].[XPKca_state_province].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_state_province] ADD CONSTRAINT [XPKca_state_province] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_taskwiz_def].[$ca_ta_u00000a0000000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_taskwiz_def] ADD CONSTRAINT [$ca_ta_u00000a0000000000] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ca_time_zone].[XPKca_time_zone].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ca_time_zone] ADD CONSTRAINT [XPKca_time_zone] PRIMARY KEY CLUSTERED (
	[time_zone_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[call_req].[XPKcall_req].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[call_req] ADD CONSTRAINT [XPKcall_req] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_grp].[XPKccat_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ccat_grp] ADD CONSTRAINT [XPKccat_grp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_loc].[XPKccat_loc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ccat_loc] ADD CONSTRAINT [XPKccat_loc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ccat_wrkshft].[XPKccat_wrkshft].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ccat_wrkshft] ADD CONSTRAINT [XPKccat_wrkshft] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[certificate].[XPKcertificate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[certificate] ADD CONSTRAINT [XPKcertificate] PRIMARY KEY CLUSTERED (
	[serno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[certificaterequest].[XPKcertificaterequest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[certificaterequest] ADD CONSTRAINT [XPKcertificaterequest] PRIMARY KEY CLUSTERED (
	[requestid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg].[XPKchg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[chg] ADD CONSTRAINT [XPKchg] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chg_template].[XPKchg_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[chg_template] ADD CONSTRAINT [XPKchg_template] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgalg].[XPKchgalg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[chgalg] ADD CONSTRAINT [XPKchgalg] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgcat].[XPKchgcat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[chgcat] ADD CONSTRAINT [XPKchgcat] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chgstat].[XPKchgstat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[chgstat] ADD CONSTRAINT [XPKchgstat] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[chip_set].[XPKchip_set].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[chip_set] ADD CONSTRAINT [XPKchip_set] PRIMARY KEY CLUSTERED (
	[chip_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions].[XPKci_actions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_actions] ADD CONSTRAINT [XPKci_actions] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_actions_alternate].[XPKci_actions_alternate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_actions_alternate] ADD CONSTRAINT [XPKci_actions_alternate] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_app_ext].[ci_app_ext_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_app_ext_X0] ON [dbo].[ci_app_ext] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_app_inhouse].[ci_app_inhouse_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_app_inhouse_X0] ON [dbo].[ci_app_inhouse] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_bookmarks].[XPKci_bookmarks].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_bookmarks] ADD CONSTRAINT [XPKci_bookmarks] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_contract].[ci_contract_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_contract_X0] ON [dbo].[ci_contract] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_database].[ci_database_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_database_X0] ON [dbo].[ci_database] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_doc_links].[XPKci_doc_links].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_doc_links] ADD CONSTRAINT [XPKci_doc_links] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_doc_templates].[XPKci_doc_templates].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_doc_templates] ADD CONSTRAINT [XPKci_doc_templates] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_doc_types].[XPKci_doc_types].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_doc_types] ADD CONSTRAINT [XPKci_doc_types] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_document].[ci_document_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_document_X0] ON [dbo].[ci_document] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_eligible_child].[ci_eligible_child_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ci_eligible_child_X0] ON [dbo].[ci_eligible_child] (
	[rel_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_eligible_parent].[ci_eligible_parent_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [ci_eligible_parent_X0] ON [dbo].[ci_eligible_parent] (
	[rel_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_ac].[ci_fac_ac_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_fac_ac_X0] ON [dbo].[ci_fac_ac] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_fire_control].[ci_fac_fire_control_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_fac_fire_control_X0] ON [dbo].[ci_fac_fire_control] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_furnishings].[ci_fac_furnishings_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_fac_furnishings_X0] ON [dbo].[ci_fac_furnishings] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_other].[ci_fac_other_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_fac_other_X0] ON [dbo].[ci_fac_other] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_fac_ups].[ci_fac_ups_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_fac_ups_X0] ON [dbo].[ci_fac_ups] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_lpar].[ci_hardware_lpar_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_lpar_X0] ON [dbo].[ci_hardware_lpar] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_mainframe].[ci_hardware_mainframe_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_mainframe_X0] ON [dbo].[ci_hardware_mainframe] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_monitor].[ci_hardware_monitor_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_monitor_X0] ON [dbo].[ci_hardware_monitor] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_other].[ci_hardware_other_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_other_X0] ON [dbo].[ci_hardware_other] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_printer].[ci_hardware_printer_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_printer_X0] ON [dbo].[ci_hardware_printer] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_server].[ci_hardware_server_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_server_X0] ON [dbo].[ci_hardware_server] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_storage].[ci_hardware_storage_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_storage_X0] ON [dbo].[ci_hardware_storage] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_virtual].[ci_hardware_virtual_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_virtual_X0] ON [dbo].[ci_hardware_virtual] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_hardware_workstation].[ci_hardware_workstation_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_hardware_workstation_X0] ON [dbo].[ci_hardware_workstation] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_bridge].[ci_network_bridge_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_bridge_X0] ON [dbo].[ci_network_bridge] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_cluster].[ci_network_cluster_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_cluster_X0] ON [dbo].[ci_network_cluster] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_controller].[ci_network_controller_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_controller_X0] ON [dbo].[ci_network_controller] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_frontend].[ci_network_frontend_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_frontend_X0] ON [dbo].[ci_network_frontend] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_gateway].[ci_network_gateway_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_gateway_X0] ON [dbo].[ci_network_gateway] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_hub].[ci_network_hub_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_hub_X0] ON [dbo].[ci_network_hub] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_nic].[ci_network_nic_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_nic_X0] ON [dbo].[ci_network_nic] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_other].[ci_network_other_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_other_X0] ON [dbo].[ci_network_other] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_peripheral].[ci_network_peripheral_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_peripheral_X0] ON [dbo].[ci_network_peripheral] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_port].[ci_network_port_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_port_X0] ON [dbo].[ci_network_port] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_resource].[ci_network_resource_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_resource_X0] ON [dbo].[ci_network_resource] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_resource_group].[ci_network_resource_group_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_resource_group_X0] ON [dbo].[ci_network_resource_group] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_router].[ci_network_router_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_router_X0] ON [dbo].[ci_network_router] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_network_server].[ci_network_server_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_network_server_X0] ON [dbo].[ci_network_server] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_operating_system].[ci_operating_system_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_operating_system_X0] ON [dbo].[ci_operating_system] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_priorities].[XPKci_priorities].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_priorities] ADD CONSTRAINT [XPKci_priorities] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_security].[ci_security_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_security_X0] ON [dbo].[ci_security] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_service].[ci_service_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_service_X0] ON [dbo].[ci_service] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_sla].[ci_sla_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_sla_X0] ON [dbo].[ci_sla] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_statuses].[XPKci_statuses].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_statuses] ADD CONSTRAINT [XPKci_statuses] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_ciruit].[ci_telcom_ciruit_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_telcom_ciruit_X0] ON [dbo].[ci_telcom_ciruit] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_other].[ci_telcom_other_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_telcom_other_X0] ON [dbo].[ci_telcom_other] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_radio].[ci_telcom_radio_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_telcom_radio_X0] ON [dbo].[ci_telcom_radio] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_voice].[ci_telcom_voice_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_telcom_voice_X0] ON [dbo].[ci_telcom_voice] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_telcom_wireless].[ci_telcom_wireless_X0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ci_telcom_wireless_X0] ON [dbo].[ci_telcom_wireless] (
	[ext_asset] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ci_wf_templates].[XPKci_wf_templates].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ci_wf_templates] ADD CONSTRAINT [XPKci_wf_templates] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10003DATA].[UE107d798c7ea].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10003DATA] ADD CONSTRAINT [UE107d798c7ea] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10010DATA].[UE107d798c7ed].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10010DATA] ADD CONSTRAINT [UE107d798c7ed] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10074DATA].[UE107d798c7fe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10074DATA] ADD CONSTRAINT [UE107d798c7fe] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10085DATA].[UE107d798c803].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10085DATA] ADD CONSTRAINT [UE107d798c803] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10093DATA].[UE107d798c808].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10093DATA] ADD CONSTRAINT [UE107d798c808] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10108DATA].[UE107d798c80d].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10108DATA] ADD CONSTRAINT [UE107d798c80d] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10115DATA].[UE107d798c812].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10115DATA] ADD CONSTRAINT [UE107d798c812] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10122DATA].[UE107d798c817].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10122DATA] ADD CONSTRAINT [UE107d798c817] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10130DATA].[UE107d798c81c].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10130DATA] ADD CONSTRAINT [UE107d798c81c] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10153DATA].[UE107d798c821].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10153DATA] ADD CONSTRAINT [UE107d798c821] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10160DATA].[UE107d798c826].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10160DATA] ADD CONSTRAINT [UE107d798c826] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10167DATA].[UE107d798c82b].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10167DATA] ADD CONSTRAINT [UE107d798c82b] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10175DATA].[UE107d798c830].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10175DATA] ADD CONSTRAINT [UE107d798c830] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10182DATA].[UE107d798c835].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10182DATA] ADD CONSTRAINT [UE107d798c835] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10190DATA].[UE107d798c83a].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10190DATA] ADD CONSTRAINT [UE107d798c83a] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10197DATA].[UE107d798c83f].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10197DATA] ADD CONSTRAINT [UE107d798c83f] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10205DATA].[UE107d798c844].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10205DATA] ADD CONSTRAINT [UE107d798c844] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10219DATA].[UE107d798c849].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10219DATA] ADD CONSTRAINT [UE107d798c849] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10226DATA].[UE107d798c84e].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10226DATA] ADD CONSTRAINT [UE107d798c84e] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACL10233DATA].[UE107d798c853].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACL10233DATA] ADD CONSTRAINT [UE107d798c853] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSACLPORTALLINKDATA].[CMSPKACLPORTALLINK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSACLPORTALLINKDATA] ADD CONSTRAINT [CMSPKACLPORTALLINK] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSADMINASSETRESOURCEDATA].[UE107d798c7e4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSADMINASSETRESOURCEDATA] ADD CONSTRAINT [UE107d798c7e4] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSADMINRESOURCEBACKBONEDATA].[UE107d798c7e5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSADMINRESOURCEBACKBONEDATA] ADD CONSTRAINT [UE107d798c7e5] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSAIFFDATA].[UE107d798c805].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSAIFFDATA] ADD CONSTRAINT [UE107d798c805] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSAIONRULEMANAGERDATA].[UE107d798c800].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSAIONRULEMANAGERDATA] ADD CONSTRAINT [UE107d798c800] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSAPPROVALCHAINDATA].[UE107d798c7db].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSAPPROVALCHAINDATA] ADD CONSTRAINT [UE107d798c7db] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSASSETDATA].[UE107d798c7ec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSASSETDATA] ADD CONSTRAINT [UE107d798c7ec] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSASSETFILEMAPDATA].[UE107d798c7e9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSASSETFILEMAPDATA] ADD CONSTRAINT [UE107d798c7e9] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSAVIDATA].[UE107d798c80f].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSAVIDATA] ADD CONSTRAINT [UE107d798c80f] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSCOLLECTIONDATA].[UE107d798c7e8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSCOLLECTIONDATA] ADD CONSTRAINT [UE107d798c7e8] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cmscpcmconfig].[PK__cmscpcmc__2FD9A76C7EA4354F].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cmscpcmconfig] ADD CONSTRAINT [PK__cmscpcmc__2FD9A76C7EA4354F] PRIMARY KEY CLUSTERED (
	[param_name] ASC,
	[ueporinstanceid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSDBLOG].[PK__CMSDBLOG__05B5756A0180A1FA].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSDBLOG] ADD CONSTRAINT [PK__CMSDBLOG__05B5756A0180A1FA] PRIMARY KEY CLUSTERED (
	[UEUNIQUEID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSERRORDATA].[UE107d798c7e1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSERRORDATA] ADD CONSTRAINT [UE107d798c7e1] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cmsfastconfig].[PK__cmsfastc__2FD9A76C055132DE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cmsfastconfig] ADD CONSTRAINT [PK__cmsfastc__2FD9A76C055132DE] PRIMARY KEY CLUSTERED (
	[param_name] ASC,
	[ueporinstanceid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSGROUPDATA].[UE107d798c7df].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSGROUPDATA] ADD CONSTRAINT [UE107d798c7df] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSIMAGEDATA].[UE107d798c80a].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSIMAGEDATA] ADD CONSTRAINT [UE107d798c80a] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMDIDCOLUMNSDATA].[UE107d798c7d7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSMDIDCOLUMNSDATA] ADD CONSTRAINT [UE107d798c7d7] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMDIDDATA].[UE107d798c7d8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSMDIDDATA] ADD CONSTRAINT [UE107d798c7d8] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMP3DATA].[UE107d798c814].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSMP3DATA] ADD CONSTRAINT [UE107d798c814] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMPEGDATA].[UE107d798c819].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSMPEGDATA] ADD CONSTRAINT [UE107d798c819] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSMSOFFICEDATA].[UE107d798c81e].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSMSOFFICEDATA] ADD CONSTRAINT [UE107d798c81e] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSPDFDATA].[UE107d798c823].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSPDFDATA] ADD CONSTRAINT [UE107d798c823] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSPERSISTANTSTATEINFORMATIONDATA].[UE107d798c7d6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSPERSISTANTSTATEINFORMATIONDATA] ADD CONSTRAINT [UE107d798c7d6] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSPERSONALIZATIONDATA].[UE107d798c7e2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSPERSONALIZATIONDATA] ADD CONSTRAINT [UE107d798c7e2] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSPHOTOSHOPDATA].[UE107d798c828].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSPHOTOSHOPDATA] ADD CONSTRAINT [UE107d798c828] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSPORTALLINKDATA].[CMSPKPORTALLINK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSPORTALLINKDATA] ADD CONSTRAINT [CMSPKPORTALLINK] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSPORTALPAGEDATA].[UE107d798c855].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSPORTALPAGEDATA] ADD CONSTRAINT [UE107d798c855] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSPOSTSCRIPTDATA].[UE107d798c82d].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSPOSTSCRIPTDATA] ADD CONSTRAINT [UE107d798c82d] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSQUICKTIMEDATA].[UE107d798c832].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSQUICKTIMEDATA] ADD CONSTRAINT [UE107d798c832] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSREALAUDIODATA].[UE107d798c837].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSREALAUDIODATA] ADD CONSTRAINT [UE107d798c837] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSREALMEDIADATA].[UE107d798c83c].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSREALMEDIADATA] ADD CONSTRAINT [UE107d798c83c] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10010DATA].[UE107d798c7ee].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10010DATA] ADD CONSTRAINT [UE107d798c7ee] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10074DATA].[UE107d798c7ff].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10074DATA] ADD CONSTRAINT [UE107d798c7ff] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10085DATA].[UE107d798c804].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10085DATA] ADD CONSTRAINT [UE107d798c804] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10093DATA].[UE107d798c809].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10093DATA] ADD CONSTRAINT [UE107d798c809] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10108DATA].[UE107d798c80e].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10108DATA] ADD CONSTRAINT [UE107d798c80e] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10115DATA].[UE107d798c813].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10115DATA] ADD CONSTRAINT [UE107d798c813] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10122DATA].[UE107d798c818].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10122DATA] ADD CONSTRAINT [UE107d798c818] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10130DATA].[UE107d798c81d].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10130DATA] ADD CONSTRAINT [UE107d798c81d] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10153DATA].[UE107d798c822].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10153DATA] ADD CONSTRAINT [UE107d798c822] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10160DATA].[UE107d798c827].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10160DATA] ADD CONSTRAINT [UE107d798c827] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10167DATA].[UE107d798c82c].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10167DATA] ADD CONSTRAINT [UE107d798c82c] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10175DATA].[UE107d798c831].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10175DATA] ADD CONSTRAINT [UE107d798c831] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10182DATA].[UE107d798c836].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10182DATA] ADD CONSTRAINT [UE107d798c836] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10190DATA].[UE107d798c83b].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10190DATA] ADD CONSTRAINT [UE107d798c83b] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10197DATA].[UE107d798c840].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10197DATA] ADD CONSTRAINT [UE107d798c840] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10205DATA].[UE107d798c845].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10205DATA] ADD CONSTRAINT [UE107d798c845] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10219DATA].[UE107d798c84a].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10219DATA] ADD CONSTRAINT [UE107d798c84a] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10226DATA].[UE107d798c84f].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10226DATA] ADD CONSTRAINT [UE107d798c84f] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBK10233DATA].[UE107d798c854].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBK10233DATA] ADD CONSTRAINT [UE107d798c854] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSROLLBKPORTALLINKDATA].[CMDPKRBPORTALLINK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSROLLBKPORTALLINKDATA] ADD CONSTRAINT [CMDPKRBPORTALLINK] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSSHOCKWAVEDATA].[UE107d798c84b].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSSHOCKWAVEDATA] ADD CONSTRAINT [UE107d798c84b] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSSTDTRIGGERDATA].[UE107d798c7fb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSSTDTRIGGERDATA] ADD CONSTRAINT [UE107d798c7fb] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSUSERDATA].[UE107d798c7dd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSUSERDATA] ADD CONSTRAINT [UE107d798c7dd] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSVIEWFILESDATA].[UE107d798c850].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSVIEWFILESDATA] ADD CONSTRAINT [UE107d798c850] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWAVDATA].[UE107d798c841].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWAVDATA] ADD CONSTRAINT [UE107d798c841] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWFACLDATA].[UE107d798c7f9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWFACLDATA] ADD CONSTRAINT [UE107d798c7f9] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWFACTIVITYDATA].[UE107d798c7f6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWFACTIVITYDATA] ADD CONSTRAINT [UE107d798c7f6] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWFACTIVITYDEFDATA].[UE107d798c7f4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWFACTIVITYDEFDATA] ADD CONSTRAINT [UE107d798c7f4] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWFATTRIBUTEDATA].[UE107d798c7f3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWFATTRIBUTEDATA] ADD CONSTRAINT [UE107d798c7f3] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWFPROCESSDATA].[UE107d798c7f7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWFPROCESSDATA] ADD CONSTRAINT [UE107d798c7f7] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWFPROCESSDEFDATA].[UE107d798c7f5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWFPROCESSDEFDATA] ADD CONSTRAINT [UE107d798c7f5] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWFWORKITEMDATA].[UE107d798c7f8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWFWORKITEMDATA] ADD CONSTRAINT [UE107d798c7f8] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWINDOWSMEDIADATA].[UE107d798c846].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWINDOWSMEDIADATA] ADD CONSTRAINT [UE107d798c846] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CMSWSSTORAGEDATA].[UE107d798c7fa].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CMSWSSTORAGEDATA] ADD CONSTRAINT [UE107d798c7fa] PRIMARY KEY CLUSTERED (
	[UEDBID] ASC,
	[UEPORINSTANCEID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cn].[XPKcn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cn] ADD CONSTRAINT [XPKcn] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cnote].[XPKcnote].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cnote] ADD CONSTRAINT [XPKcnote] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[CodeFragment].[pk_CodeFragment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[CodeFragment] ADD CONSTRAINT [pk_CodeFragment] PRIMARY KEY CLUSTERED (
	[FragmentId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[columndefinition].[$colum_u0000156a00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[columndefinition] ADD CONSTRAINT [$colum_u0000156a00000000] PRIMARY KEY CLUSTERED (
	[tableidx] ASC,
	[orderofcolumn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[componentofindex].[$compo_u0000156d00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[componentofindex] ADD CONSTRAINT [$compo_u0000156d00000000] PRIMARY KEY CLUSTERED (
	[componentmibindexidx] ASC,
	[componentofindexorder] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[compression_type].[XPKcompression_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[compression_type] ADD CONSTRAINT [XPKcompression_type] PRIMARY KEY CLUSTERED (
	[compression_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[config_vuln_category_matrix].[XPKconfig_vuln_category_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[config_vuln_category_matrix] ADD CONSTRAINT [XPKconfig_vuln_category_matrix] PRIMARY KEY CLUSTERED (
	[config_vuln_cat_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[configuration_standard_set].[XPKconfiguration_standard_set].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[configuration_standard_set] ADD CONSTRAINT [XPKconfiguration_standard_set] PRIMARY KEY CLUSTERED (
	[config_standard_set_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[configuration_standard_vuln].[XPKconfiguration_standard_vuln].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[configuration_standard_vuln] ADD CONSTRAINT [XPKconfiguration_standard_vuln] PRIMARY KEY CLUSTERED (
	[vuln_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[confmemo].[XPKconfmemo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[confmemo] ADD CONSTRAINT [XPKconfmemo] PRIMARY KEY CLUSTERED (
	[unitid] ASC,
	[conftype] ASC,
	[domainid] ASC,
	[confver] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[counter].[XPKcounter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[counter] ADD CONSTRAINT [XPKcounter] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_prp].[XPKcr_prp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cr_prp] ADD CONSTRAINT [XPKcr_prp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_prptpl].[XPKcr_prptpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cr_prptpl] ADD CONSTRAINT [XPKcr_prptpl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_stat].[XPKcr_stat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cr_stat] ADD CONSTRAINT [XPKcr_stat] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[cr_template].[XPKcr_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[cr_template] ADD CONSTRAINT [XPKcr_template] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crctmr].[XPKcrctmr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[crctmr] ADD CONSTRAINT [XPKcrctmr] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crltable].[XPKcrltable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[crltable] ADD CONSTRAINT [XPKcrltable] PRIMARY KEY CLUSTERED (
	[sernum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crsol].[XPKcrsol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[crsol] ADD CONSTRAINT [XPKcrsol] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crsq].[XPKcrsq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[crsq] ADD CONSTRAINT [XPKcrsq] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[crt].[XPKcrt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[crt] ADD CONSTRAINT [XPKcrt] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_class].[XPKcsm_class].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[csm_class] ADD CONSTRAINT [XPKcsm_class] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_object].[XPKcsm_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[csm_object] ADD CONSTRAINT [XPKcsm_object] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[csm_property].[XPKcsm_property].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[csm_property] ADD CONSTRAINT [XPKcsm_property] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ct_mth].[XPKct_mth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ct_mth] ADD CONSTRAINT [XPKct_mth] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ctab].[XPKctab].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ctab] ADD CONSTRAINT [XPKctab] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[d_painter].[XPKd_painter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[d_painter] ADD CONSTRAINT [XPKd_painter] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_anlyarglist].[das_anlyarglistpkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_anlyarglist] ADD CONSTRAINT [das_anlyarglistpkey] PRIMARY KEY CLUSTERED (
	[pluginid] ASC,
	[argnumber] ASC,
	[anlydefid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_anlydef].[das_anlydefpkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_anlydef] ADD CONSTRAINT [das_anlydefpkey] PRIMARY KEY CLUSTERED (
	[anlydefid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_anlyplugin].[das_anlypluginpkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_anlyplugin] ADD CONSTRAINT [das_anlypluginpkey] PRIMARY KEY CLUSTERED (
	[pluginid] ASC,
	[anlydefid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_anlyresults].[das_anlyresultspkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_anlyresults] ADD CONSTRAINT [das_anlyresultspkey] PRIMARY KEY CLUSTERED (
	[joid] ASC,
	[runnum] ASC,
	[anlykey] ASC,
	[anlydefid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_correctiveaction].[das_correctiveactionpkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_correctiveaction] ADD CONSTRAINT [das_correctiveactionpkey] PRIMARY KEY CLUSTERED (
	[actionid] ASC,
	[recmndid] ASC,
	[anlydefid] ASC,
	[policyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_groupjob].[das_groupjobpkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_groupjob] ADD CONSTRAINT [das_groupjobpkey] PRIMARY KEY CLUSTERED (
	[jobgroupid] ASC,
	[runsequence] ASC,
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_job].[das_jobpkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_job] ADD CONSTRAINT [das_jobpkey] PRIMARY KEY CLUSTERED (
	[jobgroupid] ASC,
	[runsequence] ASC,
	[jobid] ASC,
	[runnum] ASC,
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_monservers].[das_monserverspkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_monservers] ADD CONSTRAINT [das_monserverspkey] PRIMARY KEY CLUSTERED (
	[hostid] ASC,
	[serverid] ASC,
	[productcode] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_object_list].[pk_das_object_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_object_list] ADD CONSTRAINT [pk_das_object_list] PRIMARY KEY CLUSTERED (
	[listobjectid] ASC,
	[anlydefid] ASC,
	[actionid] ASC,
	[policyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_policy].[das_policypkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_policy] ADD CONSTRAINT [das_policypkey] PRIMARY KEY CLUSTERED (
	[policyid] ASC,
	[anlydefid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_policyaction].[das_policyactionpkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_policyaction] ADD CONSTRAINT [das_policyactionpkey] PRIMARY KEY CLUSTERED (
	[policyid] ASC,
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_policyparms].[das_policyparmspkey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_policyparms] ADD CONSTRAINT [das_policyparmspkey] PRIMARY KEY CLUSTERED (
	[policyid] ASC,
	[policykey] ASC,
	[anlydefid] ASC,
	[sectionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_recmn_target].[das_recmn_targetpk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_recmn_target] ADD CONSTRAINT [das_recmn_targetpk] PRIMARY KEY CLUSTERED (
	[actionid] ASC,
	[recmndid] ASC,
	[anlydefid] ASC,
	[policyid] ASC,
	[listobjectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_recmnd].[das_recmndpk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_recmnd] ADD CONSTRAINT [das_recmndpk] PRIMARY KEY CLUSTERED (
	[recmndid] ASC,
	[anlydefid] ASC,
	[policyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_recmndtext].[pk_das_recmndtext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_recmndtext] ADD CONSTRAINT [pk_das_recmndtext] PRIMARY KEY CLUSTERED (
	[recmndid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[das_runhistoryval].[das_runhistoryvalpk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[das_runhistoryval] ADD CONSTRAINT [das_runhistoryvalpk] PRIMARY KEY CLUSTERED (
	[jobid] ASC,
	[runnum] ASC,
	[key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Application].[PK__db_Application__51477EF3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Application] ADD CONSTRAINT [PK__db_Application__51477EF3] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Column].[PK__db_Column__4111172A].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Column] ADD CONSTRAINT [PK__db_Column__4111172A] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_DataType].[PK__db_DataType__3B583DD4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_DataType] ADD CONSTRAINT [PK__db_DataType__3B583DD4] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Field].[PK__db_Field__46C9F080].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Field] ADD CONSTRAINT [PK__db_Field__46C9F080] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Gator].[PK__db_Gator__4E6B1248].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Gator] ADD CONSTRAINT [PK__db_Gator__4E6B1248] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Index].[PK__db_Index__48B238F2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Index] ADD CONSTRAINT [PK__db_Index__48B238F2] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_InfoBlob].[PK__db_InfoBlob__3787ACF0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_InfoBlob] ADD CONSTRAINT [PK__db_InfoBlob__3787ACF0] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Layout].[PK__db_Layout__44E1A80E].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Layout] ADD CONSTRAINT [PK__db_Layout__44E1A80E] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Object].[PK__db_Object__34AB4045].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Object] ADD CONSTRAINT [PK__db_Object__34AB4045] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Op].[PK__db_Op__55180FD7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Op] ADD CONSTRAINT [PK__db_Op__55180FD7] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Parameter].[PK__db_Parameter__57F47C82].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Parameter] ADD CONSTRAINT [PK__db_Parameter__57F47C82] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Program].[PK__db_Program__532FC765].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Program] ADD CONSTRAINT [PK__db_Program__532FC765] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_ProgramInstance].[PK__db_ProgramInstan__5DAD55D8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_ProgramInstance] ADD CONSTRAINT [PK__db_ProgramInstan__5DAD55D8] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_ProgramType].[PK__db_ProgramType__5F959E4A].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_ProgramType] ADD CONSTRAINT [PK__db_ProgramType__5F959E4A] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_ProgramTypeMisc].[PK__db_ProgramTypeMi__617DE6BC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_ProgramTypeMisc] ADD CONSTRAINT [PK__db_ProgramTypeMi__617DE6BC] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_PSAFile].[PK__db_PSAFile__63662F2E].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_PSAFile] ADD CONSTRAINT [PK__db_PSAFile__63662F2E] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_SeqColumn].[PK__db_SeqColumn__42F95F9C].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_SeqColumn] ADD CONSTRAINT [PK__db_SeqColumn__42F95F9C] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_SeqTable].[PK__db_SeqTable__3F28CEB8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_SeqTable] ADD CONSTRAINT [PK__db_SeqTable__3F28CEB8] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_ServerType].[PK__db_ServerType__396FF562].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_ServerType] ADD CONSTRAINT [PK__db_ServerType__396FF562] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Star].[PK__db_Star__4B8EA59D].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Star] ADD CONSTRAINT [PK__db_Star__4B8EA59D] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_Table].[PK__db_Table__3D408646].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_Table] ADD CONSTRAINT [PK__db_Table__3D408646] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_WKF].[PK__db_WKF__59DCC4F4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_WKF] ADD CONSTRAINT [PK__db_WKF__59DCC4F4] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[db_WKFConnection].[PK__db_WKFConnection__5BC50D66].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[db_WKFConnection] ADD CONSTRAINT [PK__db_WKFConnection__5BC50D66] PRIMARY KEY CLUSTERED (
	[dbrep_IID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_captures].[dbh_captures_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbh_captures] ADD CONSTRAINT [dbh_captures_pk] PRIMARY KEY CLUSTERED (
	[capture_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_bind_variables_ora].[dbh_sql_bind_variables_ora_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbh_sql_bind_variables_ora] ADD CONSTRAINT [dbh_sql_bind_variables_ora_pk] PRIMARY KEY CLUSTERED (
	[sql_id] ASC,
	[variable_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_ora].[dbh_sql_ora_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbh_sql_ora] ADD CONSTRAINT [dbh_sql_ora_pk] PRIMARY KEY CLUSTERED (
	[sql_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_tables_ora].[dbh_sql_tables_ora_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbh_sql_tables_ora] ADD CONSTRAINT [dbh_sql_tables_ora_pk] PRIMARY KEY CLUSTERED (
	[sql_id] ASC,
	[table_owner] ASC,
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dbh_sql_udb].[dbh_sql_udb_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dbh_sql_udb] ADD CONSTRAINT [dbh_sql_udb_pk] PRIMARY KEY CLUSTERED (
	[sql_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dcon].[XPKdcon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dcon] ADD CONSTRAINT [XPKdcon] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dcon_typ].[XPKdcon_typ].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dcon_typ] ADD CONSTRAINT [XPKdcon_typ] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DDColumn].[pk_DDColumn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DDColumn] ADD CONSTRAINT [pk_DDColumn] PRIMARY KEY CLUSTERED (
	[DDTableId] ASC,
	[DDColumnName] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[DDTable].[pk_DDTable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[DDTable] ADD CONSTRAINT [pk_DDTable] PRIMARY KEY CLUSTERED (
	[DDTableId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[definitions].[$defin_u000041cd00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[definitions] ADD CONSTRAINT [$defin_u000041cd00000000] PRIMARY KEY CLUSTERED (
	[productid] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[detection_profile].[XPKdetection_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[detection_profile] ADD CONSTRAINT [XPKdetection_profile] PRIMARY KEY CLUSTERED (
	[inventory_profile_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[discovered_list].[XPKdiscovered_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[discovered_list] ADD CONSTRAINT [XPKdiscovered_list] PRIMARY KEY CLUSTERED (
	[discovered_list_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[discoveryvariable].[$disco_u0000157000000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[discoveryvariable] ADD CONSTRAINT [$disco_u0000157000000000] PRIMARY KEY CLUSTERED (
	[mibidx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dlgtsrv].[XPKdlgtsrv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dlgtsrv] ADD CONSTRAINT [XPKdlgtsrv] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dmn].[XPKdmn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dmn] ADD CONSTRAINT [XPKdmn] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[doc_rep].[XPKdoc_rep].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[doc_rep] ADD CONSTRAINT [XPKdoc_rep] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dtfilter].[XPKdts_dtfilter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dts_dtfilter] ADD CONSTRAINT [XPKdts_dtfilter] PRIMARY KEY CLUSTERED (
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dtsubscribers].[XPKdts_dtsubscribers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dts_dtsubscribers] ADD CONSTRAINT [XPKdts_dtsubscribers] PRIMARY KEY CLUSTERED (
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dttransfer].[XPKdts_dttransfer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dts_dttransfer] ADD CONSTRAINT [XPKdts_dttransfer] PRIMARY KEY CLUSTERED (
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dttransfergroup].[XPKdts_dttransfergroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dts_dttransfergroup] ADD CONSTRAINT [XPKdts_dttransfergroup] PRIMARY KEY CLUSTERED (
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_dtversion].[XPKdts_dtversion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dts_dtversion] ADD CONSTRAINT [XPKdts_dtversion] PRIMARY KEY CLUSTERED (
	[object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[dts_torproperties].[XPKdts_torproperties].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[dts_torproperties] ADD CONSTRAINT [XPKdts_torproperties] PRIMARY KEY CLUSTERED (
	[object_id] ASC,
	[row_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_acronyms].[XPKebr_acronyms].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_acronyms] ADD CONSTRAINT [XPKebr_acronyms] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_dictionary].[XPKebr_dictionary].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_dictionary] ADD CONSTRAINT [XPKebr_dictionary] PRIMARY KEY CLUSTERED (
	[word] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_dictionary_adm].[XPKebr_dictionary_adm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_dictionary_adm] ADD CONSTRAINT [XPKebr_dictionary_adm] PRIMARY KEY CLUSTERED (
	[word] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext].[XPKebr_fulltext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_fulltext] ADD CONSTRAINT [XPKebr_fulltext] PRIMARY KEY CLUSTERED (
	[full_word] ASC,
	[entity_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_fulltext_adm].[XPKebr_fulltext_adm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_fulltext_adm] ADD CONSTRAINT [XPKebr_fulltext_adm] PRIMARY KEY CLUSTERED (
	[full_word] ASC,
	[entity_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_log].[XPKebr_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_log] ADD CONSTRAINT [XPKebr_log] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_metrics].[XPKebr_metrics].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_metrics] ADD CONSTRAINT [XPKebr_metrics] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_noise_words].[XPKebr_noise_words].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_noise_words] ADD CONSTRAINT [XPKebr_noise_words] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_prefixes].[XPKebr_prefixes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_prefixes] ADD CONSTRAINT [XPKebr_prefixes] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_properties].[XPKebr_properties].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_properties] ADD CONSTRAINT [XPKebr_properties] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_substits].[XPKebr_substits].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_substits] ADD CONSTRAINT [XPKebr_substits] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_suffixes].[XPKebr_suffixes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_suffixes] ADD CONSTRAINT [XPKebr_suffixes] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_synonym_groups].[XPKebr_synonym_groups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_synonym_groups] ADD CONSTRAINT [XPKebr_synonym_groups] PRIMARY KEY CLUSTERED (
	[synonym_word] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_synonym_groups_adm].[XPKebr_synonym_groups_adm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_synonym_groups_adm] ADD CONSTRAINT [XPKebr_synonym_groups_adm] PRIMARY KEY CLUSTERED (
	[synonym_word] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_synonyms].[XPKebr_synonyms].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_synonyms] ADD CONSTRAINT [XPKebr_synonyms] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ebr_synonyms_adm].[XPKebr_synonyms_adm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ebr_synonyms_adm] ADD CONSTRAINT [XPKebr_synonyms_adm] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[eccm_actionlog].[XPKeccm_actionlog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[eccm_actionlog] ADD CONSTRAINT [XPKeccm_actionlog] PRIMARY KEY CLUSTERED (
	[key1] ASC,
	[key2] ASC,
	[chrono1] ASC,
	[chrono2] ASC,
	[log_type] ASC,
	[seq] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[eccm_configuration].[XPKeccm_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[eccm_configuration] ADD CONSTRAINT [XPKeccm_configuration] PRIMARY KEY CLUSTERED (
	[eccm_configurationid] ASC,
	[provider_name] ASC,
	[product_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[eccm_log].[XPKeccm_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[eccm_log] ADD CONSTRAINT [XPKeccm_log] PRIMARY KEY CLUSTERED (
	[key1] ASC,
	[key2] ASC,
	[chrono1] ASC,
	[chrono2] ASC,
	[log_type] ASC,
	[seq] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[eccm_user].[XPKeccm_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[eccm_user] ADD CONSTRAINT [XPKeccm_user] PRIMARY KEY CLUSTERED (
	[eccmuserid] ASC,
	[userid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[emailaction].[XPKemailaction].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[emailaction] ADD CONSTRAINT [XPKemailaction] PRIMARY KEY CLUSTERED (
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package].[XPKenterprise_package].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[enterprise_package] ADD CONSTRAINT [XPKenterprise_package] PRIMARY KEY CLUSTERED (
	[ep_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package_history].[XPKenterprise_package_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[enterprise_package_history] ADD CONSTRAINT [XPKenterprise_package_history] PRIMARY KEY CLUSTERED (
	[ep_id] ASC,
	[chrono1] ASC,
	[chrono2] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package_status].[$enter_u0000351f00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[enterprise_package_status] ADD CONSTRAINT [$enter_u0000351f00000000] PRIMARY KEY CLUSTERED (
	[ep_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[enterprise_package_subpackage].[XPKenterprise_package_subpackage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[enterprise_package_subpackage] ADD CONSTRAINT [XPKenterprise_package_subpackage] PRIMARY KEY CLUSTERED (
	[sp_id] ASC,
	[ep_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Error].[pk_Error].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Error] ADD CONSTRAINT [pk_Error] PRIMARY KEY CLUSTERED (
	[RequestId] ASC,
	[ExecutionId] ASC,
	[ErrorOrder] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_constants].[XPKes_constants].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[es_constants] ADD CONSTRAINT [XPKes_constants] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_nodes].[XPKes_nodes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[es_nodes] ADD CONSTRAINT [XPKes_nodes] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_responses].[XPKes_responses].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[es_responses] ADD CONSTRAINT [XPKes_responses] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[es_sessions].[XPKes_sessions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[es_sessions] ADD CONSTRAINT [XPKes_sessions] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[event_log].[XPKevent_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[event_log] ADD CONSTRAINT [XPKevent_log] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[event_type].[XPKevent_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[event_type] ADD CONSTRAINT [XPKevent_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[eventlog].[XPKeventlog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[eventlog] ADD CONSTRAINT [XPKeventlog] PRIMARY KEY CLUSTERED (
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evm_appliance_configuration].[XPKevm_appliance_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[evm_appliance_configuration] ADD CONSTRAINT [XPKevm_appliance_configuration] PRIMARY KEY CLUSTERED (
	[unit_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evm_company].[XPKevm_company].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[evm_company] ADD CONSTRAINT [XPKevm_company] PRIMARY KEY CLUSTERED (
	[company_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evm_discovered_software].[XPKevm_discovered_software].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[evm_discovered_software] ADD CONSTRAINT [XPKevm_discovered_software] PRIMARY KEY CLUSTERED (
	[dis_sw_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evt].[XPKevt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[evt] ADD CONSTRAINT [XPKevt] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evt_dly].[XPKevt_dly].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[evt_dly] ADD CONSTRAINT [XPKevt_dly] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[evtdlytp].[XPKevtdlytp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[evtdlytp] ADD CONSTRAINT [XPKevtdlytp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Execution].[pk_Execution].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Execution] ADD CONSTRAINT [pk_Execution] PRIMARY KEY CLUSTERED (
	[ExecutionId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ext_appl].[XPKext_appl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ext_appl] ADD CONSTRAINT [XPKext_appl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[externalaction].[XPKexternalaction].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[externalaction] ADD CONSTRAINT [XPKexternalaction] PRIMARY KEY CLUSTERED (
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[faq_sym].[XPKfaq_sym].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[faq_sym] ADD CONSTRAINT [XPKfaq_sym] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[filemgr].[XPKfilemgr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[filemgr] ADD CONSTRAINT [XPKfilemgr] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[filepart] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frmgrp].[XPKfrmgrp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frmgrp] ADD CONSTRAINT [XPKfrmgrp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_circuit_line].[XPKfrs_circuit_line].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_circuit_line] ADD CONSTRAINT [XPKfrs_circuit_line] PRIMARY KEY CLUSTERED (
	[l_net_name] ASC,
	[l_node_name] ASC,
	[l_line] ASC,
	[l_port] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_connection].[XPKfrs_connection].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_connection] ADD CONSTRAINT [XPKfrs_connection] PRIMARY KEY CLUSTERED (
	[l_node_name] ASC,
	[l_line] ASC,
	[l_slot] ASC,
	[l_port] ASC,
	[l_dlci] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_frp].[XPKfrs_frp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_frp] ADD CONSTRAINT [XPKfrs_frp] PRIMARY KEY CLUSTERED (
	[l_node_name] ASC,
	[l_slot] ASC,
	[l_port] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_ip].[XPKfrs_ip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_ip] ADD CONSTRAINT [XPKfrs_ip] PRIMARY KEY CLUSTERED (
	[lastip] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_node_id].[XPKfrs_node_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_node_id] ADD CONSTRAINT [XPKfrs_node_id] PRIMARY KEY CLUSTERED (
	[node_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_packet_line].[XPKfrs_packet_line].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_packet_line] ADD CONSTRAINT [XPKfrs_packet_line] PRIMARY KEY CLUSTERED (
	[l_net_name] ASC,
	[l_node_name] ASC,
	[l_line] ASC,
	[l_slot] ASC,
	[l_port] ASC,
	[l_vtrk] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_stat].[XPKfrs_stat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_stat] ADD CONSTRAINT [XPKfrs_stat] PRIMARY KEY CLUSTERED (
	[strnodename] ASC,
	[nslot] ASC,
	[nport] ASC,
	[ndlci] ASC,
	[nobjecttype] ASC,
	[nstattype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_stat_threshold].[XPKfrs_stat_threshold].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_stat_threshold] ADD CONSTRAINT [XPKfrs_stat_threshold] PRIMARY KEY CLUSTERED (
	[strnodename] ASC,
	[objecttype] ASC,
	[subtype] ASC,
	[stattype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[frs_svp].[XPKfrs_svp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[frs_svp] ADD CONSTRAINT [XPKfrs_svp] PRIMARY KEY CLUSTERED (
	[address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_ext].[XPKg_chg_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_chg_ext] ADD CONSTRAINT [XPKg_chg_ext] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_chg_queue].[XPKg_chg_queue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_chg_queue] ADD CONSTRAINT [XPKg_chg_queue] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_contact].[XPKg_contact].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_contact] ADD CONSTRAINT [XPKg_contact] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_ext].[XPKg_iss_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_iss_ext] ADD CONSTRAINT [XPKg_iss_ext] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_iss_queue].[XPKg_iss_queue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_iss_queue] ADD CONSTRAINT [XPKg_iss_queue] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_loc].[XPKg_loc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_loc] ADD CONSTRAINT [XPKg_loc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_org].[XPKg_org].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_org] ADD CONSTRAINT [XPKg_org] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_product].[XPKg_product].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_product] ADD CONSTRAINT [XPKg_product] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_queue_names].[XPKg_queue_names].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_queue_names] ADD CONSTRAINT [XPKg_queue_names] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_ext].[XPKg_req_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_req_ext] ADD CONSTRAINT [XPKg_req_ext] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_req_queue].[XPKg_req_queue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_req_queue] ADD CONSTRAINT [XPKg_req_queue] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_srvr].[XPKg_srvr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_srvr] ADD CONSTRAINT [XPKg_srvr] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_tbl_map].[XPKg_tbl_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_tbl_map] ADD CONSTRAINT [XPKg_tbl_map] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[g_tbl_rule].[XPKg_tbl_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[g_tbl_rule] ADD CONSTRAINT [XPKg_tbl_rule] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[gdcdiscovery].[$gdcdi_u0000157300000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[gdcdiscovery] ADD CONSTRAINT [$gdcdi_u0000157300000000] PRIMARY KEY CLUSTERED (
	[server_addr] ASC,
	[probe_addr] ASC,
	[mibidx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[gla_agents].[$gla_a_u000019c400000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[gla_agents] ADD CONSTRAINT [$gla_a_u000019c400000000] PRIMARY KEY CLUSTERED (
	[agent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[gla_hours].[$gla_h_u000019b900000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[gla_hours] ADD CONSTRAINT [$gla_h_u000019b900000000] PRIMARY KEY CLUSTERED (
	[obj_id] ASC,
	[timestamp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[gla_objects].[$gla_o_u000019bd00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[gla_objects] ADD CONSTRAINT [$gla_o_u000019bd00000000] PRIMARY KEY CLUSTERED (
	[obj_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[gla_sdamaps].[$gla_s_u000019c100000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[gla_sdamaps] ADD CONSTRAINT [$gla_s_u000019c100000000] PRIMARY KEY CLUSTERED (
	[scan_index] ASC,
	[agent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[global_status_event].[XPKglobal_status_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[global_status_event] ADD CONSTRAINT [XPKglobal_status_event] PRIMARY KEY CLUSTERED (
	[global_status_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[GlobalVariable].[pk_GlobalVariable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[GlobalVariable] ADD CONSTRAINT [pk_GlobalVariable] PRIMARY KEY CLUSTERED (
	[VariableId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[grp_loc].[XPKgrp_loc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[grp_loc] ADD CONSTRAINT [XPKgrp_loc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[grpmem].[XPKgrpmem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[grpmem] ADD CONSTRAINT [XPKgrpmem] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARACTION].[HARACTION_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARACTION] ADD CONSTRAINT [HARACTION_PK] PRIMARY KEY CLUSTERED (
	[actionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallchildrenpath].[HARALLCHILDRENPATH_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harallchildrenpath] ADD CONSTRAINT [HARALLCHILDRENPATH_PK] PRIMARY KEY CLUSTERED (
	[versionobjid] ASC,
	[childversionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harallusers].[XPKharallusers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harallusers] ADD CONSTRAINT [XPKharallusers] PRIMARY KEY CLUSTERED (
	[usrobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harapprove].[XPKharapprove].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harapprove] ADD CONSTRAINT [XPKharapprove] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harapprovehist].[XPKharapprovehist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harapprovehist] ADD CONSTRAINT [XPKharapprovehist] PRIMARY KEY CLUSTERED (
	[envobjid] ASC,
	[stateobjid] ASC,
	[packageobjid] ASC,
	[usrobjid] ASC,
	[execdtime] ASC,
	[action] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harassocpkg].[HARASSOCPKG_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harassocpkg] ADD CONSTRAINT [HARASSOCPKG_PK] PRIMARY KEY CLUSTERED (
	[formobjid] ASC,
	[assocpkgid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENT].[HARAUDITEVENT_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARAUDITEVENT] ADD CONSTRAINT [HARAUDITEVENT_PK] PRIMARY KEY CLUSTERED (
	[auditeventobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTDESCRIPTION].[HARAUDITEVENTDESCRIPTION_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARAUDITEVENTDESCRIPTION] ADD CONSTRAINT [HARAUDITEVENTDESCRIPTION_PK] PRIMARY KEY CLUSTERED (
	[auditeventobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL1].[HARAUDITEVENTRESOURCEL1_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL1] ADD CONSTRAINT [HARAUDITEVENTRESOURCEL1_PK] PRIMARY KEY CLUSTERED (
	[auditeventobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL2].[HARAUDITEVENTRESOURCEL2_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL2] ADD CONSTRAINT [HARAUDITEVENTRESOURCEL2_PK] PRIMARY KEY CLUSTERED (
	[auditeventobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL3].[HARAUDITEVENTRESOURCEL3_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL3] ADD CONSTRAINT [HARAUDITEVENTRESOURCEL3_PK] PRIMARY KEY CLUSTERED (
	[auditeventobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL4].[HARAUDITEVENTRESOURCEL4_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL4] ADD CONSTRAINT [HARAUDITEVENTRESOURCEL4_PK] PRIMARY KEY CLUSTERED (
	[auditeventobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARAUDITEVENTSEQ].[PK__HARAUDIT__7AF8B1874F4A27E8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARAUDITEVENTSEQ] ADD CONSTRAINT [PK__HARAUDIT__7AF8B1874F4A27E8] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harbranch].[XPKharbranch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harbranch] ADD CONSTRAINT [XPKharbranch] PRIMARY KEY CLUSTERED (
	[branchobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARBRANCHSEQ].[PK__HARBRANC__7AF8B1875073564B].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARBRANCHSEQ] ADD CONSTRAINT [PK__HARBRANC__7AF8B1875073564B] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harcheckinproc].[XPKharcheckinproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harcheckinproc] ADD CONSTRAINT [XPKharcheckinproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harcheckoutproc].[XPKharcheckoutproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harcheckoutproc] ADD CONSTRAINT [XPKharcheckoutproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harcomment].[XPKharcomment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harcomment] ADD CONSTRAINT [XPKharcomment] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harconmrgproc].[XPKharconmrgproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harconmrgproc] ADD CONSTRAINT [XPKharconmrgproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harconversionlog].[XPKharconversionlog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harconversionlog] ADD CONSTRAINT [XPKharconversionlog] PRIMARY KEY CLUSTERED (
	[tablename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARCPMSTATE].[HARCPMSTATE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARCPMSTATE] ADD CONSTRAINT [HARCPMSTATE_PK] PRIMARY KEY CLUSTERED (
	[SRCENVOBJID] ASC,
	[TGTENVOBJID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harcrpkgproc].[XPKharcrpkgproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harcrpkgproc] ADD CONSTRAINT [XPKharcrpkgproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harcrsenvmrgproc].[XPKharcrsenvmrgproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harcrsenvmrgproc] ADD CONSTRAINT [XPKharcrsenvmrgproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardefect].[XPKhardefect].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[hardefect] ADD CONSTRAINT [XPKhardefect] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardelpkgproc].[hardelpkgproc_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[hardelpkgproc] ADD CONSTRAINT [hardelpkgproc_PK] PRIMARY KEY CLUSTERED (
	[PROCESSOBJID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardelversproc].[XPKhardelversproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[hardelversproc] ADD CONSTRAINT [XPKhardelversproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardemoteproc].[XPKhardemoteproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[hardemoteproc] ADD CONSTRAINT [XPKhardemoteproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardware_sd_server_matrix].[XPKhardware_sd_server_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[hardware_sd_server_matrix] ADD CONSTRAINT [XPKhardware_sd_server_matrix] PRIMARY KEY CLUSTERED (
	[hardware_sd_server_matrix_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hardware_software_dvy_jb_file].[XPKhardware_software_dvy_jb_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[hardware_software_dvy_jb_file] ADD CONSTRAINT [XPKhardware_software_dvy_jb_file] PRIMARY KEY CLUSTERED (
	[hardware_software_dvy_jb_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harenvironment].[XPKharenvironment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harenvironment] ADD CONSTRAINT [XPKharenvironment] PRIMARY KEY CLUSTERED (
	[envobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harenvironmentaccess].[XPKharenvironmentaccess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harenvironmentaccess] ADD CONSTRAINT [XPKharenvironmentaccess] PRIMARY KEY CLUSTERED (
	[envobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARENVIRONMENTSEQ].[PK__HARENVIR__7AF8B18755380B68].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARENVIRONMENTSEQ] ADD CONSTRAINT [PK__HARENVIR__7AF8B18755380B68] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haresd].[XPKharesd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[haresd] ADD CONSTRAINT [XPKharesd] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HAREXECUTABLEACTION].[HAREXECUTABLEACTION_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HAREXECUTABLEACTION] ADD CONSTRAINT [HAREXECUTABLEACTION_PK] PRIMARY KEY CLUSTERED (
	[resourcetypeobjid] ASC,
	[actionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harexternassoc].[XPKharexternassoc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harexternassoc] ADD CONSTRAINT [XPKharexternassoc] PRIMARY KEY CLUSTERED (
	[externalid] ASC,
	[usrobjid] ASC,
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harfileextension].[HARFILEEXTENSION_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harfileextension] ADD CONSTRAINT [HARFILEEXTENSION_PK] PRIMARY KEY CLUSTERED (
	[repositobjid] ASC,
	[fileextension] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harform].[XPKharform].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harform] ADD CONSTRAINT [XPKharform] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformattachment].[harformmattachment_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harformattachment] ADD CONSTRAINT [harformmattachment_pk] PRIMARY KEY CLUSTERED (
	[attachmentobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARFORMATTACHMENTSEQ].[PK__HARFORMA__7AF8B18759FCC085].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARFORMATTACHMENTSEQ] ADD CONSTRAINT [PK__HARFORMA__7AF8B18759FCC085] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARFORMSEQ].[PK__HARFORMS__7AF8B1875EC175A2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARFORMSEQ] ADD CONSTRAINT [PK__HARFORMS__7AF8B1875EC175A2] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARFORMTEMPLATES].[HARFORMTEMPLATES_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARFORMTEMPLATES] ADD CONSTRAINT [HARFORMTEMPLATES_PK] PRIMARY KEY CLUSTERED (
	[FORMTYPEOBJID] ASC,
	[FILEEXTENSION] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformtype].[XPKharformtype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harformtype] ADD CONSTRAINT [XPKharformtype] PRIMARY KEY CLUSTERED (
	[formtypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformtypeaccess].[XPKharformtypeaccess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harformtypeaccess] ADD CONSTRAINT [XPKharformtypeaccess] PRIMARY KEY CLUSTERED (
	[formtypeobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harformtypedefs].[XPKharformtypedefs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harformtypedefs] ADD CONSTRAINT [XPKharformtypedefs] PRIMARY KEY CLUSTERED (
	[attrid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARGLOBALAUDITPOLICY].[HARGLOBALAUDITPOLICY_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARGLOBALAUDITPOLICY] ADD CONSTRAINT [HARGLOBALAUDITPOLICY_PK] PRIMARY KEY CLUSTERED (
	[auditpolicyobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harharvest].[XPKharharvest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [XPKharharvest] PRIMARY KEY CLUSTERED (
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harintmrgproc].[XPKharintmrgproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harintmrgproc] ADD CONSTRAINT [XPKharintmrgproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritemaccess].[XPKharitemaccess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[haritemaccess] ADD CONSTRAINT [XPKharitemaccess] PRIMARY KEY CLUSTERED (
	[itemobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARITEMNAME].[HARITEMNAME_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARITEMNAME] ADD CONSTRAINT [HARITEMNAME_PK] PRIMARY KEY CLUSTERED (
	[nameobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARITEMNAMESEQ].[PK__HARITEMN__7AF8B1877387885E].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARITEMNAMESEQ] ADD CONSTRAINT [PK__HARITEMN__7AF8B1877387885E] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritemrelationship].[XPKharitemrelationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[haritemrelationship] ADD CONSTRAINT [XPKharitemrelationship] PRIMARY KEY CLUSTERED (
	[itemobjid] ASC,
	[refitemid] ASC,
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haritems].[XPKharitems].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[haritems] ADD CONSTRAINT [XPKharitems] PRIMARY KEY CLUSTERED (
	[itemobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARITEMSSEQ].[PK__HARITEMS__7AF8B18763862ABF].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARITEMSSEQ] ADD CONSTRAINT [PK__HARITEMS__7AF8B18763862ABF] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harlinkedprocess].[XPKharlinkedprocess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harlinkedprocess] ADD CONSTRAINT [XPKharlinkedprocess] PRIMARY KEY CLUSTERED (
	[parentprocobjid] ASC,
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harlistdiffproc].[XPKharlistdiffproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harlistdiffproc] ADD CONSTRAINT [XPKharlistdiffproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harlistversproc].[XPKharlistversproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harlistversproc] ADD CONSTRAINT [XPKharlistversproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARMOVEITEMPROC].[HARMOVEITEMPROC_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARMOVEITEMPROC] ADD CONSTRAINT [HARMOVEITEMPROC_PK] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARMOVEPATHPROC].[HARMOVEPATHPROC_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARMOVEPATHPROC] ADD CONSTRAINT [HARMOVEPATHPROC_PK] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harmovepkgproc].[XPKharmovepkgproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harmovepkgproc] ADD CONSTRAINT [XPKharmovepkgproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harmr].[XPKharmr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harmr] ADD CONSTRAINT [XPKharmr] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harnotify].[XPKharnotify].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harnotify] ADD CONSTRAINT [XPKharnotify] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harobjectsequenceid].[XPKharobjectsequenceid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harobjectsequenceid] ADD CONSTRAINT [XPKharobjectsequenceid] PRIMARY KEY CLUSTERED (
	[hartablename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARONDEMANDCR].[HONDEMANDCR_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARONDEMANDCR] ADD CONSTRAINT [HONDEMANDCR_PK] PRIMARY KEY CLUSTERED (
	[FORMOBJID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpac].[XPKharpac].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpac] ADD CONSTRAINT [XPKharpac] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackage].[XPKharpackage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpackage] ADD CONSTRAINT [XPKharpackage] PRIMARY KEY CLUSTERED (
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackagegroup].[XPKharpackagegroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpackagegroup] ADD CONSTRAINT [XPKharpackagegroup] PRIMARY KEY CLUSTERED (
	[pkggrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARPACKAGEGROUPSEQ].[PK__HARPACKA__7AF8B187684ADFDC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARPACKAGEGROUPSEQ] ADD CONSTRAINT [PK__HARPACKA__7AF8B187684ADFDC] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackagenamegen].[XPKharpackagenamegen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpackagenamegen] ADD CONSTRAINT [XPKharpackagenamegen] PRIMARY KEY CLUSTERED (
	[nameformat] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARPACKAGESEQ].[PK__HARPACKA__7AF8B1876D0F94F9].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARPACKAGESEQ] ADD CONSTRAINT [PK__HARPACKA__7AF8B1876D0F94F9] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpackagestatus].[XPKharpackagestatus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpackagestatus] ADD CONSTRAINT [XPKharpackagestatus] PRIMARY KEY CLUSTERED (
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpasswordhistory].[harpasswordhistory_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpasswordhistory] ADD CONSTRAINT [harpasswordhistory_pk] PRIMARY KEY CLUSTERED (
	[usrobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpathfullname].[HARPATHFULLNAME_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpathfullname] ADD CONSTRAINT [HARPATHFULLNAME_PK] PRIMARY KEY CLUSTERED (
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARPEERREVIEW].[HARPEERREVIEW_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARPEERREVIEW] ADD CONSTRAINT [HARPEERREVIEW_PK] PRIMARY KEY CLUSTERED (
	[REVIEWOBJID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARPEERREVIEWCOMMENT].[HARPEERREVIEWCOMMENT_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARPEERREVIEWCOMMENT] ADD CONSTRAINT [HARPEERREVIEWCOMMENT_PK] PRIMARY KEY CLUSTERED (
	[COMMENTOBJID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARPEERREVIEWCOMMENTSEQ].[PK__HARPEERR__7AF8B1879BBB5078].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARPEERREVIEWCOMMENTSEQ] ADD CONSTRAINT [PK__HARPEERR__7AF8B1879BBB5078] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARPEERREVIEWSEQ].[PK__HARPEERR__7AF8B1872105020F].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARPEERREVIEWSEQ] ADD CONSTRAINT [PK__HARPEERR__7AF8B1872105020F] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpkgsincmew].[XPKharpkgsincmew].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpkgsincmew] ADD CONSTRAINT [XPKharpkgsincmew] PRIMARY KEY CLUSTERED (
	[epackageobjid] ASC,
	[packageobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpkgsinpkggrp].[XPKharpkgsinpkggrp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpkgsinpkggrp] ADD CONSTRAINT [XPKharpkgsinpkggrp] PRIMARY KEY CLUSTERED (
	[packageobjid] ASC,
	[pkggrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpmstatus].[XPKharpmstatus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpmstatus] ADD CONSTRAINT [XPKharpmstatus] PRIMARY KEY CLUSTERED (
	[pmstatusindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harproblemreport].[XPKharproblemreport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harproblemreport] ADD CONSTRAINT [XPKharproblemreport] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARPROCESSSEQ].[PK__HARPROCE__7AF8B18771D44A16].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARPROCESSSEQ] ADD CONSTRAINT [PK__HARPROCE__7AF8B18771D44A16] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harpromoteproc].[XPKharpromoteproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harpromoteproc] ADD CONSTRAINT [XPKharpromoteproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harqanda].[XPKharqanda].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harqanda] ADD CONSTRAINT [XPKharqanda] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harremitemproc].[XPKharremitemproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harremitemproc] ADD CONSTRAINT [XPKharremitemproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARREMOVEPATHPROC].[HARREMOVEPATHPROC_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARREMOVEPATHPROC] ADD CONSTRAINT [HARREMOVEPATHPROC_PK] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harrenameitemproc].[XPKharrenameitemproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harrenameitemproc] ADD CONSTRAINT [XPKharrenameitemproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARRENAMEPATHPROC].[HARRENAMEPATHPROC_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARRENAMEPATHPROC] ADD CONSTRAINT [HARRENAMEPATHPROC_PK] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harrepinview].[XPKharrepinview].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harrepinview] ADD CONSTRAINT [XPKharrepinview] PRIMARY KEY CLUSTERED (
	[viewobjid] ASC,
	[repositobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harrepository].[XPKharrepository].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harrepository] ADD CONSTRAINT [XPKharrepository] PRIMARY KEY CLUSTERED (
	[repositobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harrepositoryaccess].[XPKharrepositoryaccess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harrepositoryaccess] ADD CONSTRAINT [XPKharrepositoryaccess] PRIMARY KEY CLUSTERED (
	[repositobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARREPOSITORYSEQ].[PK__HARREPOS__7AF8B1877698FF33].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARREPOSITORYSEQ] ADD CONSTRAINT [PK__HARREPOS__7AF8B1877698FF33] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARRESOURCETYPE].[HARRESOURCETYPE_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARRESOURCETYPE] ADD CONSTRAINT [HARRESOURCETYPE_PK] PRIMARY KEY CLUSTERED (
	[resourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARRESOURCETYPECHILD].[HARRESOURCETYPECHILD_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARRESOURCETYPECHILD] ADD CONSTRAINT [HARRESOURCETYPECHILD_PK] PRIMARY KEY CLUSTERED (
	[parentresourcetypeobjid] ASC,
	[childresourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARRESOURCETYPEDESCENDANT].[HARRESOURCETYPEDESCENDANT_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARRESOURCETYPEDESCENDANT] ADD CONSTRAINT [HARRESOURCETYPEDESCENDANT_PK] PRIMARY KEY CLUSTERED (
	[ancestorresourcetypeobjid] ASC,
	[descendantresourcetypeobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARRPTSQL].[HARRPTSQL_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARRPTSQL] ADD CONSTRAINT [HARRPTSQL_PK] PRIMARY KEY CLUSTERED (
	[RPTSQLOBJID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARRPTSQLSEQ].[PK__HARRPTSQ__7AF8B187D7A44545].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARRPTSQLSEQ] ADD CONSTRAINT [PK__HARRPTSQ__7AF8B187D7A44545] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARSEQTABLE].[CI_HARSEQTABLE].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [CI_HARSEQTABLE] ON [dbo].[HARSEQTABLE] (
	[CTR] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harsnapviewproc].[XPKharsnapviewproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harsnapviewproc] ADD CONSTRAINT [XPKharsnapviewproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstate].[XPKharstate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harstate] ADD CONSTRAINT [XPKharstate] PRIMARY KEY CLUSTERED (
	[stateobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstateaccess].[XPKharstateaccess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harstateaccess] ADD CONSTRAINT [XPKharstateaccess] PRIMARY KEY CLUSTERED (
	[stateobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstateprocess].[XPKharstateprocess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harstateprocess] ADD CONSTRAINT [XPKharstateprocess] PRIMARY KEY CLUSTERED (
	[stateobjid] ASC,
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harstateprocessaccess].[XPKharstateprocessaccess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harstateprocessaccess] ADD CONSTRAINT [XPKharstateprocessaccess] PRIMARY KEY CLUSTERED (
	[stateobjid] ASC,
	[processobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARSTATESEQ].[PK__HARSTATE__7AF8B1877B5DB450].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARSTATESEQ] ADD CONSTRAINT [PK__HARSTATE__7AF8B1877B5DB450] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harswitchpkgproc].[XPKharswitchpkgproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harswitchpkgproc] ADD CONSTRAINT [XPKharswitchpkgproc] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harsyncfullpath].[XPKharsyncfullpath].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harsyncfullpath] ADD CONSTRAINT [XPKharsyncfullpath] PRIMARY KEY CLUSTERED (
	[pathobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hartestinginfo].[XPKhartestinginfo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[hartestinginfo] ADD CONSTRAINT [XPKhartestinginfo] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harudp].[XPKharudp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harudp] ADD CONSTRAINT [XPKharudp] PRIMARY KEY CLUSTERED (
	[processobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haruser].[XPKharuser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[haruser] ADD CONSTRAINT [XPKharuser] PRIMARY KEY CLUSTERED (
	[usrobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusercontact].[XPKharusercontact].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harusercontact] ADD CONSTRAINT [XPKharusercontact] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[haruserdata].[HARUSERDATA_PK].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[haruserdata] ADD CONSTRAINT [HARUSERDATA_PK] PRIMARY KEY CLUSTERED (
	[usrobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusergroup].[XPKharusergroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harusergroup] ADD CONSTRAINT [XPKharusergroup] PRIMARY KEY CLUSTERED (
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARUSERGROUPSEQ].[PK__HARUSERG__7AF8B1870022696D].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARUSERGROUPSEQ] ADD CONSTRAINT [PK__HARUSERG__7AF8B1870022696D] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARUSERSEQ].[PK__HARUSERS__7AF8B18704E71E8A].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARUSERSEQ] ADD CONSTRAINT [PK__HARUSERS__7AF8B18704E71E8A] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harusersingroup].[XPKharusersingroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harusersingroup] ADD CONSTRAINT [XPKharusersingroup] PRIMARY KEY CLUSTERED (
	[usrobjid] ASC,
	[usrgrpobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversiondata].[XPKharversiondata].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harversiondata] ADD CONSTRAINT [XPKharversiondata] PRIMARY KEY CLUSTERED (
	[versiondataobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARVERSIONDATASEQ].[PK__HARVERSI__7AF8B18709ABD3A7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARVERSIONDATASEQ] ADD CONSTRAINT [PK__HARVERSI__7AF8B18709ABD3A7] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversiondelta].[XPKharversiondelta].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harversiondelta] ADD CONSTRAINT [XPKharversiondelta] PRIMARY KEY CLUSTERED (
	[childversiondataid] ASC,
	[parentversiondataid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversioninview].[XPKharversioninview].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harversioninview] ADD CONSTRAINT [XPKharversioninview] PRIMARY KEY CLUSTERED (
	[viewobjid] ASC,
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harversions].[XPKharversions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harversions] ADD CONSTRAINT [XPKharversions] PRIMARY KEY CLUSTERED (
	[versionobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARVERSIONSSEQ].[PK__HARVERSI__7AF8B1870E7088C4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARVERSIONSSEQ] ADD CONSTRAINT [PK__HARVERSI__7AF8B1870E7088C4] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harvest_subpackage_actions].[XPKharvest_subpackage_actions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harvest_subpackage_actions] ADD CONSTRAINT [XPKharvest_subpackage_actions] PRIMARY KEY CLUSTERED (
	[sp_id] ASC,
	[ep_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[harview].[XPKharview].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[harview] ADD CONSTRAINT [XPKharview] PRIMARY KEY CLUSTERED (
	[viewobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[HARVIEWSEQ].[PK__HARVIEWS__7AF8B18713353DE1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[HARVIEWSEQ] ADD CONSTRAINT [PK__HARVIEWS__7AF8B18713353DE1] PRIMARY KEY CLUSTERED (
	[SeqID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[hier].[XPKhier].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[hier] ADD CONSTRAINT [XPKhier] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iam_object].[XPKiam_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[iam_object] ADD CONSTRAINT [XPKiam_object] PRIMARY KEY CLUSTERED (
	[object_guid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_grp].[XPKicat_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[icat_grp] ADD CONSTRAINT [XPKicat_grp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_loc].[XPKicat_loc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[icat_loc] ADD CONSTRAINT [XPKicat_loc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[icat_wrkshft].[XPKicat_wrkshft].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[icat_wrkshft] ADD CONSTRAINT [XPKicat_wrkshft] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[impact].[XPKimpact].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[impact] ADD CONSTRAINT [XPKimpact] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[index_doc_links].[XPKindex_doc_links].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[index_doc_links] ADD CONSTRAINT [XPKindex_doc_links] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[indextable].[$index_u0000157600000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[indextable] ADD CONSTRAINT [$index_u0000157600000000] PRIMARY KEY CLUSTERED (
	[componentmibindexidx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[infohis].[XPKinfohis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[infohis] ADD CONSTRAINT [XPKinfohis] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[sw_def_uuid] ASC,
	[sttotal] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[infolng].[XPKinfolng].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[infolng] ADD CONSTRAINT [XPKinfolng] PRIMARY KEY CLUSTERED (
	[unitid] ASC,
	[domainid] ASC,
	[itprid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[instances].[$insta_u000041d400000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[instances] ADD CONSTRAINT [$insta_u000041d400000000] PRIMARY KEY CLUSTERED (
	[productid] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[interface].[XPKinterface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[interface] ADD CONSTRAINT [XPKinterface] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_default_item].[XPKinv_default_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_default_item] ADD CONSTRAINT [XPKinv_default_item] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_name_id] ASC,
	[item_parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_default_tree].[XPKinv_default_tree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_default_tree] ADD CONSTRAINT [XPKinv_default_tree] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_item].[XPKinv_generalinventory_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_generalinventory_item] ADD CONSTRAINT [XPKinv_generalinventory_item] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_name_id] ASC,
	[item_parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_generalinventory_tree].[XPKinv_generalinventory_tree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_generalinventory_tree] ADD CONSTRAINT [XPKinv_generalinventory_tree] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_item_name_id].[XPKinv_item_name_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_item_name_id] ADD CONSTRAINT [XPKinv_item_name_id] PRIMARY KEY CLUSTERED (
	[domain_uuid] ASC,
	[item_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_object_tree_id].[XPKinv_object_tree_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_object_tree_id] ADD CONSTRAINT [XPKinv_object_tree_id] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_performance_item].[XPKinv_performance_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_performance_item] ADD CONSTRAINT [XPKinv_performance_item] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_name_id] ASC,
	[item_parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_performance_tree].[XPKinv_performance_tree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_performance_tree] ADD CONSTRAINT [XPKinv_performance_tree] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_reconcile_item].[XPKinv_reconcile_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_reconcile_item] ADD CONSTRAINT [XPKinv_reconcile_item] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_name_id] ASC,
	[item_parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_reconcile_tree].[XPKinv_reconcile_tree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_reconcile_tree] ADD CONSTRAINT [XPKinv_reconcile_tree] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_root_map].[XPKinv_root_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_root_map] ADD CONSTRAINT [XPKinv_root_map] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[item_root_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_table_map].[XPKinv_table_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_table_map] ADD CONSTRAINT [XPKinv_table_map] PRIMARY KEY CLUSTERED (
	[domain_uuid] ASC,
	[component_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inv_tree_name_id].[XPKinv_tree_name_id].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inv_tree_name_id] ADD CONSTRAINT [XPKinv_tree_name_id] PRIMARY KEY CLUSTERED (
	[domain_uuid] ASC,
	[tree_name_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[inventory_profile].[XPKinventory_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[inventory_profile] ADD CONSTRAINT [XPKinventory_profile] PRIMARY KEY CLUSTERED (
	[inventory_profile_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[invgene].[XPKinvgene].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[invgene] ADD CONSTRAINT [XPKinvgene] PRIMARY KEY CLUSTERED (
	[gindex] ASC,
	[unittype] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[invsetup].[XPKinvsetup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[invsetup] ADD CONSTRAINT [XPKinvsetup] PRIMARY KEY CLUSTERED (
	[invid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ipObject].[pk_Object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ipObject] ADD CONSTRAINT [pk_Object] PRIMARY KEY CLUSTERED (
	[ObjectId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ipProvider].[pk_Provider].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ipProvider] ADD CONSTRAINT [pk_Provider] PRIMARY KEY CLUSTERED (
	[ProviderId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ipRequest].[pk_Request].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ipRequest] ADD CONSTRAINT [pk_Request] PRIMARY KEY CLUSTERED (
	[RequestId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ipRequestCode].[pk_ipRequestCode].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ipRequestCode] ADD CONSTRAINT [pk_ipRequestCode] PRIMARY KEY CLUSTERED (
	[RequestId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[IPUser].[pk_IPUser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[IPUser] ADD CONSTRAINT [pk_IPUser] PRIMARY KEY CLUSTERED (
	[UserId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[iss_template].[XPKiss_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[iss_template] ADD CONSTRAINT [XPKiss_template] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issalg].[XPKissalg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[issalg] ADD CONSTRAINT [XPKissalg] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[isscat].[XPKisscat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[isscat] ADD CONSTRAINT [XPKisscat] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issprp].[XPKissprp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[issprp] ADD CONSTRAINT [XPKissprp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issstat].[XPKissstat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[issstat] ADD CONSTRAINT [XPKissstat] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[issue].[XPKissue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[issue] ADD CONSTRAINT [XPKissue] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[isswf].[XPKisswf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[isswf] ADD CONSTRAINT [XPKisswf] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_gbl].[baseidx_jmo_gbl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_gbl] ON [dbo].[jmo_gbl] (
	[gbl_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_gbls].[baseidx_jmo_gbls].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_gbls] ON [dbo].[jmo_gbls] (
	[sim_key] ASC,
	[gbl_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_gen].[baseidx_jmo_gen].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_gen] ON [dbo].[jmo_gen] (
	[scp_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_gens].[baseidx_jmo_gens].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_gens] ON [dbo].[jmo_gens] (
	[scp_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_group].[baseidx_jmo_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_group] ON [dbo].[jmo_group] (
	[id] ASC,
	[stationid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_groupid].[baseidx_jmo_groupid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_groupid] ON [dbo].[jmo_groupid] (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_hstu].[baseidx_jmo_hstu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_hstu] ON [dbo].[jmo_hstu] (
	[hst_scdn] ASC,
	[hst_name] ASC,
	[hst_jno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_jbr].[baseidx_jmo_jbr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_jbr] ON [dbo].[jmo_jbr] (
	[jbr_scdn] ASC,
	[jbr_name] ASC,
	[jbr_jno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_jhr].[baseidx_jmo_jhr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_jhr] ON [dbo].[jmo_jhr] (
	[jhr_jschd] ASC,
	[jhr_name] ASC,
	[jhr_jno] ASC,
	[jhr_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_jtr].[baseidx_jmo_jtr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_jtr] ON [dbo].[jmo_jtr] (
	[jtr_scdn] ASC,
	[jtr_name] ASC,
	[jtr_jno] ASC,
	[jtr_qual] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_jtr1].[baseidx_jmo_jtr1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_jtr1] ON [dbo].[jmo_jtr1] (
	[jtr_scdn] ASC,
	[jtr_name] ASC,
	[jtr_jno] ASC,
	[jtr_qual] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_jtrs].[baseidx_jmo_jtrs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_jtrs] ON [dbo].[jmo_jtrs] (
	[sim_key] ASC,
	[jtr_scdn] ASC,
	[jtr_name] ASC,
	[jtr_jno] ASC,
	[jtr_qual] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_jwb].[baseidx_jmo_jwb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_jwb] ON [dbo].[jmo_jwb] (
	[jwb_scdn] ASC,
	[jwb_name] ASC,
	[jwb_jno] ASC,
	[jwb_resn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_modeltemp].[baseidx_jmo_modeltemp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_modeltemp] ON [dbo].[jmo_modeltemp] (
	[reportid] ASC,
	[year] ASC,
	[month] ASC,
	[day] ASC,
	[hour] ASC,
	[minute] ASC,
	[second] ASC,
	[objecttype] ASC,
	[objectname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_mwc].[baseidx_jmo_mwc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_mwc] ON [dbo].[jmo_mwc] (
	[mwc_clus] ASC,
	[mwc_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_mwg].[baseidx_jmo_mwg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_mwg] ON [dbo].[jmo_mwg] (
	[mwg_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_nod].[baseidx_jmo_nod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_nod] ON [dbo].[jmo_nod] (
	[nod_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_prb].[baseidx_jmo_prb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_prb] ON [dbo].[jmo_prb] (
	[prb_scdn] ASC,
	[prb_name] ASC,
	[prb_jno] ASC,
	[prb_seq] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_prt].[baseidx_jmo_prt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_prt] ON [dbo].[jmo_prt] (
	[prt_scdn] ASC,
	[prt_name] ASC,
	[prt_jno] ASC,
	[prt_qual] ASC,
	[prt_seq] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_prt1].[baseidx_jmo_prt1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_prt1] ON [dbo].[jmo_prt1] (
	[prt_scdn] ASC,
	[prt_name] ASC,
	[prt_jno] ASC,
	[prt_qual] ASC,
	[prt_seq] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_psr1].[baseidx_jmo_psr1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_psr1] ON [dbo].[jmo_psr1] (
	[psr_scdn] ASC,
	[psr_name] ASC,
	[psr_jno] ASC,
	[psr_qual] ASC,
	[psr_pscd] ASC,
	[psr_pjob] ASC,
	[psr_pjno] ASC,
	[psr_pqua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_psrm].[baseidx_jmo_psrm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_psrm] ON [dbo].[jmo_psrm] (
	[psr_scdn] ASC,
	[psr_name] ASC,
	[psr_jno] ASC,
	[psr_pscd] ASC,
	[psr_pjob] ASC,
	[psr_pjno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_psrs].[baseidx_jmo_psrs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_psrs] ON [dbo].[jmo_psrs] (
	[sim_key] ASC,
	[psr_scdn] ASC,
	[psr_name] ASC,
	[psr_jno] ASC,
	[psr_qual] ASC,
	[psr_pscd] ASC,
	[psr_pjob] ASC,
	[psr_pjno] ASC,
	[psr_pqua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_psrt].[baseidx_jmo_psrt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_psrt] ON [dbo].[jmo_psrt] (
	[psr_scdn] ASC,
	[psr_name] ASC,
	[psr_jno] ASC,
	[psr_qual] ASC,
	[psr_pscd] ASC,
	[psr_pjob] ASC,
	[psr_pjno] ASC,
	[psr_pqua] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_sbr].[baseidx_jmo_sbr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_sbr] ON [dbo].[jmo_sbr] (
	[sbr_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_shr].[baseidx_jmo_shr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_shr] ON [dbo].[jmo_shr] (
	[shr_name] ASC,
	[shr_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_simtsystemdeps].[baseidx_jmo_simtsystemdeps].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_simtsystemdeps] ON [dbo].[jmo_simtsystemdeps] (
	[reportid] ASC,
	[jobsetname] ASC,
	[jobname] ASC,
	[jobnumber] ASC,
	[qualifier] ASC,
	[type] ASC,
	[seqno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_srq].[baseidx_jmo_srq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_srq] ON [dbo].[jmo_srq] (
	[srq_stck] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_station].[baseidx_jmo_station].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_station] ON [dbo].[jmo_station] (
	[id] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_str].[baseidx_jmo_str].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_str] ON [dbo].[jmo_str] (
	[str_name] ASC,
	[str_qual] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_str1].[baseidx_jmo_str1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_str1] ON [dbo].[jmo_str1] (
	[str_name] ASC,
	[str_qual] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_strs].[baseidx_jmo_strs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_strs] ON [dbo].[jmo_strs] (
	[sim_key] ASC,
	[str_name] ASC,
	[str_qual] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_swb].[baseidx_jmo_swb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_swb] ON [dbo].[jmo_swb] (
	[swb_name] ASC,
	[swb_resn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_systemdeps].[baseidx_jmo_systemdeps].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_systemdeps] ON [dbo].[jmo_systemdeps] (
	[jobsetname] ASC,
	[jobname] ASC,
	[jobnumber] ASC,
	[type] ASC,
	[seqno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_trg].[baseidx_jmo_trg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_trg] ON [dbo].[jmo_trg] (
	[trg_trev] ASC,
	[trg_trid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_trt].[baseidx_jmo_trt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_trt] ON [dbo].[jmo_trt] (
	[trt_trev] ASC,
	[trt_trid] ASC,
	[trt_qual] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_trt1].[baseidx_jmo_trt1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_trt1] ON [dbo].[jmo_trt1] (
	[trt_trev] ASC,
	[trt_trid] ASC,
	[trt_qual] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_tsystemdeps].[baseidx_jmo_tsystemdeps].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_tsystemdeps] ON [dbo].[jmo_tsystemdeps] (
	[jobsetname] ASC,
	[jobname] ASC,
	[jobnumber] ASC,
	[qualifier] ASC,
	[type] ASC,
	[seqno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[jmo_tsystemdeps1].[baseidx_jmo_tsystemdeps1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_jmo_tsystemdeps1] ON [dbo].[jmo_tsystemdeps1] (
	[jobsetname] ASC,
	[jobname] ASC,
	[jobnumber] ASC,
	[qualifier] ASC,
	[type] ASC,
	[seqno] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[joborder].[XPKjoborder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[joborder] ADD CONSTRAINT [XPKjoborder] PRIMARY KEY CLUSTERED (
	[unitid] ASC,
	[jobid] ASC,
	[udomid] ASC,
	[jdomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kc].[XPKkc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kc] ADD CONSTRAINT [XPKkc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kd_attmnt].[XPKkd_attmnt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kd_attmnt] ADD CONSTRAINT [XPKkd_attmnt] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kdlinks].[XPKkdlinks].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kdlinks] ADD CONSTRAINT [XPKkdlinks] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[keys].[XPKkeys].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[keys] ADD CONSTRAINT [XPKkeys] PRIMARY KEY CLUSTERED (
	[keyid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[km_kword].[XPKkm_kword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[km_kword] ADD CONSTRAINT [XPKkm_kword] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[km_lrel].[XPKkm_lrel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[km_lrel] ADD CONSTRAINT [XPKkm_lrel] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_data].[XPKkpi_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_data] ADD CONSTRAINT [XPKkpi_data] PRIMARY KEY CLUSTERED (
	[kpi_data_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_infer_summary_docs].[XPKkpi_infer_summary_docs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_infer_summary_docs] ADD CONSTRAINT [XPKkpi_infer_summary_docs] PRIMARY KEY CLUSTERED (
	[raw_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_names].[XPKkpi_names].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_names] ADD CONSTRAINT [XPKkpi_names] PRIMARY KEY CLUSTERED (
	[kpi_names_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_personalization].[XPKkpi_personalization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_personalization] ADD CONSTRAINT [XPKkpi_personalization] PRIMARY KEY CLUSTERED (
	[kpi_id] ASC,
	[username] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_process_stats].[XPKkpi_process_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_process_stats] ADD CONSTRAINT [XPKkpi_process_stats] PRIMARY KEY CLUSTERED (
	[kpi_process_stats_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_properties].[XPKkpi_properties].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_properties] ADD CONSTRAINT [XPKkpi_properties] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_targets].[XPKkpi_targets].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_targets] ADD CONSTRAINT [XPKkpi_targets] PRIMARY KEY CLUSTERED (
	[kpi_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_titles].[XPKkpi_titles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_titles] ADD CONSTRAINT [XPKkpi_titles] PRIMARY KEY CLUSTERED (
	[chart_title_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_types].[XPKkpi_types].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_types] ADD CONSTRAINT [XPKkpi_types] PRIMARY KEY CLUSTERED (
	[kpi_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kpi_values].[XPKkpi_values].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kpi_values] ADD CONSTRAINT [XPKkpi_values] PRIMARY KEY CLUSTERED (
	[kpi_values_key] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[kt_report_card].[XPKkt_report_card].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[kt_report_card] ADD CONSTRAINT [XPKkt_report_card] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[language].[XPKlanguage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[language] ADD CONSTRAINT [XPKlanguage] PRIMARY KEY CLUSTERED (
	[language_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[linkbck].[XPKlinkbck].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[linkbck] ADD CONSTRAINT [XPKlinkbck] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[bckid] ASC,
	[bdomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[linkjob].[XPKlinkjob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[linkjob] ADD CONSTRAINT [XPKlinkjob] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[jobid] ASC,
	[jdomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[linkmod].[XPKlinkmod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[linkmod] ADD CONSTRAINT [XPKlinkmod] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[moid] ASC,
	[mdomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lockunit].[XPKlockunit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lockunit] ADD CONSTRAINT [XPKlockunit] PRIMARY KEY CLUSTERED (
	[unitid] ASC,
	[domainid] ASC,
	[server_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[logicalrelations].[XPKlogicalrelations].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[logicalrelations] ADD CONSTRAINT [XPKlogicalrelations] PRIMARY KEY CLUSTERED (
	[primluuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[long_texts].[XPKlong_texts].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[long_texts] ADD CONSTRAINT [XPKlong_texts] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[LookOutControl].[pk_LookOutControl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[LookOutControl] ADD CONSTRAINT [pk_LookOutControl] PRIMARY KEY CLUSTERED (
	[ControlEntryId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[LookOutIdControl].[pk_LookOutIdControl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[LookOutIdControl] ADD CONSTRAINT [pk_LookOutIdControl] PRIMARY KEY CLUSTERED (
	[LookOutVersion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[LookOutServer].[pk_LookOutServer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[LookOutServer] ADD CONSTRAINT [pk_LookOutServer] PRIMARY KEY CLUSTERED (
	[ServerId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[lrel].[XPKlrel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[lrel] ADD CONSTRAINT [XPKlrel] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[managed_survey].[XPKmanaged_survey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[managed_survey] ADD CONSTRAINT [XPKmanaged_survey] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mdb].[$mdb___u00004aed00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mdb] ADD CONSTRAINT [$mdb___u00004aed00000000] PRIMARY KEY CLUSTERED (
	[mdbmajorversion] ASC,
	[mdbminorversion] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mdb_checkpoint].[$mdb_c_u00004af000000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mdb_checkpoint] ADD CONSTRAINT [$mdb_c_u00004af000000000] PRIMARY KEY CLUSTERED (
	[checkpointid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mdb_patch].[$mdb_p_u00004af300000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mdb_patch] ADD CONSTRAINT [$mdb_p_u00004af300000000] PRIMARY KEY CLUSTERED (
	[patchnumber] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mdb_service_pack].[$mdb_s_u00004af600000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mdb_service_pack] ADD CONSTRAINT [$mdb_s_u00004af600000000] PRIMARY KEY CLUSTERED (
	[servicepacknumber] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mgsalg].[XPKmgsalg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mgsalg] ADD CONSTRAINT [XPKmgsalg] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mgsstat].[XPKmgsstat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mgsstat] ADD CONSTRAINT [XPKmgsstat] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mibdefinition].[$mibde_u0000157d00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mibdefinition] ADD CONSTRAINT [$mibde_u0000157d00000000] PRIMARY KEY CLUSTERED (
	[mibidx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mibstructure].[$mibst_u0000158000000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mibstructure] ADD CONSTRAINT [$mibst_u0000158000000000] PRIMARY KEY CLUSTERED (
	[mibidx] ASC,
	[oididxformib] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mibvariabletype].[$mibva_u0000158300000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mibvariabletype] ADD CONSTRAINT [$mibva_u0000158300000000] PRIMARY KEY CLUSTERED (
	[typeid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[miftypes].[XPKmiftypes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[miftypes] ADD CONSTRAINT [XPKmiftypes] PRIMARY KEY CLUSTERED (
	[typeid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_host].[XPKmit_host].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_host] ADD CONSTRAINT [XPKmit_host] PRIMARY KEY CLUSTERED (
	[host_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_host_parm].[XPKmit_host_parm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_host_parm] ADD CONSTRAINT [XPKmit_host_parm] PRIMARY KEY CLUSTERED (
	[host_id] ASC,
	[keyword] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_identifier].[XPKmit_identifier].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_identifier] ADD CONSTRAINT [XPKmit_identifier] PRIMARY KEY CLUSTERED (
	[id_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_product].[XPKmit_product].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_product] ADD CONSTRAINT [XPKmit_product] PRIMARY KEY CLUSTERED (
	[host_id] ASC,
	[component_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_repository].[XPKmit_repository].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_repository] ADD CONSTRAINT [XPKmit_repository] PRIMARY KEY CLUSTERED (
	[keynum] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_server].[XPKmit_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_server] ADD CONSTRAINT [XPKmit_server] PRIMARY KEY CLUSTERED (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_server_parm].[XPKmit_server_parm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_server_parm] ADD CONSTRAINT [XPKmit_server_parm] PRIMARY KEY CLUSTERED (
	[server_id] ASC,
	[keyword] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_server_type].[XPKmit_server_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_server_type] ADD CONSTRAINT [XPKmit_server_type] PRIMARY KEY CLUSTERED (
	[server_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mit_server_user].[XPKmit_server_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mit_server_user] ADD CONSTRAINT [XPKmit_server_user] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mitjas_calen_date].[XPKmitjas_calen_date].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mitjas_calen_date] ADD CONSTRAINT [XPKmitjas_calen_date] PRIMARY KEY CLUSTERED (
	[calendarid] ASC,
	[rundate] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mitjas_calen_node].[XPKmitjas_calen_node].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mitjas_calen_node] ADD CONSTRAINT [XPKmitjas_calen_node] PRIMARY KEY CLUSTERED (
	[calendarid] ASC,
	[node] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mitjas_calendar].[XPKmitjas_calendar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mitjas_calendar] ADD CONSTRAINT [XPKmitjas_calendar] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mitjas_group].[XPKmitjas_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mitjas_group] ADD CONSTRAINT [XPKmitjas_group] PRIMARY KEY CLUSTERED (
	[strid] ASC,
	[groupid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mitjas_job].[XPKmitjas_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mitjas_job] ADD CONSTRAINT [XPKmitjas_job] PRIMARY KEY CLUSTERED (
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mitjas_jobhist].[XPKmitjas_jobhist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mitjas_jobhist] ADD CONSTRAINT [XPKmitjas_jobhist] PRIMARY KEY CLUSTERED (
	[joid] ASC,
	[run_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[mitjas_jobparms].[XPKmitjas_jobparms].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[mitjas_jobparms] ADD CONSTRAINT [XPKmitjas_jobparms] PRIMARY KEY CLUSTERED (
	[joid] ASC,
	[parmname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncipc].[XPKncipc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ncipc] ADD CONSTRAINT [XPKncipc] PRIMARY KEY CLUSTERED (
	[ipcid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncjobbin].[XPKncjobbin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ncjobbin] ADD CONSTRAINT [XPKncjobbin] PRIMARY KEY CLUSTERED (
	[jobid] ASC,
	[jobpart] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncjobcfg].[XPKncjobcfg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ncjobcfg] ADD CONSTRAINT [XPKncjobcfg] PRIMARY KEY CLUSTERED (
	[jobid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nclog].[XPKnclog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[nclog] ADD CONSTRAINT [XPKnclog] PRIMARY KEY CLUSTERED (
	[logid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncmodbin].[XPKncmodbin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ncmodbin] ADD CONSTRAINT [XPKncmodbin] PRIMARY KEY CLUSTERED (
	[mopart] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncmodcfg].[XPKncmodcfg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ncmodcfg] ADD CONSTRAINT [XPKncmodcfg] PRIMARY KEY CLUSTERED (
	[domainid] ASC,
	[moid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncovervw].[XPKncovervw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ncovervw] ADD CONSTRAINT [XPKncovervw] PRIMARY KEY CLUSTERED (
	[nameid] ASC,
	[prnmid] ASC,
	[unittype] ASC,
	[type] ASC,
	[domainid] ASC,
	[idomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncprofil].[XPKncprofil].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ncprofil] ADD CONSTRAINT [XPKncprofil] PRIMARY KEY CLUSTERED (
	[profilid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ncrc].[XPKncrc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ncrc] ADD CONSTRAINT [XPKncrc] PRIMARY KEY CLUSTERED (
	[rid] ASC,
	[typeid] ASC,
	[itemid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nctngref].[XPKnctngref].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[nctngref] ADD CONSTRAINT [XPKnctngref] PRIMARY KEY CLUSTERED (
	[unitid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nctpldef].[XPKnctpldef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[nctpldef] ADD CONSTRAINT [XPKnctpldef] PRIMARY KEY CLUSTERED (
	[tpid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[network_mib].[$netwo_u0000157900000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[network_mib] ADD CONSTRAINT [$netwo_u0000157900000000] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[not_log].[XPKnot_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[not_log] ADD CONSTRAINT [XPKnot_log] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[not_que].[XPKnot_que].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[not_que] ADD CONSTRAINT [XPKnot_que] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[notification].[XPKnotification].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[notification] ADD CONSTRAINT [XPKnotification] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nottrn].[XPKnottrn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[nottrn] ADD CONSTRAINT [XPKnottrn] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[noturg].[XPKnoturg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[noturg] ADD CONSTRAINT [XPKnoturg] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[nr_com].[XPKnr_com].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[nr_com] ADD CONSTRAINT [XPKnr_com] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ntfl].[XPKntfl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ntfl] ADD CONSTRAINT [XPKntfl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_comments].[XPKo_comments].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[o_comments] ADD CONSTRAINT [XPKo_comments] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_events].[XPKo_events].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[o_events] ADD CONSTRAINT [XPKo_events] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[o_indexes].[XPKo_indexes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[o_indexes] ADD CONSTRAINT [XPKo_indexes] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ols_area_ace].[XPK_ols_area_ace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ols_area_ace] ADD CONSTRAINT [XPK_ols_area_ace] PRIMARY KEY CLUSTERED (
	[object_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ols_area_def].[XPK_ols_area_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ols_area_def] ADD CONSTRAINT [XPK_ols_area_def] PRIMARY KEY CLUSTERED (
	[area_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ols_mapping].[ols_mapping_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ols_mapping] ADD CONSTRAINT [ols_mapping_pk] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[openunit].[XPKopenunit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[openunit] ADD CONSTRAINT [XPKopenunit] PRIMARY KEY CLUSTERED (
	[unitid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[options].[XPKoptions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[options] ADD CONSTRAINT [XPKoptions] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ot1sinac].[PK__ot1sinac__00F69215].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ot1sinac] ADD CONSTRAINT [PK__ot1sinac__00F69215] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ot2sinac].[PK__ot2sinac__86E08DC62AD7BD48].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ot2sinac] ADD CONSTRAINT [PK__ot2sinac__86E08DC62AD7BD48] PRIMARY KEY CLUSTERED (
	[formobjid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[p_groups].[XPKp_groups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[p_groups] ADD CONSTRAINT [XPKp_groups] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[package_type].[XPKpackage_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[package_type] ADD CONSTRAINT [XPKpackage_type] PRIMARY KEY CLUSTERED (
	[package_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_grp].[XPKpcat_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pcat_grp] ADD CONSTRAINT [XPKpcat_grp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_loc].[XPKpcat_loc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pcat_loc] ADD CONSTRAINT [XPKpcat_loc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pcat_wrkshft].[XPKpcat_wrkshft].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pcat_wrkshft] ADD CONSTRAINT [XPKpcat_wrkshft] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_10min].[pd_val_10min_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_10min] ADD CONSTRAINT [pd_val_10min_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_12hr].[pd_val_12hr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_12hr] ADD CONSTRAINT [pd_val_12hr_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_15min].[pd_val_15min_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_15min] ADD CONSTRAINT [pd_val_15min_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_1day].[pd_val_1day_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_1day] ADD CONSTRAINT [pd_val_1day_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_1hr].[pd_val_1hr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_1hr] ADD CONSTRAINT [pd_val_1hr_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_1min].[pd_val_1min_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_1min] ADD CONSTRAINT [pd_val_1min_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_1month].[pd_val_1month_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_1month] ADD CONSTRAINT [pd_val_1month_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_1week].[pd_val_1week_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_1week] ADD CONSTRAINT [pd_val_1week_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_1year].[pd_val_1year_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_1year] ADD CONSTRAINT [pd_val_1year_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_20min].[pd_val_20min_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_20min] ADD CONSTRAINT [pd_val_20min_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_2hr].[pd_val_2hr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_2hr] ADD CONSTRAINT [pd_val_2hr_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_30min].[pd_val_30min_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_30min] ADD CONSTRAINT [pd_val_30min_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_3hr].[pd_val_3hr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_3hr] ADD CONSTRAINT [pd_val_3hr_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_4hr].[pd_val_4hr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_4hr] ADD CONSTRAINT [pd_val_4hr_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_5min].[pd_val_5min_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_5min] ADD CONSTRAINT [pd_val_5min_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_6hr].[pd_val_6hr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_6hr] ADD CONSTRAINT [pd_val_6hr_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pd_val_8hr].[pd_val_8hr_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pd_val_8hr] ADD CONSTRAINT [pd_val_8hr_pk] PRIMARY KEY CLUSTERED (
	[machine_id] ASC,
	[res_id] ASC,
	[day_id] ASC,
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Permissions].[pk_Permissions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Permissions] ADD CONSTRAINT [pk_Permissions] PRIMARY KEY CLUSTERED (
	[ObjectId] ASC,
	[GranteeId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[perscon].[XPKperscon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[perscon] ADD CONSTRAINT [XPKperscon] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[policonf].[XPKpoliconf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[policonf] ADD CONSTRAINT [XPKpoliconf] PRIMARY KEY CLUSTERED (
	[polid] ASC,
	[poltype] ASC,
	[pdomid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[polidef].[XPKpolidef].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[polidef] ADD CONSTRAINT [XPKpolidef] PRIMARY KEY CLUSTERED (
	[polid] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[polijob].[XPKpolijob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[polijob] ADD CONSTRAINT [XPKpolijob] PRIMARY KEY CLUSTERED (
	[polid] ASC,
	[polorder] ASC,
	[polact] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[polilog].[XPKpolilog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[polilog] ADD CONSTRAINT [XPKpolilog] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[pdomid] ASC,
	[polid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pollrowdefinition].[$pollr_u0000158600000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pollrowdefinition] ADD CONSTRAINT [$pollr_u0000158600000000] PRIMARY KEY CLUSTERED (
	[rowid] ASC,
	[mibidx] ASC,
	[oididxformib] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_document].[XPKpor_document].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_document] ADD CONSTRAINT [XPKpor_document] PRIMARY KEY CLUSTERED (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_documentgroups].[XPKpor_documentgroups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_documentgroups] ADD CONSTRAINT [XPKpor_documentgroups] PRIMARY KEY CLUSTERED (
	[objectkey] ASC,
	[groupowner] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_group].[XPKpor_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_group] ADD CONSTRAINT [XPKpor_group] PRIMARY KEY CLUSTERED (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_objectrepos].[XPKpor_objectrepos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_objectrepos] ADD CONSTRAINT [XPKpor_objectrepos] PRIMARY KEY CLUSTERED (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_pagecols].[XPKpor_pagecols].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_pagecols] ADD CONSTRAINT [XPKpor_pagecols] PRIMARY KEY CLUSTERED (
	[component_column] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_pages].[XPKpor_pages].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_pages] ADD CONSTRAINT [XPKpor_pages] PRIMARY KEY CLUSTERED (
	[portalpage_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_publisher].[XPKpor_publisher].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_publisher] ADD CONSTRAINT [XPKpor_publisher] PRIMARY KEY CLUSTERED (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_sequences].[$por_s_u0000367200000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_sequences] ADD CONSTRAINT [$por_s_u0000367200000000] PRIMARY KEY CLUSTERED (
	[sequence_num_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_server].[XPKpor_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_server] ADD CONSTRAINT [XPKpor_server] PRIMARY KEY CLUSTERED (
	[serverkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_task].[XPKpor_task].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_task] ADD CONSTRAINT [XPKpor_task] PRIMARY KEY CLUSTERED (
	[taskkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_template].[XPKpor_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_template] ADD CONSTRAINT [XPKpor_template] PRIMARY KEY CLUSTERED (
	[templatekey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[por_user].[XPKpor_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[por_user] ADD CONSTRAINT [XPKpor_user] PRIMARY KEY CLUSTERED (
	[objectkey] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[pri].[XPKpri].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[pri] ADD CONSTRAINT [XPKpri] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[prob_ctg].[XPKprob_ctg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[prob_ctg] ADD CONSTRAINT [XPKprob_ctg] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[process_schedule].[XPKprocess_schedule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[process_schedule] ADD CONSTRAINT [XPKprocess_schedule] PRIMARY KEY CLUSTERED (
	[process_schedule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[process_type].[XPKprocess_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[process_type] ADD CONSTRAINT [XPKprocess_type] PRIMARY KEY CLUSTERED (
	[process_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[product].[XPKproduct].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[product] ADD CONSTRAINT [XPKproduct] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[profile_expression_step].[XPKprofile_expression_step].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[profile_expression_step] ADD CONSTRAINT [XPKprofile_expression_step] PRIMARY KEY CLUSTERED (
	[profile_expression_step_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[profile_pki].[XPKprofile_pki].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[profile_pki] ADD CONSTRAINT [XPKprofile_pki] PRIMARY KEY CLUSTERED (
	[name] ASC,
	[version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[protection_level].[XPKprotection_level].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[protection_level] ADD CONSTRAINT [XPKprotection_level] PRIMARY KEY CLUSTERED (
	[protection_level_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[provider_user].[XPKprovider_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[provider_user] ADD CONSTRAINT [XPKprovider_user] PRIMARY KEY CLUSTERED (
	[userid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ProviderVersion].[pk_ProviderVersion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ProviderVersion] ADD CONSTRAINT [pk_ProviderVersion] PRIMARY KEY CLUSTERED (
	[ProviderType] ASC,
	[ProviderSubtype] ASC,
	[ServerId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[prp].[XPKprp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[prp] ADD CONSTRAINT [XPKprp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[prptpl].[XPKprptpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[prptpl] ADD CONSTRAINT [XPKprptpl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[quick_tpl_types].[XPKquick_tpl_types].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[quick_tpl_types] ADD CONSTRAINT [XPKquick_tpl_types] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[racaction].[XPKracaction].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[racaction] ADD CONSTRAINT [XPKracaction] PRIMARY KEY CLUSTERED (
	[actionid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rbooltab].[XPKrbooltab].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rbooltab] ADD CONSTRAINT [XPKrbooltab] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[RDBMS_Provider].[pk_RDBMS_Provider].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[RDBMS_Provider] ADD CONSTRAINT [pk_RDBMS_Provider] PRIMARY KEY CLUSTERED (
	[ProviderId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[recoverrequest].[XPKrecoverrequest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[recoverrequest] ADD CONSTRAINT [XPKrecoverrequest] PRIMARY KEY CLUSTERED (
	[requestid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ref_ref_source_matrix].[XPKref_ref_source_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ref_ref_source_matrix] ADD CONSTRAINT [XPKref_ref_source_matrix] PRIMARY KEY CLUSTERED (
	[ref_ref_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[reference_group].[XPKreference_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[reference_group] ADD CONSTRAINT [XPKreference_group] PRIMARY KEY CLUSTERED (
	[reference_group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[reference_source].[XPKreference_source].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[reference_source] ADD CONSTRAINT [XPKreference_source] PRIMARY KEY CLUSTERED (
	[reference_source_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[reference_source_vuln_matrix].[XPKreference_source_vuln_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[reference_source_vuln_matrix] ADD CONSTRAINT [XPKreference_source_vuln_matrix] PRIMARY KEY CLUSTERED (
	[reference_source_vuln_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[release].[XPKrelease].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[release] ADD CONSTRAINT [XPKrelease] PRIMARY KEY CLUSTERED (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rem_ref].[XPKrem_ref].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rem_ref] ADD CONSTRAINT [XPKrem_ref] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[remed_prof_detect_prof_matrix].[XPKremed_prof_detect_prof_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[remed_prof_detect_prof_matrix] ADD CONSTRAINT [XPKremed_prof_detect_prof_matrix] PRIMARY KEY CLUSTERED (
	[remed_detect_profile_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[remediation_profile].[XPKremediation_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[remediation_profile] ADD CONSTRAINT [XPKremediation_profile] PRIMARY KEY CLUSTERED (
	[remed_profile_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[renewalrequest].[XPKrenewalrequest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[renewalrequest] ADD CONSTRAINT [XPKrenewalrequest] PRIMARY KEY CLUSTERED (
	[requestid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[repmeth].[XPKrepmeth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[repmeth] ADD CONSTRAINT [XPKrepmeth] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[report_pki].[XPKreport_pki].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[report_pki] ADD CONSTRAINT [XPKreport_pki] PRIMARY KEY CLUSTERED (
	[buttontext] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[request_pki].[XPKrequest_pki].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[request_pki] ADD CONSTRAINT [XPKrequest_pki] PRIMARY KEY CLUSTERED (
	[requestid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[RequestProvider].[pk_RequestProvider].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[RequestProvider] ADD CONSTRAINT [pk_RequestProvider] PRIMARY KEY CLUSTERED (
	[ProviderId] ASC,
	[RequestId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[RequestQueue].[pk_RequestQueue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[RequestQueue] ADD CONSTRAINT [pk_RequestQueue] PRIMARY KEY CLUSTERED (
	[RequestId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[requesttype].[XPKrequesttype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[requesttype] ADD CONSTRAINT [XPKrequesttype] PRIMARY KEY CLUSTERED (
	[requesttype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[resourcetype].[$resou_u0000169400000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[resourcetype] ADD CONSTRAINT [$resou_u0000169400000000] PRIMARY KEY CLUSTERED (
	[rsrctype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[response].[XPKresponse].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[response] ADD CONSTRAINT [XPKresponse] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[revocationrequest].[XPKrevocationrequest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[revocationrequest] ADD CONSTRAINT [XPKrevocationrequest] PRIMARY KEY CLUSTERED (
	[requestid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[root_cause].[XPKroot_cause].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[root_cause] ADD CONSTRAINT [XPKroot_cause] PRIMARY KEY CLUSTERED (
	[root_cause_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rootcause].[XPKrootcause].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rootcause] ADD CONSTRAINT [XPKrootcause] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpauto].[XPKrpauto].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpauto] ADD CONSTRAINT [XPKrpauto] PRIMARY KEY CLUSTERED (
	[objid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpdatcat].[XPKrpdatcat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpdatcat] ADD CONSTRAINT [XPKrpdatcat] PRIMARY KEY CLUSTERED (
	[catname] ASC,
	[locid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpdatfld].[XPKrpdatfld].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpdatfld] ADD CONSTRAINT [XPKrpdatfld] PRIMARY KEY CLUSTERED (
	[srcid] ASC,
	[locid] ASC,
	[fldname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpdatqry].[XPKrpdatqry].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpdatqry] ADD CONSTRAINT [XPKrpdatqry] PRIMARY KEY CLUSTERED (
	[srcid] ASC,
	[locid] ASC,
	[qryname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpdatsrc].[XPKrpdatsrc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpdatsrc] ADD CONSTRAINT [XPKrpdatsrc] PRIMARY KEY CLUSTERED (
	[srcid] ASC,
	[locid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpdattyp].[XPKrpdattyp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpdattyp] ADD CONSTRAINT [XPKrpdattyp] PRIMARY KEY CLUSTERED (
	[srcid] ASC,
	[locid] ASC,
	[typname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpfield].[XPKrpfield].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpfield] ADD CONSTRAINT [XPKrpfield] PRIMARY KEY CLUSTERED (
	[objid] ASC,
	[fldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpfilter].[XPKrpfilter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpfilter] ADD CONSTRAINT [XPKrpfilter] PRIMARY KEY CLUSTERED (
	[tplid] ASC,
	[resid] ASC,
	[argid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpglobal].[XPKrpglobal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpglobal] ADD CONSTRAINT [XPKrpglobal] PRIMARY KEY CLUSTERED (
	[keyname] ASC,
	[subname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpipc].[XPKrpipc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpipc] ADD CONSTRAINT [XPKrpipc] PRIMARY KEY CLUSTERED (
	[ipcid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rppub].[XPKrppub].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rppub] ADD CONSTRAINT [XPKrppub] PRIMARY KEY CLUSTERED (
	[objid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpresult].[XPKrpresult].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpresult] ADD CONSTRAINT [XPKrpresult] PRIMARY KEY CLUSTERED (
	[tplid] ASC,
	[tplsubid] ASC,
	[resid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpstats].[XPKrpstats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpstats] ADD CONSTRAINT [XPKrpstats] PRIMARY KEY CLUSTERED (
	[tplid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rptables].[XPKrptables].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rptables] ADD CONSTRAINT [XPKrptables] PRIMARY KEY CLUSTERED (
	[tblname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rptmth].[XPKrptmth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rptmth] ADD CONSTRAINT [XPKrptmth] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rptpl].[XPKrptpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rptpl] ADD CONSTRAINT [XPKrptpl] PRIMARY KEY CLUSTERED (
	[objid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rptree].[XPKrptree].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rptree] ADD CONSTRAINT [XPKrptree] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[rpview].[XPKrpview].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[rpview] ADD CONSTRAINT [XPKrpview] PRIMARY KEY CLUSTERED (
	[tplid] ASC,
	[viewid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sapolicy].[XPKsapolicy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sapolicy] ADD CONSTRAINT [XPKsapolicy] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[saprobtyp].[XPKsaprobtyp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[saprobtyp] ADD CONSTRAINT [XPKsaprobtyp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ScriptMessageLog].[pk_ScriptMessageLog].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ScriptMessageLog] ADD CONSTRAINT [pk_ScriptMessageLog] PRIMARY KEY CLUSTERED (
	[RequestId] ASC,
	[ExecutionId] ASC,
	[MessageOrder] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sd_server_download_file].[XPKsd_server_download_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sd_server_download_file] ADD CONSTRAINT [XPKsd_server_download_file] PRIMARY KEY CLUSTERED (
	[sd_server_download_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sdsc_map].[XPKsdsc_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sdsc_map] ADD CONSTRAINT [XPKsdsc_map] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[seqctl].[XPKseqctl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[seqctl] ADD CONSTRAINT [XPKseqctl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[service].[XPKservice].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[service] ADD CONSTRAINT [XPKservice] PRIMARY KEY CLUSTERED (
	[sw_def_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[session_log].[XPKsession_log].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[session_log] ADD CONSTRAINT [XPKsession_log] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[session_type].[XPKsession_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[session_type] ADD CONSTRAINT [XPKsession_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[setting].[$setti_u000041de00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[setting] ADD CONSTRAINT [$setti_u000041de00000000] PRIMARY KEY CLUSTERED (
	[productid] ASC,
	[actor] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[settings].[XPKsettings].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[settings] ADD CONSTRAINT [XPKsettings] PRIMARY KEY CLUSTERED (
	[eccmuserid] ASC,
	[context] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sevrty].[XPKsevrty].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sevrty] ADD CONSTRAINT [XPKsevrty] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[show_obj].[XPKshow_obj].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[show_obj] ADD CONSTRAINT [XPKshow_obj] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_prop].[$si_ci_u000014e700000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_ci_prop] ADD CONSTRAINT [$si_ci_u000014e700000000] PRIMARY KEY CLUSTERED (
	[ci_uuid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_ci_rec_rel].[$si_ci_u000014c100000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_ci_rec_rel] ADD CONSTRAINT [$si_ci_u000014c100000000] PRIMARY KEY CLUSTERED (
	[ci_uuid] ASC,
	[rec_uuid] ASC,
	[persid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_cnt_org_rel].[$si_cn_u000014ef00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_cnt_org_rel] ADD CONSTRAINT [$si_cn_u000014ef00000000] PRIMARY KEY CLUSTERED (
	[org_uuid] ASC,
	[cnt_uuid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_contact_prop].[$si_co_u000014e300000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_contact_prop] ADD CONSTRAINT [$si_co_u000014e300000000] PRIMARY KEY CLUSTERED (
	[contact_uuid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_financial_prop].[$si_fi_u000014f400000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_financial_prop] ADD CONSTRAINT [$si_fi_u000014f400000000] PRIMARY KEY CLUSTERED (
	[uuid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_log_prop].[$si_lo_u000014eb00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_log_prop] ADD CONSTRAINT [$si_lo_u000014eb00000000] PRIMARY KEY CLUSTERED (
	[rec_uuid] ASC,
	[persid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_org_prop].[$si_or_u000014e500000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_org_prop] ADD CONSTRAINT [$si_or_u000014e500000000] PRIMARY KEY CLUSTERED (
	[org_uuid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_rec_prop].[$si_re_u000014e900000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_rec_prop] ADD CONSTRAINT [$si_re_u000014e900000000] PRIMARY KEY CLUSTERED (
	[rec_uuid] ASC,
	[persid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[si_wf_prop].[$si_wf_u000014ed00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[si_wf_prop] ADD CONSTRAINT [$si_wf_u000014ed00000000] PRIMARY KEY CLUSTERED (
	[wf_uuid] ASC,
	[persid] ASC,
	[data_source] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[signature_os_group].[XPKsignature_os_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[signature_os_group] ADD CONSTRAINT [XPKsignature_os_group] PRIMARY KEY CLUSTERED (
	[signature_os_group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[SimpleRequest].[pk_SimpleRequest].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[SimpleRequest] ADD CONSTRAINT [pk_SimpleRequest] PRIMARY KEY CLUSTERED (
	[RequestId] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[skeletons].[XPKskeletons].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[skeletons] ADD CONSTRAINT [XPKskeletons] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[slatpl].[XPKslatpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[slatpl] ADD CONSTRAINT [XPKslatpl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[snapmain].[XPKsnapmain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[snapmain] ADD CONSTRAINT [XPKsnapmain] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[snapmain] ASC,
	[snappart] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[snapmemo].[XPKsnapmemo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[snapmemo] ADD CONSTRAINT [XPKsnapmemo] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[snappart] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_file_params].[XPKsoftware_delivery_file_params].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[software_delivery_file_params] ADD CONSTRAINT [XPKsoftware_delivery_file_params] PRIMARY KEY CLUSTERED (
	[software_delivery_file_param_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_job].[XPKsoftware_delivery_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[software_delivery_job] ADD CONSTRAINT [XPKsoftware_delivery_job] PRIMARY KEY CLUSTERED (
	[software_delivery_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_job_file].[XPKsoftware_delivery_job_file].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[software_delivery_job_file] ADD CONSTRAINT [XPKsoftware_delivery_job_file] PRIMARY KEY CLUSTERED (
	[software_delivery_job_file_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_delivery_server].[XPKsoftware_delivery_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[software_delivery_server] ADD CONSTRAINT [XPKsoftware_delivery_server] PRIMARY KEY CLUSTERED (
	[software_delivery_server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[software_vulnerability].[XPKsoftware_vulnerability].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[software_vulnerability] ADD CONSTRAINT [XPKsoftware_vulnerability] PRIMARY KEY CLUSTERED (
	[vuln_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[splmac].[XPKsplmac].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[splmac] ADD CONSTRAINT [XPKsplmac] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[splmactp].[XPKsplmactp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[splmactp] ADD CONSTRAINT [XPKsplmactp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[sql_tab].[XPKsql_tab].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[sql_tab] ADD CONSTRAINT [XPKsql_tab] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[srv_desc].[XPKsrv_desc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[srv_desc] ADD CONSTRAINT [XPKsrv_desc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[srvr_aliases].[XPKsrvr_aliases].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[srvr_aliases] ADD CONSTRAINT [XPKsrvr_aliases] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[srvr_zones].[XPKsrvr_zones].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[srvr_zones] ADD CONSTRAINT [XPKsrvr_zones] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[statjob].[XPKstatjob].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[statjob] ADD CONSTRAINT [XPKstatjob] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[jdomid] ASC,
	[jobid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[statjobm].[XPKstatjobm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[statjobm] ADD CONSTRAINT [XPKstatjobm] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[jdomid] ASC,
	[jobid] ASC,
	[statpart] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[statmod].[XPKstatmod].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[statmod] ADD CONSTRAINT [XPKstatmod] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[mdomid] ASC,
	[moid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[statmodm].[XPKstatmodm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[statmodm] ADD CONSTRAINT [XPKstatmodm] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[mdomid] ASC,
	[moid] ASC,
	[statpart] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey].[XPKsurvey].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[survey] ADD CONSTRAINT [XPKsurvey] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_answer].[XPKsurvey_answer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[survey_answer] ADD CONSTRAINT [XPKsurvey_answer] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_atpl].[XPKsurvey_atpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[survey_atpl] ADD CONSTRAINT [XPKsurvey_atpl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_qtpl].[XPKsurvey_qtpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[survey_qtpl] ADD CONSTRAINT [XPKsurvey_qtpl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_question].[XPKsurvey_question].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[survey_question] ADD CONSTRAINT [XPKsurvey_question] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_statistics].[XPKsurvey_statistics].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[survey_statistics] ADD CONSTRAINT [XPKsurvey_statistics] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_tpl].[XPKsurvey_tpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[survey_tpl] ADD CONSTRAINT [XPKsurvey_tpl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[survey_tracking].[XPKsurvey_tracking].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[survey_tracking] ADD CONSTRAINT [XPKsurvey_tracking] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[svc_contract].[XPKsvc_contract].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[svc_contract] ADD CONSTRAINT [XPKsvc_contract] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[system_configuration].[XPKsystem_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[system_configuration] ADD CONSTRAINT [XPKsystem_configuration] PRIMARY KEY CLUSTERED (
	[unit_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[SystemParameter].[pk_SystemParameter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[SystemParameter] ADD CONSTRAINT [pk_SystemParameter] PRIMARY KEY CLUSTERED (
	[ServerId] ASC,
	[ParameterName] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tabledefinition].[$table_u0000158d00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tabledefinition] ADD CONSTRAINT [$table_u0000158d00000000] PRIMARY KEY CLUSTERED (
	[tableidx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tableindex].[$table_u0000169100000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tableindex] ADD CONSTRAINT [$table_u0000169100000000] PRIMARY KEY CLUSTERED (
	[tablename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tablesdescription].[$table_u0000159100000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tablesdescription] ADD CONSTRAINT [$table_u0000159100000000] PRIMARY KEY CLUSTERED (
	[oididxformib] ASC,
	[mibidx] ASC,
	[tableidx] ASC,
	[orderofcolumn] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[thresholddesc].[$thres_u0000159600000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[thresholddesc] ADD CONSTRAINT [$thres_u0000159600000000] PRIMARY KEY CLUSTERED (
	[fieldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[thresholdformula].[$thres_u0000168a00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[thresholdformula] ADD CONSTRAINT [$thres_u0000168a00000000] PRIMARY KEY CLUSTERED (
	[fieldindex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tn].[XPKtn].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tn] ADD CONSTRAINT [XPKtn] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_address_type].[PK__tng_address_type__7973D530].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_address_type] ADD CONSTRAINT [PK__tng_address_type__7973D530] PRIMARY KEY CLUSTERED (
	[address_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_adminstatus].[PK__tng_adminstatus__7B5C1DA2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_adminstatus] ADD CONSTRAINT [PK__tng_adminstatus__7B5C1DA2] PRIMARY KEY CLUSTERED (
	[admin_status] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_auth].[PK__tng_auth__02091B31].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_auth] ADD CONSTRAINT [PK__tng_auth__02091B31] PRIMARY KEY CLUSTERED (
	[name] ASC,
	[access] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_change_history].[PK__tng_change_histo__08B618C0].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_change_history] ADD CONSTRAINT [PK__tng_change_histo__08B618C0] PRIMARY KEY CLUSTERED (
	[sequence_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_class].[PK__tng_class__0C86A9A4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_class] ADD CONSTRAINT [PK__tng_class__0C86A9A4] PRIMARY KEY CLUSTERED (
	[class_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_class_addport].[PK__tng_class_addpor__0E6EF216].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_class_addport] ADD CONSTRAINT [PK__tng_class_addpor__0E6EF216] PRIMARY KEY CLUSTERED (
	[class_name] ASC,
	[portstring] ASC,
	[port] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_class_ext].[PK__tng_class_ext__3A3865BB].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_class_ext] ADD CONSTRAINT [PK__tng_class_ext__3A3865BB] PRIMARY KEY CLUSTERED (
	[class_id] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_dbserver_connectinfo].[pk_key].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_dbserver_connectinfo] ADD CONSTRAINT [pk_key] PRIMARY KEY CLUSTERED (
	[client_pid] ASC,
	[client_host_name] ASC,
	[client_user] ASC,
	[application_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_discovery_ipsubnet].[PK__tng_discovery_ip__1F997E18].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_discovery_ipsubnet] ADD CONSTRAINT [PK__tng_discovery_ip__1F997E18] PRIMARY KEY CLUSTERED (
	[discovery_ipsubnet_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_jasmine_menu_object].[baseidx_tng_jasmine_menu_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [baseidx_tng_jasmine_menu_object] ON [dbo].[tng_jasmine_menu_object] (
	[menu_name] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_popup_menu].[PK__tng_popup_menu__6BE4CFE8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_popup_menu] ADD CONSTRAINT [PK__tng_popup_menu__6BE4CFE8] PRIMARY KEY CLUSTERED (
	[name] ASC,
	[sequence_no] ASC,
	[label] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_property_definition].[PK__tng_property_def__68143F04].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_property_definition] ADD CONSTRAINT [PK__tng_property_def__68143F04] PRIMARY KEY CLUSTERED (
	[id] ASC,
	[class_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_status].[PK__tng_status__6CD8F421].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_status] ADD CONSTRAINT [PK__tng_status__6CD8F421] PRIMARY KEY CLUSTERED (
	[status_text] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tng_status_history].[PK__tng_status_histo__6CD8F421].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tng_status_history] ADD CONSTRAINT [PK__tng_status_histo__6CD8F421] PRIMARY KEY CLUSTERED (
	[sequence_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[toc].[XPKtoc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[toc] ADD CONSTRAINT [XPKtoc] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tplmemo].[XPKtplmemo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tplmemo] ADD CONSTRAINT [XPKtplmemo] PRIMARY KEY CLUSTERED (
	[tpid] ASC,
	[tpver] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tskstat].[XPKtskstat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tskstat] ADD CONSTRAINT [XPKtskstat] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tskty].[XPKtskty].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tskty] ADD CONSTRAINT [XPKtskty] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tspan].[XPKtspan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tspan] ADD CONSTRAINT [XPKtspan] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tsr_stats].[XPKtsr_stats].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tsr_stats] ADD CONSTRAINT [XPKtsr_stats] PRIMARY KEY CLUSTERED (
	[job_id] ASC,
	[job_run] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[tz].[XPKtz].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[tz] ADD CONSTRAINT [XPKtz] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_calendars].[XPKucm_calendars].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_calendars] ADD CONSTRAINT [XPKucm_calendars] PRIMARY KEY CLUSTERED (
	[calendar_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_cron_triggers].[XPKucm_cron_triggers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_cron_triggers] ADD CONSTRAINT [XPKucm_cron_triggers] PRIMARY KEY CLUSTERED (
	[trigger_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_fired_triggers].[XPKucm_fired_triggers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_fired_triggers] ADD CONSTRAINT [XPKucm_fired_triggers] PRIMARY KEY CLUSTERED (
	[trigger_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_job_details].[XPKucm_job_details].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_job_details] ADD CONSTRAINT [XPKucm_job_details] PRIMARY KEY CLUSTERED (
	[job_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_job_listeners].[XPKucm_job_listeners].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_job_listeners] ADD CONSTRAINT [XPKucm_job_listeners] PRIMARY KEY CLUSTERED (
	[job_uuid] ASC,
	[job_listener] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_link_calendar_trigger].[XPKucm_link_calendar_trigger].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_link_calendar_trigger] ADD CONSTRAINT [XPKucm_link_calendar_trigger] PRIMARY KEY CLUSTERED (
	[calendar_uuid] ASC,
	[trigger_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_link_config_report].[XPKucm_link_config_report].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_link_config_report] ADD CONSTRAINT [XPKucm_link_config_report] PRIMARY KEY CLUSTERED (
	[config_uuid] ASC,
	[rpt_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_locks].[XPKucm_locks].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_locks] ADD CONSTRAINT [XPKucm_locks] PRIMARY KEY CLUSTERED (
	[lock_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_paused_trigger_grps].[XPKucm_paused_trigger_grps].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_paused_trigger_grps] ADD CONSTRAINT [XPKucm_paused_trigger_grps] PRIMARY KEY CLUSTERED (
	[trigger_group] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_scheduler_state].[XPKucm_scheduler_state].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_scheduler_state] ADD CONSTRAINT [XPKucm_scheduler_state] PRIMARY KEY CLUSTERED (
	[instance_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_simple_triggers].[XPKucm_simple_triggers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_simple_triggers] ADD CONSTRAINT [XPKucm_simple_triggers] PRIMARY KEY CLUSTERED (
	[trigger_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_trigger_listeners].[XPKucm_trigger_listeners].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_trigger_listeners] ADD CONSTRAINT [XPKucm_trigger_listeners] PRIMARY KEY CLUSTERED (
	[trigger_uuid] ASC,
	[trigger_listener] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ucm_triggers].[XPKucm_triggers].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ucm_triggers] ADD CONSTRAINT [XPKucm_triggers] PRIMARY KEY CLUSTERED (
	[trigger_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[uejm_adapter].[XPKuejm_adapter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[uejm_adapter] ADD CONSTRAINT [XPKuejm_adapter] PRIMARY KEY CLUSTERED (
	[name] ASC,
	[server] ASC,
	[instance] ASC,
	[modified] ASC,
	[type] ASC,
	[int_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[uejm_alert].[$uejm__u000019ae00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[uejm_alert] ADD CONSTRAINT [$uejm__u000019ae00000000] PRIMARY KEY CLUSTERED (
	[alertid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[uejm_alert_ping].[$uejm__u000019b100000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[uejm_alert_ping] ADD CONSTRAINT [$uejm__u000019b100000000] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[uejm_configuration].[XPKuejm_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[uejm_configuration] ADD CONSTRAINT [XPKuejm_configuration] PRIMARY KEY CLUSTERED (
	[name] ASC,
	[server] ASC,
	[instance] ASC,
	[modified] ASC,
	[type] ASC,
	[int_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[uejm_jobscheduling].[XPKuejm_jobscheduling].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[uejm_jobscheduling] ADD CONSTRAINT [XPKuejm_jobscheduling] PRIMARY KEY CLUSTERED (
	[name] ASC,
	[server] ASC,
	[instance] ASC,
	[modified] ASC,
	[type] ASC,
	[int_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[uejm_monitoring].[XPKuejm_monitoring].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[uejm_monitoring] ADD CONSTRAINT [XPKuejm_monitoring] PRIMARY KEY CLUSTERED (
	[name] ASC,
	[server] ASC,
	[instance] ASC,
	[modified] ASC,
	[type] ASC,
	[int_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_alarm].[alarm_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [alarm_PUC] ON [dbo].[ujo_alarm] (
	[eoid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_asbnode].[asbnode_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [asbnode_PUC] ON [dbo].[ujo_asbnode] (
	[nod_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_asext_config].[asext_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [asext_PUC] ON [dbo].[ujo_asext_config] (
	[asext_AUTOSERV] ASC,
	[asext_nod_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_audit_msg].[audit_msg_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [audit_msg_PUC] ON [dbo].[ujo_audit_msg] (
	[audit_info_num] ASC,
	[seq_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_avg_job_runs].[avg_job_runs_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [avg_job_runs_PUC] ON [dbo].[ujo_avg_job_runs] (
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_calendar].[calendar_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [calendar_PUC] ON [dbo].[ujo_calendar] (
	[name] ASC,
	[day] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_chase].[chase_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [chase_PUC] ON [dbo].[ujo_chase] (
	[nstart] ASC,
	[joid] ASC,
	[eoid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_chkpnt_rstart].[chkpnt_rstart_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [chkpnt_rstart_PUC] ON [dbo].[ujo_chkpnt_rstart] (
	[dest_machine] ASC,
	[dest_app] ASC,
	[as_evt_time] ASC,
	[ubc_name] ASC,
	[ubc_jobnumbr] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_cred].[cred_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [cred_PUC] ON [dbo].[ujo_cred] (
	[cred_domain] ASC,
	[domain_name] ASC,
	[principal] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_cycle].[cycle_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [cycle_PUC] ON [dbo].[ujo_cycle] (
	[cycname] ASC,
	[cycperiod] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_event].[event_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [event_PUC] ON [dbo].[ujo_event] (
	[eoid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_event0].[event0_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE CLUSTERED INDEX [event0_PUC] ON [dbo].[ujo_event0] (
	[priority] ASC,
	[event_time_gmt] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ext_calendar].[ext_calendar_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ext_calendar_PUC] ON [dbo].[ujo_ext_calendar] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ext_job].[ext_job_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [ext_job_PUC] ON [dbo].[ujo_ext_job] (
	[ext_job_name] ASC,
	[ext_AUTOSERV] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_glob].[glob_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [glob_PUC] ON [dbo].[ujo_glob] (
	[glo_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_globblob].[globblob_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [globblob_PUC] ON [dbo].[ujo_globblob] (
	[bname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_designator].[PK__ujo_ha_designato__078CEA5D].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ujo_ha_designator] ADD CONSTRAINT [PK__ujo_ha_designato__078CEA5D] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_process].[PK__ujo_ha_process__3D14D266].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ujo_ha_process] ADD CONSTRAINT [PK__ujo_ha_process__3D14D266] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_state].[PK__ujo_ha_state__08810E96].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ujo_ha_state] ADD CONSTRAINT [PK__ujo_ha_state__08810E96] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_ha_status].[PK__ujo_ha_status__097532CF].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ujo_ha_status] ADD CONSTRAINT [PK__ujo_ha_status__097532CF] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_intcodes].[intcodes_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [intcodes_PUC] ON [dbo].[ujo_intcodes] (
	[fld] ASC,
	[code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job].[job_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [job_PUC] ON [dbo].[ujo_job] (
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_cond].[job_cond_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [job_cond_PUC] ON [dbo].[ujo_job_cond] (
	[cond_mode] ASC,
	[joid] ASC,
	[indx] ASC,
	[over_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_delete].[job_delete_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [job_delete_PUC] ON [dbo].[ujo_job_delete] (
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job_status].[job_status_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [job_status_PUC] ON [dbo].[ujo_job_status] (
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_job2].[job2_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [job2_PUC] ON [dbo].[ujo_job2] (
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_jobblob].[jobblob_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [jobblob_PUC] ON [dbo].[ujo_jobblob] (
	[joid] ASC,
	[type] ASC,
	[sequence] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_jobres].[jobres_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [jobres_PUC] ON [dbo].[ujo_jobres] (
	[joid] ASC,
	[indx] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_jobtype].[jobtype_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [jobtype_PUC] ON [dbo].[ujo_jobtype] (
	[job_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_lic_machine].[lic_machine_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [lic_machine_PUC] ON [dbo].[ujo_lic_machine] (
	[machine] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_machine].[machine_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [machine_PUC] ON [dbo].[ujo_machine] (
	[name] ASC,
	[parent_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_machres].[machres_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [machres_PUC] ON [dbo].[ujo_machres] (
	[as_machine] ASC,
	[as_resname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_monbro].[monbro_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [monbro_PUC] ON [dbo].[ujo_monbro] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_next_oid].[next_oid_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [next_oid_PUC] ON [dbo].[ujo_next_oid] (
	[field] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_overjob].[overjob_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [overjob_PUC] ON [dbo].[ujo_overjob] (
	[joid] ASC,
	[over_num] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_proc_event].[proc_event_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [proc_event_PUC] ON [dbo].[ujo_proc_event] (
	[eoid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_rep_daily].[rep_daily_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [rep_daily_PUC] ON [dbo].[ujo_rep_daily] (
	[hour] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_rep_hourly].[rep_hourly_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [rep_hourly_PUC] ON [dbo].[ujo_rep_hourly] (
	[hour] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_rep_monthly].[rep_monthly_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [rep_monthly_PUC] ON [dbo].[ujo_rep_monthly] (
	[hour] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_rep_weekly].[rep_weekly_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [rep_weekly_PUC] ON [dbo].[ujo_rep_weekly] (
	[hour] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_req_job].[req_job_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [req_job_PUC] ON [dbo].[ujo_req_job] (
	[job_name] ASC,
	[req_AUTOSERV] ASC,
	[req_job_name] ASC,
	[nsm_system_ID] ASC,
	[nsm_jobset_ID] ASC,
	[nsm_jobno_ID] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_restart].[restart_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [restart_PUC] ON [dbo].[ujo_restart] (
	[nstart] ASC,
	[joid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_send_buffer].[send_buffer_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [send_buffer_PUC] ON [dbo].[ujo_send_buffer] (
	[eoid] ASC,
	[serverdb] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_sys_ha_state].[PK__ujo_sys_ha_state__3E08F69F].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ujo_sys_ha_state] ADD CONSTRAINT [PK__ujo_sys_ha_state__3E08F69F] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_timezones].[timezones_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [timezones_PUC] ON [dbo].[ujo_timezones] (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[ujo_uninotify].[uninotify_PUC].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE UNIQUE CLUSTERED INDEX [uninotify_PUC] ON [dbo].[ujo_uninotify] (
	[joid] ASC,
	[field_id] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_error].[und_error_error_id_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[und_error] ADD CONSTRAINT [und_error_error_id_pk] PRIMARY KEY CLUSTERED (
	[error_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_job].[und_job_job_id_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[und_job] ADD CONSTRAINT [und_job_job_id_pk] PRIMARY KEY CLUSTERED (
	[job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_probe].[und_probe_id_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[und_probe] ADD CONSTRAINT [und_probe_id_pk] PRIMARY KEY CLUSTERED (
	[probe_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_task].[$und_t_u0000194900000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[und_task] ADD CONSTRAINT [$und_t_u0000194900000000] PRIMARY KEY CLUSTERED (
	[task_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[und_user].[und_user_user_id_pk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[und_user] ADD CONSTRAINT [und_user_user_id_pk] PRIMARY KEY CLUSTERED (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[unitsec].[XPKunitsec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[unitsec] ADD CONSTRAINT [XPKunitsec] PRIMARY KEY CLUSTERED (
	[object_uuid] ASC,
	[link_uuid] ASC,
	[type] ASC,
	[typex] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[unittype].[XPKunittype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[unittype] ADD CONSTRAINT [XPKunittype] PRIMARY KEY CLUSTERED (
	[unittype] ASC,
	[domainid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_group].[XPKupm_baseline_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_baseline_group] ADD CONSTRAINT [XPKupm_baseline_group] PRIMARY KEY CLUSTERED (
	[baseline_uuid] ASC,
	[group_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_patch].[XPKupm_baseline_patch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_baseline_patch] ADD CONSTRAINT [XPKupm_baseline_patch] PRIMARY KEY CLUSTERED (
	[baseline_uuid] ASC,
	[install_pkg_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_baseline_sw].[XPKupm_baseline_sw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_baseline_sw] ADD CONSTRAINT [XPKupm_baseline_sw] PRIMARY KEY CLUSTERED (
	[baseline_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_credential].[XPKupm_credential].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_credential] ADD CONSTRAINT [XPKupm_credential] PRIMARY KEY CLUSTERED (
	[company_uuid] ASC,
	[url] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_deployment].[XPKupm_deployment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_deployment] ADD CONSTRAINT [XPKupm_deployment] PRIMARY KEY CLUSTERED (
	[deployment_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_download].[XPKupm_download].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_download] ADD CONSTRAINT [XPKupm_download] PRIMARY KEY CLUSTERED (
	[download_file_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_event].[XPKupm_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_event] ADD CONSTRAINT [XPKupm_event] PRIMARY KEY CLUSTERED (
	[event_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_name_value_pair].[XPKupm_name_value_pair].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_name_value_pair] ADD CONSTRAINT [XPKupm_name_value_pair] PRIMARY KEY CLUSTERED (
	[user_uuid] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_portlet].[XPKupm_portlet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_portlet] ADD CONSTRAINT [XPKupm_portlet] PRIMARY KEY CLUSTERED (
	[user_uuid] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_portlet_content].[XPKupm_portlet_content].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_portlet_content] ADD CONSTRAINT [XPKupm_portlet_content] PRIMARY KEY CLUSTERED (
	[user_uuid] ASC,
	[type] ASC,
	[content_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[upm_workflow].[XPKupm_workflow].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[upm_workflow] ADD CONSTRAINT [XPKupm_workflow] PRIMARY KEY CLUSTERED (
	[workflow_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_ab_computer].[XPKurc_ab_computer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urc_ab_computer] ADD CONSTRAINT [XPKurc_ab_computer] PRIMARY KEY CLUSTERED (
	[uid] ASC,
	[domain_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_ab_group_def].[XPKurc_ab_group_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urc_ab_group_def] ADD CONSTRAINT [XPKurc_ab_group_def] PRIMARY KEY CLUSTERED (
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_ab_group_member].[XPKurc_ab_group_member].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urc_ab_group_member] ADD CONSTRAINT [XPKurc_ab_group_member] PRIMARY KEY CLUSTERED (
	[member_uuid] ASC,
	[group_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_ab_permission].[XPKurc_ab_permission].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urc_ab_permission] ADD CONSTRAINT [XPKurc_ab_permission] PRIMARY KEY CLUSTERED (
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_active_session].[XPKurc_active_session].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urc_active_session] ADD CONSTRAINT [XPKurc_active_session] PRIMARY KEY CLUSTERED (
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_computer].[XPKurc_computer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urc_computer] ADD CONSTRAINT [XPKurc_computer] PRIMARY KEY CLUSTERED (
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_local_server].[XPKurc_local_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urc_local_server] ADD CONSTRAINT [XPKurc_local_server] PRIMARY KEY CLUSTERED (
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urc_schema_version].[XPKurc_schema_version].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urc_schema_version] ADD CONSTRAINT [XPKurc_schema_version] PRIMARY KEY CLUSTERED (
	[uid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[urgncy].[XPKurgncy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[urgncy] ADD CONSTRAINT [XPKurgncy] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_activity].[XPKusd_activity].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_activity] ADD CONSTRAINT [XPKusd_activity] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_actproc].[XPKusd_actproc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_actproc] ADD CONSTRAINT [XPKusd_actproc] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_apdep].[XPKusd_apdep].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_apdep] ADD CONSTRAINT [XPKusd_apdep] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_applic].[XPKusd_applic].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_applic] ADD CONSTRAINT [XPKusd_applic] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_carrier].[XPKusd_carrier].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_carrier] ADD CONSTRAINT [XPKusd_carrier] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_cc].[XPKusd_cc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_cc] ADD CONSTRAINT [XPKusd_cc] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_cmp_grp].[XPKusd_cmp_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_cmp_grp] ADD CONSTRAINT [XPKusd_cmp_grp] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_cont].[XPKusd_cont].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_cont] ADD CONSTRAINT [XPKusd_cont] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_contfold].[XPKusd_contfold].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_contfold] ADD CONSTRAINT [XPKusd_contfold] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_distap].[XPKusd_distap].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_distap] ADD CONSTRAINT [XPKusd_distap] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_distsw].[XPKusd_distsw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_distsw] ADD CONSTRAINT [XPKusd_distsw] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_disttempl].[XPKusd_disttempl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_disttempl] ADD CONSTRAINT [XPKusd_disttempl] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_fio].[XPKusd_fio].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_fio] ADD CONSTRAINT [XPKusd_fio] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_fitem].[XPKusd_fitem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_fitem] ADD CONSTRAINT [XPKusd_fitem] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_jcappgr].[XPKusd_jcappgr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_jcappgr] ADD CONSTRAINT [XPKusd_jcappgr] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_jcview].[XPKusd_jcview].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_jcview] ADD CONSTRAINT [XPKusd_jcview] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_job_cont].[XPKusd_job_cont].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_job_cont] ADD CONSTRAINT [XPKusd_job_cont] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_act_cmp].[XPKusd_link_act_cmp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_act_cmp] ADD CONSTRAINT [XPKusd_link_act_cmp] PRIMARY KEY CLUSTERED (
	[act] ASC,
	[comp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_act_grp].[XPKusd_link_act_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_act_grp] ADD CONSTRAINT [XPKusd_link_act_grp] PRIMARY KEY CLUSTERED (
	[act] ASC,
	[grp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_act_inst].[XPKusd_link_act_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_act_inst] ADD CONSTRAINT [XPKusd_link_act_inst] PRIMARY KEY CLUSTERED (
	[activity] ASC,
	[installation] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_cfold_cont].[XPKusd_link_cfold_cont].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_cfold_cont] ADD CONSTRAINT [XPKusd_link_cfold_cont] PRIMARY KEY CLUSTERED (
	[contfold] ASC,
	[cont] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_cmpgrp].[XPKusd_link_cmpgrp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_cmpgrp] ADD CONSTRAINT [XPKusd_link_cmpgrp] PRIMARY KEY CLUSTERED (
	[grpparent] ASC,
	[grpchild] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_contfold].[XPKusd_link_contfold].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_contfold] ADD CONSTRAINT [XPKusd_link_contfold] PRIMARY KEY CLUSTERED (
	[cfold_parent] ASC,
	[cfold_child] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_grp_cmp].[XPKusd_link_grp_cmp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_grp_cmp] ADD CONSTRAINT [XPKusd_link_grp_cmp] PRIMARY KEY CLUSTERED (
	[grp] ASC,
	[comp] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_grp_proc].[XPKusd_link_grp_proc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_grp_proc] ADD CONSTRAINT [XPKusd_link_grp_proc] PRIMARY KEY CLUSTERED (
	[procgrp] ASC,
	[ap] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_jc].[XPKusd_link_jc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_jc] ADD CONSTRAINT [XPKusd_link_jc] PRIMARY KEY CLUSTERED (
	[jcparent] ASC,
	[jcchild] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_jc_act].[XPKusd_link_jc_act].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_jc_act] ADD CONSTRAINT [XPKusd_link_jc_act] PRIMARY KEY CLUSTERED (
	[jcont] ASC,
	[activity] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_jc_srv].[XPKusd_link_jc_srv].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_jc_srv] ADD CONSTRAINT [XPKusd_link_jc_srv] PRIMARY KEY CLUSTERED (
	[jcont] ASC,
	[server] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_swg_sw].[XPKusd_link_swg_sw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_swg_sw] ADD CONSTRAINT [XPKusd_link_swg_sw] PRIMARY KEY CLUSTERED (
	[swg] ASC,
	[sw] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_link_swgrp].[XPKusd_link_swgrp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_link_swgrp] ADD CONSTRAINT [XPKusd_link_swgrp] PRIMARY KEY CLUSTERED (
	[grpparent] ASC,
	[grpchild] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_order].[XPKusd_order].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_order] ADD CONSTRAINT [XPKusd_order] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_rsw].[XPKusd_rsw].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_rsw] ADD CONSTRAINT [XPKusd_rsw] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_swfold].[XPKusd_swfold].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_swfold] ADD CONSTRAINT [XPKusd_swfold] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_target].[XPKusd_target].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_target] ADD CONSTRAINT [XPKusd_target] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_task].[XPKusd_task].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_task] ADD CONSTRAINT [XPKusd_task] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usd_volume].[XPKusd_volume].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usd_volume] ADD CONSTRAINT [XPKusd_volume] PRIMARY KEY CLUSTERED (
	[objectid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[user_acct_asset_group_matrix].[XPKuser_acct_asset_group_matrix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[user_acct_asset_group_matrix] ADD CONSTRAINT [XPKuser_acct_asset_group_matrix] PRIMARY KEY CLUSTERED (
	[user_account_asset_group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[user_preferences].[XPKuser_preferences].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[user_preferences] ADD CONSTRAINT [XPKuser_preferences] PRIMARY KEY CLUSTERED (
	[preference_userid] ASC,
	[preference_type] ASC,
	[product_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[user_roles].[$user__u000041e600000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[user_roles] ADD CONSTRAINT [$user__u000041e600000000] PRIMARY KEY CLUSTERED (
	[productid] ASC,
	[user_name] ASC,
	[role_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[users].[$users_u000041ea00000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[users] ADD CONSTRAINT [$users_u000041ea00000000] PRIMARY KEY CLUSTERED (
	[productid] ASC,
	[user_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_account].[XPKusm_account].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_account] ADD CONSTRAINT [XPKusm_account] PRIMARY KEY CLUSTERED (
	[account_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_account_app_user].[XPKusm_account_app_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_account_app_user] ADD CONSTRAINT [XPKusm_account_app_user] PRIMARY KEY CLUSTERED (
	[app_user_id] ASC,
	[account_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_account_domain].[XPKusm_account_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_account_domain] ADD CONSTRAINT [XPKusm_account_domain] PRIMARY KEY CLUSTERED (
	[account_no] ASC,
	[path] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_acl].[XPKusm_acl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [XPKusm_acl] PRIMARY KEY CLUSTERED (
	[acl_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_adjustment].[XPKusm_adjustment].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_adjustment] ADD CONSTRAINT [XPKusm_adjustment] PRIMARY KEY CLUSTERED (
	[adjustment_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_analysis].[XPKusm_analysis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_analysis] ADD CONSTRAINT [XPKusm_analysis] PRIMARY KEY CLUSTERED (
	[analysis_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_analysis_layout_set].[XPKusm_analysis_layout_set].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_analysis_layout_set] ADD CONSTRAINT [XPKusm_analysis_layout_set] PRIMARY KEY CLUSTERED (
	[analysis_layout_set_id] ASC,
	[report_layout_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_analyze_export_option].[XPKusm_analyze_export_option].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_analyze_export_option] ADD CONSTRAINT [XPKusm_analyze_export_option] PRIMARY KEY CLUSTERED (
	[analyze_export_option_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_analyze_function].[XPKusm_analyze_function].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_analyze_function] ADD CONSTRAINT [XPKusm_analyze_function] PRIMARY KEY CLUSTERED (
	[analyze_function_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_analyze_job].[XPKusm_analyze_job].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_analyze_job] ADD CONSTRAINT [XPKusm_analyze_job] PRIMARY KEY CLUSTERED (
	[analyze_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_analyze_job_option].[XPKusm_analyze_job_option].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_analyze_job_option] ADD CONSTRAINT [XPKusm_analyze_job_option] PRIMARY KEY CLUSTERED (
	[analyze_job_option_id] ASC,
	[name] ASC,
	[value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_analyze_schedule].[XPKusm_analyze_schedule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_analyze_schedule] ADD CONSTRAINT [XPKusm_analyze_schedule] PRIMARY KEY CLUSTERED (
	[analyze_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_appuser].[XPKusm_appuser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_appuser] ADD CONSTRAINT [XPKusm_appuser] PRIMARY KEY CLUSTERED (
	[appuser_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_asset].[XPKusm_asset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_asset] ADD CONSTRAINT [XPKusm_asset] PRIMARY KEY CLUSTERED (
	[asset_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_attr_reference_plugin].[XPKusm_attr_reference_plugin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_attr_reference_plugin] ADD CONSTRAINT [XPKusm_attr_reference_plugin] PRIMARY KEY CLUSTERED (
	[attr_reference_plugin_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_attr_reference_plugin_attr].[XPKusm_attr_reference_plugin_attr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_attr_reference_plugin_attr] ADD CONSTRAINT [XPKusm_attr_reference_plugin_attr] PRIMARY KEY CLUSTERED (
	[attr_reference_plugin_attr_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_billing_account].[XPKusm_billing_account].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [XPKusm_billing_account] PRIMARY KEY CLUSTERED (
	[account_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_billing_group].[XPKusm_billing_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_billing_group] ADD CONSTRAINT [XPKusm_billing_group] PRIMARY KEY CLUSTERED (
	[group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_branding_template].[XPKusm_branding_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_branding_template] ADD CONSTRAINT [XPKusm_branding_template] PRIMARY KEY CLUSTERED (
	[branding_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_branding_variable].[XPKusm_branding_variable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_branding_variable] ADD CONSTRAINT [XPKusm_branding_variable] PRIMARY KEY CLUSTERED (
	[variable_id] ASC,
	[branding_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_cache].[XPKusm_cache].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_cache] ADD CONSTRAINT [XPKusm_cache] PRIMARY KEY CLUSTERED (
	[cache_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_cache_listener].[XPKusm_cache_listener].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_cache_listener] ADD CONSTRAINT [XPKusm_cache_listener] PRIMARY KEY CLUSTERED (
	[cache_id] ASC,
	[cache_listener] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_calendar].[XPKusm_calendar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_calendar] ADD CONSTRAINT [XPKusm_calendar] PRIMARY KEY CLUSTERED (
	[calendar_oid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_calendar_category].[XPKusm_calendar_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_calendar_category] ADD CONSTRAINT [XPKusm_calendar_category] PRIMARY KEY CLUSTERED (
	[calendar_category_oid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_collection_profile].[XPKusm_collection_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_collection_profile] ADD CONSTRAINT [XPKusm_collection_profile] PRIMARY KEY CLUSTERED (
	[collection_profile_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_collection_profile_attrs].[XPKusm_collection_profile_attrs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_collection_profile_attrs] ADD CONSTRAINT [XPKusm_collection_profile_attrs] PRIMARY KEY CLUSTERED (
	[collection_profile_metric_id] ASC,
	[metric_attr_spec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_collection_profile_metric].[XPKusm_collection_profile_metric].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_collection_profile_metric] ADD CONSTRAINT [XPKusm_collection_profile_metric] PRIMARY KEY CLUSTERED (
	[collection_profile_metric_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_collector].[XPKusm_collector].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_collector] ADD CONSTRAINT [XPKusm_collector] PRIMARY KEY CLUSTERED (
	[collector_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_comp_instance].[XPKusm_comp_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_comp_instance] ADD CONSTRAINT [XPKusm_comp_instance] PRIMARY KEY CLUSTERED (
	[comp_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_contact_domain].[XPKusm_contact_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_contact_domain] ADD CONSTRAINT [XPKusm_contact_domain] PRIMARY KEY CLUSTERED (
	[domain] ASC,
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_contact_domain_role].[XPKusm_contact_domain_role].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_contact_domain_role] ADD CONSTRAINT [XPKusm_contact_domain_role] PRIMARY KEY CLUSTERED (
	[domain] ASC,
	[role_id] ASC,
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_contact_extension].[XPKusm_contact_extension].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_contact_extension] ADD CONSTRAINT [XPKusm_contact_extension] PRIMARY KEY CLUSTERED (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_contract].[XPKusm_contract].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_contract] ADD CONSTRAINT [XPKusm_contract] PRIMARY KEY CLUSTERED (
	[contract_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_contract_action].[XPKusm_contract_action].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_contract_action] ADD CONSTRAINT [XPKusm_contract_action] PRIMARY KEY CLUSTERED (
	[contract_action_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_cor_data].[XPKusm_cor_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_cor_data] ADD CONSTRAINT [XPKusm_cor_data] PRIMARY KEY CLUSTERED (
	[cor_data_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_cost_pool].[XPKusm_cost_pool].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_cost_pool] ADD CONSTRAINT [XPKusm_cost_pool] PRIMARY KEY CLUSTERED (
	[cp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_cp_inclusion].[XPKusm_cp_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_cp_inclusion] ADD CONSTRAINT [XPKusm_cp_inclusion] PRIMARY KEY CLUSTERED (
	[item_id] ASC,
	[cp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_dash].[XPKusm_dash].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_dash] ADD CONSTRAINT [XPKusm_dash] PRIMARY KEY CLUSTERED (
	[dash_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_db].[XPKusm_db].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_db] ADD CONSTRAINT [XPKusm_db] PRIMARY KEY CLUSTERED (
	[db_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_default_service_hours].[XPKusm_default_service_hours].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_default_service_hours] ADD CONSTRAINT [XPKusm_default_service_hours] PRIMARY KEY CLUSTERED (
	[day_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_dependency].[XPKusm_dependency].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_dependency] ADD CONSTRAINT [XPKusm_dependency] PRIMARY KEY CLUSTERED (
	[dependency_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_doctmpl_layoutlist].[XPKusm_doctmpl_layoutlist].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_doctmpl_layoutlist] ADD CONSTRAINT [XPKusm_doctmpl_layoutlist] PRIMARY KEY CLUSTERED (
	[document_template_id] ASC,
	[order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_document_template].[XPKusm_document_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_document_template] ADD CONSTRAINT [XPKusm_document_template] PRIMARY KEY CLUSTERED (
	[document_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_dst].[XPKusm_dst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_dst] ADD CONSTRAINT [XPKusm_dst] PRIMARY KEY CLUSTERED (
	[dst_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_event_category].[XPKusm_event_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_event_category] ADD CONSTRAINT [XPKusm_event_category] PRIMARY KEY CLUSTERED (
	[event_category_oid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_event_category_value].[XPKusm_event_category_value].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_event_category_value] ADD CONSTRAINT [XPKusm_event_category_value] PRIMARY KEY CLUSTERED (
	[event_category_value_oid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_event_instance].[XPKusm_event_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_event_instance] ADD CONSTRAINT [XPKusm_event_instance] PRIMARY KEY CLUSTERED (
	[event_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_event_instance_value].[XPKusm_event_instance_value].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_event_instance_value] ADD CONSTRAINT [XPKusm_event_instance_value] PRIMARY KEY CLUSTERED (
	[event_instance_value_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_event_type].[XPKusm_event_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_event_type] ADD CONSTRAINT [XPKusm_event_type] PRIMARY KEY CLUSTERED (
	[event_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_event_type_attributes].[XPKusm_event_type_attributes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_event_type_attributes] ADD CONSTRAINT [XPKusm_event_type_attributes] PRIMARY KEY CLUSTERED (
	[event_id] ASC,
	[attr_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_event_type_collector].[XPKusm_event_type_collector].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_event_type_collector] ADD CONSTRAINT [XPKusm_event_type_collector] PRIMARY KEY CLUSTERED (
	[event_type_id] ASC,
	[collector_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_exchange_rate].[XPKusm_exchange_rate].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_exchange_rate] ADD CONSTRAINT [XPKusm_exchange_rate] PRIMARY KEY CLUSTERED (
	[currency] ASC,
	[exchange_date] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_export].[XPKusm_export].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_export] ADD CONSTRAINT [XPKusm_export] PRIMARY KEY CLUSTERED (
	[type] ASC,
	[domain] ASC,
	[filename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_exporter].[XPKusm_exporter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_exporter] ADD CONSTRAINT [XPKusm_exporter] PRIMARY KEY CLUSTERED (
	[exporter_oid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_fiscal_period].[XPKusm_fiscal_period].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_fiscal_period] ADD CONSTRAINT [XPKusm_fiscal_period] PRIMARY KEY CLUSTERED (
	[fp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_guinode].[XPKusm_guinode].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_guinode] ADD CONSTRAINT [XPKusm_guinode] PRIMARY KEY CLUSTERED (
	[guinode_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_guinode_content].[XPKusm_guinode_content].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_guinode_content] ADD CONSTRAINT [XPKusm_guinode_content] PRIMARY KEY CLUSTERED (
	[guinode_id] ASC,
	[order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_host].[XPKusm_host].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_host] ADD CONSTRAINT [XPKusm_host] PRIMARY KEY CLUSTERED (
	[host_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_host_element].[XPKusm_host_element].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_host_element] ADD CONSTRAINT [XPKusm_host_element] PRIMARY KEY CLUSTERED (
	[host_element_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_host_type].[XPKusm_host_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_host_type] ADD CONSTRAINT [XPKusm_host_type] PRIMARY KEY CLUSTERED (
	[host_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_icon].[XPKusm_icon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_icon] ADD CONSTRAINT [XPKusm_icon] PRIMARY KEY CLUSTERED (
	[icon_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_id_mapping].[XPKusm_id_mapping].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_id_mapping] ADD CONSTRAINT [XPKusm_id_mapping] PRIMARY KEY CLUSTERED (
	[domain] ASC,
	[system_id] ASC,
	[object_id] ASC,
	[ican_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_id_pd].[XPKusm_id_pd].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_id_pd] ADD CONSTRAINT [XPKusm_id_pd] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_id_plan].[XPKusm_id_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_id_plan] ADD CONSTRAINT [XPKusm_id_plan] PRIMARY KEY CLUSTERED (
	[pd_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_import_attribute].[XPKusm_import_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_import_attribute] ADD CONSTRAINT [XPKusm_import_attribute] PRIMARY KEY CLUSTERED (
	[import_attribute_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_import_rule].[XPKusm_import_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_import_rule] ADD CONSTRAINT [XPKusm_import_rule] PRIMARY KEY CLUSTERED (
	[import_rule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_import_table_index].[XPKusm_import_table_index].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_import_table_index] ADD CONSTRAINT [XPKusm_import_table_index] PRIMARY KEY CLUSTERED (
	[table_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_importer].[XPKusm_importer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_importer] ADD CONSTRAINT [XPKusm_importer] PRIMARY KEY CLUSTERED (
	[importer_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_importer_instance].[XPKusm_importer_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_importer_instance] ADD CONSTRAINT [XPKusm_importer_instance] PRIMARY KEY CLUSTERED (
	[importer_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_importer_spec].[XPKusm_importer_spec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_importer_spec] ADD CONSTRAINT [XPKusm_importer_spec] PRIMARY KEY CLUSTERED (
	[importer_spec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_importer_spec_value].[XPKusm_importer_spec_value].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_importer_spec_value] ADD CONSTRAINT [XPKusm_importer_spec_value] PRIMARY KEY CLUSTERED (
	[importer_spec_id] ASC,
	[value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_install].[XPKusm_install].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_install] ADD CONSTRAINT [XPKusm_install] PRIMARY KEY CLUSTERED (
	[host_id] ASC,
	[product_code] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_installed_component].[XPKusm_installed_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_installed_component] ADD CONSTRAINT [XPKusm_installed_component] PRIMARY KEY CLUSTERED (
	[installed_component_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_installed_subcomponent].[XPKusm_installed_subcomponent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_installed_subcomponent] ADD CONSTRAINT [XPKusm_installed_subcomponent] PRIMARY KEY CLUSTERED (
	[installed_subcomponent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_invoice_history].[XPKusm_invoice_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_invoice_history] ADD CONSTRAINT [XPKusm_invoice_history] PRIMARY KEY CLUSTERED (
	[invoice_history_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_keyword].[XPKusm_keyword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_keyword] ADD CONSTRAINT [XPKusm_keyword] PRIMARY KEY CLUSTERED (
	[keyword_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_last_analysis].[XPKusm_last_analysis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_last_analysis] ADD CONSTRAINT [XPKusm_last_analysis] PRIMARY KEY CLUSTERED (
	[analyze_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_lastid].[XPKusm_lastid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_lastid] ADD CONSTRAINT [XPKusm_lastid] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_launchpad].[XPKusm_launchpad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_launchpad] ADD CONSTRAINT [XPKusm_launchpad] PRIMARY KEY CLUSTERED (
	[launchpad_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_launchpad_content].[XPKusm_launchpad_content].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_launchpad_content] ADD CONSTRAINT [XPKusm_launchpad_content] PRIMARY KEY CLUSTERED (
	[launchpad_id] ASC,
	[order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_account_user].[XPKusm_link_account_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_account_user] ADD CONSTRAINT [XPKusm_link_account_user] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[account_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_analysis_layout].[XPKusm_link_analysis_layout].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_analysis_layout] ADD CONSTRAINT [XPKusm_link_analysis_layout] PRIMARY KEY CLUSTERED (
	[report_layout_id] ASC,
	[analysis_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_analyze_func_metr_cat].[XPKusm_link_analyze_func_metr_cat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_analyze_func_metr_cat] ADD CONSTRAINT [XPKusm_link_analyze_func_metr_cat] PRIMARY KEY CLUSTERED (
	[analyze_function_id] ASC,
	[metric_category_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_analyze_job_group].[XPKusm_link_analyze_job_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_analyze_job_group] ADD CONSTRAINT [XPKusm_link_analyze_job_group] PRIMARY KEY CLUSTERED (
	[analyze_job_id] ASC,
	[report_group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_analyze_job_ticket].[XPKusm_link_analyze_job_ticket].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_analyze_job_ticket] ADD CONSTRAINT [XPKusm_link_analyze_job_ticket] PRIMARY KEY CLUSTERED (
	[service_desk_ticket_id] ASC,
	[analyze_job_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_billing_account_group].[XPKusm_link_billing_account_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_billing_account_group] ADD CONSTRAINT [XPKusm_link_billing_account_group] PRIMARY KEY CLUSTERED (
	[group_id] ASC,
	[account_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_calendar_contract].[XPKusm_link_calendar_contract].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_calendar_contract] ADD CONSTRAINT [XPKusm_link_calendar_contract] PRIMARY KEY CLUSTERED (
	[calendar_oid] ASC,
	[contract_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_contract_sla_inst].[XPKusm_link_contract_sla_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_contract_sla_inst] ADD CONSTRAINT [XPKusm_link_contract_sla_inst] PRIMARY KEY CLUSTERED (
	[contract_id] ASC,
	[sla_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_event_inst_metr_inst].[XPKusm_link_event_inst_metr_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_event_inst_metr_inst] ADD CONSTRAINT [XPKusm_link_event_inst_metr_inst] PRIMARY KEY CLUSTERED (
	[metric_instance_id] ASC,
	[event_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_event_metric_category].[XPKusm_link_event_metric_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_event_metric_category] ADD CONSTRAINT [XPKusm_link_event_metric_category] PRIMARY KEY CLUSTERED (
	[metric_category_id] ASC,
	[event_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_guinode_guinode].[XPKusm_link_guinode_guinode].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_guinode_guinode] ADD CONSTRAINT [XPKusm_link_guinode_guinode] PRIMARY KEY CLUSTERED (
	[guinode_parent_id] ASC,
	[guinode_id] ASC,
	[link_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_importer_inst_metric].[XPKusm_link_importer_inst_metric].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_importer_inst_metric] ADD CONSTRAINT [XPKusm_link_importer_inst_metric] PRIMARY KEY CLUSTERED (
	[metric_id] ASC,
	[importer_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_install_comp_subcomp].[XPKusm_link_install_comp_subcomp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_install_comp_subcomp] ADD CONSTRAINT [XPKusm_link_install_comp_subcomp] PRIMARY KEY CLUSTERED (
	[installed_subcomponent_id] ASC,
	[installed_component_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_launchpad_launchpad].[XPKusm_link_launchpad_launchpad].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_launchpad_launchpad] ADD CONSTRAINT [XPKusm_link_launchpad_launchpad] PRIMARY KEY CLUSTERED (
	[launchpad_parent_id] ASC,
	[launchpad_id] ASC,
	[link_order] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_method_method].[XPKusm_link_method_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_method_method] ADD CONSTRAINT [XPKusm_link_method_method] PRIMARY KEY CLUSTERED (
	[method_id] ASC,
	[method_parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_metric_schema_comp].[XPKusm_link_metric_schema_comp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_metric_schema_comp] ADD CONSTRAINT [XPKusm_link_metric_schema_comp] PRIMARY KEY CLUSTERED (
	[metric_id] ASC,
	[schema_comp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_metric_scope].[XPKusm_link_metric_scope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_metric_scope] ADD CONSTRAINT [XPKusm_link_metric_scope] PRIMARY KEY CLUSTERED (
	[link_metric_scope_id] ASC,
	[metric_category_id] ASC,
	[scope_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_mr_import_event_inst].[XPKusm_link_mr_import_event_inst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_mr_import_event_inst] ADD CONSTRAINT [XPKusm_link_mr_import_event_inst] PRIMARY KEY CLUSTERED (
	[import_id] ASC,
	[event_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_object_keyword].[XPKusm_link_object_keyword].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_object_keyword] ADD CONSTRAINT [XPKusm_link_object_keyword] PRIMARY KEY CLUSTERED (
	[object_type] ASC,
	[object_id] ASC,
	[keyword_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_plugin_plugintype].[XPKusm_link_plugin_plugintype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_plugin_plugintype] ADD CONSTRAINT [XPKusm_link_plugin_plugintype] PRIMARY KEY CLUSTERED (
	[plugin_type_id] ASC,
	[plugin_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_profile_hosts].[XPKusm_link_profile_hosts].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_profile_hosts] ADD CONSTRAINT [XPKusm_link_profile_hosts] PRIMARY KEY CLUSTERED (
	[collection_profile_id] ASC,
	[target_host_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_report_variable_data].[XPKusm_link_report_variable_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_report_variable_data] ADD CONSTRAINT [XPKusm_link_report_variable_data] PRIMARY KEY CLUSTERED (
	[report_data_id] ASC,
	[report_variable_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_resource_outage].[XPKusm_link_resource_outage].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_resource_outage] ADD CONSTRAINT [XPKusm_link_resource_outage] PRIMARY KEY CLUSTERED (
	[calendar_oid] ASC,
	[host_id] ASC,
	[sla_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_rtapp_account].[XPKusm_link_rtapp_account].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_rtapp_account] ADD CONSTRAINT [XPKusm_link_rtapp_account] PRIMARY KEY CLUSTERED (
	[account_id] ASC,
	[runtime_application_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_schema_component].[XPKusm_link_schema_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_schema_component] ADD CONSTRAINT [XPKusm_link_schema_component] PRIMARY KEY CLUSTERED (
	[smcomponent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_schema_inst_metr_cat].[XPKusm_link_schema_inst_metr_cat].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_schema_inst_metr_cat] ADD CONSTRAINT [XPKusm_link_schema_inst_metr_cat] PRIMARY KEY CLUSTERED (
	[schema_instance_id] ASC,
	[metric_category_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_schema_metr_category].[XPKusm_link_schema_metr_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_schema_metr_category] ADD CONSTRAINT [XPKusm_link_schema_metr_category] PRIMARY KEY CLUSTERED (
	[metric_category_id] ASC,
	[schema_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_schema_slo_template].[XPKusm_link_schema_slo_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_schema_slo_template] ADD CONSTRAINT [XPKusm_link_schema_slo_template] PRIMARY KEY CLUSTERED (
	[schema_id] ASC,
	[slo_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_scope_layout].[XPKusm_link_scope_layout].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_scope_layout] ADD CONSTRAINT [XPKusm_link_scope_layout] PRIMARY KEY CLUSTERED (
	[scope_id] ASC,
	[report_layout_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_server_systeminstall].[XPKusm_link_server_systeminstall].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_server_systeminstall] ADD CONSTRAINT [XPKusm_link_server_systeminstall] PRIMARY KEY CLUSTERED (
	[server_id] ASC,
	[system_install_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_service_event].[XPKusm_link_service_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_service_event] ADD CONSTRAINT [XPKusm_link_service_event] PRIMARY KEY CLUSTERED (
	[calendar_oid] ASC,
	[contract_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_service_event_metr_in].[XPKusm_link_service_event_metr_in].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_service_event_metr_in] ADD CONSTRAINT [XPKusm_link_service_event_metr_in] PRIMARY KEY CLUSTERED (
	[service_event_id] ASC,
	[metric_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_service_event_ticket].[XPKusm_link_service_event_ticket].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_service_event_ticket] ADD CONSTRAINT [XPKusm_link_service_event_ticket] PRIMARY KEY CLUSTERED (
	[service_desk_ticket_id] ASC,
	[service_event_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_slo_instance_instance].[XPKusm_link_slo_instance_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_slo_instance_instance] ADD CONSTRAINT [XPKusm_link_slo_instance_instance] PRIMARY KEY CLUSTERED (
	[slo_instance_parent_id] ASC,
	[slo_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_slo_package_template].[XPKusm_link_slo_package_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_slo_package_template] ADD CONSTRAINT [XPKusm_link_slo_package_template] PRIMARY KEY CLUSTERED (
	[slo_package_id] ASC,
	[slo_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_slo_template_template].[XPKusm_link_slo_template_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] ADD CONSTRAINT [XPKusm_link_slo_template_template] PRIMARY KEY CLUSTERED (
	[slo_template_id] ASC,
	[slo_template_parent_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_subscription_asset].[XPKusm_link_subscription_asset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] ADD CONSTRAINT [XPKusm_link_subscription_asset] PRIMARY KEY CLUSTERED (
	[request_id] ASC,
	[request_item_id] ASC,
	[asset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_link_sysinstall_installcom].[XPKusm_link_sysinstall_installcom].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_link_sysinstall_installcom] ADD CONSTRAINT [XPKusm_link_sysinstall_installcom] PRIMARY KEY CLUSTERED (
	[installed_component_id] ASC,
	[system_install_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_meter_gui_cfg].[XPKusm_meter_gui_cfg].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_meter_gui_cfg] ADD CONSTRAINT [XPKusm_meter_gui_cfg] PRIMARY KEY CLUSTERED (
	[meter_gui_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metering_package].[XPKusm_metering_package].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metering_package] ADD CONSTRAINT [XPKusm_metering_package] PRIMARY KEY CLUSTERED (
	[metering_package_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_method].[XPKusm_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_method] ADD CONSTRAINT [XPKusm_method] PRIMARY KEY CLUSTERED (
	[method_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_method_input].[XPKusm_method_input].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_method_input] ADD CONSTRAINT [XPKusm_method_input] PRIMARY KEY CLUSTERED (
	[method_id] ASC,
	[input] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_method_optional_input].[XPKusm_method_optional_input].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_method_optional_input] ADD CONSTRAINT [XPKusm_method_optional_input] PRIMARY KEY CLUSTERED (
	[method_id] ASC,
	[optional_input] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric].[XPKusm_metric].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric] ADD CONSTRAINT [XPKusm_metric] PRIMARY KEY CLUSTERED (
	[metric_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_analyzer].[XPKusm_metric_analyzer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric_analyzer] ADD CONSTRAINT [XPKusm_metric_analyzer] PRIMARY KEY CLUSTERED (
	[metric_analyzer_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_analyzer_attrs].[XPKusm_metric_analyzer_attrs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric_analyzer_attrs] ADD CONSTRAINT [XPKusm_metric_analyzer_attrs] PRIMARY KEY CLUSTERED (
	[metric_analyzer_id] ASC,
	[attr_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_attr_spec].[XPKusm_metric_attr_spec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric_attr_spec] ADD CONSTRAINT [XPKusm_metric_attr_spec] PRIMARY KEY CLUSTERED (
	[metric_attr_spec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_attr_spec_value].[XPKusm_metric_attr_spec_value].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric_attr_spec_value] ADD CONSTRAINT [XPKusm_metric_attr_spec_value] PRIMARY KEY CLUSTERED (
	[metric_attr_spec_value_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_attr_value].[XPKusm_metric_attr_value].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric_attr_value] ADD CONSTRAINT [XPKusm_metric_attr_value] PRIMARY KEY CLUSTERED (
	[metric_attribute_value_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_category].[XPKusm_metric_category].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric_category] ADD CONSTRAINT [XPKusm_metric_category] PRIMARY KEY CLUSTERED (
	[metric_category_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_folder].[XPKusm_metric_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric_folder] ADD CONSTRAINT [XPKusm_metric_folder] PRIMARY KEY CLUSTERED (
	[metric_folder_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_metric_instance].[XPKusm_metric_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_metric_instance] ADD CONSTRAINT [XPKusm_metric_instance] PRIMARY KEY CLUSTERED (
	[metric_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_ievent_metric].[XPKusm_mr_ievent_metric].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_ievent_metric] ADD CONSTRAINT [XPKusm_mr_ievent_metric] PRIMARY KEY CLUSTERED (
	[event_id] ASC,
	[metric_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_ifield].[XPKusm_mr_ifield].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_ifield] ADD CONSTRAINT [XPKusm_mr_ifield] PRIMARY KEY CLUSTERED (
	[field_id] ASC,
	[table_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_ifile].[XPKusm_mr_ifile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_ifile] ADD CONSTRAINT [XPKusm_mr_ifile] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_iftype].[XPKusm_mr_iftype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_iftype] ADD CONSTRAINT [XPKusm_mr_iftype] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_import].[XPKusm_mr_import].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_import] ADD CONSTRAINT [XPKusm_mr_import] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_isystem].[XPKusm_mr_isystem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_isystem] ADD CONSTRAINT [XPKusm_mr_isystem] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_itable].[XPKusm_mr_itable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_itable] ADD CONSTRAINT [XPKusm_mr_itable] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_itrend].[XPKusm_mr_itrend].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_itrend] ADD CONSTRAINT [XPKusm_mr_itrend] PRIMARY KEY CLUSTERED (
	[metric_id] ASC,
	[service_code] ASC,
	[sm_start_time] ASC,
	[sm_end_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_mr_ivalue].[XPKusm_mr_ivalue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_mr_ivalue] ADD CONSTRAINT [XPKusm_mr_ivalue] PRIMARY KEY CLUSTERED (
	[file_id] ASC,
	[ftype_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_news].[XPKusm_news].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_news] ADD CONSTRAINT [XPKusm_news] PRIMARY KEY CLUSTERED (
	[news_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_note].[XPKusm_note].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_note] ADD CONSTRAINT [XPKusm_note] PRIMARY KEY CLUSTERED (
	[notes_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_numeric_policy].[XPKusm_numeric_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_numeric_policy] ADD CONSTRAINT [XPKusm_numeric_policy] PRIMARY KEY CLUSTERED (
	[policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_object_wf_instance_ref].[XPKusm_object_wf_instance_ref].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_object_wf_instance_ref] ADD CONSTRAINT [XPKusm_object_wf_instance_ref] PRIMARY KEY CLUSTERED (
	[object_workflow_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering].[XPKusm_offering].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_offering] ADD CONSTRAINT [XPKusm_offering] PRIMARY KEY CLUSTERED (
	[offering_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering_ratedef_inclusion].[XPKusm_offering_ratedef_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] ADD CONSTRAINT [XPKusm_offering_ratedef_inclusion] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_offering_rplan_inclusion].[XPKusm_offering_rplan_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_offering_rplan_inclusion] ADD CONSTRAINT [XPKusm_offering_rplan_inclusion] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_onetime_event].[XPKusm_onetime_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_onetime_event] ADD CONSTRAINT [XPKusm_onetime_event] PRIMARY KEY CLUSTERED (
	[onetime_event_oid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_pattern_type].[XPKusm_pattern_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_pattern_type] ADD CONSTRAINT [XPKusm_pattern_type] PRIMARY KEY CLUSTERED (
	[pattern_type_oid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_payment_method].[XPKusm_payment_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_payment_method] ADD CONSTRAINT [XPKusm_payment_method] PRIMARY KEY CLUSTERED (
	[account_no] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_plan].[XPKusm_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_plan] ADD CONSTRAINT [XPKusm_plan] PRIMARY KEY CLUSTERED (
	[pd_id] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_plan_data].[XPKusm_plan_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_plan_data] ADD CONSTRAINT [XPKusm_plan_data] PRIMARY KEY CLUSTERED (
	[fp_id] ASC,
	[ps_id] ASC,
	[cp_id] ASC,
	[item_id] ASC,
	[type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_plan_def].[XPKusm_plan_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_plan_def] ADD CONSTRAINT [XPKusm_plan_def] PRIMARY KEY CLUSTERED (
	[pd_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_plan_set].[XPKusm_plan_set].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_plan_set] ADD CONSTRAINT [XPKusm_plan_set] PRIMARY KEY CLUSTERED (
	[set_domain] ASC,
	[set_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_planning_set].[XPKusm_planning_set].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_planning_set] ADD CONSTRAINT [XPKusm_planning_set] PRIMARY KEY CLUSTERED (
	[ps_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_plugin].[XPKusm_plugin].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_plugin] ADD CONSTRAINT [XPKusm_plugin] PRIMARY KEY CLUSTERED (
	[plugin_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_plugin_type].[XPKusm_plugin_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_plugin_type] ADD CONSTRAINT [XPKusm_plugin_type] PRIMARY KEY CLUSTERED (
	[plugin_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_portal_content].[XPKusm_portal_content].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_portal_content] ADD CONSTRAINT [XPKusm_portal_content] PRIMARY KEY CLUSTERED (
	[portal_content_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_portal_template].[XPKusm_portal_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_portal_template] ADD CONSTRAINT [XPKusm_portal_template] PRIMARY KEY CLUSTERED (
	[portal_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_pwd_policy].[XPKusm_pwd_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_pwd_policy] ADD CONSTRAINT [XPKusm_pwd_policy] PRIMARY KEY CLUSTERED (
	[pwd_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_queue_item].[XPKusm_queue_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_queue_item] ADD CONSTRAINT [XPKusm_queue_item] PRIMARY KEY CLUSTERED (
	[queue_item_id] ASC,
	[created_time] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_queue_item_detail].[XPKusm_queue_item_detail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_queue_item_detail] ADD CONSTRAINT [XPKusm_queue_item_detail] PRIMARY KEY CLUSTERED (
	[queue_item_detail_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rate_definition].[XPKusm_rate_definition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rate_definition] ADD CONSTRAINT [XPKusm_rate_definition] PRIMARY KEY CLUSTERED (
	[item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rate_plan].[XPKusm_rate_plan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rate_plan] ADD CONSTRAINT [XPKusm_rate_plan] PRIMARY KEY CLUSTERED (
	[rate_plan_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rateplan_inclusion].[XPKusm_rateplan_inclusion].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rateplan_inclusion] ADD CONSTRAINT [XPKusm_rateplan_inclusion] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rateplan_inheritance].[XPKusm_rateplan_inheritance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rateplan_inheritance] ADD CONSTRAINT [XPKusm_rateplan_inheritance] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_recurring_event].[XPKusm_recurring_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_recurring_event] ADD CONSTRAINT [XPKusm_recurring_event] PRIMARY KEY CLUSTERED (
	[recurring_event_oid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_data].[XPKusm_report_data].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_data] ADD CONSTRAINT [XPKusm_report_data] PRIMARY KEY CLUSTERED (
	[report_data_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_dataview].[XPKusm_report_dataview].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_dataview] ADD CONSTRAINT [XPKusm_report_dataview] PRIMARY KEY CLUSTERED (
	[report_dataview_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_group].[XPKusm_report_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_group] ADD CONSTRAINT [XPKusm_report_group] PRIMARY KEY CLUSTERED (
	[report_group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_group_goal].[XPKusm_report_group_goal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_group_goal] ADD CONSTRAINT [XPKusm_report_group_goal] PRIMARY KEY CLUSTERED (
	[report_group_id] ASC,
	[service_goal_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_group_metr_instance].[XPKusm_report_group_metr_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_group_metr_instance] ADD CONSTRAINT [XPKusm_report_group_metr_instance] PRIMARY KEY CLUSTERED (
	[report_group_id] ASC,
	[metric_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_group_template].[XPKusm_report_group_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_group_template] ADD CONSTRAINT [XPKusm_report_group_template] PRIMARY KEY CLUSTERED (
	[report_group_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_layout].[XPKusm_report_layout].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_layout] ADD CONSTRAINT [XPKusm_report_layout] PRIMARY KEY CLUSTERED (
	[report_layout_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_profile].[XPKusm_report_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_profile] ADD CONSTRAINT [XPKusm_report_profile] PRIMARY KEY CLUSTERED (
	[report_profile_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_profile_spec].[XPKusm_report_profile_spec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_profile_spec] ADD CONSTRAINT [XPKusm_report_profile_spec] PRIMARY KEY CLUSTERED (
	[attribute_name] ASC,
	[section] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_report_variable].[XPKusm_report_variable].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_report_variable] ADD CONSTRAINT [XPKusm_report_variable] PRIMARY KEY CLUSTERED (
	[report_variable_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request].[XPKusm_request].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_request] ADD CONSTRAINT [XPKusm_request] PRIMARY KEY CLUSTERED (
	[request_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request_pending_action].[XPKusm_request_pending_action].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_request_pending_action] ADD CONSTRAINT [XPKusm_request_pending_action] PRIMARY KEY CLUSTERED (
	[request_pending_action_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_request_value].[XPKusm_request_value].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_request_value] ADD CONSTRAINT [XPKusm_request_value] PRIMARY KEY CLUSTERED (
	[request_id] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_role].[XPKusm_role].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_role] ADD CONSTRAINT [XPKusm_role] PRIMARY KEY CLUSTERED (
	[role_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_role_user].[XPKusm_role_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_role_user] ADD CONSTRAINT [XPKusm_role_user] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[role_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rsc_map].[XPKusm_rsc_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rsc_map] ADD CONSTRAINT [XPKusm_rsc_map] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rsc_method].[XPKusm_rsc_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rsc_method] ADD CONSTRAINT [XPKusm_rsc_method] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rsc_nmrefer].[XPKusm_rsc_nmrefer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rsc_nmrefer] ADD CONSTRAINT [XPKusm_rsc_nmrefer] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rsc_node].[XPKusm_rsc_node].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rsc_node] ADD CONSTRAINT [XPKusm_rsc_node] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rsc_parameter].[XPKusm_rsc_parameter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rsc_parameter] ADD CONSTRAINT [XPKusm_rsc_parameter] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rsc_property].[XPKusm_rsc_property].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rsc_property] ADD CONSTRAINT [XPKusm_rsc_property] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rsc_system].[XPKusm_rsc_system].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rsc_system] ADD CONSTRAINT [XPKusm_rsc_system] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rule].[XPKusm_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rule] ADD CONSTRAINT [XPKusm_rule] PRIMARY KEY CLUSTERED (
	[rule_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rule_action].[XPKusm_rule_action].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rule_action] ADD CONSTRAINT [XPKusm_rule_action] PRIMARY KEY CLUSTERED (
	[rule_action_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rule_condition].[XPKusm_rule_condition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rule_condition] ADD CONSTRAINT [XPKusm_rule_condition] PRIMARY KEY CLUSTERED (
	[rule_condition_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_rule_event_type].[XPKusm_rule_event_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_rule_event_type] ADD CONSTRAINT [XPKusm_rule_event_type] PRIMARY KEY CLUSTERED (
	[event_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_runtime_application].[XPKusm_runtime_application].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_runtime_application] ADD CONSTRAINT [XPKusm_runtime_application] PRIMARY KEY CLUSTERED (
	[runtime_application_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_runtime_component].[XPKusm_runtime_component].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_runtime_component] ADD CONSTRAINT [XPKusm_runtime_component] PRIMARY KEY CLUSTERED (
	[runtime_component_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_runtimecomp_parameter].[XPKusm_runtimecomp_parameter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_runtimecomp_parameter] ADD CONSTRAINT [XPKusm_runtimecomp_parameter] PRIMARY KEY CLUSTERED (
	[runtime_component_id] ASC,
	[runtime_parameter] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_schema].[XPKusm_schema].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_schema] ADD CONSTRAINT [XPKusm_schema] PRIMARY KEY CLUSTERED (
	[schema_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_schema_comp].[XPKusm_schema_comp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_schema_comp] ADD CONSTRAINT [XPKusm_schema_comp] PRIMARY KEY CLUSTERED (
	[schema_comp_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_schema_instance].[XPKusm_schema_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_schema_instance] ADD CONSTRAINT [XPKusm_schema_instance] PRIMARY KEY CLUSTERED (
	[schema_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_scope].[XPKusm_scope].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_scope] ADD CONSTRAINT [XPKusm_scope] PRIMARY KEY CLUSTERED (
	[scope_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_search_node].[XPKusm_search_node].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_search_node] ADD CONSTRAINT [XPKusm_search_node] PRIMARY KEY CLUSTERED (
	[search_node_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_server].[XPKusm_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_server] ADD CONSTRAINT [XPKusm_server] PRIMARY KEY CLUSTERED (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_service_desk_priority].[XPKusm_service_desk_priority].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_service_desk_priority] ADD CONSTRAINT [XPKusm_service_desk_priority] PRIMARY KEY CLUSTERED (
	[priority_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_service_desk_ticket].[XPKusm_service_desk_ticket].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_service_desk_ticket] ADD CONSTRAINT [XPKusm_service_desk_ticket] PRIMARY KEY CLUSTERED (
	[service_desk_ticket_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_service_event].[XPKusm_service_event].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_service_event] ADD CONSTRAINT [XPKusm_service_event] PRIMARY KEY CLUSTERED (
	[service_event_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_service_goal].[XPKusm_service_goal].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_service_goal] ADD CONSTRAINT [XPKusm_service_goal] PRIMARY KEY CLUSTERED (
	[service_goal_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_service_goal_values].[XPKusm_service_goal_values].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_service_goal_values] ADD CONSTRAINT [XPKusm_service_goal_values] PRIMARY KEY CLUSTERED (
	[service_goal_id] ASC,
	[value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_service_hours].[XPKusm_service_hours].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_service_hours] ADD CONSTRAINT [XPKusm_service_hours] PRIMARY KEY CLUSTERED (
	[report_group_id] ASC,
	[day_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_serviceconfig].[XPKusm_serviceconfig].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_serviceconfig] ADD CONSTRAINT [XPKusm_serviceconfig] PRIMARY KEY CLUSTERED (
	[serviceconfig_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_settlement].[XPKusm_settlement].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_settlement] ADD CONSTRAINT [XPKusm_settlement] PRIMARY KEY CLUSTERED (
	[settlement_no] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_sla_config].[XPKusm_sla_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_sla_config] ADD CONSTRAINT [XPKusm_sla_config] PRIMARY KEY CLUSTERED (
	[sla_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_sla_instance].[XPKusm_sla_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_sla_instance] ADD CONSTRAINT [XPKusm_sla_instance] PRIMARY KEY CLUSTERED (
	[sla_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_sla_metric_instance].[XPKusm_sla_metric_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] ADD CONSTRAINT [XPKusm_sla_metric_instance] PRIMARY KEY CLUSTERED (
	[sla_metric_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slm_server].[XPKusm_slm_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slm_server] ADD CONSTRAINT [XPKusm_slm_server] PRIMARY KEY CLUSTERED (
	[server_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slm_server_config].[XPKusm_slm_server_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slm_server_config] ADD CONSTRAINT [XPKusm_slm_server_config] PRIMARY KEY CLUSTERED (
	[server_config_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slm_server_status].[XPKusm_slm_server_status].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slm_server_status] ADD CONSTRAINT [XPKusm_slm_server_status] PRIMARY KEY CLUSTERED (
	[server_status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slm_server_status_type].[XPKusm_slm_server_status_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slm_server_status_type] ADD CONSTRAINT [XPKusm_slm_server_status_type] PRIMARY KEY CLUSTERED (
	[server_status_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slm_server_type].[XPKusm_slm_server_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slm_server_type] ADD CONSTRAINT [XPKusm_slm_server_type] PRIMARY KEY CLUSTERED (
	[server_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slm_server_type_spec].[XPKusm_slm_server_type_spec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slm_server_type_spec] ADD CONSTRAINT [XPKusm_slm_server_type_spec] PRIMARY KEY CLUSTERED (
	[slm_server_type_spec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slm_server_type_value].[XPKusm_slm_server_type_value].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slm_server_type_value] ADD CONSTRAINT [XPKusm_slm_server_type_value] PRIMARY KEY CLUSTERED (
	[slm_server_type_spec_id] ASC,
	[value] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slo_instance].[XPKusm_slo_instance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slo_instance] ADD CONSTRAINT [XPKusm_slo_instance] PRIMARY KEY CLUSTERED (
	[slo_instance_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slo_package].[XPKusm_slo_package].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slo_package] ADD CONSTRAINT [XPKusm_slo_package] PRIMARY KEY CLUSTERED (
	[slo_package_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slo_template].[XPKusm_slo_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slo_template] ADD CONSTRAINT [XPKusm_slo_template] PRIMARY KEY CLUSTERED (
	[slo_template_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slo_template_sla_config].[XPKusm_slo_template_sla_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slo_template_sla_config] ADD CONSTRAINT [XPKusm_slo_template_sla_config] PRIMARY KEY CLUSTERED (
	[slo_template_id] ASC,
	[sla_config_id] ASC,
	[aggregation_type] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_slo_threshold].[XPKusm_slo_threshold].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_slo_threshold] ADD CONSTRAINT [XPKusm_slo_threshold] PRIMARY KEY CLUSTERED (
	[slo_threshold_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_sm_comp].[XPKusm_sm_comp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_sm_comp] ADD CONSTRAINT [XPKusm_sm_comp] PRIMARY KEY CLUSTERED (
	[sm_request_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_snmp_config].[XPKusm_snmp_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_snmp_config] ADD CONSTRAINT [XPKusm_snmp_config] PRIMARY KEY CLUSTERED (
	[target] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_statement].[XPKusm_statement].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_statement] ADD CONSTRAINT [XPKusm_statement] PRIMARY KEY CLUSTERED (
	[statement_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_stylesheet].[XPKusm_stylesheet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_stylesheet] ADD CONSTRAINT [XPKusm_stylesheet] PRIMARY KEY CLUSTERED (
	[stylesheet_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_subscription_detail].[XPKusm_subscription_detail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_subscription_detail] ADD CONSTRAINT [XPKusm_subscription_detail] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_subscription_mgmt].[XPKusm_subscription_mgmt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_subscription_mgmt] ADD CONSTRAINT [XPKusm_subscription_mgmt] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_system_alert].[XPKusm_system_alert].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_system_alert] ADD CONSTRAINT [XPKusm_system_alert] PRIMARY KEY CLUSTERED (
	[system_alert_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_system_change].[XPKusm_system_change].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_system_change] ADD CONSTRAINT [XPKusm_system_change] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_system_change_detail].[XPKusm_system_change_detail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_system_change_detail] ADD CONSTRAINT [XPKusm_system_change_detail] PRIMARY KEY CLUSTERED (
	[id] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_system_install].[XPKusm_system_install].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_system_install] ADD CONSTRAINT [XPKusm_system_install] PRIMARY KEY CLUSTERED (
	[system_install_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_task].[XPKusm_task].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_task] ADD CONSTRAINT [XPKusm_task] PRIMARY KEY CLUSTERED (
	[task_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_tenant].[XPKusm_tenant].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_tenant] ADD CONSTRAINT [XPKusm_tenant] PRIMARY KEY CLUSTERED (
	[tenant_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_tenant_ext_ldap_conf].[XPKusm_tenant_ext_ldap_conf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_tenant_ext_ldap_conf] ADD CONSTRAINT [XPKusm_tenant_ext_ldap_conf] PRIMARY KEY CLUSTERED (
	[tenant_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_transaction].[XPKusm_transaction].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_transaction] ADD CONSTRAINT [XPKusm_transaction] PRIMARY KEY CLUSTERED (
	[account_no] ASC,
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_unittype].[XPKusm_unittype].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_unittype] ADD CONSTRAINT [XPKusm_unittype] PRIMARY KEY CLUSTERED (
	[unittype_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_user].[XPKusm_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_user] ADD CONSTRAINT [XPKusm_user] PRIMARY KEY CLUSTERED (
	[user_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_user_query_history].[XPKusm_user_query_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_user_query_history] ADD CONSTRAINT [XPKusm_user_query_history] PRIMARY KEY CLUSTERED (
	[user_id] ASC,
	[guinode_id] ASC,
	[name] ASC,
	[user_query] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_webservice].[XPKusm_webservice].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_webservice] ADD CONSTRAINT [XPKusm_webservice] PRIMARY KEY CLUSTERED (
	[webservice_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_webservice_method].[XPKusm_webservice_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_webservice_method] ADD CONSTRAINT [XPKusm_webservice_method] PRIMARY KEY CLUSTERED (
	[webservice_method_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_wmi_classes].[XPKusm_wmi_classes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_wmi_classes] ADD CONSTRAINT [XPKusm_wmi_classes] PRIMARY KEY CLUSTERED (
	[server_id] ASC,
	[class_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usm_wmi_expression].[XPKusm_wmi_expression].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usm_wmi_expression] ADD CONSTRAINT [XPKusm_wmi_expression] PRIMARY KEY CLUSTERED (
	[expression_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_contact].[XPKusp_contact].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usp_contact] ADD CONSTRAINT [XPKusp_contact] PRIMARY KEY CLUSTERED (
	[contact_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_organization].[XPKusp_organization].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usp_organization] ADD CONSTRAINT [XPKusp_organization] PRIMARY KEY CLUSTERED (
	[organization_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_owned_resource].[XPKusp_owned_resource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usp_owned_resource] ADD CONSTRAINT [XPKusp_owned_resource] PRIMARY KEY CLUSTERED (
	[owned_resource_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_preferences].[XPKusp_preferences].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usp_preferences] ADD CONSTRAINT [XPKusp_preferences] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_projex].[XPKusp_projex].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usp_projex] ADD CONSTRAINT [XPKusp_projex] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usp_properties].[XPKusp_properties].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usp_properties] ADD CONSTRAINT [XPKusp_properties] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[usq].[XPKusq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[usq] ADD CONSTRAINT [XPKusq] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[validation_method].[XPKvalidation_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[validation_method] ADD CONSTRAINT [XPKvalidation_method] PRIMARY KEY CLUSTERED (
	[validation_method_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[vuln_management_backup_config].[XPKvuln_management_backup_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[vuln_management_backup_config] ADD CONSTRAINT [XPKvuln_management_backup_config] PRIMARY KEY CLUSTERED (
	[unit_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[vuln_management_configuration].[XPKvuln_management_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[vuln_management_configuration] ADD CONSTRAINT [XPKvuln_management_configuration] PRIMARY KEY CLUSTERED (
	[unit_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[vulnerability].[XPKvulnerability].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[vulnerability] ADD CONSTRAINT [XPKvulnerability] PRIMARY KEY CLUSTERED (
	[vuln_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[vulnerability_vailidation_method].[XPKvulnerability_vailidation_method].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[vulnerability_vailidation_method] ADD CONSTRAINT [XPKvulnerability_vailidation_method] PRIMARY KEY CLUSTERED (
	[vuln_validation_rec_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[vunerability_asset_group].[XPKvunerability_asset_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[vunerability_asset_group] ADD CONSTRAINT [XPKvunerability_asset_group] PRIMARY KEY CLUSTERED (
	[asset_group_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wf].[XPKwf].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wf] ADD CONSTRAINT [XPKwf] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wf_ids].[PK__wf_ids__7E4F2F94].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wf_ids] ADD CONSTRAINT [PK__wf_ids__7E4F2F94] PRIMARY KEY CLUSTERED (
	[productid] ASC,
	[category] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wfschema].[$wfsch_u000041f100000000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wfschema] ADD CONSTRAINT [$wfsch_u000041f100000000] PRIMARY KEY CLUSTERED (
	[productid] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wftpl].[XPKwftpl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wftpl] ADD CONSTRAINT [XPKwftpl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wftpl_grp].[XPKwftpl_grp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wftpl_grp] ADD CONSTRAINT [XPKwftpl_grp] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[workbench_product].[XPKworkbench_product].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[workbench_product] ADD CONSTRAINT [XPKworkbench_product] PRIMARY KEY CLUSTERED (
	[product_code] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_accesszone].[XPKwsm_accesszone].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_accesszone] ADD CONSTRAINT [XPKwsm_accesszone] PRIMARY KEY CLUSTERED (
	[accesszone_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_accesszone_gui_attrib].[XPKwsm_accesszone_gui_attrib].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_accesszone_gui_attrib] ADD CONSTRAINT [XPKwsm_accesszone_gui_attrib] PRIMARY KEY CLUSTERED (
	[accesszone_uuid] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_advanced_psk].[XPKwsm_advanced_psk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_advanced_psk] ADD CONSTRAINT [XPKwsm_advanced_psk] PRIMARY KEY CLUSTERED (
	[advanced_psk_sched_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_advanced_wep].[XPKwsm_advanced_wep].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_advanced_wep] ADD CONSTRAINT [XPKwsm_advanced_wep] PRIMARY KEY CLUSTERED (
	[advanced_wep_sched_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_agent].[XPKwsm_agent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_agent] ADD CONSTRAINT [XPKwsm_agent] PRIMARY KEY CLUSTERED (
	[agent_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_attribute_type].[XPKwsm_attribute_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_attribute_type] ADD CONSTRAINT [XPKwsm_attribute_type] PRIMARY KEY CLUSTERED (
	[attribute_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_certificate_store].[XPKwsm_certificate_store].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_certificate_store] ADD CONSTRAINT [XPKwsm_certificate_store] PRIMARY KEY CLUSTERED (
	[certificate_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configprofile_type].[XPKwsm_configprofile_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_configprofile_type] ADD CONSTRAINT [XPKwsm_configprofile_type] PRIMARY KEY CLUSTERED (
	[config_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_history].[XPKwsm_configuration_history].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_configuration_history] ADD CONSTRAINT [XPKwsm_configuration_history] PRIMARY KEY CLUSTERED (
	[index] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_item].[XPKwsm_configuration_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_configuration_item] ADD CONSTRAINT [XPKwsm_configuration_item] PRIMARY KEY CLUSTERED (
	[config_item_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_object].[XPKwsm_configuration_object].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_configuration_object] ADD CONSTRAINT [XPKwsm_configuration_object] PRIMARY KEY CLUSTERED (
	[config_object_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_configuration_profile].[XPKwsm_configuration_profile].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_configuration_profile] ADD CONSTRAINT [XPKwsm_configuration_profile] PRIMARY KEY CLUSTERED (
	[config_profile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_datamgmt_policy].[XPKwsm_datamgmt_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_datamgmt_policy] ADD CONSTRAINT [XPKwsm_datamgmt_policy] PRIMARY KEY CLUSTERED (
	[wsm_entity] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_day].[XPKwsm_dc_day].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_dc_day] ADD CONSTRAINT [XPKwsm_dc_day] PRIMARY KEY CLUSTERED (
	[day_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_resource].[XPKwsm_dc_resource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_dc_resource] ADD CONSTRAINT [XPKwsm_dc_resource] PRIMARY KEY CLUSTERED (
	[res_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_dc_time].[XPKwsm_dc_time].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_dc_time] ADD CONSTRAINT [XPKwsm_dc_time] PRIMARY KEY CLUSTERED (
	[time_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device].[XPKwsm_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_device] ADD CONSTRAINT [XPKwsm_device] PRIMARY KEY CLUSTERED (
	[device_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_attrib_def].[XPKwsm_device_attrib_def].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_device_attrib_def] ADD CONSTRAINT [XPKwsm_device_attrib_def] PRIMARY KEY CLUSTERED (
	[attribute_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_attribute].[XPKwsm_device_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_device_attribute] ADD CONSTRAINT [XPKwsm_device_attribute] PRIMARY KEY CLUSTERED (
	[device_id] ASC,
	[attribute_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_gui_attributes].[XPKwsm_device_gui_attributes].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_device_gui_attributes] ADD CONSTRAINT [XPKwsm_device_gui_attributes] PRIMARY KEY CLUSTERED (
	[device_id] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_relationship].[XPKwsm_device_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_device_relationship] ADD CONSTRAINT [XPKwsm_device_relationship] PRIMARY KEY CLUSTERED (
	[device_id_sidea] ASC,
	[device_id_sideb] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_device_type].[XPKwsm_device_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_device_type] ADD CONSTRAINT [XPKwsm_device_type] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_engine].[XPKwsm_engine].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_engine] ADD CONSTRAINT [XPKwsm_engine] PRIMARY KEY CLUSTERED (
	[manager_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_event_definitions].[XPKwsm_event_definitions].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_event_definitions] ADD CONSTRAINT [XPKwsm_event_definitions] PRIMARY KEY CLUSTERED (
	[eventdefinition_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_events].[XPKwsm_events].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_events] ADD CONSTRAINT [XPKwsm_events] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_firmware_definition].[xpkwsm_firmware].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_firmware_definition] ADD CONSTRAINT [xpkwsm_firmware] PRIMARY KEY CLUSTERED (
	[firmware_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_global_gui_configuration].[xpkwsm_global_gui_config].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_global_gui_configuration] ADD CONSTRAINT [xpkwsm_global_gui_config] PRIMARY KEY CLUSTERED (
	[manager_uuid] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_icon_group].[XPKwsm_icon_group].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_icon_group] ADD CONSTRAINT [XPKwsm_icon_group] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_image].[XPKwsm_image].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_image] ADD CONSTRAINT [XPKwsm_image] PRIMARY KEY CLUSTERED (
	[image_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_intrusion_rules].[XPKwsm_intrusion_rules].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_intrusion_rules] ADD CONSTRAINT [XPKwsm_intrusion_rules] PRIMARY KEY CLUSTERED (
	[intrusion_ruleset_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_level].[XPKwsm_level].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_level] ADD CONSTRAINT [XPKwsm_level] PRIMARY KEY CLUSTERED (
	[level_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_attribdef_to_model].[XPKwsm_link_attribdef_to_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_attribdef_to_model] ADD CONSTRAINT [XPKwsm_link_attribdef_to_model] PRIMARY KEY CLUSTERED (
	[attribute_id] ASC,
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_config_to_device].[XPKwsm_link_config_to_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_config_to_device] ADD CONSTRAINT [XPKwsm_link_config_to_device] PRIMARY KEY CLUSTERED (
	[device_id] ASC,
	[config_profile_uuid] ASC,
	[version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_firmware_def_to_model].[xpkwsm_link_firmware_def_to_mo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_firmware_def_to_model] ADD CONSTRAINT [xpkwsm_link_firmware_def_to_mo] PRIMARY KEY CLUSTERED (
	[model_uuid] ASC,
	[firmware_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_firmware_to_device].[XPKwsm_link_firmware_to_device].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_firmware_to_device] ADD CONSTRAINT [XPKwsm_link_firmware_to_device] PRIMARY KEY CLUSTERED (
	[firmware_uuid] ASC,
	[device_id] ASC,
	[version] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_icongrp_to_model].[XPKwsm_link_icongrp_to_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_icongrp_to_model] ADD CONSTRAINT [XPKwsm_link_icongrp_to_model] PRIMARY KEY CLUSTERED (
	[icongroup_uuid] ASC,
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_model_method_tmplate].[xpkwsm_link_model_method_tmpla].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_model_method_tmplate] ADD CONSTRAINT [xpkwsm_link_model_method_tmpla] PRIMARY KEY CLUSTERED (
	[model_method_uuid] ASC,
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_model_to_template].[XPKwsm_link_model_to_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_model_to_template] ADD CONSTRAINT [XPKwsm_link_model_to_template] PRIMARY KEY CLUSTERED (
	[templateuuid] ASC,
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_policy_to_policy].[XPKwsm_link_policy_to_policy].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_policy_to_policy] ADD CONSTRAINT [XPKwsm_link_policy_to_policy] PRIMARY KEY CLUSTERED (
	[policy_uuid] ASC,
	[assoc_policy_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_frmware].[xpkwsm_link_rsrc_bundle_frmwar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_frmware] ADD CONSTRAINT [xpkwsm_link_rsrc_bundle_frmwar] PRIMARY KEY CLUSTERED (
	[bundleid] ASC,
	[firmware_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_tmplt].[XPKwsm_link_rsrc_bundle_tmplt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_tmplt] ADD CONSTRAINT [XPKwsm_link_rsrc_bundle_tmplt] PRIMARY KEY CLUSTERED (
	[bundleid] ASC,
	[templateuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_location].[XPKwsm_location].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_location] ADD CONSTRAINT [XPKwsm_location] PRIMARY KEY CLUSTERED (
	[location_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model].[xpkwsm_supported_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_model] ADD CONSTRAINT [xpkwsm_supported_model] PRIMARY KEY CLUSTERED (
	[model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model_method_template].[XPKwsm_model_method_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_model_method_template] ADD CONSTRAINT [XPKwsm_model_method_template] PRIMARY KEY CLUSTERED (
	[model_method_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_model_relationship].[XPKwsm_model_relationship].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_model_relationship] ADD CONSTRAINT [XPKwsm_model_relationship] PRIMARY KEY CLUSTERED (
	[model_uuid_aside] ASC,
	[model_uuid_bside] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_policy_detail].[XPKwsm_policy_detail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_policy_detail] ADD CONSTRAINT [XPKwsm_policy_detail] PRIMARY KEY CLUSTERED (
	[policy_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_profile_schedule].[XPKwsm_profile_schedule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_profile_schedule] ADD CONSTRAINT [XPKwsm_profile_schedule] PRIMARY KEY CLUSTERED (
	[sched_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_propogation_model].[XPKwsm_propogation_model].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_propogation_model] ADD CONSTRAINT [XPKwsm_propogation_model] PRIMARY KEY CLUSTERED (
	[propogation_model_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_propogation_model_ext].[XPKwsm_propogation_model_ext].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_propogation_model_ext] ADD CONSTRAINT [XPKwsm_propogation_model_ext] PRIMARY KEY CLUSTERED (
	[propogation_model_uuid] ASC,
	[attribname] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_provisioning].[XPKwsm_provisioning].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_provisioning] ADD CONSTRAINT [XPKwsm_provisioning] PRIMARY KEY CLUSTERED (
	[user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_relationship_attrib].[XPKwsm_relationship_attrib].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_relationship_attrib] ADD CONSTRAINT [XPKwsm_relationship_attrib] PRIMARY KEY CLUSTERED (
	[device_id_sidea] ASC,
	[device_id_sideb] ASC,
	[attribute_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_resource_bundle].[XPKwsm_resource_bundle].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_resource_bundle] ADD CONSTRAINT [XPKwsm_resource_bundle] PRIMARY KEY CLUSTERED (
	[bundleid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_rule].[XPKwsm_rule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_rule] ADD CONSTRAINT [XPKwsm_rule] PRIMARY KEY CLUSTERED (
	[rule_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_status_definition].[XPKwsm_status_definition].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_status_definition] ADD CONSTRAINT [XPKwsm_status_definition] PRIMARY KEY CLUSTERED (
	[status_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_subnets].[xpkwsm_assigned_subnets].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_subnets] ADD CONSTRAINT [xpkwsm_assigned_subnets] PRIMARY KEY CLUSTERED (
	[subnet_address] ASC,
	[subnet_mask] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_task_attribute].[XPKwsm_task_attribute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_task_attribute] ADD CONSTRAINT [XPKwsm_task_attribute] PRIMARY KEY CLUSTERED (
	[manager_uuid] ASC,
	[taskid] ASC,
	[attributename] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_task_list].[XPKwsm_task_list].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_task_list] ADD CONSTRAINT [XPKwsm_task_list] PRIMARY KEY CLUSTERED (
	[manager_uuid] ASC,
	[taskid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_task_schedule].[XPKwsm_task_schedule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_task_schedule] ADD CONSTRAINT [XPKwsm_task_schedule] PRIMARY KEY CLUSTERED (
	[task_sched_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_template].[XPKwsm_template].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_template] ADD CONSTRAINT [XPKwsm_template] PRIMARY KEY CLUSTERED (
	[templateuuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_template_type].[XPKwsm_template_type].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_template_type] ADD CONSTRAINT [XPKwsm_template_type] PRIMARY KEY CLUSTERED (
	[template_type_id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user].[XPKwsm_user].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_user] ADD CONSTRAINT [XPKwsm_user] PRIMARY KEY CLUSTERED (
	[user_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user_gui_config_item].[XPKwsm_user_gui_config_item].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_user_gui_config_item] ADD CONSTRAINT [XPKwsm_user_gui_config_item] PRIMARY KEY CLUSTERED (
	[config_uuid] ASC,
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_user_gui_configuration].[XPKwsm_user_gui_configuration].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_user_gui_configuration] ADD CONSTRAINT [XPKwsm_user_gui_configuration] PRIMARY KEY CLUSTERED (
	[config_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[xpkwsm_userprofile_assoc_detai].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] ADD CONSTRAINT [xpkwsm_userprofile_assoc_detai] PRIMARY KEY CLUSTERED (
	[policy_uuid] ASC,
	[userprofile_uuid] ASC,
	[rule_uuid] ASC,
	[sched_uuid] ASC,
	[policytype] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsm_userprofile_detail].[XPKwsm_userprofile_detail].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsm_userprofile_detail] ADD CONSTRAINT [XPKwsm_userprofile_detail] PRIMARY KEY CLUSTERED (
	[userprofile_uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wspcol].[XPKwspcol].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wspcol] ADD CONSTRAINT [XPKwspcol] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wsptbl].[XPKwsptbl].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wsptbl] ADD CONSTRAINT [XPKwsptbl] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wt_3com].[XPKwt_3com].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wt_3com] ADD CONSTRAINT [XPKwt_3com] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wt_3com_access_point].[XPKwt_3com_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wt_3com_access_point] ADD CONSTRAINT [XPKwt_3com_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtaccess_point].[XPKwtaccess_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtaccess_point] ADD CONSTRAINT [XPKwtaccess_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtaccesspointreference].[XPKwtaccesspointreference].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtaccesspointreference] ADD CONSTRAINT [XPKwtaccesspointreference] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtaccessstax].[XPKwtaccessstax].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtaccessstax] ADD CONSTRAINT [XPKwtaccessstax] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtadhoc_access_point].[XPKwtadhoc_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtadhoc_access_point] ADD CONSTRAINT [XPKwtadhoc_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtagent].[XPKwtagent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtagent] ADD CONSTRAINT [XPKwtagent] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanoatmif].[XPKwtanoatmif].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtanoatmif] ADD CONSTRAINT [XPKwtanoatmif] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanoatmlink].[XPKwtanoatmlink].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtanoatmlink] ADD CONSTRAINT [XPKwtanoatmlink] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanodevice].[XPKwtanodevice].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtanodevice] ADD CONSTRAINT [XPKwtanodevice] PRIMARY KEY CLUSTERED (
	[address] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanodscagent].[XPKwtanodscagent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtanodscagent] ADD CONSTRAINT [XPKwtanodscagent] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanofroif].[XPKwtanofroif].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtanofroif] ADD CONSTRAINT [XPKwtanofroif] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtanointerface].[XPKwtanointerface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtanointerface] ADD CONSTRAINT [XPKwtanointerface] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtapc_ups].[XPKwtapc_ups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtapc_ups] ADD CONSTRAINT [XPKwtapc_ups] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtas400].[XPKwtas400].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtas400] ADD CONSTRAINT [XPKwtas400] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtasante].[XPKwtasante].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtasante] ADD CONSTRAINT [XPKwtasante] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtatm].[XPKwtatm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtatm] ADD CONSTRAINT [XPKwtatm] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtatm_interface].[XPKwtatm_interface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtatm_interface] ADD CONSTRAINT [XPKwtatm_interface] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtatm_link].[XPKwtatm_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtatm_link] ADD CONSTRAINT [XPKwtatm_link] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtavayaaccesspoint].[XPKwtavayaaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtavayaaccesspoint] ADD CONSTRAINT [XPKwtavayaaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbattery].[XPKwtbattery].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbattery] ADD CONSTRAINT [XPKwtbattery] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbaybridge].[XPKwtbaybridge].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbaybridge] ADD CONSTRAINT [XPKwtbaybridge] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbayhub].[XPKwtbayhub].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbayhub] ADD CONSTRAINT [XPKwtbayhub] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbelkinaccesspoint].[XPKwtbelkinaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbelkinaccesspoint] ADD CONSTRAINT [XPKwtbelkinaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbgp_link].[XPKwtbgp_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbgp_link] ADD CONSTRAINT [XPKwtbgp_link] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbillboard].[XPKwtbillboard].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbillboard] ADD CONSTRAINT [XPKwtbillboard] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbreezecomaccesspoint].[XPKwtbreezecomaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbreezecomaccesspoint] ADD CONSTRAINT [XPKwtbreezecomaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbridge].[XPKwtbridge].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbridge] ADD CONSTRAINT [XPKwtbridge] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbuffalo_access_point].[XPKwtbuffalo_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbuffalo_access_point] ADD CONSTRAINT [XPKwtbuffalo_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbull].[XPKwtbull].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbull] ADD CONSTRAINT [XPKwtbull] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtbus].[XPKwtbus].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtbus] ADD CONSTRAINT [XPKwtbus] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcabletron].[XPKwtcabletron].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcabletron] ADD CONSTRAINT [XPKwtcabletron] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_cpu].[XPKwtcacmo_cpu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_cpu] ADD CONSTRAINT [XPKwtcacmo_cpu] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_mem].[XPKwtcacmo_mem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_mem] ADD CONSTRAINT [XPKwtcacmo_mem] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_msclusterservice].[XPKwtcacmo_msclusterservice].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_msclusterservice] ADD CONSTRAINT [XPKwtcacmo_msclusterservice] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_mscshost].[XPKwtcacmo_mscshost].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_mscshost] ADD CONSTRAINT [XPKwtcacmo_mscshost] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_mscsquorum].[XPKwtcacmo_mscsquorum].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_mscsquorum] ADD CONSTRAINT [XPKwtcacmo_mscsquorum] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_mscsresource].[XPKwtcacmo_mscsresource].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_mscsresource] ADD CONSTRAINT [XPKwtcacmo_mscsresource] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_mscsresourcegroup].[XPKwtcacmo_mscsresourcegroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_mscsresourcegroup] ADD CONSTRAINT [XPKwtcacmo_mscsresourcegroup] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_redhatcluhost].[XPKwtcacmo_redhatcluhost].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_redhatcluhost] ADD CONSTRAINT [XPKwtcacmo_redhatcluhost] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_redhatclumanager].[XPKwtcacmo_redhatclumanager].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_redhatclumanager] ADD CONSTRAINT [XPKwtcacmo_redhatclumanager] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcacmo_redhatcluser].[XPKwtcacmo_redhatcluser].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcacmo_redhatcluser] ADD CONSTRAINT [XPKwtcacmo_redhatcluser] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcamera_3d].[XPKwtcamera_3d].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcamera_3d] ADD CONSTRAINT [XPKwtcamera_3d] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtchargeback].[XPKwtchargeback].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtchargeback] ADD CONSTRAINT [XPKwtchargeback] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtchassis].[XPKwtchassis].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtchassis] ADD CONSTRAINT [XPKwtchassis] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtchipcom].[XPKwtchipcom].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtchipcom] ADD CONSTRAINT [XPKwtchipcom] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcisco].[XPKwtcisco].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcisco] ADD CONSTRAINT [XPKwtcisco] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcisco_aironet1100_access_point].[XPKwtcisco_aironet1100_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcisco_aironet1100_access_point] ADD CONSTRAINT [XPKwtcisco_aironet1100_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcisco_aironet1200_access_point].[XPKwtcisco_aironet1200_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcisco_aironet1200_access_point] ADD CONSTRAINT [XPKwtcisco_aironet1200_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcisco_aironet340_access_point].[XPKwtcisco_aironet340_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcisco_aironet340_access_point] ADD CONSTRAINT [XPKwtcisco_aironet340_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcisco_aironet350_access_point].[XPKwtcisco_aironet350_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcisco_aironet350_access_point] ADD CONSTRAINT [XPKwtcisco_aironet350_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcmutek].[XPKwtcmutek].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcmutek] ADD CONSTRAINT [XPKwtcmutek] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcompaq_access_point].[XPKwtcompaq_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcompaq_access_point] ADD CONSTRAINT [XPKwtcompaq_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtcontextmenu].[XPKwtcontextmenu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtcontextmenu] ADD CONSTRAINT [XPKwtcontextmenu] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdatacomagtinst].[XPKwtdatacomagtinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdatacomagtinst] ADD CONSTRAINT [XPKwtdatacomagtinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdbpvqueryinfo].[XPKwtdbpvqueryinfo].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdbpvqueryinfo] ADD CONSTRAINT [XPKwtdbpvqueryinfo] PRIMARY KEY CLUSTERED (
	[query_name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdecbridge].[XPKwtdecbridge].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdecbridge] ADD CONSTRAINT [XPKwtdecbridge] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdechub].[XPKwtdechub].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdechub] ADD CONSTRAINT [XPKwtdechub] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdecrouter].[XPKwtdecrouter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdecrouter] ADD CONSTRAINT [XPKwtdecrouter] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdecsystem].[XPKwtdecsystem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdecsystem] ADD CONSTRAINT [XPKwtdecsystem] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdevice_disk_ide].[XPKwtdevice_disk_ide].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdevice_disk_ide] ADD CONSTRAINT [XPKwtdevice_disk_ide] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdevice_disk_scsi].[XPKwtdevice_disk_scsi].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdevice_disk_scsi] ADD CONSTRAINT [XPKwtdevice_disk_scsi] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdevice_tapelibrary].[XPKwtdevice_tapelibrary].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdevice_tapelibrary] ADD CONSTRAINT [XPKwtdevice_tapelibrary] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdg_ux].[XPKwtdg_ux].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdg_ux] ADD CONSTRAINT [XPKwtdg_ux] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdlink_access_point].[XPKwtdlink_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdlink_access_point] ADD CONSTRAINT [XPKwtdlink_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdomain].[XPKwtdomain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdomain] ADD CONSTRAINT [XPKwtdomain] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_cb_folder].[XPKwtdro_e10k_cb_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_cb_folder] ADD CONSTRAINT [XPKwtdro_e10k_cb_folder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_domain_folder].[XPKwtdro_e10k_domain_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_domain_folder] ADD CONSTRAINT [XPKwtdro_e10k_domain_folder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_domains].[XPKwtdro_e10k_domains].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_domains] ADD CONSTRAINT [XPKwtdro_e10k_domains] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_fans].[XPKwtdro_e10k_fans].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_fans] ADD CONSTRAINT [XPKwtdro_e10k_fans] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_primary_cb].[XPKwtdro_e10k_primary_cb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_primary_cb] ADD CONSTRAINT [XPKwtdro_e10k_primary_cb] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_spare_cb].[XPKwtdro_e10k_spare_cb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_spare_cb] ADD CONSTRAINT [XPKwtdro_e10k_spare_cb] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_ssp].[XPKwtdro_e10k_ssp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_ssp] ADD CONSTRAINT [XPKwtdro_e10k_ssp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_system_board_folder].[XPKwtdro_e10k_system_board_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_system_board_folder] ADD CONSTRAINT [XPKwtdro_e10k_system_board_folder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_system_boards].[XPKwtdro_e10k_system_boards].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_system_boards] ADD CONSTRAINT [XPKwtdro_e10k_system_boards] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_tray_folder].[XPKwtdro_e10k_tray_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_tray_folder] ADD CONSTRAINT [XPKwtdro_e10k_tray_folder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_e10k_trays].[XPKwtdro_e10k_trays].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_e10k_trays] ADD CONSTRAINT [XPKwtdro_e10k_trays] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_ibmlpar].[XPKwtdro_ibmlpar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_ibmlpar] ADD CONSTRAINT [XPKwtdro_ibmlpar] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_plfolder].[XPKwtdro_plfolder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_plfolder] ADD CONSTRAINT [XPKwtdro_plfolder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_starfire].[XPKwtdro_starfire].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_starfire] ADD CONSTRAINT [XPKwtdro_starfire] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire].[XPKwtdro_sunfire].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire] ADD CONSTRAINT [XPKwtdro_sunfire] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_cb_folder].[XPKwtdro_sunfire_cb_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_cb_folder] ADD CONSTRAINT [XPKwtdro_sunfire_cb_folder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_domain_folder].[XPKwtdro_sunfire_domain_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_domain_folder] ADD CONSTRAINT [XPKwtdro_sunfire_domain_folder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend].[XPKwtdro_sunfire_highend].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_highend] ADD CONSTRAINT [XPKwtdro_sunfire_highend] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend_fans].[XPKwtdro_sunfire_highend_fans].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_highend_fans] ADD CONSTRAINT [XPKwtdro_sunfire_highend_fans] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend_main_sc].[XPKwtdro_sunfire_highend_main_sc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_highend_main_sc] ADD CONSTRAINT [XPKwtdro_sunfire_highend_main_sc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend_sb_cpu].[XPKwtdro_sunfire_highend_sb_cpu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_highend_sb_cpu] ADD CONSTRAINT [XPKwtdro_sunfire_highend_sb_cpu] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend_sb_io].[XPKwtdro_sunfire_highend_sb_io].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_highend_sb_io] ADD CONSTRAINT [XPKwtdro_sunfire_highend_sb_io] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend_spare_sc].[XPKwtdro_sunfire_highend_spare_sc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_highend_spare_sc] ADD CONSTRAINT [XPKwtdro_sunfire_highend_spare_sc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_highend_trays].[XPKwtdro_sunfire_highend_trays].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_highend_trays] ADD CONSTRAINT [XPKwtdro_sunfire_highend_trays] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange].[XPKwtdro_sunfire_midrange].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_midrange] ADD CONSTRAINT [XPKwtdro_sunfire_midrange] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_fans].[XPKwtdro_sunfire_midrange_fans].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_midrange_fans] ADD CONSTRAINT [XPKwtdro_sunfire_midrange_fans] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_pri_cb].[XPKwtdro_sunfire_midrange_pri_cb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_midrange_pri_cb] ADD CONSTRAINT [XPKwtdro_sunfire_midrange_pri_cb] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_sb_cpu].[XPKwtdro_sunfire_midrange_sb_cpu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_midrange_sb_cpu] ADD CONSTRAINT [XPKwtdro_sunfire_midrange_sb_cpu] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_sb_io].[XPKwtdro_sunfire_midrange_sb_io].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_midrange_sb_io] ADD CONSTRAINT [XPKwtdro_sunfire_midrange_sb_io] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_sb_others].[XPKwtdro_sunfire_midrange_sb_others].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_midrange_sb_others] ADD CONSTRAINT [XPKwtdro_sunfire_midrange_sb_others] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_spr_cb].[XPKwtdro_sunfire_midrange_spr_cb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_midrange_spr_cb] ADD CONSTRAINT [XPKwtdro_sunfire_midrange_spr_cb] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_midrange_trays].[XPKwtdro_sunfire_midrange_trays].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_midrange_trays] ADD CONSTRAINT [XPKwtdro_sunfire_midrange_trays] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_msp].[XPKwtdro_sunfire_msp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_msp] ADD CONSTRAINT [XPKwtdro_sunfire_msp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_sb_folder].[XPKwtdro_sunfire_sb_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_sb_folder] ADD CONSTRAINT [XPKwtdro_sunfire_sb_folder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtdro_sunfire_tray_folder].[XPKwtdro_sunfire_tray_folder].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtdro_sunfire_tray_folder] ADD CONSTRAINT [XPKwtdro_sunfire_tray_folder] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wteauditmessagegroup].[XPKwteauditmessagegroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wteauditmessagegroup] ADD CONSTRAINT [XPKwteauditmessagegroup] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtentrasys_access_point].[XPKwtentrasys_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtentrasys_access_point] ADD CONSTRAINT [XPKwtentrasys_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepcomsmpnodegroup].[XPKwtepcomsmpnodegroup].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepcomsmpnodegroup] ADD CONSTRAINT [XPKwtepcomsmpnodegroup] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_ecs_c6].[XPKwtepworld_ecs_c6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_ecs_c6] ADD CONSTRAINT [XPKwtepworld_ecs_c6] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_ecs_pc].[XPKwtepworld_ecs_pc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_ecs_pc] ADD CONSTRAINT [XPKwtepworld_ecs_pc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_ecs_s1].[XPKwtepworld_ecs_s1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_ecs_s1] ADD CONSTRAINT [XPKwtepworld_ecs_s1] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_ecs_s2].[XPKwtepworld_ecs_s2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_ecs_s2] ADD CONSTRAINT [XPKwtepworld_ecs_s2] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_ecs_s3].[XPKwtepworld_ecs_s3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_ecs_s3] ADD CONSTRAINT [XPKwtepworld_ecs_s3] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_ecs_s4].[XPKwtepworld_ecs_s4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_ecs_s4] ADD CONSTRAINT [XPKwtepworld_ecs_s4] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_ecs_s5].[XPKwtepworld_ecs_s5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_ecs_s5] ADD CONSTRAINT [XPKwtepworld_ecs_s5] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_c5].[XPKwtepworld_eportal_c5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_c5] ADD CONSTRAINT [XPKwtepworld_eportal_c5] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_c8].[XPKwtepworld_eportal_c8].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_c8] ADD CONSTRAINT [XPKwtepworld_eportal_c8] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_pc].[XPKwtepworld_eportal_pc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_pc] ADD CONSTRAINT [XPKwtepworld_eportal_pc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s10].[XPKwtepworld_eportal_s10].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s10] ADD CONSTRAINT [XPKwtepworld_eportal_s10] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s11].[XPKwtepworld_eportal_s11].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s11] ADD CONSTRAINT [XPKwtepworld_eportal_s11] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s12].[XPKwtepworld_eportal_s12].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s12] ADD CONSTRAINT [XPKwtepworld_eportal_s12] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s14].[XPKwtepworld_eportal_s14].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s14] ADD CONSTRAINT [XPKwtepworld_eportal_s14] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s15].[XPKwtepworld_eportal_s15].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s15] ADD CONSTRAINT [XPKwtepworld_eportal_s15] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s2].[XPKwtepworld_eportal_s2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s2] ADD CONSTRAINT [XPKwtepworld_eportal_s2] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s3].[XPKwtepworld_eportal_s3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s3] ADD CONSTRAINT [XPKwtepworld_eportal_s3] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s6].[XPKwtepworld_eportal_s6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s6] ADD CONSTRAINT [XPKwtepworld_eportal_s6] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_eportal_s7].[XPKwtepworld_eportal_s7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_eportal_s7] ADD CONSTRAINT [XPKwtepworld_eportal_s7] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_itech_c3].[XPKwtepworld_itech_c3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_itech_c3] ADD CONSTRAINT [XPKwtepworld_itech_c3] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_itech_c4].[XPKwtepworld_itech_c4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_itech_c4] ADD CONSTRAINT [XPKwtepworld_itech_c4] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_itech_pc].[XPKwtepworld_itech_pc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_itech_pc] ADD CONSTRAINT [XPKwtepworld_itech_pc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_itech_s5].[XPKwtepworld_itech_s5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_itech_s5] ADD CONSTRAINT [XPKwtepworld_itech_s5] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_itech_s7].[XPKwtepworld_itech_s7].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_itech_s7] ADD CONSTRAINT [XPKwtepworld_itech_s7] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_mswin_c2].[XPKwtepworld_mswin_c2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_mswin_c2] ADD CONSTRAINT [XPKwtepworld_mswin_c2] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_mswin_c3].[XPKwtepworld_mswin_c3].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_mswin_c3] ADD CONSTRAINT [XPKwtepworld_mswin_c3] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_mswin_pc].[XPKwtepworld_mswin_pc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_mswin_pc] ADD CONSTRAINT [XPKwtepworld_mswin_pc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_mswin_s1].[XPKwtepworld_mswin_s1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_mswin_s1] ADD CONSTRAINT [XPKwtepworld_mswin_s1] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_tsenbl_pc].[XPKwtepworld_tsenbl_pc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_tsenbl_pc] ADD CONSTRAINT [XPKwtepworld_tsenbl_pc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworld_tsenbl_s1].[XPKwtepworld_tsenbl_s1].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworld_tsenbl_s1] ADD CONSTRAINT [XPKwtepworld_tsenbl_s1] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtepworldspace].[XPKwtepworldspace].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtepworldspace] ADD CONSTRAINT [XPKwtepworldspace] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtericsson_access_point].[XPKwtericsson_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtericsson_access_point] ADD CONSTRAINT [XPKwtericsson_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtethairnetaccesspoint].[XPKwtethairnetaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtethairnetaccesspoint] ADD CONSTRAINT [XPKwtethairnetaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtetsmim].[XPKwtetsmim].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtetsmim] ADD CONSTRAINT [XPKwtetsmim] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtfoundry].[XPKwtfoundry].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtfoundry] ADD CONSTRAINT [XPKwtfoundry] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtframerelay_pvc_endpoint].[XPKwtframerelay_pvc_endpoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtframerelay_pvc_endpoint] ADD CONSTRAINT [XPKwtframerelay_pvc_endpoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtframerelay_switch].[XPKwtframerelay_switch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtframerelay_switch] ADD CONSTRAINT [XPKwtframerelay_switch] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtframerelaytrunk].[XPKwtframerelaytrunk].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtframerelaytrunk] ADD CONSTRAINT [XPKwtframerelaytrunk] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtfrlink].[XPKwtfrlink].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtfrlink] ADD CONSTRAINT [XPKwtfrlink] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtfujiuxp].[XPKwtfujiuxp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtfujiuxp] ADD CONSTRAINT [XPKwtfujiuxp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtgatorstar].[XPKwtgatorstar].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtgatorstar] ADD CONSTRAINT [XPKwtgatorstar] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtgenericpc].[XPKwtgenericpc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtgenericpc] ADD CONSTRAINT [XPKwtgenericpc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wthawking_access_point].[XPKwthawking_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wthawking_access_point] ADD CONSTRAINT [XPKwthawking_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wthost].[XPKwthost].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wthost] ADD CONSTRAINT [XPKwthost] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wthp_printer].[XPKwthp_printer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wthp_printer] ADD CONSTRAINT [XPKwthp_printer] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wthpbridge].[XPKwthpbridge].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wthpbridge] ADD CONSTRAINT [XPKwthpbridge] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wthphub].[XPKwthphub].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wthphub] ADD CONSTRAINT [XPKwthphub] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wthpserver].[XPKwthpserver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wthpserver] ADD CONSTRAINT [XPKwthpserver] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wthpunix].[XPKwthpunix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wthpunix] ADD CONSTRAINT [XPKwthpunix] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wthub].[XPKwthub].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wthub] ADD CONSTRAINT [XPKwthub] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtibm].[XPKwtibm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtibm] ADD CONSTRAINT [XPKwtibm] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtibm_access_point].[XPKwtibm_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtibm_access_point] ADD CONSTRAINT [XPKwtibm_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtibm_mss].[XPKwtibm_mss].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtibm_mss] ADD CONSTRAINT [XPKwtibm_mss] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtibm3090].[XPKwtibm3090].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtibm3090] ADD CONSTRAINT [XPKwtibm3090] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wticlunix].[XPKwticlunix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wticlunix] ADD CONSTRAINT [XPKwticlunix] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wticssnmp].[XPKwticssnmp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wticssnmp] ADD CONSTRAINT [XPKwticssnmp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtidmsinstance].[XPKwtidmsinstance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtidmsinstance] ADD CONSTRAINT [XPKwtidmsinstance] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtintel_access_point].[XPKwtintel_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtintel_access_point] ADD CONSTRAINT [XPKwtintel_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtinteractive].[XPKwtinteractive].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtinteractive] ADD CONSTRAINT [XPKwtinteractive] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtipx_generic_interface].[XPKwtipx_generic_interface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtipx_generic_interface] ADD CONSTRAINT [XPKwtipx_generic_interface] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtipx_host].[XPKwtipx_host].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtipx_host] ADD CONSTRAINT [XPKwtipx_host] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtipx_printserver].[XPKwtipx_printserver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtipx_printserver] ADD CONSTRAINT [XPKwtipx_printserver] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtirm2snmp].[XPKwtirm2snmp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtirm2snmp] ADD CONSTRAINT [XPKwtirm2snmp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtkarlnetaccesspoint].[XPKwtkarlnetaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtkarlnetaccesspoint] ADD CONSTRAINT [XPKwtkarlnetaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtlane].[XPKwtlane].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtlane] ADD CONSTRAINT [XPKwtlane] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtlaserprinter].[XPKwtlaserprinter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtlaserprinter] ADD CONSTRAINT [XPKwtlaserprinter] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtlec].[XPKwtlec].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtlec] ADD CONSTRAINT [XPKwtlec] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtlecs].[XPKwtlecs].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtlecs] ADD CONSTRAINT [XPKwtlecs] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtles].[XPKwtles].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtles] ADD CONSTRAINT [XPKwtles] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtlight_3d].[XPKwtlight_3d].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtlight_3d] ADD CONSTRAINT [XPKwtlight_3d] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtlinksysaccesspoint].[XPKwtlinksysaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtlinksysaccesspoint] ADD CONSTRAINT [XPKwtlinksysaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtlinux].[XPKwtlinux].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtlinux] ADD CONSTRAINT [XPKwtlinux] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtlun].[XPKwtlun].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtlun] ADD CONSTRAINT [XPKwtlun] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmacintosh].[XPKwtmacintosh].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmacintosh] ADD CONSTRAINT [XPKwtmacintosh] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmanagedpc].[XPKwtmanagedpc].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmanagedpc] ADD CONSTRAINT [XPKwtmanagedpc] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmicom].[XPKwtmicom].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmicom] ADD CONSTRAINT [XPKwtmicom] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmkagent].[XPKwtmkagent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmkagent] ADD CONSTRAINT [XPKwtmkagent] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmobiledevice].[XPKwtmobiledevice].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmobiledevice] ADD CONSTRAINT [XPKwtmobiledevice] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqaliasq].[XPKwtmqaliasq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqaliasq] ADD CONSTRAINT [XPKwtmqaliasq] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqaliasqinst].[XPKwtmqaliasqinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqaliasqinst] ADD CONSTRAINT [XPKwtmqaliasqinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqchaninit].[XPKwtmqchaninit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqchaninit] ADD CONSTRAINT [XPKwtmqchaninit] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqchaninitinst].[XPKwtmqchaninitinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqchaninitinst] ADD CONSTRAINT [XPKwtmqchaninitinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqchannel].[XPKwtmqchannel].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqchannel] ADD CONSTRAINT [XPKwtmqchannel] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqchannelinst].[XPKwtmqchannelinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqchannelinst] ADD CONSTRAINT [XPKwtmqchannelinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqdlq].[XPKwtmqdlq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqdlq] ADD CONSTRAINT [XPKwtmqdlq] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqdlqinst].[XPKwtmqdlqinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqdlqinst] ADD CONSTRAINT [XPKwtmqdlqinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqmgr].[XPKwtmqmgr].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqmgr] ADD CONSTRAINT [XPKwtmqmgr] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqmgrinst].[XPKwtmqmgrinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqmgrinst] ADD CONSTRAINT [XPKwtmqmgrinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqmodelq].[XPKwtmqmodelq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqmodelq] ADD CONSTRAINT [XPKwtmqmodelq] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqmodelqinst].[XPKwtmqmodelqinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqmodelqinst] ADD CONSTRAINT [XPKwtmqmodelqinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqprocess].[XPKwtmqprocess].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqprocess] ADD CONSTRAINT [XPKwtmqprocess] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqprocessinst].[XPKwtmqprocessinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqprocessinst] ADD CONSTRAINT [XPKwtmqprocessinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqpsid].[XPKwtmqpsid].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqpsid] ADD CONSTRAINT [XPKwtmqpsid] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqpsidinst].[XPKwtmqpsidinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqpsidinst] ADD CONSTRAINT [XPKwtmqpsidinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqqueue].[XPKwtmqqueue].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqqueue] ADD CONSTRAINT [XPKwtmqqueue] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqqueueinst].[XPKwtmqqueueinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqqueueinst] ADD CONSTRAINT [XPKwtmqqueueinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqremoteq].[XPKwtmqremoteq].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqremoteq] ADD CONSTRAINT [XPKwtmqremoteq] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqremoteqinst].[XPKwtmqremoteqinst].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqremoteqinst] ADD CONSTRAINT [XPKwtmqremoteqinst] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmqsinstance].[XPKwtmqsinstance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmqsinstance] ADD CONSTRAINT [XPKwtmqsinstance] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmulti_port].[XPKwtmulti_port].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmulti_port] ADD CONSTRAINT [XPKwtmulti_port] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtmultinet].[XPKwtmultinet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtmultinet] ADD CONSTRAINT [XPKwtmultinet] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtncrunix].[XPKwtncrunix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtncrunix] ADD CONSTRAINT [XPKwtncrunix] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnetgearaccesspoint].[XPKwtnetgearaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnetgearaccesspoint] ADD CONSTRAINT [XPKwtnetgearaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnetgeneral].[XPKwtnetgeneral].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnetgeneral] ADD CONSTRAINT [XPKwtnetgeneral] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnetjet_printerserver].[XPKwtnetjet_printerserver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnetjet_printerserver] ADD CONSTRAINT [XPKwtnetjet_printerserver] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnetque_printerserver].[XPKwtnetque_printerserver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnetque_printerserver] ADD CONSTRAINT [XPKwtnetque_printerserver] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnetsnmp].[XPKwtnetsnmp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnetsnmp] ADD CONSTRAINT [XPKwtnetsnmp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnetworth].[XPKwtnetworth].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnetworth] ADD CONSTRAINT [XPKwtnetworth] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtngsniffer].[XPKwtngsniffer].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtngsniffer] ADD CONSTRAINT [XPKwtngsniffer] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnortel_access_point].[XPKwtnortel_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnortel_access_point] ADD CONSTRAINT [XPKwtnortel_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnovell].[XPKwtnovell].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnovell] ADD CONSTRAINT [XPKwtnovell] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtnovellhub].[XPKwtnovellhub].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtnovellhub] ADD CONSTRAINT [XPKwtnovellhub] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtopenvms].[XPKwtopenvms].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtopenvms] ADD CONSTRAINT [XPKwtopenvms] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtopenvms_system_monitor].[XPKwtopenvms_system_monitor].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtopenvms_system_monitor] ADD CONSTRAINT [XPKwtopenvms_system_monitor] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtorinocoaccesspoint].[XPKwtorinocoaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtorinocoaccesspoint] ADD CONSTRAINT [XPKwtorinocoaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtos2].[XPKwtos2].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtos2] ADD CONSTRAINT [XPKwtos2] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtospf_area].[XPKwtospf_area].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtospf_area] ADD CONSTRAINT [XPKwtospf_area] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtospf_link].[XPKwtospf_link].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtospf_link] ADD CONSTRAINT [XPKwtospf_link] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtospf_router].[XPKwtospf_router].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtospf_router] ADD CONSTRAINT [XPKwtospf_router] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtotherdevices].[XPKwtotherdevices].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtotherdevices] ADD CONSTRAINT [XPKwtotherdevices] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtpcniu].[XPKwtpcniu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtpcniu] ADD CONSTRAINT [XPKwtpcniu] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtperformance].[XPKwtperformance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtperformance] ADD CONSTRAINT [XPKwtperformance] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtperformancetrend].[XPKwtperformancetrend].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtperformancetrend] ADD CONSTRAINT [XPKwtperformancetrend] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtprinters].[XPKwtprinters].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtprinters] ADD CONSTRAINT [XPKwtprinters] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtprobe].[XPKwtprobe].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtprobe] ADD CONSTRAINT [XPKwtprobe] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtprofiledomainserver].[XPKwtprofiledomainserver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtprofiledomainserver] ADD CONSTRAINT [XPKwtprofiledomainserver] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtproxim_access_point].[XPKwtproxim_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtproxim_access_point] ADD CONSTRAINT [XPKwtproxim_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtpv705n].[XPKwtpv705n].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtpv705n] ADD CONSTRAINT [XPKwtpv705n] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtqlogic_switch].[XPKwtqlogic_switch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtqlogic_switch] ADD CONSTRAINT [XPKwtqlogic_switch] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtresponsemanagercollector].[XPKwtresponsemanagercollector].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtresponsemanagercollector] ADD CONSTRAINT [XPKwtresponsemanagercollector] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtrisc6000].[XPKwtrisc6000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtrisc6000] ADD CONSTRAINT [XPKwtrisc6000] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtroamaboutaccesspoint].[XPKwtroamaboutaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtroamaboutaccesspoint] ADD CONSTRAINT [XPKwtroamaboutaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtrogue_access_point].[XPKwtrogue_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtrogue_access_point] ADD CONSTRAINT [XPKwtrogue_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtrouter].[XPKwtrouter].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtrouter] ADD CONSTRAINT [XPKwtrouter] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtrouter_interface].[XPKwtrouter_interface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtrouter_interface] ADD CONSTRAINT [XPKwtrouter_interface] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsamsung].[XPKwtsamsung].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsamsung] ADD CONSTRAINT [XPKwtsamsung] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsapagent].[XPKwtsapagent].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsapagent] ADD CONSTRAINT [XPKwtsapagent] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsapinstance].[XPKwtsapinstance].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsapinstance] ADD CONSTRAINT [XPKwtsapinstance] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsapinstance4].[XPKwtsapinstance4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsapinstance4] ADD CONSTRAINT [XPKwtsapinstance4] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtscounix].[XPKwtscounix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtscounix] ADD CONSTRAINT [XPKwtscounix] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsequent_server].[XPKwtsequent_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsequent_server] ADD CONSTRAINT [XPKwtsequent_server] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsiemenux].[XPKwtsiemenux].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsiemenux] ADD CONSTRAINT [XPKwtsiemenux] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsilicon].[XPKwtsilicon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsilicon] ADD CONSTRAINT [XPKwtsilicon] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsmcaccesspoint].[XPKwtsmcaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsmcaccesspoint] ADD CONSTRAINT [XPKwtsmcaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsolaris].[XPKwtsolaris].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsolaris] ADD CONSTRAINT [XPKwtsolaris] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmedia].[XPKwtssmedia].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtssmedia] ADD CONSTRAINT [XPKwtssmedia] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssmodule].[XPKwtssmodule].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtssmodule] ADD CONSTRAINT [XPKwtssmodule] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssport].[XPKwtssport].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtssport] ADD CONSTRAINT [XPKwtssport] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssroute].[XPKwtssroute].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtssroute] ADD CONSTRAINT [XPKwtssroute] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsssubnet].[XPKwtsssubnet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsssubnet] ADD CONSTRAINT [XPKwtsssubnet] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssswitch].[XPKwtssswitch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtssswitch] ADD CONSTRAINT [XPKwtssswitch] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssvlan].[XPKwtssvlan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtssvlan] ADD CONSTRAINT [XPKwtssvlan] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtssvtpdomain].[XPKwtssvtpdomain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtssvtpdomain] ADD CONSTRAINT [XPKwtssvtpdomain] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtstoragesubsystem].[XPKwtstoragesubsystem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtstoragesubsystem] ADD CONSTRAINT [XPKwtstoragesubsystem] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsunos].[XPKwtsunos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsunos] ADD CONSTRAINT [XPKwtsunos] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsuspectaccesspoint].[XPKwtsuspectaccesspoint].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsuspectaccesspoint] ADD CONSTRAINT [XPKwtsuspectaccesspoint] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtswitch].[XPKwtswitch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtswitch] ADD CONSTRAINT [XPKwtswitch] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtswitch_interface].[XPKwtswitch_interface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtswitch_interface] ADD CONSTRAINT [XPKwtswitch_interface] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsymbol_1m_access_point].[XPKwtsymbol_1m_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsymbol_1m_access_point] ADD CONSTRAINT [XPKwtsymbol_1m_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsymbol80211_1_2m_access_point].[XPKwtsymbol80211_1_2m_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsymbol80211_1_2m_access_point] ADD CONSTRAINT [XPKwtsymbol80211_1_2m_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsymbol80211_11m_access_point].[XPKwtsymbol80211_11m_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsymbol80211_11m_access_point] ADD CONSTRAINT [XPKwtsymbol80211_11m_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsynoptics].[XPKwtsynoptics].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsynoptics] ADD CONSTRAINT [XPKwtsynoptics] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtsynoptics_bridge].[XPKwtsynoptics_bridge].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtsynoptics_bridge] ADD CONSTRAINT [XPKwtsynoptics_bridge] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wttandem].[XPKwttandem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wttandem] ADD CONSTRAINT [XPKwttandem] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wttapesubsystem].[XPKwttapesubsystem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wttapesubsystem] ADD CONSTRAINT [XPKwttapesubsystem] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wttelebit].[XPKwttelebit].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wttelebit] ADD CONSTRAINT [XPKwttelebit] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wttnd_icon].[XPKwttnd_icon].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wttnd_icon] ADD CONSTRAINT [XPKwttnd_icon] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wttooltip].[XPKwttooltip].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wttooltip] ADD CONSTRAINT [XPKwttooltip] PRIMARY KEY CLUSTERED (
	[name] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtubempower].[XPKwtubempower].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtubempower] ADD CONSTRAINT [XPKwtubempower] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtubniu].[XPKwtubniu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtubniu] ADD CONSTRAINT [XPKwtubniu] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtunicenter_openvms].[XPKwtunicenter_openvms].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtunicenter_openvms] ADD CONSTRAINT [XPKwtunicenter_openvms] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtunicenter_openvmsmanagedobject].[XPKwtunicenter_openvmsmanagedobject].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtunicenter_openvmsmanagedobject] ADD CONSTRAINT [XPKwtunicenter_openvmsmanagedobject] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtunisys].[XPKwtunisys].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtunisys] ADD CONSTRAINT [XPKwtunisys] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtunix].[XPKwtunix].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtunix] ADD CONSTRAINT [XPKwtunix] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtunixware].[XPKwtunixware].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtunixware] ADD CONSTRAINT [XPKwtunixware] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtups].[XPKwtups].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtups] ADD CONSTRAINT [XPKwtups] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wturm].[XPKwturm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wturm] ADD CONSTRAINT [XPKwturm] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtusr_access_point].[XPKwtusr_access_point].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtusr_access_point] ADD CONSTRAINT [XPKwtusr_access_point] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvcp_1000].[XPKwtvcp_1000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvcp_1000] ADD CONSTRAINT [XPKwtvcp_1000] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvip_interface].[XPKwtvip_interface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvip_interface] ADD CONSTRAINT [XPKwtvip_interface] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvitalink].[XPKwtvitalink].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvitalink] ADD CONSTRAINT [XPKwtvitalink] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvlan].[XPKwtvlan].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvlan] ADD CONSTRAINT [XPKwtvlan] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvlan_interface].[XPKwtvlan_interface].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvlan_interface] ADD CONSTRAINT [XPKwtvlan_interface] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvlan_switch].[XPKwtvlan_switch].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvlan_switch] ADD CONSTRAINT [XPKwtvlan_switch] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_cpu].[XPKwtvmo_cpu].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_cpu] ADD CONSTRAINT [XPKwtvmo_cpu] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_disk_io].[XPKwtvmo_disk_io].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_disk_io] ADD CONSTRAINT [XPKwtvmo_disk_io] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_guestos].[XPKwtvmo_guestos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_guestos] ADD CONSTRAINT [XPKwtvmo_guestos] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_hb].[XPKwtvmo_hb].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_hb] ADD CONSTRAINT [XPKwtvmo_hb] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_linux].[XPKwtvmo_linux].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_linux] ADD CONSTRAINT [XPKwtvmo_linux] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_linux_hostos].[XPKwtvmo_linux_hostos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_linux_hostos] ADD CONSTRAINT [XPKwtvmo_linux_hostos] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_mem].[XPKwtvmo_mem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_mem] ADD CONSTRAINT [XPKwtvmo_mem] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_msdos].[XPKwtvmo_msdos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_msdos] ADD CONSTRAINT [XPKwtvmo_msdos] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_netware4].[XPKwtvmo_netware4].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_netware4] ADD CONSTRAINT [XPKwtvmo_netware4] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_netware5].[XPKwtvmo_netware5].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_netware5] ADD CONSTRAINT [XPKwtvmo_netware5] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_netware6].[XPKwtvmo_netware6].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_netware6] ADD CONSTRAINT [XPKwtvmo_netware6] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_network_io].[XPKwtvmo_network_io].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_network_io] ADD CONSTRAINT [XPKwtvmo_network_io] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_other].[XPKwtvmo_other].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_other] ADD CONSTRAINT [XPKwtvmo_other] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_power].[XPKwtvmo_power].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_power] ADD CONSTRAINT [XPKwtvmo_power] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win2k3es].[XPKwtvmo_win2k3es].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win2k3es] ADD CONSTRAINT [XPKwtvmo_win2k3es] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win2k3s].[XPKwtvmo_win2k3s].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win2k3s] ADD CONSTRAINT [XPKwtvmo_win2k3s] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win2k3ws].[XPKwtvmo_win2k3ws].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win2k3ws] ADD CONSTRAINT [XPKwtvmo_win2k3ws] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win2kas].[XPKwtvmo_win2kas].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win2kas] ADD CONSTRAINT [XPKwtvmo_win2kas] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win2kp].[XPKwtvmo_win2kp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win2kp] ADD CONSTRAINT [XPKwtvmo_win2kp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win2ks].[XPKwtvmo_win2ks].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win2ks] ADD CONSTRAINT [XPKwtvmo_win2ks] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win31].[XPKwtvmo_win31].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win31] ADD CONSTRAINT [XPKwtvmo_win31] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win95].[XPKwtvmo_win95].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win95] ADD CONSTRAINT [XPKwtvmo_win95] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_win98].[XPKwtvmo_win98].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_win98] ADD CONSTRAINT [XPKwtvmo_win98] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_windows_hostos].[XPKwtvmo_windows_hostos].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_windows_hostos] ADD CONSTRAINT [XPKwtvmo_windows_hostos] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_winme].[XPKwtvmo_winme].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_winme] ADD CONSTRAINT [XPKwtvmo_winme] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_winnt].[XPKwtvmo_winnt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_winnt] ADD CONSTRAINT [XPKwtvmo_winnt] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_winxph].[XPKwtvmo_winxph].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_winxph] ADD CONSTRAINT [XPKwtvmo_winxph] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtvmo_winxpp].[XPKwtvmo_winxpp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtvmo_winxpp] ADD CONSTRAINT [XPKwtvmo_winxpp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwbem].[XPKwtwbem].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwbem] ADD CONSTRAINT [XPKwtwbem] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwellfleet].[XPKwtwellfleet].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwellfleet] ADD CONSTRAINT [XPKwtwellfleet] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwindows].[XPKwtwindows].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwindows] ADD CONSTRAINT [XPKwtwindows] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwindows_netserver].[XPKwtwindows_netserver].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwindows_netserver] ADD CONSTRAINT [XPKwtwindows_netserver] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwindows2000].[XPKwtwindows2000].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwindows2000] ADD CONSTRAINT [XPKwtwindows2000] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwindows2000_server].[XPKwtwindows2000_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwindows2000_server] ADD CONSTRAINT [XPKwtwindows2000_server] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwindows9x].[XPKwtwindows9x].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwindows9x] ADD CONSTRAINT [XPKwtwindows9x] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwindowsnt].[XPKwtwindowsnt].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwindowsnt] ADD CONSTRAINT [XPKwtwindowsnt] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwindowsnt_server].[XPKwtwindowsnt_server].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwindowsnt_server] ADD CONSTRAINT [XPKwtwindowsnt_server] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwindowsxp].[XPKwtwindowsxp].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwindowsxp] ADD CONSTRAINT [XPKwtwindowsxp] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtwireless_domain].[XPKwtwireless_domain].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtwireless_domain] ADD CONSTRAINT [XPKwtwireless_domain] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtworkstation].[XPKwtworkstation].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtworkstation] ADD CONSTRAINT [XPKwtworkstation] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtxterm].[XPKwtxterm].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtxterm] ADD CONSTRAINT [XPKwtxterm] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtzone].[XPKwtzone].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtzone] ADD CONSTRAINT [XPKwtzone] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[wtzoneset].[XPKwtzoneset].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[wtzoneset] ADD CONSTRAINT [XPKwtzoneset] PRIMARY KEY CLUSTERED (
	[uuid] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[xent_map].[XPKxent_map].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[xent_map] ADD CONSTRAINT [XPKxent_map] PRIMARY KEY CLUSTERED (
	[id] ASC
) ON [PRIMARY]

GO
--SqlScripter----[dbo].[Z_PARAMETRO].[PK__Z_PARAME__3214EC272F9C7265].sql
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[Z_PARAMETRO] ADD CONSTRAINT [PK__Z_PARAME__3214EC272F9C7265] PRIMARY KEY CLUSTERED (
	[ID] ASC
) ON [PRIMARY]

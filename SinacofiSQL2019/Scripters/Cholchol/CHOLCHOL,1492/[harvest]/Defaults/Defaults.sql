
GO
--SqlScripter----[dbo].[DF__actors__lastchec__585E90D6].sql
GO
ALTER TABLE [dbo].[actors] ADD CONSTRAINT [DF__actors__lastchec__585E90D6] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__ai_fddef___fdint__37D1C5B3].sql
GO
ALTER TABLE [dbo].[ai_fddef_prop] ADD CONSTRAINT [DF__ai_fddef___fdint__37D1C5B3] DEFAULT (' ') FOR [fdinterface]
GO
--SqlScripter----[dbo].[DF__ai_fddef___fdmod__36DDA17A].sql
GO
ALTER TABLE [dbo].[ai_fddef_prop] ADD CONSTRAINT [DF__ai_fddef___fdmod__36DDA17A] DEFAULT (' ') FOR [fdmodel]
GO
--SqlScripter----[dbo].[DF__ai_fddef___fdsiz__38C5E9EC].sql
GO
ALTER TABLE [dbo].[ai_fddef_prop] ADD CONSTRAINT [DF__ai_fddef___fdsiz__38C5E9EC] DEFAULT (0) FOR [fdsize]
GO
--SqlScripter----[dbo].[DF__ai_fddef___fdsta__3AAE325E].sql
GO
ALTER TABLE [dbo].[ai_fddef_prop] ADD CONSTRAINT [DF__ai_fddef___fdsta__3AAE325E] DEFAULT (' ') FOR [fdstatus]
GO
--SqlScripter----[dbo].[DF__ai_fddef___fdven__35E97D41].sql
GO
ALTER TABLE [dbo].[ai_fddef_prop] ADD CONSTRAINT [DF__ai_fddef___fdven__35E97D41] DEFAULT (' ') FOR [fdvendor]
GO
--SqlScripter----[dbo].[DF__ai_fddef_p__fdsn__39BA0E25].sql
GO
ALTER TABLE [dbo].[ai_fddef_prop] ADD CONSTRAINT [DF__ai_fddef_p__fdsn__39BA0E25] DEFAULT (' ') FOR [fdsn]
GO
--SqlScripter----[dbo].[DF__ai_fsdef___fsfre__424F5426].sql
GO
ALTER TABLE [dbo].[ai_fsdef_prop] ADD CONSTRAINT [DF__ai_fsdef___fsfre__424F5426] DEFAULT (0) FOR [fsfree]
GO
--SqlScripter----[dbo].[DF__ai_fsdef___fslab__3E7EC342].sql
GO
ALTER TABLE [dbo].[ai_fsdef_prop] ADD CONSTRAINT [DF__ai_fsdef___fslab__3E7EC342] DEFAULT (' ') FOR [fslabel]
GO
--SqlScripter----[dbo].[DF__ai_fsdef___fsnam__3D8A9F09].sql
GO
ALTER TABLE [dbo].[ai_fsdef_prop] ADD CONSTRAINT [DF__ai_fsdef___fsnam__3D8A9F09] DEFAULT (' ') FOR [fsname]
GO
--SqlScripter----[dbo].[DF__ai_fsdef___fssiz__40670BB4].sql
GO
ALTER TABLE [dbo].[ai_fsdef_prop] ADD CONSTRAINT [DF__ai_fsdef___fssiz__40670BB4] DEFAULT (0) FOR [fssize]
GO
--SqlScripter----[dbo].[DF__ai_fsdef___fstyp__3F72E77B].sql
GO
ALTER TABLE [dbo].[ai_fsdef_prop] ADD CONSTRAINT [DF__ai_fsdef___fstyp__3F72E77B] DEFAULT (' ') FOR [fstype]
GO
--SqlScripter----[dbo].[DF__ai_fsdef___fsuse__415B2FED].sql
GO
ALTER TABLE [dbo].[ai_fsdef_prop] ADD CONSTRAINT [DF__ai_fsdef___fsuse__415B2FED] DEFAULT (0) FOR [fsused]
GO
--SqlScripter----[dbo].[DF__ai_hfdef___hfmod__4CCCE299].sql
GO
ALTER TABLE [dbo].[ai_hfdef_prop] ADD CONSTRAINT [DF__ai_hfdef___hfmod__4CCCE299] DEFAULT (' ') FOR [hfmod]
GO
--SqlScripter----[dbo].[DF__ai_hfdef___hfrel__4BD8BE60].sql
GO
ALTER TABLE [dbo].[ai_hfdef_prop] ADD CONSTRAINT [DF__ai_hfdef___hfrel__4BD8BE60] DEFAULT (' ') FOR [hfrel]
GO
--SqlScripter----[dbo].[DF__ai_hfdef___hfver__4AE49A27].sql
GO
ALTER TABLE [dbo].[ai_hfdef_prop] ADD CONSTRAINT [DF__ai_hfdef___hfver__4AE49A27] DEFAULT (' ') FOR [hfver]
GO
--SqlScripter----[dbo].[DF__ai_hfdef___lactd__4DC106D2].sql
GO
ALTER TABLE [dbo].[ai_hfdef_prop] ADD CONSTRAINT [DF__ai_hfdef___lactd__4DC106D2] DEFAULT (' ') FOR [lactdate]
GO
--SqlScripter----[dbo].[DF__ai_hfdef_p__hfid__49F075EE].sql
GO
ALTER TABLE [dbo].[ai_hfdef_prop] ADD CONSTRAINT [DF__ai_hfdef_p__hfid__49F075EE] DEFAULT (' ') FOR [hfid]
GO
--SqlScripter----[dbo].[DF__ai_hfdef_p__hfsp__48FC51B5].sql
GO
ALTER TABLE [dbo].[ai_hfdef_prop] ADD CONSTRAINT [DF__ai_hfdef_p__hfsp__48FC51B5] DEFAULT (' ') FOR [hfsp]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___class__509D737D].sql
GO
ALTER TABLE [dbo].[ai_hwdef_classdef_rel] ADD CONSTRAINT [DF__ai_hwdef___class__509D737D] DEFAULT (0) FOR [classid]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___corea__56564CD3].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___corea__56564CD3] DEFAULT (0) FOR [coreavg]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___corem__574A710C].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___corem__574A710C] DEFAULT (0) FOR [coremax]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___corem__583E9545].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___corem__583E9545] DEFAULT (0) FOR [coremin]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___early__5379E028].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___early__5379E028] DEFAULT (0) FOR [earlyavg]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___early__546E0461].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___early__546E0461] DEFAULT (0) FOR [earlymax]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___early__5562289A].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___early__5562289A] DEFAULT (0) FOR [earlymin]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___latea__5932B97E].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___latea__5932B97E] DEFAULT (0) FOR [lateavg]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___latem__5A26DDB7].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___latem__5A26DDB7] DEFAULT (0) FOR [latemax]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___latem__5B1B01F0].sql
GO
ALTER TABLE [dbo].[ai_hwdef_cpuperf_kpi] ADD CONSTRAINT [DF__ai_hwdef___latem__5B1B01F0] DEFAULT (0) FOR [latemin]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___creat__5DF76E9B].sql
GO
ALTER TABLE [dbo].[ai_hwdef_createdate_kpi] ADD CONSTRAINT [DF__ai_hwdef___creat__5DF76E9B] DEFAULT (' ') FOR [createdate]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___login__60D3DB46].sql
GO
ALTER TABLE [dbo].[ai_hwdef_login_all_rel] ADD CONSTRAINT [DF__ai_hwdef___login__60D3DB46] DEFAULT (' ') FOR [logindomain]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___login__63B047F1].sql
GO
ALTER TABLE [dbo].[ai_hwdef_login_lscandate_rel] ADD CONSTRAINT [DF__ai_hwdef___login__63B047F1] DEFAULT (' ') FOR [logindomain]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___login__668CB49C].sql
GO
ALTER TABLE [dbo].[ai_hwdef_login_maxscan_rel] ADD CONSTRAINT [DF__ai_hwdef___login__668CB49C] DEFAULT (' ') FOR [logindomain]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___login__69692147].sql
GO
ALTER TABLE [dbo].[ai_hwdef_login_rel] ADD CONSTRAINT [DF__ai_hwdef___login__69692147] DEFAULT (' ') FOR [loginid]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___login__6A5D4580].sql
GO
ALTER TABLE [dbo].[ai_hwdef_login_rel] ADD CONSTRAINT [DF__ai_hwdef___login__6A5D4580] DEFAULT (' ') FOR [logindomain]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwbio__78AB64D7].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwbio__78AB64D7] DEFAULT (' ') FOR [hwbiosmfgr]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwbio__799F8910].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwbio__799F8910] DEFAULT (' ') FOR [hwbiosver]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwbio__7A93AD49].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwbio__7A93AD49] DEFAULT (' ') FOR [hwbiosdate]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwdom__72F28B81].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwdom__72F28B81] DEFAULT (' ') FOR [hwdom]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwmem__77B7409E].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwmem__77B7409E] DEFAULT (0) FOR [hwmem]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwmfg__75CEF82C].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwmfg__75CEF82C] DEFAULT (' ') FOR [hwmfgr]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwmod__76C31C65].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwmod__76C31C65] DEFAULT (' ') FOR [hwmodel]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwpro__7B87D182].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwpro__7B87D182] DEFAULT (' ') FOR [hwprocmfgr]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwpro__7C7BF5BB].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwpro__7C7BF5BB] DEFAULT (' ') FOR [hwprocmodel]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwpro__7D7019F4].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwpro__7D7019F4] DEFAULT (' ') FOR [hwproctype]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwpro__7E643E2D].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwpro__7E643E2D] DEFAULT (0) FOR [hwproccount]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwpro__7F586266].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwpro__7F586266] DEFAULT (0) FOR [hwprocspeed]
GO
--SqlScripter----[dbo].[DF__ai_hwdef___hwtyp__74DAD3F3].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef___hwtyp__74DAD3F3] DEFAULT (' ') FOR [hwtype]
GO
--SqlScripter----[dbo].[DF__ai_hwdef_p__hwsn__73E6AFBA].sql
GO
ALTER TABLE [dbo].[ai_hwdef_prop] ADD CONSTRAINT [DF__ai_hwdef_p__hwsn__73E6AFBA] DEFAULT (' ') FOR [hwsn]
GO
--SqlScripter----[dbo].[DF__ai_ipdef___ipmas__0234CF11].sql
GO
ALTER TABLE [dbo].[ai_ipdef_prop] ADD CONSTRAINT [DF__ai_ipdef___ipmas__0234CF11] DEFAULT (' ') FOR [ipmask]
GO
--SqlScripter----[dbo].[DF__ai_ipdef___ipnwa__0328F34A].sql
GO
ALTER TABLE [dbo].[ai_ipdef_prop] ADD CONSTRAINT [DF__ai_ipdef___ipnwa__0328F34A] DEFAULT (' ') FOR [ipnwaddr]
GO
--SqlScripter----[dbo].[DF__ai_orgdef__orgnm__34C04EDE].sql
GO
ALTER TABLE [dbo].[ai_orgdef_rel] ADD CONSTRAINT [DF__ai_orgdef__orgnm__34C04EDE] DEFAULT (' ') FOR [orgnm]
GO
--SqlScripter----[dbo].[DF__ai_orgdef__regio__35B47317].sql
GO
ALTER TABLE [dbo].[ai_orgdef_rel] ADD CONSTRAINT [DF__ai_orgdef__regio__35B47317] DEFAULT (' ') FOR [region]
GO
--SqlScripter----[dbo].[DF__ai_osdef___osbui__0ACA1512].sql
GO
ALTER TABLE [dbo].[ai_osdef_prop] ADD CONSTRAINT [DF__ai_osdef___osbui__0ACA1512] DEFAULT (' ') FOR [osbuild]
GO
--SqlScripter----[dbo].[DF__ai_osdef___oslan__0CB25D84].sql
GO
ALTER TABLE [dbo].[ai_osdef_prop] ADD CONSTRAINT [DF__ai_osdef___oslan__0CB25D84] DEFAULT (' ') FOR [oslanguage]
GO
--SqlScripter----[dbo].[DF__ai_osdef___ospub__08E1CCA0].sql
GO
ALTER TABLE [dbo].[ai_osdef_prop] ADD CONSTRAINT [DF__ai_osdef___ospub__08E1CCA0] DEFAULT (' ') FOR [ospub]
GO
--SqlScripter----[dbo].[DF__ai_osdef___osver__09D5F0D9].sql
GO
ALTER TABLE [dbo].[ai_osdef_prop] ADD CONSTRAINT [DF__ai_osdef___osver__09D5F0D9] DEFAULT (' ') FOR [osver]
GO
--SqlScripter----[dbo].[DF__ai_osdef_p__ossp__0BBE394B].sql
GO
ALTER TABLE [dbo].[ai_osdef_prop] ADD CONSTRAINT [DF__ai_osdef_p__ossp__0BBE394B] DEFAULT (' ') FOR [ossp]
GO
--SqlScripter----[dbo].[DF__ai_swcat___creat__19183469].sql
GO
ALTER TABLE [dbo].[ai_swcat_prop] ADD CONSTRAINT [DF__ai_swcat___creat__19183469] DEFAULT (' ') FOR [createuser]
GO
--SqlScripter----[dbo].[DF__ai_swdef___lactd__276653C0].sql
GO
ALTER TABLE [dbo].[ai_swdef_prop] ADD CONSTRAINT [DF__ai_swdef___lactd__276653C0] DEFAULT (' ') FOR [lactdate]
GO
--SqlScripter----[dbo].[DF__ai_swdef___swbld__2489E715].sql
GO
ALTER TABLE [dbo].[ai_swdef_prop] ADD CONSTRAINT [DF__ai_swdef___swbld__2489E715] DEFAULT (' ') FOR [swbld]
GO
--SqlScripter----[dbo].[DF__ai_swdef___swlan__26722F87].sql
GO
ALTER TABLE [dbo].[ai_swdef_prop] ADD CONSTRAINT [DF__ai_swdef___swlan__26722F87] DEFAULT (' ') FOR [swlang]
GO
--SqlScripter----[dbo].[DF__ai_swdef___swmod__2395C2DC].sql
GO
ALTER TABLE [dbo].[ai_swdef_prop] ADD CONSTRAINT [DF__ai_swdef___swmod__2395C2DC] DEFAULT (' ') FOR [swmod]
GO
--SqlScripter----[dbo].[DF__ai_swdef___swnot__257E0B4E].sql
GO
ALTER TABLE [dbo].[ai_swdef_prop] ADD CONSTRAINT [DF__ai_swdef___swnot__257E0B4E] DEFAULT (' ') FOR [swnote]
GO
--SqlScripter----[dbo].[DF__ai_swdef___swrel__22A19EA3].sql
GO
ALTER TABLE [dbo].[ai_swdef_prop] ADD CONSTRAINT [DF__ai_swdef___swrel__22A19EA3] DEFAULT (' ') FOR [swrel]
GO
--SqlScripter----[dbo].[DF__ai_swdef___swver__21AD7A6A].sql
GO
ALTER TABLE [dbo].[ai_swdef_prop] ADD CONSTRAINT [DF__ai_swdef___swver__21AD7A6A] DEFAULT (' ') FOR [swver]
GO
--SqlScripter----[dbo].[DF__ai_usrdef__repor__2D1F2D16].sql
GO
ALTER TABLE [dbo].[ai_usrdef_orgtree_prop] ADD CONSTRAINT [DF__ai_usrdef__repor__2D1F2D16] DEFAULT (' ') FOR [reportsto]
GO
--SqlScripter----[dbo].[DF__ai_usrdef_o__pmf__2C2B08DD].sql
GO
ALTER TABLE [dbo].[ai_usrdef_orgtree_prop] ADD CONSTRAINT [DF__ai_usrdef_o__pmf__2C2B08DD] DEFAULT (' ') FOR [pmf]
GO
--SqlScripter----[dbo].[DF__ai_usrdef__samid__2FFB99C1].sql
GO
ALTER TABLE [dbo].[ai_usrdef_prop] ADD CONSTRAINT [DF__ai_usrdef__samid__2FFB99C1] DEFAULT (' ') FOR [samid]
GO
--SqlScripter----[dbo].[DF__ai_usrdef_pr__fn__30EFBDFA].sql
GO
ALTER TABLE [dbo].[ai_usrdef_prop] ADD CONSTRAINT [DF__ai_usrdef_pr__fn__30EFBDFA] DEFAULT (' ') FOR [fn]
GO
--SqlScripter----[dbo].[DF__ai_usrdef_pr__ln__31E3E233].sql
GO
ALTER TABLE [dbo].[ai_usrdef_prop] ADD CONSTRAINT [DF__ai_usrdef_pr__ln__31E3E233] DEFAULT (' ') FOR [ln]
GO
--SqlScripter----[dbo].[DF_am_approved_licenses_approved_licenses].sql
GO
ALTER TABLE [dbo].[am_approved_licenses] ADD CONSTRAINT [DF_am_approved_licenses_approved_licenses] DEFAULT (0) FOR [approved_licenses]
GO
--SqlScripter----[dbo].[DF_am_approved_licenses_license_type].sql
GO
ALTER TABLE [dbo].[am_approved_licenses] ADD CONSTRAINT [DF_am_approved_licenses_license_type] DEFAULT (0) FOR [license_type]
GO
--SqlScripter----[dbo].[DF_am_approved_licenses_object_type].sql
GO
ALTER TABLE [dbo].[am_approved_licenses] ADD CONSTRAINT [DF_am_approved_licenses_object_type] DEFAULT (-1) FOR [object_type]
GO
--SqlScripter----[dbo].[DF_am_approved_licenses_object_uuid].sql
GO
ALTER TABLE [dbo].[am_approved_licenses] ADD CONSTRAINT [DF_am_approved_licenses_object_uuid] DEFAULT (NULL) FOR [object_uuid]
GO
--SqlScripter----[dbo].[DF__am_extern__versi__0A9D95DB].sql
GO
ALTER TABLE [dbo].[am_external_device] ADD CONSTRAINT [DF__am_extern__versi__0A9D95DB] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__am_extern__versi__0C85DE4D].sql
GO
ALTER TABLE [dbo].[am_external_device_def] ADD CONSTRAINT [DF__am_extern__versi__0C85DE4D] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__am_link_e__versi__4C97D86F].sql
GO
ALTER TABLE [dbo].[am_link_external_device] ADD CONSTRAINT [DF__am_link_e__versi__4C97D86F] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__am_link_o__folde__114A936A].sql
GO
ALTER TABLE [dbo].[am_link_object_folder] ADD CONSTRAINT [DF__am_link_o__folde__114A936A] DEFAULT (0) FOR [folder_domain_id]
GO
--SqlScripter----[dbo].[DF__am_link_o__folde__123EB7A3].sql
GO
ALTER TABLE [dbo].[am_link_object_folder] ADD CONSTRAINT [DF__am_link_o__folde__123EB7A3] DEFAULT (0) FOR [folder_id]
GO
--SqlScripter----[dbo].[DF__am_link_o__objec__1332DBDC].sql
GO
ALTER TABLE [dbo].[am_link_object_folder] ADD CONSTRAINT [DF__am_link_o__objec__1332DBDC] DEFAULT (0) FOR [object_domain_id]
GO
--SqlScripter----[dbo].[DF__am_object__folde__17F790F9].sql
GO
ALTER TABLE [dbo].[am_object_folder] ADD CONSTRAINT [DF__am_object__folde__17F790F9] DEFAULT (0) FOR [folder_domain_id]
GO
--SqlScripter----[dbo].[DF__am_object__folde__18EBB532].sql
GO
ALTER TABLE [dbo].[am_object_folder] ADD CONSTRAINT [DF__am_object__folde__18EBB532] DEFAULT (0) FOR [folder_id]
GO
--SqlScripter----[dbo].[DF__am_object__folde__19DFD96B].sql
GO
ALTER TABLE [dbo].[am_object_folder] ADD CONSTRAINT [DF__am_object__folde__19DFD96B] DEFAULT (NULL) FOR [folder_parent_id]
GO
--SqlScripter----[dbo].[DF__am_object__folde__1AD3FDA4].sql
GO
ALTER TABLE [dbo].[am_object_folder] ADD CONSTRAINT [DF__am_object__folde__1AD3FDA4] DEFAULT (NULL) FOR [folder_name]
GO
--SqlScripter----[dbo].[DF__am_object__folde__1CBC4616].sql
GO
ALTER TABLE [dbo].[am_object_folder] ADD CONSTRAINT [DF__am_object__folde__1CBC4616] DEFAULT (0) FOR [folder_filter]
GO
--SqlScripter----[dbo].[DF__am_object__folde__1DB06A4F].sql
GO
ALTER TABLE [dbo].[am_object_folder] ADD CONSTRAINT [DF__am_object__folde__1DB06A4F] DEFAULT (0) FOR [folder_id_type]
GO
--SqlScripter----[dbo].[DF__am_object__objec__1BC821DD].sql
GO
ALTER TABLE [dbo].[am_object_folder] ADD CONSTRAINT [DF__am_object__objec__1BC821DD] DEFAULT (NULL) FOR [object_type]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__ackno__30C33EC3].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__ackno__30C33EC3] DEFAULT (0) FOR [acknowledged]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__activ__31B762FC].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__activ__31B762FC] DEFAULT ('Y') FOR [active]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__alarm__32AB8735].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__alarm__32AB8735] DEFAULT (0) FOR [alarmed]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__annot__43D61337].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__annot__43D61337] DEFAULT (0) FOR [annotated]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__appda__3B40CD36].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__appda__3B40CD36] DEFAULT ('') FOR [appdata1]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__appda__3C34F16F].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__appda__3C34F16F] DEFAULT ('') FOR [appdata2]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__appda__3D2915A8].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__appda__3D2915A8] DEFAULT ('') FOR [appdata3]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__appda__3E1D39E1].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__appda__3E1D39E1] DEFAULT ('') FOR [appdata4]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__appda__3F115E1A].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__appda__3F115E1A] DEFAULT ('') FOR [appdata5]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__appve__3A4CA8FD].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__appve__3A4CA8FD] DEFAULT ('') FOR [appversion]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__assoc__489AC854].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__assoc__489AC854] DEFAULT (-1) FOR [assoccount]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__class__2B0A656D].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__class__2B0A656D] DEFAULT ('') FOR [class]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__close__46B27FE2].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__close__46B27FE2] DEFAULT (0) FOR [closed]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__creat__44CA3770].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__creat__44CA3770] DEFAULT (0) FOR [created]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__descr__2A164134].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__descr__2A164134] DEFAULT ('') FOR [description]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__displ__2CF2ADDF].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__displ__2CF2ADDF] DEFAULT ('') FOR [display]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__escal__2DE6D218].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__escal__2DE6D218] DEFAULT ('') FOR [escalation]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__escal__42E1EEFE].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__escal__42E1EEFE] DEFAULT (0) FOR [escalated]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__escal__47A6A41B].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__escal__47A6A41B] DEFAULT (0) FOR [escalating]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__facil__339FAB6E].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__facil__339FAB6E] DEFAULT ('') FOR [facility]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__group__2EDAF651].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__group__2EDAF651] DEFAULT ('') FOR [groupid]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__group__2FCF1A8A].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__group__2FCF1A8A] DEFAULT (0) FOR [groupcount]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__modif__45BE5BA9].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__modif__45BE5BA9] DEFAULT (0) FOR [modified]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__occur__395884C4].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__occur__395884C4] DEFAULT (0) FOR [occurred]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__queue__2BFE89A6].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__queue__2BFE89A6] DEFAULT ('') FOR [queue]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__route__3587F3E0].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__route__3587F3E0] DEFAULT ('') FOR [routenode]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__sourc__367C1819].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__sourc__367C1819] DEFAULT ('') FOR [source]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__ticke__40F9A68C].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__ticke__40F9A68C] DEFAULT ('') FOR [ticket]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__trans__41EDCAC5].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__trans__41EDCAC5] DEFAULT (0) FOR [transferred]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__udata__40058253].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__udata__40058253] DEFAULT ('') FOR [udata]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__works__37703C52].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_a__works__37703C52] DEFAULT ('') FOR [workstation]
GO
--SqlScripter----[dbo].[DF__ams_lv1_al__name__29221CFB].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_al__name__29221CFB] DEFAULT ('') FOR [name]
GO
--SqlScripter----[dbo].[DF__ams_lv1_al__node__3493CFA7].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_al__node__3493CFA7] DEFAULT ('') FOR [node]
GO
--SqlScripter----[dbo].[DF__ams_lv1_ale__url__3864608B].sql
GO
ALTER TABLE [dbo].[ams_lv1_alerts] ADD CONSTRAINT [DF__ams_lv1_ale__url__3864608B] DEFAULT ('') FOR [url]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__creat__4B7734FF].sql
GO
ALTER TABLE [dbo].[ams_lv1_annotation] ADD CONSTRAINT [DF__ams_lv1_a__creat__4B7734FF] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__modif__4C6B5938].sql
GO
ALTER TABLE [dbo].[ams_lv1_annotation] ADD CONSTRAINT [DF__ams_lv1_a__modif__4C6B5938] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_an__text__4A8310C6].sql
GO
ALTER TABLE [dbo].[ams_lv1_annotation] ADD CONSTRAINT [DF__ams_lv1_an__text__4A8310C6] DEFAULT ('') FOR [text]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__creat__503BEA1C].sql
GO
ALTER TABLE [dbo].[ams_lv1_association] ADD CONSTRAINT [DF__ams_lv1_a__creat__503BEA1C] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__mocla__4E53A1AA].sql
GO
ALTER TABLE [dbo].[ams_lv1_association] ADD CONSTRAINT [DF__ams_lv1_a__mocla__4E53A1AA] DEFAULT ('') FOR [moclass]
GO
--SqlScripter----[dbo].[DF__ams_lv1_a__modif__51300E55].sql
GO
ALTER TABLE [dbo].[ams_lv1_association] ADD CONSTRAINT [DF__ams_lv1_a__modif__51300E55] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_as__name__4F47C5E3].sql
GO
ALTER TABLE [dbo].[ams_lv1_association] ADD CONSTRAINT [DF__ams_lv1_as__name__4F47C5E3] DEFAULT ('') FOR [name]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__activ__55009F39].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__activ__55009F39] DEFAULT ('Y') FOR [active]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__alarm__55F4C372].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__alarm__55F4C372] DEFAULT ('N') FOR [alarmed]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__calen__5D95E53A].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__calen__5D95E53A] DEFAULT ('') FOR [calendar]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__close__58D1301D].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__close__58D1301D] DEFAULT ('N') FOR [closeticket]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__conso__56E8E7AB].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__conso__56E8E7AB] DEFAULT ('N') FOR [consolidate]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__creat__57DD0BE4].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__creat__57DD0BE4] DEFAULT ('N') FOR [createticket]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__creat__5F7E2DAC].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__creat__5F7E2DAC] DEFAULT (0) FOR [created]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__creat__607251E5].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__creat__607251E5] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__descr__540C7B00].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__descr__540C7B00] DEFAULT ('') FOR [description]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__displ__5AB9788F].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__displ__5AB9788F] DEFAULT ('') FOR [display]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__escal__5BAD9CC8].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__escal__5BAD9CC8] DEFAULT ('') FOR [escalation]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__expir__5CA1C101].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__expir__5CA1C101] DEFAULT (15) FOR [expiration]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__modif__6166761E].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__modif__6166761E] DEFAULT (0) FOR [modified]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__modif__625A9A57].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__modif__625A9A57] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_c__queue__59C55456].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_c__queue__59C55456] DEFAULT ('') FOR [queue]
GO
--SqlScripter----[dbo].[DF__ams_lv1_cl__name__531856C7].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_cl__name__531856C7] DEFAULT ('') FOR [name]
GO
--SqlScripter----[dbo].[DF__ams_lv1_cla__url__5E8A0973].sql
GO
ALTER TABLE [dbo].[ams_lv1_classes] ADD CONSTRAINT [DF__ams_lv1_cla__url__5E8A0973] DEFAULT ('') FOR [url]
GO
--SqlScripter----[dbo].[DF__ams_lv1_d__blink__65370702].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_d__blink__65370702] DEFAULT (' ') FOR [blinking]
GO
--SqlScripter----[dbo].[DF__ams_lv1_d__creat__6AEFE058].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_d__creat__6AEFE058] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_d__descr__6442E2C9].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_d__descr__6442E2C9] DEFAULT ('') FOR [description]
GO
--SqlScripter----[dbo].[DF__ams_lv1_d__itali__671F4F74].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_d__itali__671F4F74] DEFAULT (' ') FOR [italic]
GO
--SqlScripter----[dbo].[DF__ams_lv1_d__modif__6BE40491].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_d__modif__6BE40491] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_d__rever__681373AD].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_d__rever__681373AD] DEFAULT (' ') FOR [reverse]
GO
--SqlScripter----[dbo].[DF__ams_lv1_d__strik__690797E6].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_d__strik__690797E6] DEFAULT (' ') FOR [strikethrough]
GO
--SqlScripter----[dbo].[DF__ams_lv1_d__under__69FBBC1F].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_d__under__69FBBC1F] DEFAULT (' ') FOR [underline]
GO
--SqlScripter----[dbo].[DF__ams_lv1_di__bold__662B2B3B].sql
GO
ALTER TABLE [dbo].[ams_lv1_display] ADD CONSTRAINT [DF__ams_lv1_di__bold__662B2B3B] DEFAULT (' ') FOR [bold]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__ackno__793DFFAF].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__ackno__793DFFAF] DEFAULT (0) FOR [acknowledgedage]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__alert__719CDDE7].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__alert__719CDDE7] DEFAULT (0) FOR [alertage]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__calen__7C1A6C5A].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__calen__7C1A6C5A] DEFAULT ('') FOR [calendar]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__creat__05A3D694].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__creat__05A3D694] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__creat__7E02B4CC].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__creat__7E02B4CC] DEFAULT ('N') FOR [createticket]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__descr__6EC0713C].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__descr__6EC0713C] DEFAULT ('') FOR [description]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__displ__7FEAFD3E].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__displ__7FEAFD3E] DEFAULT ('') FOR [display]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__group__7755B73D].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__group__7755B73D] DEFAULT (0) FOR [groupcount]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__incur__02C769E9].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__incur__02C769E9] DEFAULT (' ') FOR [incurgency]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__match__6FB49575].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__match__6FB49575] DEFAULT (' ') FOR [matchall]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__messa__04AFB25B].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__messa__04AFB25B] DEFAULT ('') FOR [message]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__modif__0697FACD].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__modif__0697FACD] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__queue__00DF2177].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__queue__00DF2177] DEFAULT ('') FOR [queue]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__queue__73852659].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__queue__73852659] DEFAULT (0) FOR [queueage]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__recip__03BB8E22].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__recip__03BB8E22] DEFAULT ('') FOR [recipient]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__setal__7D0E9093].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__setal__7D0E9093] DEFAULT (' ') FOR [setalarm]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__setur__01D345B0].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__setur__01D345B0] DEFAULT (0) FOR [seturgency]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__testa__70A8B9AE].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__testa__70A8B9AE] DEFAULT (' ') FOR [testalertage]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__testa__7849DB76].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__testa__7849DB76] DEFAULT (' ') FOR [testacknowledgedage]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__testa__7B264821].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__testa__7B264821] DEFAULT (0) FOR [testalarmed]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__testg__76619304].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__testg__76619304] DEFAULT (' ') FOR [testgroupcount]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__testn__7A3223E8].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__testn__7A3223E8] DEFAULT (' ') FOR [testnotacknowledged]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__testq__72910220].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__testq__72910220] DEFAULT (' ') FOR [testqueueage]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__testu__74794A92].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__testu__74794A92] DEFAULT (' ') FOR [testurgency]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__urgen__756D6ECB].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__urgen__756D6ECB] DEFAULT (0) FOR [urgency]
GO
--SqlScripter----[dbo].[DF__ams_lv1_e__usera__7EF6D905].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_e__usera__7EF6D905] DEFAULT ('') FOR [useraction]
GO
--SqlScripter----[dbo].[DF__ams_lv1_es__name__6DCC4D03].sql
GO
ALTER TABLE [dbo].[ams_lv1_escalation] ADD CONSTRAINT [DF__ams_lv1_es__name__6DCC4D03] DEFAULT ('') FOR [name]
GO
--SqlScripter----[dbo].[DF__ams_lv1_g__activ__0A688BB1].sql
GO
ALTER TABLE [dbo].[ams_lv1_global] ADD CONSTRAINT [DF__ams_lv1_g__activ__0A688BB1] DEFAULT (' ') FOR [active]
GO
--SqlScripter----[dbo].[DF__ams_lv1_g__creat__0C50D423].sql
GO
ALTER TABLE [dbo].[ams_lv1_global] ADD CONSTRAINT [DF__ams_lv1_g__creat__0C50D423] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_g__inter__0B5CAFEA].sql
GO
ALTER TABLE [dbo].[ams_lv1_global] ADD CONSTRAINT [DF__ams_lv1_g__inter__0B5CAFEA] DEFAULT (' ') FOR [internal]
GO
--SqlScripter----[dbo].[DF__ams_lv1_g__modif__0D44F85C].sql
GO
ALTER TABLE [dbo].[ams_lv1_global] ADD CONSTRAINT [DF__ams_lv1_g__modif__0D44F85C] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_g__value__0880433F].sql
GO
ALTER TABLE [dbo].[ams_lv1_global] ADD CONSTRAINT [DF__ams_lv1_g__value__0880433F] DEFAULT ('') FOR [value]
GO
--SqlScripter----[dbo].[DF__ams_lv1_g__value__09746778].sql
GO
ALTER TABLE [dbo].[ams_lv1_global] ADD CONSTRAINT [DF__ams_lv1_g__value__09746778] DEFAULT ('') FOR [value2]
GO
--SqlScripter----[dbo].[DF__ams_lv1_h__colum__11158940].sql
GO
ALTER TABLE [dbo].[ams_lv1_history] ADD CONSTRAINT [DF__ams_lv1_h__colum__11158940] DEFAULT ('') FOR [column_name]
GO
--SqlScripter----[dbo].[DF__ams_lv1_h__curre__12FDD1B2].sql
GO
ALTER TABLE [dbo].[ams_lv1_history] ADD CONSTRAINT [DF__ams_lv1_h__curre__12FDD1B2] DEFAULT ('') FOR [current_value]
GO
--SqlScripter----[dbo].[DF__ams_lv1_h__previ__1209AD79].sql
GO
ALTER TABLE [dbo].[ams_lv1_history] ADD CONSTRAINT [DF__ams_lv1_h__previ__1209AD79] DEFAULT ('') FOR [previous_value]
GO
--SqlScripter----[dbo].[DF__ams_lv1_h__usern__10216507].sql
GO
ALTER TABLE [dbo].[ams_lv1_history] ADD CONSTRAINT [DF__ams_lv1_h__usern__10216507] DEFAULT ('') FOR [username]
GO
--SqlScripter----[dbo].[DF__ams_lv1_hi__text__0F2D40CE].sql
GO
ALTER TABLE [dbo].[ams_lv1_history] ADD CONSTRAINT [DF__ams_lv1_hi__text__0F2D40CE] DEFAULT ('') FOR [text]
GO
--SqlScripter----[dbo].[DF__ams_lv1_m__creat__15DA3E5D].sql
GO
ALTER TABLE [dbo].[ams_lv1_menus] ADD CONSTRAINT [DF__ams_lv1_m__creat__15DA3E5D] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_m__descr__14E61A24].sql
GO
ALTER TABLE [dbo].[ams_lv1_menus] ADD CONSTRAINT [DF__ams_lv1_m__descr__14E61A24] DEFAULT ('') FOR [description]
GO
--SqlScripter----[dbo].[DF__ams_lv1_m__modif__16CE6296].sql
GO
ALTER TABLE [dbo].[ams_lv1_menus] ADD CONSTRAINT [DF__ams_lv1_m__modif__16CE6296] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_q__creat__1A9EF37A].sql
GO
ALTER TABLE [dbo].[ams_lv1_queues] ADD CONSTRAINT [DF__ams_lv1_q__creat__1A9EF37A] DEFAULT (0) FOR [created]
GO
--SqlScripter----[dbo].[DF__ams_lv1_q__creat__1B9317B3].sql
GO
ALTER TABLE [dbo].[ams_lv1_queues] ADD CONSTRAINT [DF__ams_lv1_q__creat__1B9317B3] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_q__descr__18B6AB08].sql
GO
ALTER TABLE [dbo].[ams_lv1_queues] ADD CONSTRAINT [DF__ams_lv1_q__descr__18B6AB08] DEFAULT ('') FOR [description]
GO
--SqlScripter----[dbo].[DF__ams_lv1_q__escal__19AACF41].sql
GO
ALTER TABLE [dbo].[ams_lv1_queues] ADD CONSTRAINT [DF__ams_lv1_q__escal__19AACF41] DEFAULT ('') FOR [escalation]
GO
--SqlScripter----[dbo].[DF__ams_lv1_q__modif__1C873BEC].sql
GO
ALTER TABLE [dbo].[ams_lv1_queues] ADD CONSTRAINT [DF__ams_lv1_q__modif__1C873BEC] DEFAULT (0) FOR [modified]
GO
--SqlScripter----[dbo].[DF__ams_lv1_q__modif__1D7B6025].sql
GO
ALTER TABLE [dbo].[ams_lv1_queues] ADD CONSTRAINT [DF__ams_lv1_q__modif__1D7B6025] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__actio__214BF109].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_u__actio__214BF109] DEFAULT ('') FOR [action]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__creat__2610A626].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_u__creat__2610A626] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__descr__1F63A897].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_u__descr__1F63A897] DEFAULT ('') FOR [description]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__inter__24285DB4].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_u__inter__24285DB4] DEFAULT (' ') FOR [interactive]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__modif__2704CA5F].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_u__modif__2704CA5F] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__showc__2334397B].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_u__showc__2334397B] DEFAULT (' ') FOR [showconsole]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__useop__22401542].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_u__useop__22401542] DEFAULT (' ') FOR [useoprcmd]
GO
--SqlScripter----[dbo].[DF__ams_lv1_ua__auto__251C81ED].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_ua__auto__251C81ED] DEFAULT (' ') FOR [auto]
GO
--SqlScripter----[dbo].[DF__ams_lv1_ua__node__2057CCD0].sql
GO
ALTER TABLE [dbo].[ams_lv1_uaction] ADD CONSTRAINT [DF__ams_lv1_ua__node__2057CCD0] DEFAULT ('') FOR [node]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__actio__28ED12D1].sql
GO
ALTER TABLE [dbo].[ams_lv1_uactionlinker] ADD CONSTRAINT [DF__ams_lv1_u__actio__28ED12D1] DEFAULT ('') FOR [action]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__creat__29E1370A].sql
GO
ALTER TABLE [dbo].[ams_lv1_uactionlinker] ADD CONSTRAINT [DF__ams_lv1_u__creat__29E1370A] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__modif__2AD55B43].sql
GO
ALTER TABLE [dbo].[ams_lv1_uactionlinker] ADD CONSTRAINT [DF__ams_lv1_u__modif__2AD55B43] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__creat__2EA5EC27].sql
GO
ALTER TABLE [dbo].[ams_lv1_udata] ADD CONSTRAINT [DF__ams_lv1_u__creat__2EA5EC27] DEFAULT ('') FOR [createdby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__descr__2DB1C7EE].sql
GO
ALTER TABLE [dbo].[ams_lv1_udata] ADD CONSTRAINT [DF__ams_lv1_u__descr__2DB1C7EE] DEFAULT ('') FOR [description]
GO
--SqlScripter----[dbo].[DF__ams_lv1_u__modif__2F9A1060].sql
GO
ALTER TABLE [dbo].[ams_lv1_udata] ADD CONSTRAINT [DF__ams_lv1_u__modif__2F9A1060] DEFAULT ('') FOR [modifiedby]
GO
--SqlScripter----[dbo].[DF__ams_lv1_ud__name__2CBDA3B5].sql
GO
ALTER TABLE [dbo].[ams_lv1_udata] ADD CONSTRAINT [DF__ams_lv1_ud__name__2CBDA3B5] DEFAULT ('') FOR [name]
GO
--SqlScripter----[dbo].[DF__arg_actio__versi__55BFB948].sql
GO
ALTER TABLE [dbo].[arg_action] ADD CONSTRAINT [DF__arg_actio__versi__55BFB948] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_actio__versi__589C25F3].sql
GO
ALTER TABLE [dbo].[arg_actiondf] ADD CONSTRAINT [DF__arg_actio__versi__589C25F3] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_actio__versi__5B78929E].sql
GO
ALTER TABLE [dbo].[arg_actionlk] ADD CONSTRAINT [DF__arg_actio__versi__5B78929E] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_argde__versi__5E54FF49].sql
GO
ALTER TABLE [dbo].[arg_argdeflt] ADD CONSTRAINT [DF__arg_argde__versi__5E54FF49] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_asset__versi__61316BF4].sql
GO
ALTER TABLE [dbo].[arg_assetver] ADD CONSTRAINT [DF__arg_asset__versi__61316BF4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_attac__versi__640DD89F].sql
GO
ALTER TABLE [dbo].[arg_attachmt] ADD CONSTRAINT [DF__arg_attac__versi__640DD89F] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_attri__versi__66EA454A].sql
GO
ALTER TABLE [dbo].[arg_attribute_def] ADD CONSTRAINT [DF__arg_attri__versi__66EA454A] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_class__versi__69C6B1F5].sql
GO
ALTER TABLE [dbo].[arg_class_def] ADD CONSTRAINT [DF__arg_class__versi__69C6B1F5] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_contr__versi__6CA31EA0].sql
GO
ALTER TABLE [dbo].[arg_controls] ADD CONSTRAINT [DF__arg_contr__versi__6CA31EA0] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_costd__versi__6F7F8B4B].sql
GO
ALTER TABLE [dbo].[arg_costdet] ADD CONSTRAINT [DF__arg_costd__versi__6F7F8B4B] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_drpdn__versi__725BF7F6].sql
GO
ALTER TABLE [dbo].[arg_drpdnlst] ADD CONSTRAINT [DF__arg_drpdn__versi__725BF7F6] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_evdef__versi__753864A1].sql
GO
ALTER TABLE [dbo].[arg_evdefhdr] ADD CONSTRAINT [DF__arg_evdef__versi__753864A1] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_evdef__versi__7814D14C].sql
GO
ALTER TABLE [dbo].[arg_evdefny] ADD CONSTRAINT [DF__arg_evdef__versi__7814D14C] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_evnot__versi__7AF13DF7].sql
GO
ALTER TABLE [dbo].[arg_evnotify] ADD CONSTRAINT [DF__arg_evnot__versi__7AF13DF7] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_evrem__versi__7DCDAAA2].sql
GO
ALTER TABLE [dbo].[arg_evrem] ADD CONSTRAINT [DF__arg_evrem__versi__7DCDAAA2] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_exten__versi__00AA174D].sql
GO
ALTER TABLE [dbo].[arg_extension_rule_def] ADD CONSTRAINT [DF__arg_exten__versi__00AA174D] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_extsy__versi__038683F8].sql
GO
ALTER TABLE [dbo].[arg_extsys] ADD CONSTRAINT [DF__arg_extsy__versi__038683F8] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_field__versi__0662F0A3].sql
GO
ALTER TABLE [dbo].[arg_field_def] ADD CONSTRAINT [DF__arg_field__versi__0662F0A3] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_filtc__versi__093F5D4E].sql
GO
ALTER TABLE [dbo].[arg_filtcrit] ADD CONSTRAINT [DF__arg_filtc__versi__093F5D4E] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_filtd__versi__0C1BC9F9].sql
GO
ALTER TABLE [dbo].[arg_filtdata] ADD CONSTRAINT [DF__arg_filtd__versi__0C1BC9F9] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_filtd__versi__0EF836A4].sql
GO
ALTER TABLE [dbo].[arg_filtdef] ADD CONSTRAINT [DF__arg_filtd__versi__0EF836A4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_filti__versi__11D4A34F].sql
GO
ALTER TABLE [dbo].[arg_filtind] ADD CONSTRAINT [DF__arg_filti__versi__11D4A34F] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_histo__versi__14B10FFA].sql
GO
ALTER TABLE [dbo].[arg_history] ADD CONSTRAINT [DF__arg_histo__versi__14B10FFA] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_hsnot__versi__178D7CA5].sql
GO
ALTER TABLE [dbo].[arg_hsnotify] ADD CONSTRAINT [DF__arg_hsnot__versi__178D7CA5] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_hsrem__versi__1A69E950].sql
GO
ALTER TABLE [dbo].[arg_hsrem] ADD CONSTRAINT [DF__arg_hsrem__versi__1A69E950] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_index__versi__1D4655FB].sql
GO
ALTER TABLE [dbo].[arg_index_def] ADD CONSTRAINT [DF__arg_index__versi__1D4655FB] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_index__versi__2022C2A6].sql
GO
ALTER TABLE [dbo].[arg_index_member] ADD CONSTRAINT [DF__arg_index__versi__2022C2A6] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_intrf__versi__22FF2F51].sql
GO
ALTER TABLE [dbo].[arg_intrface] ADD CONSTRAINT [DF__arg_intrf__versi__22FF2F51] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_intxr__versi__25DB9BFC].sql
GO
ALTER TABLE [dbo].[arg_intxref] ADD CONSTRAINT [DF__arg_intxr__versi__25DB9BFC] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_itemv__versi__28B808A7].sql
GO
ALTER TABLE [dbo].[arg_itemver] ADD CONSTRAINT [DF__arg_itemv__versi__28B808A7] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF_arg_job_version_number].sql
GO
ALTER TABLE [dbo].[arg_job] ADD CONSTRAINT [DF_arg_job_version_number] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF_arg_job_task_version_number].sql
GO
ALTER TABLE [dbo].[arg_job_task] ADD CONSTRAINT [DF_arg_job_task_version_number] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_join___versi__2B947552].sql
GO
ALTER TABLE [dbo].[arg_join_def] ADD CONSTRAINT [DF__arg_join___versi__2B947552] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_join___versi__2E70E1FD].sql
GO
ALTER TABLE [dbo].[arg_join_member] ADD CONSTRAINT [DF__arg_join___versi__2E70E1FD] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_keyde__versi__314D4EA8].sql
GO
ALTER TABLE [dbo].[arg_keydef] ADD CONSTRAINT [DF__arg_keyde__versi__314D4EA8] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_keywo__versi__3429BB53].sql
GO
ALTER TABLE [dbo].[arg_keyword] ADD CONSTRAINT [DF__arg_keywo__versi__3429BB53] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_legal__versi__370627FE].sql
GO
ALTER TABLE [dbo].[arg_legaldef] ADD CONSTRAINT [DF__arg_legal__versi__370627FE] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_legal__versi__39E294A9].sql
GO
ALTER TABLE [dbo].[arg_legaldet] ADD CONSTRAINT [DF__arg_legal__versi__39E294A9] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_legal__versi__3CBF0154].sql
GO
ALTER TABLE [dbo].[arg_legaldoc] ADD CONSTRAINT [DF__arg_legal__versi__3CBF0154] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_legal__versi__3F9B6DFF].sql
GO
ALTER TABLE [dbo].[arg_legalpar] ADD CONSTRAINT [DF__arg_legal__versi__3F9B6DFF] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_legas__versi__4277DAAA].sql
GO
ALTER TABLE [dbo].[arg_legasset] ADD CONSTRAINT [DF__arg_legas__versi__4277DAAA] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_legas__versi__45544755].sql
GO
ALTER TABLE [dbo].[arg_legasstc] ADD CONSTRAINT [DF__arg_legas__versi__45544755] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_linkd__versi__4830B400].sql
GO
ALTER TABLE [dbo].[arg_linkdef] ADD CONSTRAINT [DF__arg_linkd__versi__4830B400] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_listd__versi__4B0D20AB].sql
GO
ALTER TABLE [dbo].[arg_listdef] ADD CONSTRAINT [DF__arg_listd__versi__4B0D20AB] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_ltcde__versi__4DE98D56].sql
GO
ALTER TABLE [dbo].[arg_ltcdef] ADD CONSTRAINT [DF__arg_ltcde__versi__4DE98D56] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_map__version__50C5FA01].sql
GO
ALTER TABLE [dbo].[arg_map] ADD CONSTRAINT [DF__arg_map__version__50C5FA01] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_map_d__versi__53A266AC].sql
GO
ALTER TABLE [dbo].[arg_map_db] ADD CONSTRAINT [DF__arg_map_d__versi__53A266AC] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_note___versi__567ED357].sql
GO
ALTER TABLE [dbo].[arg_note_text] ADD CONSTRAINT [DF__arg_note___versi__567ED357] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_notes__versi__595B4002].sql
GO
ALTER TABLE [dbo].[arg_notes] ADD CONSTRAINT [DF__arg_notes__versi__595B4002] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_payde__versi__5C37ACAD].sql
GO
ALTER TABLE [dbo].[arg_paydet] ADD CONSTRAINT [DF__arg_payde__versi__5C37ACAD] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_query__versi__5F141958].sql
GO
ALTER TABLE [dbo].[arg_query_assignment] ADD CONSTRAINT [DF__arg_query__versi__5F141958] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_query__versi__61F08603].sql
GO
ALTER TABLE [dbo].[arg_query_def] ADD CONSTRAINT [DF__arg_query__versi__61F08603] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_recon__versi__64CCF2AE].sql
GO
ALTER TABLE [dbo].[arg_reconcile_data] ADD CONSTRAINT [DF__arg_recon__versi__64CCF2AE] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_recon__versi__67A95F59].sql
GO
ALTER TABLE [dbo].[arg_reconcile_modification] ADD CONSTRAINT [DF__arg_recon__versi__67A95F59] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_recon__versi__6A85CC04].sql
GO
ALTER TABLE [dbo].[arg_reconcile_msg_queue] ADD CONSTRAINT [DF__arg_recon__versi__6A85CC04] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_recon__versi__6D6238AF].sql
GO
ALTER TABLE [dbo].[arg_reconcile_rule] ADD CONSTRAINT [DF__arg_recon__versi__6D6238AF] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_recon__versi__703EA55A].sql
GO
ALTER TABLE [dbo].[arg_reconcile_task] ADD CONSTRAINT [DF__arg_recon__versi__703EA55A] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_roled__versi__731B1205].sql
GO
ALTER TABLE [dbo].[arg_roledef] ADD CONSTRAINT [DF__arg_roled__versi__731B1205] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_scrip__versi__75F77EB0].sql
GO
ALTER TABLE [dbo].[arg_script] ADD CONSTRAINT [DF__arg_scrip__versi__75F77EB0] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_secur__versi__78D3EB5B].sql
GO
ALTER TABLE [dbo].[arg_security] ADD CONSTRAINT [DF__arg_secur__versi__78D3EB5B] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_stath__versi__7BB05806].sql
GO
ALTER TABLE [dbo].[arg_stathist] ADD CONSTRAINT [DF__arg_stath__versi__7BB05806] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_strls__versi__7E8CC4B1].sql
GO
ALTER TABLE [dbo].[arg_strlst] ADD CONSTRAINT [DF__arg_strls__versi__7E8CC4B1] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_table__versi__0169315C].sql
GO
ALTER TABLE [dbo].[arg_table_def] ADD CONSTRAINT [DF__arg_table__versi__0169315C] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_tclgd__versi__04459E07].sql
GO
ALTER TABLE [dbo].[arg_tclgdef] ADD CONSTRAINT [DF__arg_tclgd__versi__04459E07] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_trans__versi__07220AB2].sql
GO
ALTER TABLE [dbo].[arg_translation_list] ADD CONSTRAINT [DF__arg_trans__versi__07220AB2] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_xmlca__versi__09FE775D].sql
GO
ALTER TABLE [dbo].[arg_xmlcache_in] ADD CONSTRAINT [DF__arg_xmlca__versi__09FE775D] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__arg_xmlca__versi__0CDAE408].sql
GO
ALTER TABLE [dbo].[arg_xmlcache_ss] ADD CONSTRAINT [DF__arg_xmlca__versi__0CDAE408] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__asmo_rpt__config__1758727B].sql
GO
ALTER TABLE [dbo].[asmo_rpt] ADD CONSTRAINT [DF__asmo_rpt__config__1758727B] DEFAULT (NULL) FOR [config_file]
GO
--SqlScripter----[dbo].[DF__asmo_rpt__new_st__184C96B4].sql
GO
ALTER TABLE [dbo].[asmo_rpt] ADD CONSTRAINT [DF__asmo_rpt__new_st__184C96B4] DEFAULT (NULL) FOR [new_state_id]
GO
--SqlScripter----[dbo].[DF__asmo_rpt__new_va__1A34DF26].sql
GO
ALTER TABLE [dbo].[asmo_rpt] ADD CONSTRAINT [DF__asmo_rpt__new_va__1A34DF26] DEFAULT (0) FOR [new_value]
GO
--SqlScripter----[dbo].[DF__asmo_rpt__old_va__1940BAED].sql
GO
ALTER TABLE [dbo].[asmo_rpt] ADD CONSTRAINT [DF__asmo_rpt__old_va__1940BAED] DEFAULT (0) FOR [old_value]
GO
--SqlScripter----[dbo].[DF__asmo_rpt__target__1B29035F].sql
GO
ALTER TABLE [dbo].[asmo_rpt] ADD CONSTRAINT [DF__asmo_rpt__target__1B29035F] DEFAULT (NULL) FOR [target_location]
GO
--SqlScripter----[dbo].[DF__asmo_task__retur__23BE4960].sql
GO
ALTER TABLE [dbo].[asmo_tasks] ADD CONSTRAINT [DF__asmo_task__retur__23BE4960] DEFAULT (NULL) FOR [return_code]
GO
--SqlScripter----[dbo].[DF__asmo_task__task___21D600EE].sql
GO
ALTER TABLE [dbo].[asmo_tasks] ADD CONSTRAINT [DF__asmo_task__task___21D600EE] DEFAULT (NULL) FOR [task_occurence]
GO
--SqlScripter----[dbo].[DF__asmo_task__time___22CA2527].sql
GO
ALTER TABLE [dbo].[asmo_tasks] ADD CONSTRAINT [DF__asmo_task__time___22CA2527] DEFAULT (NULL) FOR [time_completed]
GO
--SqlScripter----[dbo].[DF__assignmen__lastc__5952B50F].sql
GO
ALTER TABLE [dbo].[assignments] ADD CONSTRAINT [DF__assignmen__lastc__5952B50F] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__backup_po__file___182EFD28].sql
GO
ALTER TABLE [dbo].[backup_policy] ADD CONSTRAINT [DF__backup_po__file___182EFD28] DEFAULT (0) FOR [file_retention_time]
GO
--SqlScripter----[dbo].[DF__backup_po__file___19232161].sql
GO
ALTER TABLE [dbo].[backup_policy] ADD CONSTRAINT [DF__backup_po__file___19232161] DEFAULT (0) FOR [file_rev_retention_time]
GO
--SqlScripter----[dbo].[DF__backup_re__backu__76B698BF].sql
GO
ALTER TABLE [dbo].[backup_restored_file] ADD CONSTRAINT [DF__backup_re__backu__76B698BF] DEFAULT (0) FOR [backup_run_date]
GO
--SqlScripter----[dbo].[DF__bckdef__auto_ser__20ACD28B].sql
GO
ALTER TABLE [dbo].[bckdef] ADD CONSTRAINT [DF__bckdef__auto_ser__20ACD28B] DEFAULT (0) FOR [auto_server_version]
GO
--SqlScripter----[dbo].[DF__ca_agent__auto_s__4119A21D].sql
GO
ALTER TABLE [dbo].[ca_agent] ADD CONSTRAINT [DF__ca_agent__auto_s__4119A21D] DEFAULT (0) FOR [auto_server_version]
GO
--SqlScripter----[dbo].[DF__ca_agent__derive__420DC656].sql
GO
ALTER TABLE [dbo].[ca_agent] ADD CONSTRAINT [DF__ca_agent__derive__420DC656] DEFAULT (0) FOR [derived_status_am]
GO
--SqlScripter----[dbo].[DF__ca_agent__derive__4301EA8F].sql
GO
ALTER TABLE [dbo].[ca_agent] ADD CONSTRAINT [DF__ca_agent__derive__4301EA8F] DEFAULT (0) FOR [derived_status_sd]
GO
--SqlScripter----[dbo].[DF__ca_agent__derive__43F60EC8].sql
GO
ALTER TABLE [dbo].[ca_agent] ADD CONSTRAINT [DF__ca_agent__derive__43F60EC8] DEFAULT (0) FOR [derived_status_rc]
GO
--SqlScripter----[dbo].[DF__ca_agent__derive__44EA3301].sql
GO
ALTER TABLE [dbo].[ca_agent] ADD CONSTRAINT [DF__ca_agent__derive__44EA3301] DEFAULT (0) FOR [derived_status_babld]
GO
--SqlScripter----[dbo].[DF__ca_agent__versio__40257DE4].sql
GO
ALTER TABLE [dbo].[ca_agent] ADD CONSTRAINT [DF__ca_agent__versio__40257DE4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_applic__insta__49AEE81E].sql
GO
ALTER TABLE [dbo].[ca_application_registration] ADD CONSTRAINT [DF__ca_applic__insta__49AEE81E] DEFAULT (0) FOR [install_count]
GO
--SqlScripter----[dbo].[DF__ca_asset__versio__4C8B54C9].sql
GO
ALTER TABLE [dbo].[ca_asset] ADD CONSTRAINT [DF__ca_asset__versio__4C8B54C9] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_asset___versi__515009E6].sql
GO
ALTER TABLE [dbo].[ca_asset_source] ADD CONSTRAINT [DF__ca_asset___versi__515009E6] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_asset___versi__542C7691].sql
GO
ALTER TABLE [dbo].[ca_asset_source_location] ADD CONSTRAINT [DF__ca_asset___versi__542C7691] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_asset___versi__5708E33C].sql
GO
ALTER TABLE [dbo].[ca_asset_subschema] ADD CONSTRAINT [DF__ca_asset___versi__5708E33C] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_asset___versi__59E54FE7].sql
GO
ALTER TABLE [dbo].[ca_asset_type] ADD CONSTRAINT [DF__ca_asset___versi__59E54FE7] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_capaci__inact__5CC1BC92].sql
GO
ALTER TABLE [dbo].[ca_capacity_unit] ADD CONSTRAINT [DF__ca_capaci__inact__5CC1BC92] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_capaci__versi__5DB5E0CB].sql
GO
ALTER TABLE [dbo].[ca_capacity_unit] ADD CONSTRAINT [DF__ca_capaci__versi__5DB5E0CB] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_catego__sourc__618671AF].sql
GO
ALTER TABLE [dbo].[ca_category_def] ADD CONSTRAINT [DF__ca_catego__sourc__618671AF] DEFAULT (1) FOR [source_type_id]
GO
--SqlScripter----[dbo].[DF__ca_catego__versi__60924D76].sql
GO
ALTER TABLE [dbo].[ca_category_def] ADD CONSTRAINT [DF__ca_catego__versi__60924D76] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_catego__sourc__65570293].sql
GO
ALTER TABLE [dbo].[ca_category_member] ADD CONSTRAINT [DF__ca_catego__sourc__65570293] DEFAULT (1) FOR [source_type_id]
GO
--SqlScripter----[dbo].[DF__ca_catego__versi__6462DE5A].sql
GO
ALTER TABLE [dbo].[ca_category_member] ADD CONSTRAINT [DF__ca_catego__versi__6462DE5A] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_compan__inact__6DEC4894].sql
GO
ALTER TABLE [dbo].[ca_company] ADD CONSTRAINT [DF__ca_compan__inact__6DEC4894] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_compan__sourc__6FD49106].sql
GO
ALTER TABLE [dbo].[ca_company] ADD CONSTRAINT [DF__ca_compan__sourc__6FD49106] DEFAULT (0) FOR [source_type_id]
GO
--SqlScripter----[dbo].[DF__ca_compan__versi__6EE06CCD].sql
GO
ALTER TABLE [dbo].[ca_company] ADD CONSTRAINT [DF__ca_compan__versi__6EE06CCD] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_compan__inact__72B0FDB1].sql
GO
ALTER TABLE [dbo].[ca_company_type] ADD CONSTRAINT [DF__ca_compan__inact__72B0FDB1] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_compan__versi__74994623].sql
GO
ALTER TABLE [dbo].[ca_company_type] ADD CONSTRAINT [DF__ca_compan__versi__74994623] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_company__name__73A521EA].sql
GO
ALTER TABLE [dbo].[ca_company_type] ADD CONSTRAINT [DF__ca_company__name__73A521EA] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_config__versi__7775B2CE].sql
GO
ALTER TABLE [dbo].[ca_config_item] ADD CONSTRAINT [DF__ca_config__versi__7775B2CE] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_contac__inact__7C3A67EB].sql
GO
ALTER TABLE [dbo].[ca_contact] ADD CONSTRAINT [DF__ca_contac__inact__7C3A67EB] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_contac__versi__7D2E8C24].sql
GO
ALTER TABLE [dbo].[ca_contact] ADD CONSTRAINT [DF__ca_contac__versi__7D2E8C24] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_contac__inact__000AF8CF].sql
GO
ALTER TABLE [dbo].[ca_contact_type] ADD CONSTRAINT [DF__ca_contac__inact__000AF8CF] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_contac__versi__01F34141].sql
GO
ALTER TABLE [dbo].[ca_contact_type] ADD CONSTRAINT [DF__ca_contac__versi__01F34141] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_contact__name__00FF1D08].sql
GO
ALTER TABLE [dbo].[ca_contact_type] ADD CONSTRAINT [DF__ca_contact__name__00FF1D08] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_countr__inact__04CFADEC].sql
GO
ALTER TABLE [dbo].[ca_country] ADD CONSTRAINT [DF__ca_countr__inact__04CFADEC] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_countr__versi__06B7F65E].sql
GO
ALTER TABLE [dbo].[ca_country] ADD CONSTRAINT [DF__ca_countr__versi__06B7F65E] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_country__name__05C3D225].sql
GO
ALTER TABLE [dbo].[ca_country] ADD CONSTRAINT [DF__ca_country__name__05C3D225] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_curren__symbo__09946309].sql
GO
ALTER TABLE [dbo].[ca_currency_type] ADD CONSTRAINT [DF__ca_curren__symbo__09946309] DEFAULT ('$') FOR [symbol]
GO
--SqlScripter----[dbo].[DF__ca_direct__versi__0C70CFB4].sql
GO
ALTER TABLE [dbo].[ca_directory_details] ADD CONSTRAINT [DF__ca_direct__versi__0C70CFB4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_direct__versi__0F4D3C5F].sql
GO
ALTER TABLE [dbo].[ca_directory_schema_map] ADD CONSTRAINT [DF__ca_direct__versi__0F4D3C5F] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_disc_e__event__1229A90A].sql
GO
ALTER TABLE [dbo].[ca_disc_event] ADD CONSTRAINT [DF__ca_disc_e__event__1229A90A] DEFAULT (0) FOR [event_index]
GO
--SqlScripter----[dbo].[DF__ca_disc_e__event__131DCD43].sql
GO
ALTER TABLE [dbo].[ca_disc_event] ADD CONSTRAINT [DF__ca_disc_e__event__131DCD43] DEFAULT (0) FOR [event_date]
GO
--SqlScripter----[dbo].[DF__ca_discov__class__16EE5E27].sql
GO
ALTER TABLE [dbo].[ca_discovered_hardware] ADD CONSTRAINT [DF__ca_discov__class__16EE5E27] DEFAULT (0) FOR [class_id]
GO
--SqlScripter----[dbo].[DF__ca_discov__disco__17E28260].sql
GO
ALTER TABLE [dbo].[ca_discovered_hardware] ADD CONSTRAINT [DF__ca_discov__disco__17E28260] DEFAULT (0) FOR [discovery_changes_switch]
GO
--SqlScripter----[dbo].[DF__ca_discov__versi__15FA39EE].sql
GO
ALTER TABLE [dbo].[ca_discovered_hardware] ADD CONSTRAINT [DF__ca_discov__versi__15FA39EE] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_discov__versi__1ABEEF0B].sql
GO
ALTER TABLE [dbo].[ca_discovered_hardware_ext_sys] ADD CONSTRAINT [DF__ca_discov__versi__1ABEEF0B] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_discov__versi__1F83A428].sql
GO
ALTER TABLE [dbo].[ca_discovered_software] ADD CONSTRAINT [DF__ca_discov__versi__1F83A428] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_discov__versi__226010D3].sql
GO
ALTER TABLE [dbo].[ca_discovered_software_prop] ADD CONSTRAINT [DF__ca_discov__versi__226010D3] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_discov__versi__253C7D7E].sql
GO
ALTER TABLE [dbo].[ca_discovered_user] ADD CONSTRAINT [DF__ca_discov__versi__253C7D7E] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_docume__versi__2818EA29].sql
GO
ALTER TABLE [dbo].[ca_document] ADD CONSTRAINT [DF__ca_docume__versi__2818EA29] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_downlo__is_ac__2AF556D4].sql
GO
ALTER TABLE [dbo].[ca_download_file] ADD CONSTRAINT [DF__ca_downlo__is_ac__2AF556D4] DEFAULT (1) FOR [is_active]
GO
--SqlScripter----[dbo].[DF__ca_engine__versi__3943762B].sql
GO
ALTER TABLE [dbo].[ca_engine] ADD CONSTRAINT [DF__ca_engine__versi__3943762B] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_geo_co__inact__3C1FE2D6].sql
GO
ALTER TABLE [dbo].[ca_geo_coord_type] ADD CONSTRAINT [DF__ca_geo_co__inact__3C1FE2D6] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_geo_co__versi__3D14070F].sql
GO
ALTER TABLE [dbo].[ca_geo_coord_type] ADD CONSTRAINT [DF__ca_geo_co__versi__3D14070F] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_group___objec__3FF073BA].sql
GO
ALTER TABLE [dbo].[ca_group_ace] ADD CONSTRAINT [DF__ca_group___objec__3FF073BA] DEFAULT (1005) FOR [object_type]
GO
--SqlScripter----[dbo].[DF__ca_group___secur__4580C68C].sql
GO
ALTER TABLE [dbo].[ca_group_ace] ADD CONSTRAINT [DF__ca_group___secur__4580C68C] DEFAULT (0) FOR [security_level]
GO
--SqlScripter----[dbo].[DF__ca_group___versi__42CCE065].sql
GO
ALTER TABLE [dbo].[ca_group_def] ADD CONSTRAINT [DF__ca_group___versi__42CCE065] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_group___versi__45A94D10].sql
GO
ALTER TABLE [dbo].[ca_group_member] ADD CONSTRAINT [DF__ca_group___versi__45A94D10] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_instal__is_ac__4C564A9F].sql
GO
ALTER TABLE [dbo].[ca_install_package] ADD CONSTRAINT [DF__ca_instal__is_ac__4C564A9F] DEFAULT (1) FOR [is_active]
GO
--SqlScripter----[dbo].[DF__ca_instal__pmode__23A0AFD4].sql
GO
ALTER TABLE [dbo].[ca_install_package] ADD CONSTRAINT [DF__ca_instal__pmode__23A0AFD4] DEFAULT (0) FOR [pmode]
GO
--SqlScripter----[dbo].[DF__ca_instal__is_ac__4F32B74A].sql
GO
ALTER TABLE [dbo].[ca_install_step] ADD CONSTRAINT [DF__ca_instal__is_ac__4F32B74A] DEFAULT (1) FOR [is_active]
GO
--SqlScripter----[dbo].[DF__ca_job_fu__inact__520F23F5].sql
GO
ALTER TABLE [dbo].[ca_job_function] ADD CONSTRAINT [DF__ca_job_fu__inact__520F23F5] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_job_fu__versi__53F76C67].sql
GO
ALTER TABLE [dbo].[ca_job_function] ADD CONSTRAINT [DF__ca_job_fu__versi__53F76C67] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_job_fun__name__5303482E].sql
GO
ALTER TABLE [dbo].[ca_job_function] ADD CONSTRAINT [DF__ca_job_fun__name__5303482E] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_job_ti__inact__56D3D912].sql
GO
ALTER TABLE [dbo].[ca_job_title] ADD CONSTRAINT [DF__ca_job_ti__inact__56D3D912] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_job_ti__versi__58BC2184].sql
GO
ALTER TABLE [dbo].[ca_job_title] ADD CONSTRAINT [DF__ca_job_ti__versi__58BC2184] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_job_tit__name__57C7FD4B].sql
GO
ALTER TABLE [dbo].[ca_job_title] ADD CONSTRAINT [DF__ca_job_tit__name__57C7FD4B] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_licens__inact__5F691F13].sql
GO
ALTER TABLE [dbo].[ca_license_type] ADD CONSTRAINT [DF__ca_licens__inact__5F691F13] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_licens__versi__605D434C].sql
GO
ALTER TABLE [dbo].[ca_license_type] ADD CONSTRAINT [DF__ca_licens__versi__605D434C] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_c__versi__6339AFF7].sql
GO
ALTER TABLE [dbo].[ca_link_company_location] ADD CONSTRAINT [DF__ca_link_c__versi__6339AFF7] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_c__versi__66161CA2].sql
GO
ALTER TABLE [dbo].[ca_link_config_item] ADD CONSTRAINT [DF__ca_link_c__versi__66161CA2] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_c__versi__68F2894D].sql
GO
ALTER TABLE [dbo].[ca_link_config_item_doc] ADD CONSTRAINT [DF__ca_link_c__versi__68F2894D] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_c__versi__6BCEF5F8].sql
GO
ALTER TABLE [dbo].[ca_link_configured_service] ADD CONSTRAINT [DF__ca_link_c__versi__6BCEF5F8] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_c__versi__6EAB62A3].sql
GO
ALTER TABLE [dbo].[ca_link_contact_user] ADD CONSTRAINT [DF__ca_link_c__versi__6EAB62A3] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_d__versi__7187CF4E].sql
GO
ALTER TABLE [dbo].[ca_link_dir_details_map] ADD CONSTRAINT [DF__ca_link_d__versi__7187CF4E] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_d__versi__74643BF9].sql
GO
ALTER TABLE [dbo].[ca_link_dis_hw] ADD CONSTRAINT [DF__ca_link_d__versi__74643BF9] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_d__versi__7740A8A4].sql
GO
ALTER TABLE [dbo].[ca_link_dis_hw_user] ADD CONSTRAINT [DF__ca_link_d__versi__7740A8A4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_d__versi__7A1D154F].sql
GO
ALTER TABLE [dbo].[ca_link_dis_user_sec_profile] ADD CONSTRAINT [DF__ca_link_d__versi__7A1D154F] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_l__versi__7EE1CA6C].sql
GO
ALTER TABLE [dbo].[ca_link_license_sw_def] ADD CONSTRAINT [DF__ca_link_l__versi__7EE1CA6C] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_m__versi__03A67F89].sql
GO
ALTER TABLE [dbo].[ca_link_model_sw_def] ADD CONSTRAINT [DF__ca_link_m__versi__03A67F89] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_n__versi__0682EC34].sql
GO
ALTER TABLE [dbo].[ca_link_named_config_doc] ADD CONSTRAINT [DF__ca_link_n__versi__0682EC34] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_n__versi__095F58DF].sql
GO
ALTER TABLE [dbo].[ca_link_named_config_item] ADD CONSTRAINT [DF__ca_link_n__versi__095F58DF] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_o__versi__0C3BC58A].sql
GO
ALTER TABLE [dbo].[ca_link_object_owner] ADD CONSTRAINT [DF__ca_link_o__versi__0C3BC58A] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_s__versi__0F183235].sql
GO
ALTER TABLE [dbo].[ca_link_sw_def] ADD CONSTRAINT [DF__ca_link_s__versi__0F183235] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_link_t__versi__11F49EE0].sql
GO
ALTER TABLE [dbo].[ca_link_type] ADD CONSTRAINT [DF__ca_link_t__versi__11F49EE0] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_locati__inact__17AD7836].sql
GO
ALTER TABLE [dbo].[ca_location] ADD CONSTRAINT [DF__ca_locati__inact__17AD7836] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_locati__locat__16B953FD].sql
GO
ALTER TABLE [dbo].[ca_location] ADD CONSTRAINT [DF__ca_locati__locat__16B953FD] DEFAULT (' ') FOR [location_name]
GO
--SqlScripter----[dbo].[DF__ca_locati__versi__18A19C6F].sql
GO
ALTER TABLE [dbo].[ca_location] ADD CONSTRAINT [DF__ca_locati__versi__18A19C6F] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_locati__inact__1B7E091A].sql
GO
ALTER TABLE [dbo].[ca_location_type] ADD CONSTRAINT [DF__ca_locati__inact__1B7E091A] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_locati__versi__1D66518C].sql
GO
ALTER TABLE [dbo].[ca_location_type] ADD CONSTRAINT [DF__ca_locati__versi__1D66518C] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_locatio__name__1C722D53].sql
GO
ALTER TABLE [dbo].[ca_location_type] ADD CONSTRAINT [DF__ca_locatio__name__1C722D53] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_logica__versi__2042BE37].sql
GO
ALTER TABLE [dbo].[ca_logical_asset] ADD CONSTRAINT [DF__ca_logica__versi__2042BE37] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_logica__versi__231F2AE2].sql
GO
ALTER TABLE [dbo].[ca_logical_asset_property] ADD CONSTRAINT [DF__ca_logica__versi__231F2AE2] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_manage__versi__25FB978D].sql
GO
ALTER TABLE [dbo].[ca_manager] ADD CONSTRAINT [DF__ca_manage__versi__25FB978D] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_manage__disab__29CC2871].sql
GO
ALTER TABLE [dbo].[ca_manager_component] ADD CONSTRAINT [DF__ca_manage__disab__29CC2871] DEFAULT (0) FOR [disabled]
GO
--SqlScripter----[dbo].[DF__ca_manage__versi__28D80438].sql
GO
ALTER TABLE [dbo].[ca_manager_component] ADD CONSTRAINT [DF__ca_manage__versi__28D80438] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_model___inact__2CA8951C].sql
GO
ALTER TABLE [dbo].[ca_model_def] ADD CONSTRAINT [DF__ca_model___inact__2CA8951C] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_model___versi__2E90DD8E].sql
GO
ALTER TABLE [dbo].[ca_model_def] ADD CONSTRAINT [DF__ca_model___versi__2E90DD8E] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_model_d__name__2D9CB955].sql
GO
ALTER TABLE [dbo].[ca_model_def] ADD CONSTRAINT [DF__ca_model_d__name__2D9CB955] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_n_tier__versi__316D4A39].sql
GO
ALTER TABLE [dbo].[ca_n_tier] ADD CONSTRAINT [DF__ca_n_tier__versi__316D4A39] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_named___versi__3449B6E4].sql
GO
ALTER TABLE [dbo].[ca_named_configuration] ADD CONSTRAINT [DF__ca_named___versi__3449B6E4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_organi__inact__3A02903A].sql
GO
ALTER TABLE [dbo].[ca_organization] ADD CONSTRAINT [DF__ca_organi__inact__3A02903A] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_organi__org_n__390E6C01].sql
GO
ALTER TABLE [dbo].[ca_organization] ADD CONSTRAINT [DF__ca_organi__org_n__390E6C01] DEFAULT (' ') FOR [org_name]
GO
--SqlScripter----[dbo].[DF__ca_organi__versi__3AF6B473].sql
GO
ALTER TABLE [dbo].[ca_organization] ADD CONSTRAINT [DF__ca_organi__versi__3AF6B473] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_owned___asset__3EC74557].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] ADD CONSTRAINT [DF__ca_owned___asset__3EC74557] DEFAULT (1) FOR [asset_type_id]
GO
--SqlScripter----[dbo].[DF__ca_owned___inact__3DD3211E].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] ADD CONSTRAINT [DF__ca_owned___inact__3DD3211E] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_owned___resou__3FBB6990].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] ADD CONSTRAINT [DF__ca_owned___resou__3FBB6990] DEFAULT (0) FOR [resource_class]
GO
--SqlScripter----[dbo].[DF__ca_owned___versi__41A3B202].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] ADD CONSTRAINT [DF__ca_owned___versi__41A3B202] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_owned_r__ufam__40AF8DC9].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] ADD CONSTRAINT [DF__ca_owned_r__ufam__40AF8DC9] DEFAULT (0) FOR [ufam]
GO
--SqlScripter----[dbo].[DF__ca_query___versi__475C8B58].sql
GO
ALTER TABLE [dbo].[ca_query_def] ADD CONSTRAINT [DF__ca_query___versi__475C8B58] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_query___versi__49BB6BC4].sql
GO
ALTER TABLE [dbo].[ca_query_def_contents] ADD CONSTRAINT [DF__ca_query___versi__49BB6BC4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_query___versi__4EFDAD20].sql
GO
ALTER TABLE [dbo].[ca_query_result] ADD CONSTRAINT [DF__ca_query___versi__4EFDAD20] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_query___versi__51DA19CB].sql
GO
ALTER TABLE [dbo].[ca_query_version] ADD CONSTRAINT [DF__ca_query___versi__51DA19CB] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_replic__versi__5A6F5FCC].sql
GO
ALTER TABLE [dbo].[ca_replication_conf] ADD CONSTRAINT [DF__ca_replic__versi__5A6F5FCC] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_resour__inact__65E11278].sql
GO
ALTER TABLE [dbo].[ca_resource_class] ADD CONSTRAINT [DF__ca_resour__inact__65E11278] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_resour__versi__67C95AEA].sql
GO
ALTER TABLE [dbo].[ca_resource_class] ADD CONSTRAINT [DF__ca_resour__versi__67C95AEA] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_resourc__name__66D536B1].sql
GO
ALTER TABLE [dbo].[ca_resource_class] ADD CONSTRAINT [DF__ca_resourc__name__66D536B1] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_resour__inact__6AA5C795].sql
GO
ALTER TABLE [dbo].[ca_resource_cost_center] ADD CONSTRAINT [DF__ca_resour__inact__6AA5C795] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_resour__versi__6C8E1007].sql
GO
ALTER TABLE [dbo].[ca_resource_cost_center] ADD CONSTRAINT [DF__ca_resour__versi__6C8E1007] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_resourc__name__6B99EBCE].sql
GO
ALTER TABLE [dbo].[ca_resource_cost_center] ADD CONSTRAINT [DF__ca_resourc__name__6B99EBCE] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_resour__inact__6F6A7CB2].sql
GO
ALTER TABLE [dbo].[ca_resource_department] ADD CONSTRAINT [DF__ca_resour__inact__6F6A7CB2] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_resour__versi__7152C524].sql
GO
ALTER TABLE [dbo].[ca_resource_department] ADD CONSTRAINT [DF__ca_resour__versi__7152C524] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_resourc__name__705EA0EB].sql
GO
ALTER TABLE [dbo].[ca_resource_department] ADD CONSTRAINT [DF__ca_resourc__name__705EA0EB] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_resour__inact__742F31CF].sql
GO
ALTER TABLE [dbo].[ca_resource_family] ADD CONSTRAINT [DF__ca_resour__inact__742F31CF] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_resour__inclu__770B9E7A].sql
GO
ALTER TABLE [dbo].[ca_resource_family] ADD CONSTRAINT [DF__ca_resour__inclu__770B9E7A] DEFAULT (0) FOR [include_reconciliation]
GO
--SqlScripter----[dbo].[DF__ca_resour__versi__76177A41].sql
GO
ALTER TABLE [dbo].[ca_resource_family] ADD CONSTRAINT [DF__ca_resour__versi__76177A41] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_resourc__name__75235608].sql
GO
ALTER TABLE [dbo].[ca_resource_family] ADD CONSTRAINT [DF__ca_resourc__name__75235608] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_resour__inact__79E80B25].sql
GO
ALTER TABLE [dbo].[ca_resource_gl_code] ADD CONSTRAINT [DF__ca_resour__inact__79E80B25] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_resour__versi__7BD05397].sql
GO
ALTER TABLE [dbo].[ca_resource_gl_code] ADD CONSTRAINT [DF__ca_resour__versi__7BD05397] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_resourc__name__7ADC2F5E].sql
GO
ALTER TABLE [dbo].[ca_resource_gl_code] ADD CONSTRAINT [DF__ca_resourc__name__7ADC2F5E] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_resour__inact__7EACC042].sql
GO
ALTER TABLE [dbo].[ca_resource_operating_system] ADD CONSTRAINT [DF__ca_resour__inact__7EACC042] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_resour__versi__009508B4].sql
GO
ALTER TABLE [dbo].[ca_resource_operating_system] ADD CONSTRAINT [DF__ca_resour__versi__009508B4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_resourc__name__7FA0E47B].sql
GO
ALTER TABLE [dbo].[ca_resource_operating_system] ADD CONSTRAINT [DF__ca_resourc__name__7FA0E47B] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_resour__inact__04659998].sql
GO
ALTER TABLE [dbo].[ca_resource_status] ADD CONSTRAINT [DF__ca_resour__inact__04659998] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_resour__versi__064DE20A].sql
GO
ALTER TABLE [dbo].[ca_resource_status] ADD CONSTRAINT [DF__ca_resour__versi__064DE20A] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_resourc__name__0559BDD1].sql
GO
ALTER TABLE [dbo].[ca_resource_status] ADD CONSTRAINT [DF__ca_resourc__name__0559BDD1] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_sdi_ti__ticke__092A4EB5].sql
GO
ALTER TABLE [dbo].[ca_sdi_ticket] ADD CONSTRAINT [DF__ca_sdi_ti__ticke__092A4EB5] DEFAULT (0) FOR [ticket_status]
GO
--SqlScripter----[dbo].[DF__ca_sdi_ti__versi__0A1E72EE].sql
GO
ALTER TABLE [dbo].[ca_sdi_ticket] ADD CONSTRAINT [DF__ca_sdi_ti__versi__0A1E72EE] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_securi__area___5478F159].sql
GO
ALTER TABLE [dbo].[ca_security_profile] ADD CONSTRAINT [DF__ca_securi__area___5478F159] DEFAULT (-1) FOR [area_ace]
GO
--SqlScripter----[dbo].[DF__ca_securi__area___556D1592].sql
GO
ALTER TABLE [dbo].[ca_security_profile] ADD CONSTRAINT [DF__ca_securi__area___556D1592] DEFAULT (0) FOR [area_enabled]
GO
--SqlScripter----[dbo].[DF__ca_securi__build__0EE3280B].sql
GO
ALTER TABLE [dbo].[ca_security_profile] ADD CONSTRAINT [DF__ca_securi__build__0EE3280B] DEFAULT (0) FOR [buildin_profile]
GO
--SqlScripter----[dbo].[DF__ca_server__versi__11BF94B6].sql
GO
ALTER TABLE [dbo].[ca_server] ADD CONSTRAINT [DF__ca_server__versi__11BF94B6] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_server__versi__149C0161].sql
GO
ALTER TABLE [dbo].[ca_server_component] ADD CONSTRAINT [DF__ca_server__versi__149C0161] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_site__inactiv__1D314762].sql
GO
ALTER TABLE [dbo].[ca_site] ADD CONSTRAINT [DF__ca_site__inactiv__1D314762] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_site__name__1E256B9B].sql
GO
ALTER TABLE [dbo].[ca_site] ADD CONSTRAINT [DF__ca_site__name__1E256B9B] DEFAULT (' ') FOR [name]
GO
--SqlScripter----[dbo].[DF__ca_site__version__1F198FD4].sql
GO
ALTER TABLE [dbo].[ca_site] ADD CONSTRAINT [DF__ca_site__version__1F198FD4] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_softwa__filte__23DE44F1].sql
GO
ALTER TABLE [dbo].[ca_software_def] ADD CONSTRAINT [DF__ca_softwa__filte__23DE44F1] DEFAULT (0) FOR [filter_from_view]
GO
--SqlScripter----[dbo].[DF__ca_softwa__is_ac__22EA20B8].sql
GO
ALTER TABLE [dbo].[ca_software_def] ADD CONSTRAINT [DF__ca_softwa__is_ac__22EA20B8] DEFAULT (1) FOR [is_active]
GO
--SqlScripter----[dbo].[DF__ca_softwa__versi__21F5FC7F].sql
GO
ALTER TABLE [dbo].[ca_software_def] ADD CONSTRAINT [DF__ca_softwa__versi__21F5FC7F] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_softwa__versi__2A8B4280].sql
GO
ALTER TABLE [dbo].[ca_software_license] ADD CONSTRAINT [DF__ca_softwa__versi__2A8B4280] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_softwa__versi__2D67AF2B].sql
GO
ALTER TABLE [dbo].[ca_software_signature] ADD CONSTRAINT [DF__ca_softwa__versi__2D67AF2B] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_softwa__versi__30441BD6].sql
GO
ALTER TABLE [dbo].[ca_software_type] ADD CONSTRAINT [DF__ca_softwa__versi__30441BD6] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_source__versi__33208881].sql
GO
ALTER TABLE [dbo].[ca_source_type] ADD CONSTRAINT [DF__ca_source__versi__33208881] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_state___inact__35FCF52C].sql
GO
ALTER TABLE [dbo].[ca_state_province] ADD CONSTRAINT [DF__ca_state___inact__35FCF52C] DEFAULT (0) FOR [inactive]
GO
--SqlScripter----[dbo].[DF__ca_state___symbo__36F11965].sql
GO
ALTER TABLE [dbo].[ca_state_province] ADD CONSTRAINT [DF__ca_state___symbo__36F11965] DEFAULT (' ') FOR [symbol]
GO
--SqlScripter----[dbo].[DF__ca_state___versi__37E53D9E].sql
GO
ALTER TABLE [dbo].[ca_state_province] ADD CONSTRAINT [DF__ca_state___versi__37E53D9E] DEFAULT (0) FOR [version_number]
GO
--SqlScripter----[dbo].[DF__ca_time_z__dst_f__3CA9F2BB].sql
GO
ALTER TABLE [dbo].[ca_time_zone] ADD CONSTRAINT [DF__ca_time_z__dst_f__3CA9F2BB] DEFAULT (0) FOR [dst_flag]
GO
--SqlScripter----[dbo].[DF__component__impli__45FE52CB].sql
GO
ALTER TABLE [dbo].[componentofindex] ADD CONSTRAINT [DF__component__impli__45FE52CB] DEFAULT ('N') FOR [implied]
GO
--SqlScripter----[dbo].[DF__definitio__lastc__5A46D948].sql
GO
ALTER TABLE [dbo].[definitions] ADD CONSTRAINT [DF__definitio__lastc__5A46D948] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__definitio__versi__5AC46587].sql
GO
ALTER TABLE [dbo].[definitions] ADD CONSTRAINT [DF__definitio__versi__5AC46587] DEFAULT ('1.0') FOR [version]
GO
--SqlScripter----[dbo].[DF__dynamic_w__lastc__6D59ADBC].sql
GO
ALTER TABLE [dbo].[dynamic_worklist] ADD CONSTRAINT [DF__dynamic_w__lastc__6D59ADBC] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__dynamic_w__proce__7A3D10E0].sql
GO
ALTER TABLE [dbo].[dynamic_worklist] ADD CONSTRAINT [DF__dynamic_w__proce__7A3D10E0] DEFAULT ('') FOR [processid]
GO
--SqlScripter----[dbo].[DF__dynamic_w__worki__7B313519].sql
GO
ALTER TABLE [dbo].[dynamic_worklist] ADD CONSTRAINT [DF__dynamic_w__worki__7B313519] DEFAULT (NULL) FOR [workitemid]
GO
--SqlScripter----[dbo].[DF__e2e_wrm_c__local__2DBCB4E6].sql
GO
ALTER TABLE [dbo].[e2e_wrm_countersource] ADD CONSTRAINT [DF__e2e_wrm_c__local__2DBCB4E6] DEFAULT (1033) FOR [localeid]
GO
--SqlScripter----[dbo].[DF__e2e_wrm_c__srcti__2EB0D91F].sql
GO
ALTER TABLE [dbo].[e2e_wrm_countersource] ADD CONSTRAINT [DF__e2e_wrm_c__srcti__2EB0D91F] DEFAULT (0) FOR [srctimezone]
GO
--SqlScripter----[dbo].[DF__e2e_wrm_w__issen__3469B275].sql
GO
ALTER TABLE [dbo].[e2e_wrm_wrm] ADD CONSTRAINT [DF__e2e_wrm_w__issen__3469B275] DEFAULT (0) FOR [issent]
GO
--SqlScripter----[dbo].[DF__e2e_wrm_w__ismer__3B16B004].sql
GO
ALTER TABLE [dbo].[e2e_wrm_wrmreport] ADD CONSTRAINT [DF__e2e_wrm_w__ismer__3B16B004] DEFAULT (0) FOR [ismerged]
GO
--SqlScripter----[dbo].[DF__e2e_wrm_w__issen__3A228BCB].sql
GO
ALTER TABLE [dbo].[e2e_wrm_wrmreport] ADD CONSTRAINT [DF__e2e_wrm_w__issen__3A228BCB] DEFAULT (0) FOR [issent]
GO
--SqlScripter----[dbo].[DF__ebr_log__session__55CAA640].sql
GO
ALTER TABLE [dbo].[ebr_log] ADD CONSTRAINT [DF__ebr_log__session__55CAA640] DEFAULT (0) FOR [session_id]
GO
--SqlScripter----[dbo].[DF__enterpris__ep_ex__02BEDEF6].sql
GO
ALTER TABLE [dbo].[enterprise_package] ADD CONSTRAINT [DF__enterpris__ep_ex__02BEDEF6] DEFAULT (0) FOR [ep_exec_notification]
GO
--SqlScripter----[dbo].[DF__gdcdiscov__disco__65CC03DF].sql
GO
ALTER TABLE [dbo].[gdcdiscovery] ADD CONSTRAINT [DF__gdcdiscov__disco__65CC03DF] DEFAULT (1) FOR [discovered]
GO
--SqlScripter----[dbo].[DF__gla_sdama__integ__6F556E19].sql
GO
ALTER TABLE [dbo].[gla_sdamaps] ADD CONSTRAINT [DF__gla_sdama__integ__6F556E19] DEFAULT (0) FOR [integer_to_collect]
GO
--SqlScripter----[dbo].[DF__HARAUDITE__succe__37729E57].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENT] ADD CONSTRAINT [DF__HARAUDITE__succe__37729E57] DEFAULT ('F') FOR [successfailure]
GO
--SqlScripter----[dbo].[DF__harchecki__force__072CF7AA].sql
GO
ALTER TABLE [dbo].[harcheckinproc] ADD CONSTRAINT [DF__harchecki__force__072CF7AA] DEFAULT ('N') FOR [forcecomment]
GO
--SqlScripter----[dbo].[DF__harchecki__ONBRA__6EC2D341].sql
GO
ALTER TABLE [dbo].[harcheckinproc] ADD CONSTRAINT [DF__harchecki__ONBRA__6EC2D341] DEFAULT ('N') FOR [ONBRANCH]
GO
--SqlScripter----[dbo].[DF__harchecki__ONTRU__6DCEAF08].sql
GO
ALTER TABLE [dbo].[harcheckinproc] ADD CONSTRAINT [DF__harchecki__ONTRU__6DCEAF08] DEFAULT ('Y') FOR [ONTRUNK]
GO
--SqlScripter----[dbo].[DF__harconmrg__merge__0DD9F539].sql
GO
ALTER TABLE [dbo].[harconmrgproc] ADD CONSTRAINT [DF__harconmrg__merge__0DD9F539] DEFAULT ('A') FOR [mergerule]
GO
--SqlScripter----[dbo].[DF__harcrpkgp__disab__1392CE8F].sql
GO
ALTER TABLE [dbo].[harcrpkgproc] ADD CONSTRAINT [DF__harcrpkgp__disab__1392CE8F] DEFAULT ('N') FOR [disablenamechange]
GO
--SqlScripter----[dbo].[DF__harcrpkgp__initi__129EAA56].sql
GO
ALTER TABLE [dbo].[harcrpkgproc] ADD CONSTRAINT [DF__harcrpkgp__initi__129EAA56] DEFAULT (0) FOR [initialstateid]
GO
--SqlScripter----[dbo].[DF__harcrsenv__merge__166F3B3A].sql
GO
ALTER TABLE [dbo].[harcrsenvmrgproc] ADD CONSTRAINT [DF__harcrsenv__merge__166F3B3A] DEFAULT ('A') FOR [mergerule]
GO
--SqlScripter----[dbo].[DF__hardemote__check__1E105D02].sql
GO
ALTER TABLE [dbo].[hardemoteproc] ADD CONSTRAINT [DF__hardemote__check__1E105D02] DEFAULT ('N') FOR [checkdependencies]
GO
--SqlScripter----[dbo].[DF__hardemote__enfor__1D1C38C9].sql
GO
ALTER TABLE [dbo].[hardemoteproc] ADD CONSTRAINT [DF__hardemote__enfor__1D1C38C9] DEFAULT ('N') FOR [enforcebind]
GO
--SqlScripter----[dbo].[DF__harenviro__archi__26A5A303].sql
GO
ALTER TABLE [dbo].[harenvironment] ADD CONSTRAINT [DF__harenviro__archi__26A5A303] DEFAULT (1) FOR [archiveby]
GO
--SqlScripter----[dbo].[DF__harenviro__basel__24BD5A91].sql
GO
ALTER TABLE [dbo].[harenvironment] ADD CONSTRAINT [DF__harenviro__basel__24BD5A91] DEFAULT (0) FOR [baselineviewid]
GO
--SqlScripter----[dbo].[DF__harenviro__isarc__25B17ECA].sql
GO
ALTER TABLE [dbo].[harenvironment] ADD CONSTRAINT [DF__harenviro__isarc__25B17ECA] DEFAULT ('N') FOR [isarchive]
GO
--SqlScripter----[dbo].[DF__harenviro__execu__2C5E7C59].sql
GO
ALTER TABLE [dbo].[harenvironmentaccess] ADD CONSTRAINT [DF__harenviro__execu__2C5E7C59] DEFAULT ('N') FOR [executeaccess]
GO
--SqlScripter----[dbo].[DF__harenviro__secur__29820FAE].sql
GO
ALTER TABLE [dbo].[harenvironmentaccess] ADD CONSTRAINT [DF__harenviro__secur__29820FAE] DEFAULT ('N') FOR [secureaccess]
GO
--SqlScripter----[dbo].[DF__harenviro__updat__2A7633E7].sql
GO
ALTER TABLE [dbo].[harenvironmentaccess] ADD CONSTRAINT [DF__harenviro__updat__2A7633E7] DEFAULT ('N') FOR [updateaccess]
GO
--SqlScripter----[dbo].[DF__harenviro__viewa__2B6A5820].sql
GO
ALTER TABLE [dbo].[harenvironmentaccess] ADD CONSTRAINT [DF__harenviro__viewa__2B6A5820] DEFAULT ('N') FOR [viewaccess]
GO
--SqlScripter----[dbo].[DF__harformat__filec__36DC0ACC].sql
GO
ALTER TABLE [dbo].[harformattachment] ADD CONSTRAINT [DF__harformat__filec__36DC0ACC] DEFAULT ('N') FOR [filecompressed]
GO
--SqlScripter----[dbo].[DF__harformty__notif__39B87777].sql
GO
ALTER TABLE [dbo].[harformtype] ADD CONSTRAINT [DF__harformty__notif__39B87777] DEFAULT ('N') FOR [notifywebservice]
GO
--SqlScripter----[dbo].[DF__harformty__secur__3C94E422].sql
GO
ALTER TABLE [dbo].[harformtypeaccess] ADD CONSTRAINT [DF__harformty__secur__3C94E422] DEFAULT ('N') FOR [secureaccess]
GO
--SqlScripter----[dbo].[DF__harformty__updat__3D89085B].sql
GO
ALTER TABLE [dbo].[harformtypeaccess] ADD CONSTRAINT [DF__harformty__updat__3D89085B] DEFAULT ('N') FOR [updateaccess]
GO
--SqlScripter----[dbo].[DF__harformty__viewa__3E7D2C94].sql
GO
ALTER TABLE [dbo].[harformtypeaccess] ADD CONSTRAINT [DF__harformty__viewa__3E7D2C94] DEFAULT ('N') FOR [viewaccess]
GO
--SqlScripter----[dbo].[DF__HARGLOBAL__creat__32ADE93A].sql
GO
ALTER TABLE [dbo].[HARGLOBALAUDITPOLICY] ADD CONSTRAINT [DF__HARGLOBAL__creat__32ADE93A] DEFAULT (getutcdate()) FOR [creationtime]
GO
--SqlScripter----[dbo].[DF__HARGLOBAL__enabl__2FD17C8F].sql
GO
ALTER TABLE [dbo].[HARGLOBALAUDITPOLICY] ADD CONSTRAINT [DF__HARGLOBAL__enabl__2FD17C8F] DEFAULT ('Y') FOR [enabled]
GO
--SqlScripter----[dbo].[DF__HARGLOBAL__modif__33A20D73].sql
GO
ALTER TABLE [dbo].[HARGLOBALAUDITPOLICY] ADD CONSTRAINT [DF__HARGLOBAL__modif__33A20D73] DEFAULT (getutcdate()) FOR [modifiedtime]
GO
--SqlScripter----[dbo].[DF__HARGLOBAL__onfai__31B9C501].sql
GO
ALTER TABLE [dbo].[HARGLOBALAUDITPOLICY] ADD CONSTRAINT [DF__HARGLOBAL__onfai__31B9C501] DEFAULT ('Y') FOR [onfailure]
GO
--SqlScripter----[dbo].[DF__HARGLOBAL__onsuc__30C5A0C8].sql
GO
ALTER TABLE [dbo].[HARGLOBALAUDITPOLICY] ADD CONSTRAINT [DF__HARGLOBAL__onsuc__30C5A0C8] DEFAULT ('N') FOR [onsuccess]
GO
--SqlScripter----[dbo].[DF__harharves__admin__443605EA].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__admin__443605EA] DEFAULT ('N') FOR [adminuser]
GO
--SqlScripter----[dbo].[DF__harharves__admin__461E4E5C].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__admin__461E4E5C] DEFAULT ('N') FOR [adminenvironment]
GO
--SqlScripter----[dbo].[DF__harharves__admin__480696CE].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__admin__480696CE] DEFAULT ('N') FOR [adminrepository]
GO
--SqlScripter----[dbo].[DF__harharves__admin__49EEDF40].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__admin__49EEDF40] DEFAULT ('N') FOR [adminformtype]
GO
--SqlScripter----[dbo].[DF__harharves__secur__4341E1B1].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__secur__4341E1B1] DEFAULT ('N') FOR [secureharvest]
GO
--SqlScripter----[dbo].[DF__harharves__viewe__47127295].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__viewe__47127295] DEFAULT ('N') FOR [viewenvironment]
GO
--SqlScripter----[dbo].[DF__harharves__viewf__4AE30379].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__viewf__4AE30379] DEFAULT ('N') FOR [viewformtype]
GO
--SqlScripter----[dbo].[DF__harharves__viewr__48FABB07].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__viewr__48FABB07] DEFAULT ('N') FOR [viewrepository]
GO
--SqlScripter----[dbo].[DF__harharves__viewu__452A2A23].sql
GO
ALTER TABLE [dbo].[harharvest] ADD CONSTRAINT [DF__harharves__viewu__452A2A23] DEFAULT ('N') FOR [viewuser]
GO
--SqlScripter----[dbo].[DF__harintmrg__merge__4DBF7024].sql
GO
ALTER TABLE [dbo].[harintmrgproc] ADD CONSTRAINT [DF__harintmrg__merge__4DBF7024] DEFAULT (0) FOR [mergeway]
GO
--SqlScripter----[dbo].[DF__haritemac__viewa__509BDCCF].sql
GO
ALTER TABLE [dbo].[haritemaccess] ADD CONSTRAINT [DF__haritemac__viewa__509BDCCF] DEFAULT ('Y') FOR [viewaccess]
GO
--SqlScripter----[dbo].[DF__haritems__itemna__556091EC].sql
GO
ALTER TABLE [dbo].[haritems] ADD CONSTRAINT [DF__haritems__itemna__556091EC] DEFAULT (' ') FOR [itemnameupper]
GO
--SqlScripter----[dbo].[DF__HARMOVEIT__modeo__55F72577].sql
GO
ALTER TABLE [dbo].[HARMOVEITEMPROC] ADD CONSTRAINT [DF__HARMOVEIT__modeo__55F72577] DEFAULT (0) FOR [modeoption]
GO
--SqlScripter----[dbo].[DF__HARMOVEIT__onbra__5503013E].sql
GO
ALTER TABLE [dbo].[HARMOVEITEMPROC] ADD CONSTRAINT [DF__HARMOVEIT__onbra__5503013E] DEFAULT ('N') FOR [onbranch]
GO
--SqlScripter----[dbo].[DF__HARMOVEIT__ontru__540EDD05].sql
GO
ALTER TABLE [dbo].[HARMOVEITEMPROC] ADD CONSTRAINT [DF__HARMOVEIT__ontru__540EDD05] DEFAULT ('Y') FOR [ontrunk]
GO
--SqlScripter----[dbo].[DF__HARMOVEPA__modeo__6074B3EA].sql
GO
ALTER TABLE [dbo].[HARMOVEPATHPROC] ADD CONSTRAINT [DF__HARMOVEPA__modeo__6074B3EA] DEFAULT (0) FOR [modeoption]
GO
--SqlScripter----[dbo].[DF__HARMOVEPA__onbra__5F808FB1].sql
GO
ALTER TABLE [dbo].[HARMOVEPATHPROC] ADD CONSTRAINT [DF__HARMOVEPA__onbra__5F808FB1] DEFAULT ('N') FOR [onbranch]
GO
--SqlScripter----[dbo].[DF__HARMOVEPA__ontru__5E8C6B78].sql
GO
ALTER TABLE [dbo].[HARMOVEPATHPROC] ADD CONSTRAINT [DF__HARMOVEPA__ontru__5E8C6B78] DEFAULT ('Y') FOR [ontrunk]
GO
--SqlScripter----[dbo].[DF__harpackag__assig__6B4FD30B].sql
GO
ALTER TABLE [dbo].[harpackage] ADD CONSTRAINT [DF__harpackag__assig__6B4FD30B] DEFAULT (-1) FOR [assigneeid]
GO
--SqlScripter----[dbo].[DF__harpackag__notif__6D381B7D].sql
GO
ALTER TABLE [dbo].[harpackage] ADD CONSTRAINT [DF__harpackag__notif__6D381B7D] DEFAULT ('N') FOR [notifywebservice]
GO
--SqlScripter----[dbo].[DF__harpackag__prior__6A5BAED2].sql
GO
ALTER TABLE [dbo].[harpackage] ADD CONSTRAINT [DF__harpackag__prior__6A5BAED2] DEFAULT (0) FOR [priority]
GO
--SqlScripter----[dbo].[DF__harpackag__state__68736660].sql
GO
ALTER TABLE [dbo].[harpackage] ADD CONSTRAINT [DF__harpackag__state__68736660] DEFAULT (0) FOR [stateobjid]
GO
--SqlScripter----[dbo].[DF__harpackag__state__6C43F744].sql
GO
ALTER TABLE [dbo].[harpackage] ADD CONSTRAINT [DF__harpackag__state__6C43F744] DEFAULT ('now') FOR [stateentrytime]
GO
--SqlScripter----[dbo].[DF__harpackag__viewo__69678A99].sql
GO
ALTER TABLE [dbo].[harpackage] ADD CONSTRAINT [DF__harpackag__viewo__69678A99] DEFAULT (-1) FOR [viewobjid]
GO
--SqlScripter----[dbo].[DF__harpackage__bind__70148828].sql
GO
ALTER TABLE [dbo].[harpackagegroup] ADD CONSTRAINT [DF__harpackage__bind__70148828] DEFAULT ('N') FOR [bind]
GO
--SqlScripter----[dbo].[DF__harpasswo__allow__041B80D5].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__allow__041B80D5] DEFAULT ('Y') FOR [allowusername]
GO
--SqlScripter----[dbo].[DF__harpasswo__allow__7D6E8346].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__allow__7D6E8346] DEFAULT ('Y') FOR [allowusrchgexp]
GO
--SqlScripter----[dbo].[DF__harpasswo__chrep__7F56CBB8].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__chrep__7F56CBB8] DEFAULT (-1) FOR [chrepetition]
GO
--SqlScripter----[dbo].[DF__harpasswo__lower__013F142A].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__lower__013F142A] DEFAULT (0) FOR [lowercase]
GO
--SqlScripter----[dbo].[DF__harpasswo__maxag__78A9CE29].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__maxag__78A9CE29] DEFAULT (-1) FOR [maxage]
GO
--SqlScripter----[dbo].[DF__harpasswo__maxfa__7C7A5F0D].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__maxfa__7C7A5F0D] DEFAULT (-1) FOR [maxfailures]
GO
--SqlScripter----[dbo].[DF__harpasswo__minag__799DF262].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__minag__799DF262] DEFAULT (0) FOR [minage]
GO
--SqlScripter----[dbo].[DF__harpasswo__minle__7A92169B].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__minle__7A92169B] DEFAULT (6) FOR [minlen]
GO
--SqlScripter----[dbo].[DF__harpasswo__minnu__004AEFF1].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__minnu__004AEFF1] DEFAULT (0) FOR [minnumeric]
GO
--SqlScripter----[dbo].[DF__harpasswo__nonal__03275C9C].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__nonal__03275C9C] DEFAULT (0) FOR [nonalphanum]
GO
--SqlScripter----[dbo].[DF__harpasswo__reuse__7B863AD4].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__reuse__7B863AD4] DEFAULT (0) FOR [reuserule]
GO
--SqlScripter----[dbo].[DF__harpasswo__upper__02333863].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__upper__02333863] DEFAULT (0) FOR [uppercase]
GO
--SqlScripter----[dbo].[DF__harpasswo__warni__7E62A77F].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] ADD CONSTRAINT [DF__harpasswo__warni__7E62A77F] DEFAULT (-1) FOR [warningage]
GO
--SqlScripter----[dbo].[DF__harpromot__check__1269A02C].sql
GO
ALTER TABLE [dbo].[harpromoteproc] ADD CONSTRAINT [DF__harpromot__check__1269A02C] DEFAULT ('N') FOR [checkdependencies]
GO
--SqlScripter----[dbo].[DF__harpromot__enfor__1451E89E].sql
GO
ALTER TABLE [dbo].[harpromoteproc] ADD CONSTRAINT [DF__harpromot__enfor__1451E89E] DEFAULT ('N') FOR [enforcebind]
GO
--SqlScripter----[dbo].[DF__harpromot__froms__135DC465].sql
GO
ALTER TABLE [dbo].[harpromoteproc] ADD CONSTRAINT [DF__harpromot__froms__135DC465] DEFAULT (0) FOR [fromstateid]
GO
--SqlScripter----[dbo].[DF__harremite__ONBRA__69FE1E24].sql
GO
ALTER TABLE [dbo].[harremitemproc] ADD CONSTRAINT [DF__harremite__ONBRA__69FE1E24] DEFAULT ('N') FOR [ONBRANCH]
GO
--SqlScripter----[dbo].[DF__harremite__ONTRU__6909F9EB].sql
GO
ALTER TABLE [dbo].[harremitemproc] ADD CONSTRAINT [DF__harremite__ONTRU__6909F9EB] DEFAULT ('Y') FOR [ONTRUNK]
GO
--SqlScripter----[dbo].[DF__HARREMOVE__onbra__5ABBDA94].sql
GO
ALTER TABLE [dbo].[HARREMOVEPATHPROC] ADD CONSTRAINT [DF__HARREMOVE__onbra__5ABBDA94] DEFAULT ('N') FOR [onbranch]
GO
--SqlScripter----[dbo].[DF__HARREMOVE__ontru__59C7B65B].sql
GO
ALTER TABLE [dbo].[HARREMOVEPATHPROC] ADD CONSTRAINT [DF__HARREMOVE__ontru__59C7B65B] DEFAULT ('Y') FOR [ontrunk]
GO
--SqlScripter----[dbo].[DF__harrename__MODEO__6CDA8ACF].sql
GO
ALTER TABLE [dbo].[harrenameitemproc] ADD CONSTRAINT [DF__harrename__MODEO__6CDA8ACF] DEFAULT (0) FOR [MODEOPTION]
GO
--SqlScripter----[dbo].[DF__harrename__ONBRA__6BE66696].sql
GO
ALTER TABLE [dbo].[harrenameitemproc] ADD CONSTRAINT [DF__harrename__ONBRA__6BE66696] DEFAULT ('N') FOR [ONBRANCH]
GO
--SqlScripter----[dbo].[DF__harrename__ONTRU__6AF2425D].sql
GO
ALTER TABLE [dbo].[harrenameitemproc] ADD CONSTRAINT [DF__harrename__ONTRU__6AF2425D] DEFAULT ('Y') FOR [ONTRUNK]
GO
--SqlScripter----[dbo].[DF__HARRENAME__modeo__662D8D40].sql
GO
ALTER TABLE [dbo].[HARRENAMEPATHPROC] ADD CONSTRAINT [DF__HARRENAME__modeo__662D8D40] DEFAULT (0) FOR [modeoption]
GO
--SqlScripter----[dbo].[DF__HARRENAME__onbra__65396907].sql
GO
ALTER TABLE [dbo].[HARRENAMEPATHPROC] ADD CONSTRAINT [DF__HARRENAME__onbra__65396907] DEFAULT ('N') FOR [onbranch]
GO
--SqlScripter----[dbo].[DF__HARRENAME__ontru__644544CE].sql
GO
ALTER TABLE [dbo].[HARRENAMEPATHPROC] ADD CONSTRAINT [DF__HARRENAME__ontru__644544CE] DEFAULT ('Y') FOR [ontrunk]
GO
--SqlScripter----[dbo].[DF__harreposi__compf__20B7BF83].sql
GO
ALTER TABLE [dbo].[harrepository] ADD CONSTRAINT [DF__harreposi__compf__20B7BF83] DEFAULT ('Y') FOR [compfile]
GO
--SqlScripter----[dbo].[DF__harreposi__exten__1FC39B4A].sql
GO
ALTER TABLE [dbo].[harrepository] ADD CONSTRAINT [DF__harreposi__exten__1FC39B4A] DEFAULT (1) FOR [extensionoption]
GO
--SqlScripter----[dbo].[DF__harreposi__mvsma__22A007F5].sql
GO
ALTER TABLE [dbo].[harrepository] ADD CONSTRAINT [DF__harreposi__mvsma__22A007F5] DEFAULT ('M') FOR [mvsmapping]
GO
--SqlScripter----[dbo].[DF__harreposi__notco__21ABE3BC].sql
GO
ALTER TABLE [dbo].[harrepository] ADD CONSTRAINT [DF__harreposi__notco__21ABE3BC] DEFAULT ('.zip.jpg.gif.asf.ram.mp3.wav.cab') FOR [notcompext]
GO
--SqlScripter----[dbo].[DF__harreposi__secur__257C74A0].sql
GO
ALTER TABLE [dbo].[harrepositoryaccess] ADD CONSTRAINT [DF__harreposi__secur__257C74A0] DEFAULT ('N') FOR [secureaccess]
GO
--SqlScripter----[dbo].[DF__harreposi__updat__267098D9].sql
GO
ALTER TABLE [dbo].[harrepositoryaccess] ADD CONSTRAINT [DF__harreposi__updat__267098D9] DEFAULT ('N') FOR [updateaccess]
GO
--SqlScripter----[dbo].[DF__harreposi__viewa__2764BD12].sql
GO
ALTER TABLE [dbo].[harrepositoryaccess] ADD CONSTRAINT [DF__harreposi__viewa__2764BD12] DEFAULT ('N') FOR [viewaccess]
GO
--SqlScripter----[dbo].[DF__harstate__locati__2FFA0313].sql
GO
ALTER TABLE [dbo].[harstate] ADD CONSTRAINT [DF__harstate__locati__2FFA0313] DEFAULT (0) FOR [locationx]
GO
--SqlScripter----[dbo].[DF__harstate__locati__30EE274C].sql
GO
ALTER TABLE [dbo].[harstate] ADD CONSTRAINT [DF__harstate__locati__30EE274C] DEFAULT (0) FOR [locationy]
GO
--SqlScripter----[dbo].[DF__harstate__pmstat__31E24B85].sql
GO
ALTER TABLE [dbo].[harstate] ADD CONSTRAINT [DF__harstate__pmstat__31E24B85] DEFAULT (0) FOR [pmstatusindex]
GO
--SqlScripter----[dbo].[DF__harstatea__updat__34BEB830].sql
GO
ALTER TABLE [dbo].[harstateaccess] ADD CONSTRAINT [DF__harstatea__updat__34BEB830] DEFAULT ('N') FOR [updateaccess]
GO
--SqlScripter----[dbo].[DF__harstatea__updat__35B2DC69].sql
GO
ALTER TABLE [dbo].[harstateaccess] ADD CONSTRAINT [DF__harstatea__updat__35B2DC69] DEFAULT ('N') FOR [updatepkgaccess]
GO
--SqlScripter----[dbo].[DF__harstatep__postc__388F4914].sql
GO
ALTER TABLE [dbo].[harstateprocess] ADD CONSTRAINT [DF__harstatep__postc__388F4914] DEFAULT (0) FOR [postcount]
GO
--SqlScripter----[dbo].[DF__harstatep__preco__39836D4D].sql
GO
ALTER TABLE [dbo].[harstateprocess] ADD CONSTRAINT [DF__harstatep__preco__39836D4D] DEFAULT (0) FOR [precount]
GO
--SqlScripter----[dbo].[DF__harstatep__execu__3C5FD9F8].sql
GO
ALTER TABLE [dbo].[harstateprocessaccess] ADD CONSTRAINT [DF__harstatep__execu__3C5FD9F8] DEFAULT ('N') FOR [executeaccess]
GO
--SqlScripter----[dbo].[DF__hartablei__authe__5066D2A5].sql
GO
ALTER TABLE [dbo].[hartableinfo] ADD CONSTRAINT [DF__hartablei__authe__5066D2A5] DEFAULT ('Y') FOR [authenticateuser]
GO
--SqlScripter----[dbo].[DF__hartablei__cases__4E7E8A33].sql
GO
ALTER TABLE [dbo].[hartableinfo] ADD CONSTRAINT [DF__hartablei__cases__4E7E8A33] DEFAULT ('Y') FOR [casesenslogin]
GO
--SqlScripter----[dbo].[DF__hartablei__datab__4F72AE6C].sql
GO
ALTER TABLE [dbo].[hartableinfo] ADD CONSTRAINT [DF__hartablei__datab__4F72AE6C] DEFAULT (0) FOR [databaseid]
GO
--SqlScripter----[dbo].[DF__hartablei__sysva__515AF6DE].sql
GO
ALTER TABLE [dbo].[hartableinfo] ADD CONSTRAINT [DF__hartablei__sysva__515AF6DE] DEFAULT ('N') FOR [sysvarpw]
GO
--SqlScripter----[dbo].[DF__harudp__UDPNOPRO__1181FF99].sql
GO
ALTER TABLE [dbo].[harudp] ADD CONSTRAINT [DF__harudp__UDPNOPRO__1181FF99] DEFAULT ('N') FOR [UDPNOPROMPT]
GO
--SqlScripter----[dbo].[DF__haruser__passwda__5FA91635].sql
GO
ALTER TABLE [dbo].[haruser] ADD CONSTRAINT [DF__haruser__passwda__5FA91635] DEFAULT (0) FOR [passwdattrs]
GO
--SqlScripter----[dbo].[DF__HARUSERDA__Accou__4A457BA9].sql
GO
ALTER TABLE [dbo].[haruserdata] ADD CONSTRAINT [DF__HARUSERDA__Accou__4A457BA9] DEFAULT ('N') FOR [AccountExternal]
GO
--SqlScripter----[dbo].[DF__haruserda__Accou__7CF0F707].sql
GO
ALTER TABLE [dbo].[haruserdata] ADD CONSTRAINT [DF__haruserda__Accou__7CF0F707] DEFAULT ('N') FOR [AccountDisabled]
GO
--SqlScripter----[dbo].[DF__haruserda__Accou__7DE51B40].sql
GO
ALTER TABLE [dbo].[haruserdata] ADD CONSTRAINT [DF__haruserda__Accou__7DE51B40] DEFAULT ('N') FOR [AccountLocked]
GO
--SqlScripter----[dbo].[DF__haruserda__failu__646DCB52].sql
GO
ALTER TABLE [dbo].[haruserdata] ADD CONSTRAINT [DF__haruserda__failu__646DCB52] DEFAULT (0) FOR [failures]
GO
--SqlScripter----[dbo].[DF__haruserda__maxag__6561EF8B].sql
GO
ALTER TABLE [dbo].[haruserdata] ADD CONSTRAINT [DF__haruserda__maxag__6561EF8B] DEFAULT (-2) FOR [maxage]
GO
--SqlScripter----[dbo].[DF__haruserda__SWLog__7BFCD2CE].sql
GO
ALTER TABLE [dbo].[haruserdata] ADD CONSTRAINT [DF__haruserda__SWLog__7BFCD2CE] DEFAULT ('N') FOR [SWLogin]
GO
--SqlScripter----[dbo].[DF__harusergr__GROUP__2588F846].sql
GO
ALTER TABLE [dbo].[harusergroup] ADD CONSTRAINT [DF__harusergr__GROUP__2588F846] DEFAULT ('N') FOR [GROUPEXTERNAL]
GO
--SqlScripter----[dbo].[DF__harversio__compd__6C0EED1A].sql
GO
ALTER TABLE [dbo].[harversiondata] ADD CONSTRAINT [DF__harversio__compd__6C0EED1A] DEFAULT (0) FOR [compdatasize]
GO
--SqlScripter----[dbo].[DF__harversio__itemo__6D031153].sql
GO
ALTER TABLE [dbo].[harversiondata] ADD CONSTRAINT [DF__harversio__itemo__6D031153] DEFAULT (0) FOR [itemobjid]
GO
--SqlScripter----[dbo].[DF__harversio__refco__6B1AC8E1].sql
GO
ALTER TABLE [dbo].[harversiondata] ADD CONSTRAINT [DF__harversio__refco__6B1AC8E1] DEFAULT (0) FOR [refcounter]
GO
--SqlScripter----[dbo].[DF__harversio__ances__73B00EE2].sql
GO
ALTER TABLE [dbo].[harversions] ADD CONSTRAINT [DF__harversio__ances__73B00EE2] DEFAULT (0) FOR [ancestorversionid]
GO
--SqlScripter----[dbo].[DF__harversio__REFAC__7663F509].sql
GO
ALTER TABLE [dbo].[harversions] ADD CONSTRAINT [DF__harversio__REFAC__7663F509] DEFAULT ('N') FOR [REFACTOR]
GO
--SqlScripter----[dbo].[DF__harversio__REFAC__77581942].sql
GO
ALTER TABLE [dbo].[harversions] ADD CONSTRAINT [DF__harversio__REFAC__77581942] DEFAULT (0) FOR [REFACTOR_BY]
GO
--SqlScripter----[dbo].[DF__instance___actor__19D5B7CA].sql
GO
ALTER TABLE [dbo].[instance_history] ADD CONSTRAINT [DF__instance___actor__19D5B7CA] DEFAULT (NULL) FOR [actorname]
GO
--SqlScripter----[dbo].[DF__instance___lastc__6F41F62E].sql
GO
ALTER TABLE [dbo].[instance_history] ADD CONSTRAINT [DF__instance___lastc__6F41F62E] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__instance___nodei__16F94B1F].sql
GO
ALTER TABLE [dbo].[instance_history] ADD CONSTRAINT [DF__instance___nodei__16F94B1F] DEFAULT ('') FOR [nodeid]
GO
--SqlScripter----[dbo].[DF__instance___proce__160526E6].sql
GO
ALTER TABLE [dbo].[instance_history] ADD CONSTRAINT [DF__instance___proce__160526E6] DEFAULT ('') FOR [processid]
GO
--SqlScripter----[dbo].[DF__instance___worki__18E19391].sql
GO
ALTER TABLE [dbo].[instance_history] ADD CONSTRAINT [DF__instance___worki__18E19391] DEFAULT (NULL) FOR [workitemid]
GO
--SqlScripter----[dbo].[DF__instance_h__info__1AC9DC03].sql
GO
ALTER TABLE [dbo].[instance_history] ADD CONSTRAINT [DF__instance_h__info__1AC9DC03] DEFAULT (NULL) FOR [info]
GO
--SqlScripter----[dbo].[DF__instance_h__type__17ED6F58].sql
GO
ALTER TABLE [dbo].[instance_history] ADD CONSTRAINT [DF__instance_h__type__17ED6F58] DEFAULT (-1) FOR [type]
GO
--SqlScripter----[dbo].[DF__instances__killc__1DA648AE].sql
GO
ALTER TABLE [dbo].[instances] ADD CONSTRAINT [DF__instances__killc__1DA648AE] DEFAULT (0) FOR [killcount]
GO
--SqlScripter----[dbo].[DF__instances__lastc__5C2F21BA].sql
GO
ALTER TABLE [dbo].[instances] ADD CONSTRAINT [DF__instances__lastc__5C2F21BA] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__instances__versi__1CB22475].sql
GO
ALTER TABLE [dbo].[instances] ADD CONSTRAINT [DF__instances__versi__1CB22475] DEFAULT ('1.0') FOR [version]
GO
--SqlScripter----[dbo].[DF__jmo_gbl__act_trk__5F740C0B].sql
GO
ALTER TABLE [dbo].[jmo_gbl] ADD CONSTRAINT [DF__jmo_gbl__act_trk__5F740C0B] DEFAULT ('P') FOR [act_trkset]
GO
--SqlScripter----[dbo].[DF__jmo_gbls__act_tr__615C547D].sql
GO
ALTER TABLE [dbo].[jmo_gbls] ADD CONSTRAINT [DF__jmo_gbls__act_tr__615C547D] DEFAULT ('P') FOR [act_trkset]
GO
--SqlScripter----[dbo].[DF__ldapactor__lastc__6B71654A].sql
GO
ALTER TABLE [dbo].[ldapactors_worklist] ADD CONSTRAINT [DF__ldapactor__lastc__6B71654A] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__ldapactor__users__630F92C5].sql
GO
ALTER TABLE [dbo].[ldapactors_worklist] ADD CONSTRAINT [DF__ldapactor__users__630F92C5] DEFAULT ('') FOR [users]
GO
--SqlScripter----[dbo].[DF__ldapconfi__lastc__6A7D4111].sql
GO
ALTER TABLE [dbo].[ldapconfiguration] ADD CONSTRAINT [DF__ldapconfi__lastc__6A7D4111] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__ldapconfi__pwatt__66E023A9].sql
GO
ALTER TABLE [dbo].[ldapconfiguration] ADD CONSTRAINT [DF__ldapconfi__pwatt__66E023A9] DEFAULT ('') FOR [pwattribute]
GO
--SqlScripter----[dbo].[DF__ldapconfi__rootd__64F7DB37].sql
GO
ALTER TABLE [dbo].[ldapconfiguration] ADD CONSTRAINT [DF__ldapconfi__rootd__64F7DB37] DEFAULT ('') FOR [rootdn]
GO
--SqlScripter----[dbo].[DF__ldapconfi__rootp__65EBFF70].sql
GO
ALTER TABLE [dbo].[ldapconfiguration] ADD CONSTRAINT [DF__ldapconfi__rootp__65EBFF70] DEFAULT ('') FOR [rootpass]
GO
--SqlScripter----[dbo].[DF__ldaptemp__npmf__68C86C1B].sql
GO
ALTER TABLE [dbo].[ldaptemp] ADD CONSTRAINT [DF__ldaptemp__npmf__68C86C1B] DEFAULT (' ') FOR [npmf]
GO
--SqlScripter----[dbo].[DF__ldaptemp__nrepor__69BC9054].sql
GO
ALTER TABLE [dbo].[ldaptemp] ADD CONSTRAINT [DF__ldaptemp__nrepor__69BC9054] DEFAULT (' ') FOR [nreportsto]
GO
--SqlScripter----[dbo].[DF__mibdefini__mibty__28ADE706].sql
GO
ALTER TABLE [dbo].[mibdefinition] ADD CONSTRAINT [DF__mibdefini__mibty__28ADE706] DEFAULT (0) FOR [mibtype]
GO
--SqlScripter----[dbo].[DF__ncjobcfg__auto_s__5A45429A].sql
GO
ALTER TABLE [dbo].[ncjobcfg] ADD CONSTRAINT [DF__ncjobcfg__auto_s__5A45429A] DEFAULT (0) FOR [auto_server_version]
GO
--SqlScripter----[dbo].[DF__ncmodcfg__auto_s__60F24029].sql
GO
ALTER TABLE [dbo].[ncmodcfg] ADD CONSTRAINT [DF__ncmodcfg__auto_s__60F24029] DEFAULT (0) FOR [auto_server_version]
GO
--SqlScripter----[dbo].[DF__nctpldef__auto_s__6B6FCE9C].sql
GO
ALTER TABLE [dbo].[nctpldef] ADD CONSTRAINT [DF__nctpldef__auto_s__6B6FCE9C] DEFAULT (0) FOR [auto_server_version]
GO
--SqlScripter----[dbo].[DF__objclasse__lastc__5D2345F3].sql
GO
ALTER TABLE [dbo].[objclasses] ADD CONSTRAINT [DF__objclasse__lastc__5D2345F3] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__objstore__lastch__5E176A2C].sql
GO
ALTER TABLE [dbo].[objstore] ADD CONSTRAINT [DF__objstore__lastch__5E176A2C] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__ols_area___area___57555E04].sql
GO
ALTER TABLE [dbo].[ols_area_ace] ADD CONSTRAINT [DF__ols_area___area___57555E04] DEFAULT (-1) FOR [area_ace]
GO
--SqlScripter----[dbo].[DF__ols_area___area___5849823D].sql
GO
ALTER TABLE [dbo].[ols_area_ace] ADD CONSTRAINT [DF__ols_area___area___5849823D] DEFAULT (-1) FOR [area_mask]
GO
--SqlScripter----[dbo].[DF__ols_area___secur__593DA676].sql
GO
ALTER TABLE [dbo].[ols_area_ace] ADD CONSTRAINT [DF__ols_area___secur__593DA676] DEFAULT (0) FOR [security_level]
GO
--SqlScripter----[dbo].[DF__pd_cluste__clust__23B427BF].sql
GO
ALTER TABLE [dbo].[pd_cluster_ext] ADD CONSTRAINT [DF__pd_cluste__clust__23B427BF] DEFAULT (' ') FOR [cluster_alias]
GO
--SqlScripter----[dbo].[DF__pd_cluste__clust__24A84BF8].sql
GO
ALTER TABLE [dbo].[pd_cluster_ext] ADD CONSTRAINT [DF__pd_cluste__clust__24A84BF8] DEFAULT (' ') FOR [cluster_type]
GO
--SqlScripter----[dbo].[DF__pd_global__build__296D0115].sql
GO
ALTER TABLE [dbo].[pd_global] ADD CONSTRAINT [DF__pd_global__build__296D0115] DEFAULT (0) FOR [build_version]
GO
--SqlScripter----[dbo].[DF__pd_global__major__2784B8A3].sql
GO
ALTER TABLE [dbo].[pd_global] ADD CONSTRAINT [DF__pd_global__major__2784B8A3] DEFAULT (1) FOR [major_version]
GO
--SqlScripter----[dbo].[DF__pd_global__minor__2878DCDC].sql
GO
ALTER TABLE [dbo].[pd_global] ADD CONSTRAINT [DF__pd_global__minor__2878DCDC] DEFAULT (0) FOR [minor_version]
GO
--SqlScripter----[dbo].[DF__pd_global__revis__2A61254E].sql
GO
ALTER TABLE [dbo].[pd_global] ADD CONSTRAINT [DF__pd_global__revis__2A61254E] DEFAULT (0) FOR [revision_version]
GO
--SqlScripter----[dbo].[DF__pd_machin__is_th__2D3D91F9].sql
GO
ALTER TABLE [dbo].[pd_machine] ADD CONSTRAINT [DF__pd_machin__is_th__2D3D91F9] DEFAULT (0) FOR [is_this_cluster]
GO
--SqlScripter----[dbo].[DF__pd_machin__systy__2C496DC0].sql
GO
ALTER TABLE [dbo].[pd_machine] ADD CONSTRAINT [DF__pd_machin__systy__2C496DC0] DEFAULT (' ') FOR [systype_name]
GO
--SqlScripter----[dbo].[DF__pd_machin__agent__3B8BB150].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__agent__3B8BB150] DEFAULT (0) FOR [agent_version]
GO
--SqlScripter----[dbo].[DF__pd_machin__backu__3019FEA4].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__backu__3019FEA4] DEFAULT (' ') FOR [backup_pde_name]
GO
--SqlScripter----[dbo].[DF__pd_machin__confi__39A368DE].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__confi__39A368DE] DEFAULT (' ') FOR [config_server]
GO
--SqlScripter----[dbo].[DF__pd_machin__last___32F66B4F].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__last___32F66B4F] DEFAULT (' ') FOR [last_dns_name]
GO
--SqlScripter----[dbo].[DF__pd_machin__last___33EA8F88].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__last___33EA8F88] DEFAULT (' ') FOR [last_dns_name_1]
GO
--SqlScripter----[dbo].[DF__pd_machin__last___34DEB3C1].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__last___34DEB3C1] DEFAULT (' ') FOR [last_dns_name_2]
GO
--SqlScripter----[dbo].[DF__pd_machin__last___35D2D7FA].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__last___35D2D7FA] DEFAULT (' ') FOR [last_dns_name_3]
GO
--SqlScripter----[dbo].[DF__pd_machin__last___36C6FC33].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__last___36C6FC33] DEFAULT (' ') FOR [last_dns_name_4]
GO
--SqlScripter----[dbo].[DF__pd_machin__last___37BB206C].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__last___37BB206C] DEFAULT (' ') FOR [last_dns_name_5]
GO
--SqlScripter----[dbo].[DF__pd_machin__mac_a__3A978D17].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__mac_a__3A978D17] DEFAULT (' ') FOR [mac_address]
GO
--SqlScripter----[dbo].[DF__pd_machin__neuge__3C7FD589].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__neuge__3C7FD589] DEFAULT (0) FOR [neugent_version]
GO
--SqlScripter----[dbo].[DF__pd_machin__objec__41448AA6].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__objec__41448AA6] DEFAULT (0) FOR [object_id_high]
GO
--SqlScripter----[dbo].[DF__pd_machin__objec__4238AEDF].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__objec__4238AEDF] DEFAULT (0) FOR [object_id_low]
GO
--SqlScripter----[dbo].[DF__pd_machin__pd_ad__4050666D].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__pd_ad__4050666D] DEFAULT (' ') FOR [pd_address]
GO
--SqlScripter----[dbo].[DF__pd_machin__pd_da__3F5C4234].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__pd_da__3F5C4234] DEFAULT (' ') FOR [pd_date]
GO
--SqlScripter----[dbo].[DF__pd_machin__pd_pr__3E681DFB].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__pd_pr__3E681DFB] DEFAULT (0) FOR [pd_protocol]
GO
--SqlScripter----[dbo].[DF__pd_machin__pd_st__32024716].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__pd_st__32024716] DEFAULT (' ') FOR [pd_static_name]
GO
--SqlScripter----[dbo].[DF__pd_machin__pp_ve__3D73F9C2].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__pp_ve__3D73F9C2] DEFAULT (0) FOR [pp_version]
GO
--SqlScripter----[dbo].[DF__pd_machin__prima__2F25DA6B].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__prima__2F25DA6B] DEFAULT (' ') FOR [primary_pde_name]
GO
--SqlScripter----[dbo].[DF__pd_machin__prima__310E22DD].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__prima__310E22DD] DEFAULT (' ') FOR [primary_pdg_name]
GO
--SqlScripter----[dbo].[DF__pd_machin__profi__38AF44A5].sql
GO
ALTER TABLE [dbo].[pd_machine_ext] ADD CONSTRAINT [DF__pd_machin__profi__38AF44A5] DEFAULT (' ') FOR [profile_name]
GO
--SqlScripter----[dbo].[DF__pd_resour__res_i__47F18835].sql
GO
ALTER TABLE [dbo].[pd_resource] ADD CONSTRAINT [DF__pd_resour__res_i__47F18835] DEFAULT (' ') FOR [res_instance]
GO
--SqlScripter----[dbo].[DF__pd_resour__res_v__48E5AC6E].sql
GO
ALTER TABLE [dbo].[pd_resource] ADD CONSTRAINT [DF__pd_resour__res_v__48E5AC6E] DEFAULT (' ') FOR [res_value_type]
GO
--SqlScripter----[dbo].[DF__por_portl__perso__0F7824E8].sql
GO
ALTER TABLE [dbo].[por_portlet_entity] ADD CONSTRAINT [DF__por_portl__perso__0F7824E8] DEFAULT (2) FOR [personalization_level]
GO
--SqlScripter----[dbo].[DF__por_wp__priority__2D0887CF].sql
GO
ALTER TABLE [dbo].[por_wp] ADD CONSTRAINT [DF__por_wp__priority__2D0887CF] DEFAULT (1) FOR [priority]
GO
--SqlScripter----[dbo].[DF__process_l__lastc__6C658983].sql
GO
ALTER TABLE [dbo].[process_listeners] ADD CONSTRAINT [DF__process_l__lastc__6C658983] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__productid__lastc__523A0C7E].sql
GO
ALTER TABLE [dbo].[productids] ADD CONSTRAINT [DF__productid__lastc__523A0C7E] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__rmoaddres__forma__1407CFDB].sql
GO
ALTER TABLE [dbo].[rmoaddress] ADD CONSTRAINT [DF__rmoaddres__forma__1407CFDB] DEFAULT ('email') FOR [format]
GO
--SqlScripter----[dbo].[DF__rmoaddres__regis__14FBF414].sql
GO
ALTER TABLE [dbo].[rmoaddress] ADD CONSTRAINT [DF__rmoaddres__regis__14FBF414] DEFAULT ('N') FOR [registered]
GO
--SqlScripter----[dbo].[DF__securityp__defin__23150941].sql
GO
ALTER TABLE [dbo].[securitypredicate] ADD CONSTRAINT [DF__securityp__defin__23150941] DEFAULT ('') FOR [definitionid]
GO
--SqlScripter----[dbo].[DF__securityp__lastc__6894F89F].sql
GO
ALTER TABLE [dbo].[securitypredicate] ADD CONSTRAINT [DF__securityp__lastc__6894F89F] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__servicepr__lastc__5F0B8E65].sql
GO
ALTER TABLE [dbo].[serviceproviders] ADD CONSTRAINT [DF__servicepr__lastc__5F0B8E65] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__setting__lastche__5FFFB29E].sql
GO
ALTER TABLE [dbo].[setting] ADD CONSTRAINT [DF__setting__lastche__5FFFB29E] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__simpleeve__lastc__60F3D6D7].sql
GO
ALTER TABLE [dbo].[simpleevent] ADD CONSTRAINT [DF__simpleeve__lastc__60F3D6D7] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__skeletons__index__4FE7AFB8].sql
GO
ALTER TABLE [dbo].[skeletons] ADD CONSTRAINT [DF__skeletons__index__4FE7AFB8] DEFAULT (0) FOR [indexed]
GO
--SqlScripter----[dbo].[DF__stats__lastcheck__61E7FB10].sql
GO
ALTER TABLE [dbo].[stats] ADD CONSTRAINT [DF__stats__lastcheck__61E7FB10] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__subsearch__cvid__7CBA562F].sql
GO
ALTER TABLE [dbo].[subsearch] ADD CONSTRAINT [DF__subsearch__cvid__7CBA562F] DEFAULT (0) FOR [cvid]
GO
--SqlScripter----[dbo].[DF__tablesdes__colle__26B08FFB].sql
GO
ALTER TABLE [dbo].[tablesdescription] ADD CONSTRAINT [DF__tablesdes__colle__26B08FFB] DEFAULT ('Y') FOR [collectable]
GO
--SqlScripter----[dbo].[DF__timedeven__lastc__62DC1F49].sql
GO
ALTER TABLE [dbo].[timedevent] ADD CONSTRAINT [DF__timedeven__lastc__62DC1F49] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF_tng_class_reclass_rule_off].sql
GO
ALTER TABLE [dbo].[tng_class_reclass] ADD CONSTRAINT [DF_tng_class_reclass_rule_off] DEFAULT (0) FOR [rule_off]
GO
--SqlScripter----[dbo].[DF__tng_dbpv__notify__4FB2A58E].sql
GO
ALTER TABLE [dbo].[tng_dbpv] ADD CONSTRAINT [DF__tng_dbpv__notify__4FB2A58E] DEFAULT (0) FOR [notify_em]
GO
--SqlScripter----[dbo].[DF__tng_field___name__5FE90D57].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field___name__5FE90D57] DEFAULT ('') FOR [name]
GO
--SqlScripter----[dbo].[DF__tng_field__data___60DD3190].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field__data___60DD3190] DEFAULT (0) FOR [data_length]
GO
--SqlScripter----[dbo].[DF__tng_field__field__5D0CA0AC].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field__field__5D0CA0AC] DEFAULT (0) FOR [field_id]
GO
--SqlScripter----[dbo].[DF__tng_field__field__5E00C4E5].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field__field__5E00C4E5] DEFAULT (0) FOR [field_type]
GO
--SqlScripter----[dbo].[DF__tng_field__field__5EF4E91E].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field__field__5EF4E91E] DEFAULT (0) FOR [field_flags]
GO
--SqlScripter----[dbo].[DF__tng_field__insta__61D155C9].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field__insta__61D155C9] DEFAULT ('') FOR [instance_storage]
GO
--SqlScripter----[dbo].[DF__tng_field__last___63B99E3B].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field__last___63B99E3B] DEFAULT (0) FOR [last_int]
GO
--SqlScripter----[dbo].[DF__tng_field__last___64ADC274].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field__last___64ADC274] DEFAULT (0) FOR [last_char]
GO
--SqlScripter----[dbo].[DF__tng_field__stora__62C57A02].sql
GO
ALTER TABLE [dbo].[tng_field_definition] ADD CONSTRAINT [DF__tng_field__stora__62C57A02] DEFAULT ('') FOR [storage_name]
GO
--SqlScripter----[dbo].[DF__tng_field___int1__66960AE6].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int1__66960AE6] DEFAULT (0) FOR [int1]
GO
--SqlScripter----[dbo].[DF__tng_field___int2__678A2F1F].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int2__678A2F1F] DEFAULT (0) FOR [int2]
GO
--SqlScripter----[dbo].[DF__tng_field___int3__687E5358].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int3__687E5358] DEFAULT (0) FOR [int3]
GO
--SqlScripter----[dbo].[DF__tng_field___int4__69727791].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int4__69727791] DEFAULT (0) FOR [int4]
GO
--SqlScripter----[dbo].[DF__tng_field___int5__6A669BCA].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int5__6A669BCA] DEFAULT (0) FOR [int5]
GO
--SqlScripter----[dbo].[DF__tng_field___int6__6B5AC003].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int6__6B5AC003] DEFAULT (0) FOR [int6]
GO
--SqlScripter----[dbo].[DF__tng_field___int7__6C4EE43C].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int7__6C4EE43C] DEFAULT (0) FOR [int7]
GO
--SqlScripter----[dbo].[DF__tng_field___int8__6D430875].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int8__6D430875] DEFAULT (0) FOR [int8]
GO
--SqlScripter----[dbo].[DF__tng_field___int9__6E372CAE].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___int9__6E372CAE] DEFAULT (0) FOR [int9]
GO
--SqlScripter----[dbo].[DF__tng_field___str1__45F4312A].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str1__45F4312A] DEFAULT ('') FOR [str1]
GO
--SqlScripter----[dbo].[DF__tng_field___str2__46E85563].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str2__46E85563] DEFAULT ('') FOR [str2]
GO
--SqlScripter----[dbo].[DF__tng_field___str3__47DC799C].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str3__47DC799C] DEFAULT ('') FOR [str3]
GO
--SqlScripter----[dbo].[DF__tng_field___str4__48D09DD5].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str4__48D09DD5] DEFAULT ('') FOR [str4]
GO
--SqlScripter----[dbo].[DF__tng_field___str5__49C4C20E].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str5__49C4C20E] DEFAULT ('') FOR [str5]
GO
--SqlScripter----[dbo].[DF__tng_field___str6__4AB8E647].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str6__4AB8E647] DEFAULT ('') FOR [str6]
GO
--SqlScripter----[dbo].[DF__tng_field___str7__4BAD0A80].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str7__4BAD0A80] DEFAULT ('') FOR [str7]
GO
--SqlScripter----[dbo].[DF__tng_field___str8__4CA12EB9].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str8__4CA12EB9] DEFAULT ('') FOR [str8]
GO
--SqlScripter----[dbo].[DF__tng_field___str9__4D9552F2].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field___str9__4D9552F2] DEFAULT ('') FOR [str9]
GO
--SqlScripter----[dbo].[DF__tng_field__int10__45000CF1].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int10__45000CF1] DEFAULT (0) FOR [int100]
GO
--SqlScripter----[dbo].[DF__tng_field__int10__6F2B50E7].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int10__6F2B50E7] DEFAULT (0) FOR [int10]
GO
--SqlScripter----[dbo].[DF__tng_field__int11__701F7520].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int11__701F7520] DEFAULT (0) FOR [int11]
GO
--SqlScripter----[dbo].[DF__tng_field__int12__71139959].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int12__71139959] DEFAULT (0) FOR [int12]
GO
--SqlScripter----[dbo].[DF__tng_field__int13__7207BD92].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int13__7207BD92] DEFAULT (0) FOR [int13]
GO
--SqlScripter----[dbo].[DF__tng_field__int14__72FBE1CB].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int14__72FBE1CB] DEFAULT (0) FOR [int14]
GO
--SqlScripter----[dbo].[DF__tng_field__int15__73F00604].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int15__73F00604] DEFAULT (0) FOR [int15]
GO
--SqlScripter----[dbo].[DF__tng_field__int16__74E42A3D].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int16__74E42A3D] DEFAULT (0) FOR [int16]
GO
--SqlScripter----[dbo].[DF__tng_field__int17__75D84E76].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int17__75D84E76] DEFAULT (0) FOR [int17]
GO
--SqlScripter----[dbo].[DF__tng_field__int18__76CC72AF].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int18__76CC72AF] DEFAULT (0) FOR [int18]
GO
--SqlScripter----[dbo].[DF__tng_field__int19__77C096E8].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int19__77C096E8] DEFAULT (0) FOR [int19]
GO
--SqlScripter----[dbo].[DF__tng_field__int20__78B4BB21].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int20__78B4BB21] DEFAULT (0) FOR [int20]
GO
--SqlScripter----[dbo].[DF__tng_field__int21__79A8DF5A].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int21__79A8DF5A] DEFAULT (0) FOR [int21]
GO
--SqlScripter----[dbo].[DF__tng_field__int22__7A9D0393].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int22__7A9D0393] DEFAULT (0) FOR [int22]
GO
--SqlScripter----[dbo].[DF__tng_field__int23__7B9127CC].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int23__7B9127CC] DEFAULT (0) FOR [int23]
GO
--SqlScripter----[dbo].[DF__tng_field__int24__7C854C05].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int24__7C854C05] DEFAULT (0) FOR [int24]
GO
--SqlScripter----[dbo].[DF__tng_field__int25__7D79703E].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int25__7D79703E] DEFAULT (0) FOR [int25]
GO
--SqlScripter----[dbo].[DF__tng_field__int26__7E6D9477].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int26__7E6D9477] DEFAULT (0) FOR [int26]
GO
--SqlScripter----[dbo].[DF__tng_field__int27__7F61B8B0].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int27__7F61B8B0] DEFAULT (0) FOR [int27]
GO
--SqlScripter----[dbo].[DF__tng_field__int28__0055DCE9].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int28__0055DCE9] DEFAULT (0) FOR [int28]
GO
--SqlScripter----[dbo].[DF__tng_field__int29__014A0122].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int29__014A0122] DEFAULT (0) FOR [int29]
GO
--SqlScripter----[dbo].[DF__tng_field__int30__023E255B].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int30__023E255B] DEFAULT (0) FOR [int30]
GO
--SqlScripter----[dbo].[DF__tng_field__int31__03324994].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int31__03324994] DEFAULT (0) FOR [int31]
GO
--SqlScripter----[dbo].[DF__tng_field__int32__04266DCD].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int32__04266DCD] DEFAULT (0) FOR [int32]
GO
--SqlScripter----[dbo].[DF__tng_field__int33__051A9206].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int33__051A9206] DEFAULT (0) FOR [int33]
GO
--SqlScripter----[dbo].[DF__tng_field__int34__060EB63F].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int34__060EB63F] DEFAULT (0) FOR [int34]
GO
--SqlScripter----[dbo].[DF__tng_field__int35__0702DA78].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int35__0702DA78] DEFAULT (0) FOR [int35]
GO
--SqlScripter----[dbo].[DF__tng_field__int36__07F6FEB1].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int36__07F6FEB1] DEFAULT (0) FOR [int36]
GO
--SqlScripter----[dbo].[DF__tng_field__int37__08EB22EA].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int37__08EB22EA] DEFAULT (0) FOR [int37]
GO
--SqlScripter----[dbo].[DF__tng_field__int38__09DF4723].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int38__09DF4723] DEFAULT (0) FOR [int38]
GO
--SqlScripter----[dbo].[DF__tng_field__int39__0AD36B5C].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int39__0AD36B5C] DEFAULT (0) FOR [int39]
GO
--SqlScripter----[dbo].[DF__tng_field__int40__0BC78F95].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int40__0BC78F95] DEFAULT (0) FOR [int40]
GO
--SqlScripter----[dbo].[DF__tng_field__int41__0CBBB3CE].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int41__0CBBB3CE] DEFAULT (0) FOR [int41]
GO
--SqlScripter----[dbo].[DF__tng_field__int42__0DAFD807].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int42__0DAFD807] DEFAULT (0) FOR [int42]
GO
--SqlScripter----[dbo].[DF__tng_field__int43__0EA3FC40].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int43__0EA3FC40] DEFAULT (0) FOR [int43]
GO
--SqlScripter----[dbo].[DF__tng_field__int44__0F982079].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int44__0F982079] DEFAULT (0) FOR [int44]
GO
--SqlScripter----[dbo].[DF__tng_field__int45__108C44B2].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int45__108C44B2] DEFAULT (0) FOR [int45]
GO
--SqlScripter----[dbo].[DF__tng_field__int46__118068EB].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int46__118068EB] DEFAULT (0) FOR [int46]
GO
--SqlScripter----[dbo].[DF__tng_field__int47__12748D24].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int47__12748D24] DEFAULT (0) FOR [int47]
GO
--SqlScripter----[dbo].[DF__tng_field__int48__1368B15D].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int48__1368B15D] DEFAULT (0) FOR [int48]
GO
--SqlScripter----[dbo].[DF__tng_field__int49__145CD596].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int49__145CD596] DEFAULT (0) FOR [int49]
GO
--SqlScripter----[dbo].[DF__tng_field__int50__1550F9CF].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int50__1550F9CF] DEFAULT (0) FOR [int50]
GO
--SqlScripter----[dbo].[DF__tng_field__int51__16451E08].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int51__16451E08] DEFAULT (0) FOR [int51]
GO
--SqlScripter----[dbo].[DF__tng_field__int52__17394241].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int52__17394241] DEFAULT (0) FOR [int52]
GO
--SqlScripter----[dbo].[DF__tng_field__int53__182D667A].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int53__182D667A] DEFAULT (0) FOR [int53]
GO
--SqlScripter----[dbo].[DF__tng_field__int54__19218AB3].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int54__19218AB3] DEFAULT (0) FOR [int54]
GO
--SqlScripter----[dbo].[DF__tng_field__int55__1A15AEEC].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int55__1A15AEEC] DEFAULT (0) FOR [int55]
GO
--SqlScripter----[dbo].[DF__tng_field__int56__1B09D325].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int56__1B09D325] DEFAULT (0) FOR [int56]
GO
--SqlScripter----[dbo].[DF__tng_field__int57__1BFDF75E].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int57__1BFDF75E] DEFAULT (0) FOR [int57]
GO
--SqlScripter----[dbo].[DF__tng_field__int58__1CF21B97].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int58__1CF21B97] DEFAULT (0) FOR [int58]
GO
--SqlScripter----[dbo].[DF__tng_field__int59__1DE63FD0].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int59__1DE63FD0] DEFAULT (0) FOR [int59]
GO
--SqlScripter----[dbo].[DF__tng_field__int60__1EDA6409].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int60__1EDA6409] DEFAULT (0) FOR [int60]
GO
--SqlScripter----[dbo].[DF__tng_field__int61__1FCE8842].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int61__1FCE8842] DEFAULT (0) FOR [int61]
GO
--SqlScripter----[dbo].[DF__tng_field__int62__20C2AC7B].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int62__20C2AC7B] DEFAULT (0) FOR [int62]
GO
--SqlScripter----[dbo].[DF__tng_field__int63__21B6D0B4].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int63__21B6D0B4] DEFAULT (0) FOR [int63]
GO
--SqlScripter----[dbo].[DF__tng_field__int64__22AAF4ED].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int64__22AAF4ED] DEFAULT (0) FOR [int64]
GO
--SqlScripter----[dbo].[DF__tng_field__int65__239F1926].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int65__239F1926] DEFAULT (0) FOR [int65]
GO
--SqlScripter----[dbo].[DF__tng_field__int66__24933D5F].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int66__24933D5F] DEFAULT (0) FOR [int66]
GO
--SqlScripter----[dbo].[DF__tng_field__int67__25876198].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int67__25876198] DEFAULT (0) FOR [int67]
GO
--SqlScripter----[dbo].[DF__tng_field__int68__267B85D1].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int68__267B85D1] DEFAULT (0) FOR [int68]
GO
--SqlScripter----[dbo].[DF__tng_field__int69__276FAA0A].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int69__276FAA0A] DEFAULT (0) FOR [int69]
GO
--SqlScripter----[dbo].[DF__tng_field__int70__2863CE43].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int70__2863CE43] DEFAULT (0) FOR [int70]
GO
--SqlScripter----[dbo].[DF__tng_field__int71__2957F27C].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int71__2957F27C] DEFAULT (0) FOR [int71]
GO
--SqlScripter----[dbo].[DF__tng_field__int72__2A4C16B5].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int72__2A4C16B5] DEFAULT (0) FOR [int72]
GO
--SqlScripter----[dbo].[DF__tng_field__int73__2B403AEE].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int73__2B403AEE] DEFAULT (0) FOR [int73]
GO
--SqlScripter----[dbo].[DF__tng_field__int74__2C345F27].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int74__2C345F27] DEFAULT (0) FOR [int74]
GO
--SqlScripter----[dbo].[DF__tng_field__int75__2D288360].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int75__2D288360] DEFAULT (0) FOR [int75]
GO
--SqlScripter----[dbo].[DF__tng_field__int76__2E1CA799].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int76__2E1CA799] DEFAULT (0) FOR [int76]
GO
--SqlScripter----[dbo].[DF__tng_field__int77__2F10CBD2].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int77__2F10CBD2] DEFAULT (0) FOR [int77]
GO
--SqlScripter----[dbo].[DF__tng_field__int78__3004F00B].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int78__3004F00B] DEFAULT (0) FOR [int78]
GO
--SqlScripter----[dbo].[DF__tng_field__int79__30F91444].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int79__30F91444] DEFAULT (0) FOR [int79]
GO
--SqlScripter----[dbo].[DF__tng_field__int80__31ED387D].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int80__31ED387D] DEFAULT (0) FOR [int80]
GO
--SqlScripter----[dbo].[DF__tng_field__int81__32E15CB6].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int81__32E15CB6] DEFAULT (0) FOR [int81]
GO
--SqlScripter----[dbo].[DF__tng_field__int82__33D580EF].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int82__33D580EF] DEFAULT (0) FOR [int82]
GO
--SqlScripter----[dbo].[DF__tng_field__int83__34C9A528].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int83__34C9A528] DEFAULT (0) FOR [int83]
GO
--SqlScripter----[dbo].[DF__tng_field__int84__35BDC961].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int84__35BDC961] DEFAULT (0) FOR [int84]
GO
--SqlScripter----[dbo].[DF__tng_field__int85__36B1ED9A].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int85__36B1ED9A] DEFAULT (0) FOR [int85]
GO
--SqlScripter----[dbo].[DF__tng_field__int86__37A611D3].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int86__37A611D3] DEFAULT (0) FOR [int86]
GO
--SqlScripter----[dbo].[DF__tng_field__int87__389A360C].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int87__389A360C] DEFAULT (0) FOR [int87]
GO
--SqlScripter----[dbo].[DF__tng_field__int88__398E5A45].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int88__398E5A45] DEFAULT (0) FOR [int88]
GO
--SqlScripter----[dbo].[DF__tng_field__int89__3A827E7E].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int89__3A827E7E] DEFAULT (0) FOR [int89]
GO
--SqlScripter----[dbo].[DF__tng_field__int90__3B76A2B7].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int90__3B76A2B7] DEFAULT (0) FOR [int90]
GO
--SqlScripter----[dbo].[DF__tng_field__int91__3C6AC6F0].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int91__3C6AC6F0] DEFAULT (0) FOR [int91]
GO
--SqlScripter----[dbo].[DF__tng_field__int92__3D5EEB29].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int92__3D5EEB29] DEFAULT (0) FOR [int92]
GO
--SqlScripter----[dbo].[DF__tng_field__int93__3E530F62].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int93__3E530F62] DEFAULT (0) FOR [int93]
GO
--SqlScripter----[dbo].[DF__tng_field__int94__3F47339B].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int94__3F47339B] DEFAULT (0) FOR [int94]
GO
--SqlScripter----[dbo].[DF__tng_field__int95__403B57D4].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int95__403B57D4] DEFAULT (0) FOR [int95]
GO
--SqlScripter----[dbo].[DF__tng_field__int96__412F7C0D].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int96__412F7C0D] DEFAULT (0) FOR [int96]
GO
--SqlScripter----[dbo].[DF__tng_field__int97__4223A046].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int97__4223A046] DEFAULT (0) FOR [int97]
GO
--SqlScripter----[dbo].[DF__tng_field__int98__4317C47F].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int98__4317C47F] DEFAULT (0) FOR [int98]
GO
--SqlScripter----[dbo].[DF__tng_field__int99__440BE8B8].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__int99__440BE8B8] DEFAULT (0) FOR [int99]
GO
--SqlScripter----[dbo].[DF__tng_field__str10__4E89772B].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__str10__4E89772B] DEFAULT ('') FOR [str10]
GO
--SqlScripter----[dbo].[DF__tng_field__str11__4F7D9B64].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__str11__4F7D9B64] DEFAULT ('') FOR [str11]
GO
--SqlScripter----[dbo].[DF__tng_field__str12__5071BF9D].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__str12__5071BF9D] DEFAULT ('') FOR [str12]
GO
--SqlScripter----[dbo].[DF__tng_field__str13__5165E3D6].sql
GO
ALTER TABLE [dbo].[tng_field_storage] ADD CONSTRAINT [DF__tng_field__str13__5165E3D6] DEFAULT ('') FOR [str13]
GO
--SqlScripter----[dbo].[DF__tng_geoma__altit__534E2C48].sql
GO
ALTER TABLE [dbo].[tng_geomap] ADD CONSTRAINT [DF__tng_geoma__altit__534E2C48] DEFAULT (1) FOR [altitude]
GO
--SqlScripter----[dbo].[DF__tng_inclu__hidde__571EBD2C].sql
GO
ALTER TABLE [dbo].[tng_inclusion] ADD CONSTRAINT [DF__tng_inclu__hidde__571EBD2C] DEFAULT (0) FOR [hidden]
GO
--SqlScripter----[dbo].[DF__tng_ip_di__date___59FB29D7].sql
GO
ALTER TABLE [dbo].[tng_ip_discovery_history] ADD CONSTRAINT [DF__tng_ip_di__date___59FB29D7] DEFAULT ('now') FOR [date_ins]
GO
--SqlScripter----[dbo].[DF__tng_ip_su__ip_sb__5CD79682].sql
GO
ALTER TABLE [dbo].[tng_ip_subnet] ADD CONSTRAINT [DF__tng_ip_su__ip_sb__5CD79682] DEFAULT (0) FOR [ip_sbnt_ref]
GO
--SqlScripter----[dbo].[DF__tng_jasmi__confi__5EBFDEF4].sql
GO
ALTER TABLE [dbo].[tng_jasmine_menu_action] ADD CONSTRAINT [DF__tng_jasmi__confi__5EBFDEF4] DEFAULT (0) FOR [confirmit]
GO
--SqlScripter----[dbo].[DF__tng_jasmi__show___5FB4032D].sql
GO
ALTER TABLE [dbo].[tng_jasmine_menu_action] ADD CONSTRAINT [DF__tng_jasmi__show___5FB4032D] DEFAULT (1) FOR [show_result]
GO
--SqlScripter----[dbo].[DF__tng_link__hidden__6E022284].sql
GO
ALTER TABLE [dbo].[tng_link] ADD CONSTRAINT [DF__tng_link__hidden__6E022284] DEFAULT (0) FOR [hidden]
GO
--SqlScripter----[dbo].[DF__tng_link__implie__6EF646BD].sql
GO
ALTER TABLE [dbo].[tng_link] ADD CONSTRAINT [DF__tng_link__implie__6EF646BD] DEFAULT (0) FOR [implied]
GO
--SqlScripter----[dbo].[DF__tng_link__link_f__6FEA6AF6].sql
GO
ALTER TABLE [dbo].[tng_link] ADD CONSTRAINT [DF__tng_link__link_f__6FEA6AF6] DEFAULT (0) FOR [link_flag]
GO
--SqlScripter----[dbo].[DF__tng_link__unimpl__70DE8F2F].sql
GO
ALTER TABLE [dbo].[tng_link] ADD CONSTRAINT [DF__tng_link__unimpl__70DE8F2F] DEFAULT (0) FOR [unimplied]
GO
--SqlScripter----[dbo].[DF__tng_manag__date___74AF2013].sql
GO
ALTER TABLE [dbo].[tng_managedobject] ADD CONSTRAINT [DF__tng_manag__date___74AF2013] DEFAULT ('now') FOR [date_ins]
GO
--SqlScripter----[dbo].[DF__tng_manag__date___75A3444C].sql
GO
ALTER TABLE [dbo].[tng_managedobject] ADD CONSTRAINT [DF__tng_manag__date___75A3444C] DEFAULT ('now') FOR [date_modify]
GO
--SqlScripter----[dbo].[DF__tng_polls__port___7D446614].sql
GO
ALTER TABLE [dbo].[tng_pollset] ADD CONSTRAINT [DF__tng_polls__port___7D446614] DEFAULT (161) FOR [port_number]
GO
--SqlScripter----[dbo].[DF__tng_tnd_g__altit__06CDD04E].sql
GO
ALTER TABLE [dbo].[tng_tnd_geomap] ADD CONSTRAINT [DF__tng_tnd_g__altit__06CDD04E] DEFAULT (1) FOR [altitude]
GO
--SqlScripter----[dbo].[DF__triggers__lastch__63D04382].sql
GO
ALTER TABLE [dbo].[triggers] ADD CONSTRAINT [DF__triggers__lastch__63D04382] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__ud_dataso__creat__3890DFC2].sql
GO
ALTER TABLE [dbo].[ud_datasource_list] ADD CONSTRAINT [DF__ud_dataso__creat__3890DFC2] DEFAULT (' ') FOR [createdate]
GO
--SqlScripter----[dbo].[DF__ud_dataso__lactd__379CBB89].sql
GO
ALTER TABLE [dbo].[ud_datasource_list] ADD CONSTRAINT [DF__ud_dataso__lactd__379CBB89] DEFAULT (' ') FOR [lactdate]
GO
--SqlScripter----[dbo].[DF__ud_orgdef__oldiv__3C6170A6].sql
GO
ALTER TABLE [dbo].[ud_orgdef_list] ADD CONSTRAINT [DF__ud_orgdef__oldiv__3C6170A6] DEFAULT (' ') FOR [oldiv]
GO
--SqlScripter----[dbo].[DF__ud_orgdef__olnot__3B6D4C6D].sql
GO
ALTER TABLE [dbo].[ud_orgdef_list] ADD CONSTRAINT [DF__ud_orgdef__olnot__3B6D4C6D] DEFAULT (' ') FOR [olnote]
GO
--SqlScripter----[dbo].[DF__ud_orgdef__oluse__3A792834].sql
GO
ALTER TABLE [dbo].[ud_orgdef_list] ADD CONSTRAINT [DF__ud_orgdef__oluse__3A792834] DEFAULT (' ') FOR [oluserlist]
GO
--SqlScripter----[dbo].[DF__ud_swcat___creat__430E6E35].sql
GO
ALTER TABLE [dbo].[ud_swcat_rule] ADD CONSTRAINT [DF__ud_swcat___creat__430E6E35] DEFAULT (' ') FOR [createdate]
GO
--SqlScripter----[dbo].[DF__ud_swcat___creat__4402926E].sql
GO
ALTER TABLE [dbo].[ud_swcat_rule] ADD CONSTRAINT [DF__ud_swcat___creat__4402926E] DEFAULT (' ') FOR [createuser]
GO
--SqlScripter----[dbo].[DF__ud_swcat___lactd__421A49FC].sql
GO
ALTER TABLE [dbo].[ud_swcat_rule] ADD CONSTRAINT [DF__ud_swcat___lactd__421A49FC] DEFAULT (' ') FOR [lactdate]
GO
--SqlScripter----[dbo].[DF__ud_swcat___lacti__412625C3].sql
GO
ALTER TABLE [dbo].[ud_swcat_rule] ADD CONSTRAINT [DF__ud_swcat___lacti__412625C3] DEFAULT (' ') FOR [laction]
GO
--SqlScripter----[dbo].[DF__ud_swcat___scnot__4032018A].sql
GO
ALTER TABLE [dbo].[ud_swcat_rule] ADD CONSTRAINT [DF__ud_swcat___scnot__4032018A] DEFAULT (' ') FOR [scnote]
GO
--SqlScripter----[dbo].[DF__ud_swcat___scrul__3F3DDD51].sql
GO
ALTER TABLE [dbo].[ud_swcat_rule] ADD CONSTRAINT [DF__ud_swcat___scrul__3F3DDD51] DEFAULT (' ') FOR [scrule]
GO
--SqlScripter----[dbo].[DF__und_probe__dt_cr__631A7FBD].sql
GO
ALTER TABLE [dbo].[und_probe] ADD CONSTRAINT [DF__und_probe__dt_cr__631A7FBD] DEFAULT (' ') FOR [dt_created]
GO
--SqlScripter----[dbo].[DF__upm_basel__pmode__2494D40D].sql
GO
ALTER TABLE [dbo].[upm_baseline_sw] ADD CONSTRAINT [DF__upm_basel__pmode__2494D40D] DEFAULT (0) FOR [pmode]
GO
--SqlScripter----[dbo].[DF__urc_ab_gr__updat__056F97C1].sql
GO
ALTER TABLE [dbo].[urc_ab_group_def] ADD CONSTRAINT [DF__urc_ab_gr__updat__056F97C1] DEFAULT (1) FOR [update_viewer_version]
GO
--SqlScripter----[dbo].[DF__usd_class__bucke__2117B236].sql
GO
ALTER TABLE [dbo].[usd_class_version] ADD CONSTRAINT [DF__usd_class__bucke__2117B236] DEFAULT (0) FOR [bucket_number]
GO
--SqlScripter----[dbo].[DF__usd_class__bucke__220BD66F].sql
GO
ALTER TABLE [dbo].[usd_class_version] ADD CONSTRAINT [DF__usd_class__bucke__220BD66F] DEFAULT (0) FOR [bucket_count]
GO
--SqlScripter----[dbo].[DF__usd_class__inser__22FFFAA8].sql
GO
ALTER TABLE [dbo].[usd_class_version] ADD CONSTRAINT [DF__usd_class__inser__22FFFAA8] DEFAULT (0) FOR [insert_version]
GO
--SqlScripter----[dbo].[DF__usd_class__modif__23F41EE1].sql
GO
ALTER TABLE [dbo].[usd_class_version] ADD CONSTRAINT [DF__usd_class__modif__23F41EE1] DEFAULT (0) FOR [modify_version]
GO
--SqlScripter----[dbo].[DF__usd_cont__priori__02A9D05D].sql
GO
ALTER TABLE [dbo].[usd_cont] ADD CONSTRAINT [DF__usd_cont__priori__02A9D05D] DEFAULT (5) FOR [priority]
GO
--SqlScripter----[dbo].[DF__usd_job_c__prior__01B5AC24].sql
GO
ALTER TABLE [dbo].[usd_job_cont] ADD CONSTRAINT [DF__usd_job_c__prior__01B5AC24] DEFAULT (5) FOR [priority]
GO
--SqlScripter----[dbo].[DF__usd_targe__calen__5C387804].sql
GO
ALTER TABLE [dbo].[usd_target] ADD CONSTRAINT [DF__usd_targe__calen__5C387804] DEFAULT (' ') FOR [calendar]
GO
--SqlScripter----[dbo].[DF__usd_targe__downl__5D2C9C3D].sql
GO
ALTER TABLE [dbo].[usd_target] ADD CONSTRAINT [DF__usd_targe__downl__5D2C9C3D] DEFAULT (0) FOR [download_method]
GO
--SqlScripter----[dbo].[DF__usd_targe__locks__5E20C076].sql
GO
ALTER TABLE [dbo].[usd_target] ADD CONSTRAINT [DF__usd_targe__locks__5E20C076] DEFAULT (0) FOR [locks]
GO
--SqlScripter----[dbo].[DF__usd_targe__manag__5A502F92].sql
GO
ALTER TABLE [dbo].[usd_target] ADD CONSTRAINT [DF__usd_targe__manag__5A502F92] DEFAULT (1) FOR [managementtype]
GO
--SqlScripter----[dbo].[DF__usd_targe__state__5B4453CB].sql
GO
ALTER TABLE [dbo].[usd_target] ADD CONSTRAINT [DF__usd_targe__state__5B4453CB] DEFAULT (0) FOR [state]
GO
--SqlScripter----[dbo].[DF__usd_targe__versi__595C0B59].sql
GO
ALTER TABLE [dbo].[usd_target] ADD CONSTRAINT [DF__usd_targe__versi__595C0B59] DEFAULT (1) FOR [version]
GO
--SqlScripter----[dbo].[DF__usd_task__priori__039DF496].sql
GO
ALTER TABLE [dbo].[usd_task] ADD CONSTRAINT [DF__usd_task__priori__039DF496] DEFAULT (5) FOR [priority]
GO
--SqlScripter----[dbo].[DF__user_role__lastc__64C467BB].sql
GO
ALTER TABLE [dbo].[user_roles] ADD CONSTRAINT [DF__user_role__lastc__64C467BB] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__userlist___lastc__70361A67].sql
GO
ALTER TABLE [dbo].[userlist_worklist] ADD CONSTRAINT [DF__userlist___lastc__70361A67] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__users__lastcheck__65B88BF4].sql
GO
ALTER TABLE [dbo].[users] ADD CONSTRAINT [DF__users__lastcheck__65B88BF4] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__usm_accou__opene__713394EA].sql
GO
ALTER TABLE [dbo].[usm_account] ADD CONSTRAINT [DF__usm_accou__opene__713394EA] DEFAULT ('today') FOR [opened_date]
GO
--SqlScripter----[dbo].[DF__usm_accou__statu__703F70B1].sql
GO
ALTER TABLE [dbo].[usm_account] ADD CONSTRAINT [DF__usm_accou__statu__703F70B1] DEFAULT (0) FOR [status]
GO
--SqlScripter----[dbo].[DF__usm_acl__create___77E09279].sql
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [DF__usm_acl__create___77E09279] DEFAULT (0) FOR [create_permit]
GO
--SqlScripter----[dbo].[DF__usm_acl__delete___78D4B6B2].sql
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [DF__usm_acl__delete___78D4B6B2] DEFAULT (0) FOR [delete_permit]
GO
--SqlScripter----[dbo].[DF__usm_acl__execute__7BB1235D].sql
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [DF__usm_acl__execute__7BB1235D] DEFAULT (0) FOR [execute_permit]
GO
--SqlScripter----[dbo].[DF__usm_acl__is_syst__7E8D9008].sql
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [DF__usm_acl__is_syst__7E8D9008] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_acl__list_pe__7D996BCF].sql
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [DF__usm_acl__list_pe__7D996BCF] DEFAULT (0) FOR [list_permit]
GO
--SqlScripter----[dbo].[DF__usm_acl__mod_per__7CA54796].sql
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [DF__usm_acl__mod_per__7CA54796] DEFAULT (0) FOR [mod_permit]
GO
--SqlScripter----[dbo].[DF__usm_acl__modify___79C8DAEB].sql
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [DF__usm_acl__modify___79C8DAEB] DEFAULT (0) FOR [modify_permit]
GO
--SqlScripter----[dbo].[DF__usm_acl__read_pe__7ABCFF24].sql
GO
ALTER TABLE [dbo].[usm_acl] ADD CONSTRAINT [DF__usm_acl__read_pe__7ABCFF24] DEFAULT (0) FOR [read_permit]
GO
--SqlScripter----[dbo].[DF__usm_appus__use_p__11A0647C].sql
GO
ALTER TABLE [dbo].[usm_appuser] ADD CONSTRAINT [DF__usm_appus__use_p__11A0647C] DEFAULT (0) FOR [use_password]
GO
--SqlScripter----[dbo].[DF__usm_asset__is_fo__147CD127].sql
GO
ALTER TABLE [dbo].[usm_asset] ADD CONSTRAINT [DF__usm_asset__is_fo__147CD127] DEFAULT (0) FOR [is_folder]
GO
--SqlScripter----[dbo].[DF__usm_asset__is_sy__1570F560].sql
GO
ALTER TABLE [dbo].[usm_asset] ADD CONSTRAINT [DF__usm_asset__is_sy__1570F560] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_asset__locke__16651999].sql
GO
ALTER TABLE [dbo].[usm_asset] ADD CONSTRAINT [DF__usm_asset__locke__16651999] DEFAULT (0) FOR [locked]
GO
--SqlScripter----[dbo].[DF__usm_billi__aggre__20E2A80C].sql
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [DF__usm_billi__aggre__20E2A80C] DEFAULT (-1) FOR [aggregation_type]
GO
--SqlScripter----[dbo].[DF__usm_billi__last___21D6CC45].sql
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [DF__usm_billi__last___21D6CC45] DEFAULT (-1) FOR [last_transaction_id]
GO
--SqlScripter----[dbo].[DF__usm_billi__last___22CAF07E].sql
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [DF__usm_billi__last___22CAF07E] DEFAULT (-1) FOR [last_payment_id]
GO
--SqlScripter----[dbo].[DF__usm_billi__last___23BF14B7].sql
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [DF__usm_billi__last___23BF14B7] DEFAULT (-1) FOR [last_statement_id]
GO
--SqlScripter----[dbo].[DF__usm_billi__notif__1E063B61].sql
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [DF__usm_billi__notif__1E063B61] DEFAULT (1) FOR [notify_stmt_sent]
GO
--SqlScripter----[dbo].[DF__usm_billi__opene__1D121728].sql
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [DF__usm_billi__opene__1D121728] DEFAULT ('today') FOR [opened_date]
GO
--SqlScripter----[dbo].[DF__usm_billi__summa__1EFA5F9A].sql
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [DF__usm_billi__summa__1EFA5F9A] DEFAULT (1) FOR [summarize_statements]
GO
--SqlScripter----[dbo].[DF__usm_billi__taxab__1FEE83D3].sql
GO
ALTER TABLE [dbo].[usm_billing_account] ADD CONSTRAINT [DF__usm_billi__taxab__1FEE83D3] DEFAULT (1) FOR [taxable]
GO
--SqlScripter----[dbo].[DF__usm_brand__is_de__2977EE0D].sql
GO
ALTER TABLE [dbo].[usm_branding_template] ADD CONSTRAINT [DF__usm_brand__is_de__2977EE0D] DEFAULT (0) FOR [is_default]
GO
--SqlScripter----[dbo].[DF__usm_brand__is_sh__2883C9D4].sql
GO
ALTER TABLE [dbo].[usm_branding_template] ADD CONSTRAINT [DF__usm_brand__is_sh__2883C9D4] DEFAULT (0) FOR [is_shared]
GO
--SqlScripter----[dbo].[DF__usm_cache__args___3024EB9C].sql
GO
ALTER TABLE [dbo].[usm_cache] ADD CONSTRAINT [DF__usm_cache__args___3024EB9C] DEFAULT (0) FOR [args_critical]
GO
--SqlScripter----[dbo].[DF__usm_cache__use_c__2F30C763].sql
GO
ALTER TABLE [dbo].[usm_cache] ADD CONSTRAINT [DF__usm_cache__use_c__2F30C763] DEFAULT (0) FOR [use_cache]
GO
--SqlScripter----[dbo].[DF__usm_conta__autho__4337C010].sql
GO
ALTER TABLE [dbo].[usm_contact_domain] ADD CONSTRAINT [DF__usm_conta__autho__4337C010] DEFAULT (0) FOR [authorization_level]
GO
--SqlScripter----[dbo].[DF__usm_conta__defau__46142CBB].sql
GO
ALTER TABLE [dbo].[usm_contact_domain_role] ADD CONSTRAINT [DF__usm_conta__defau__46142CBB] DEFAULT (0) FOR [default_domain]
GO
--SqlScripter----[dbo].[DF__usm_contr__repor__4AD8E1D8].sql
GO
ALTER TABLE [dbo].[usm_contract] ADD CONSTRAINT [DF__usm_contr__repor__4AD8E1D8] DEFAULT (-1) FOR [report_interval]
GO
--SqlScripter----[dbo].[DF__usm_dash__auto_a__5927012F].sql
GO
ALTER TABLE [dbo].[usm_dash] ADD CONSTRAINT [DF__usm_dash__auto_a__5927012F] DEFAULT (0) FOR [auto_arrange]
GO
--SqlScripter----[dbo].[DF__usm_dash__full_s__564A9484].sql
GO
ALTER TABLE [dbo].[usm_dash] ADD CONSTRAINT [DF__usm_dash__full_s__564A9484] DEFAULT (0) FOR [full_size]
GO
--SqlScripter----[dbo].[DF__usm_dash__locked__5832DCF6].sql
GO
ALTER TABLE [dbo].[usm_dash] ADD CONSTRAINT [DF__usm_dash__locked__5832DCF6] DEFAULT (0) FOR [locked]
GO
--SqlScripter----[dbo].[DF__usm_dash__separa__573EB8BD].sql
GO
ALTER TABLE [dbo].[usm_dash] ADD CONSTRAINT [DF__usm_dash__separa__573EB8BD] DEFAULT (0) FOR [separate_window]
GO
--SqlScripter----[dbo].[DF__usm_db__normaliz__5CF79213].sql
GO
ALTER TABLE [dbo].[usm_db] ADD CONSTRAINT [DF__usm_db__normaliz__5CF79213] DEFAULT (0) FOR [normalize_timestamps]
GO
--SqlScripter----[dbo].[DF__usm_docum__modif__686944BF].sql
GO
ALTER TABLE [dbo].[usm_document_template] ADD CONSTRAINT [DF__usm_docum__modif__686944BF] DEFAULT (0) FOR [modify]
GO
--SqlScripter----[dbo].[DF__usm_dst__in_use__6B45B16A].sql
GO
ALTER TABLE [dbo].[usm_dst] ADD CONSTRAINT [DF__usm_dst__in_use__6B45B16A] DEFAULT (0) FOR [in_use]
GO
--SqlScripter----[dbo].[DF__usm_expor__num_r__7E5885DE].sql
GO
ALTER TABLE [dbo].[usm_export] ADD CONSTRAINT [DF__usm_expor__num_r__7E5885DE] DEFAULT (-1) FOR [num_records]
GO
--SqlScripter----[dbo].[DF__usm_guino__is_se__0505836D].sql
GO
ALTER TABLE [dbo].[usm_guinode] ADD CONSTRAINT [DF__usm_guino__is_se__0505836D] DEFAULT (0) FOR [is_secured]
GO
--SqlScripter----[dbo].[DF__usm_guino__is_sy__06EDCBDF].sql
GO
ALTER TABLE [dbo].[usm_guinode] ADD CONSTRAINT [DF__usm_guino__is_sy__06EDCBDF] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_guino__need___07E1F018].sql
GO
ALTER TABLE [dbo].[usm_guinode] ADD CONSTRAINT [DF__usm_guino__need___07E1F018] DEFAULT (0) FOR [need_login]
GO
--SqlScripter----[dbo].[DF__usm_guino__separ__05F9A7A6].sql
GO
ALTER TABLE [dbo].[usm_guinode] ADD CONSTRAINT [DF__usm_guino__separ__05F9A7A6] DEFAULT (0) FOR [separate_window]
GO
--SqlScripter----[dbo].[DF__usm_host__regist__0CA6A535].sql
GO
ALTER TABLE [dbo].[usm_host] ADD CONSTRAINT [DF__usm_host__regist__0CA6A535] DEFAULT (0) FOR [registered]
GO
--SqlScripter----[dbo].[DF__usm_invoi__start__2E079900].sql
GO
ALTER TABLE [dbo].[usm_invoice_history] ADD CONSTRAINT [DF__usm_invoi__start__2E079900] DEFAULT ('today') FOR [start_date]
GO
--SqlScripter----[dbo].[DF__usm_launc__displ__369CDF01].sql
GO
ALTER TABLE [dbo].[usm_launchpad] ADD CONSTRAINT [DF__usm_launc__displ__369CDF01] DEFAULT (0) FOR [display_intree]
GO
--SqlScripter----[dbo].[DF__usm_launc__separ__3791033A].sql
GO
ALTER TABLE [dbo].[usm_launchpad] ADD CONSTRAINT [DF__usm_launc__separ__3791033A] DEFAULT (0) FOR [separate_window]
GO
--SqlScripter----[dbo].[DF__usm_link_a__type__3C55B857].sql
GO
ALTER TABLE [dbo].[usm_link_account_user] ADD CONSTRAINT [DF__usm_link_a__type__3C55B857] DEFAULT (0) FOR [type]
GO
--SqlScripter----[dbo].[DF__usm_link___is_de__3F322502].sql
GO
ALTER TABLE [dbo].[usm_link_analysis_layout] ADD CONSTRAINT [DF__usm_link___is_de__3F322502] DEFAULT (0) FOR [is_default]
GO
--SqlScripter----[dbo].[DF__usm_link___servi__45DF2291].sql
GO
ALTER TABLE [dbo].[usm_link_analyze_job_ticket] ADD CONSTRAINT [DF__usm_link___servi__45DF2291] DEFAULT (1) FOR [service_desk_ticket_id]
GO
--SqlScripter----[dbo].[DF__usm_link___servi__7C3B3342].sql
GO
ALTER TABLE [dbo].[usm_link_service_event_ticket] ADD CONSTRAINT [DF__usm_link___servi__7C3B3342] DEFAULT (1) FOR [service_desk_ticket_id]
GO
--SqlScripter----[dbo].[DF__usm_metri__enabl__216CB7F1].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] ADD CONSTRAINT [DF__usm_metri__enabl__216CB7F1] DEFAULT (0) FOR [enable]
GO
--SqlScripter----[dbo].[DF__usm_metri__full___2260DC2A].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] ADD CONSTRAINT [DF__usm_metri__full___2260DC2A] DEFAULT (0) FOR [full_detail]
GO
--SqlScripter----[dbo].[DF__usm_metri__real___23550063].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] ADD CONSTRAINT [DF__usm_metri__real___23550063] DEFAULT (0) FOR [real_time_metric]
GO
--SqlScripter----[dbo].[DF__usm_news__time_s__3D14D266].sql
GO
ALTER TABLE [dbo].[usm_news] ADD CONSTRAINT [DF__usm_news__time_s__3D14D266] DEFAULT ('today') FOR [time_stamp]
GO
--SqlScripter----[dbo].[DF__usm_note__create__3FF13F11].sql
GO
ALTER TABLE [dbo].[usm_note] ADD CONSTRAINT [DF__usm_note__create__3FF13F11] DEFAULT ('today') FOR [created_date]
GO
--SqlScripter----[dbo].[DF__usm_objec__creat__44B5F42E].sql
GO
ALTER TABLE [dbo].[usm_object_wf_instance_ref] ADD CONSTRAINT [DF__usm_objec__creat__44B5F42E] DEFAULT ('today') FOR [created_date]
GO
--SqlScripter----[dbo].[DF__usm_objec__modif__45AA1867].sql
GO
ALTER TABLE [dbo].[usm_object_wf_instance_ref] ADD CONSTRAINT [DF__usm_objec__modif__45AA1867] DEFAULT ('today') FOR [modified_date]
GO
--SqlScripter----[dbo].[DF__usm_offer__appro__48868512].sql
GO
ALTER TABLE [dbo].[usm_offering] ADD CONSTRAINT [DF__usm_offer__appro__48868512] DEFAULT (0) FOR [approval_process]
GO
--SqlScripter----[dbo].[DF__usm_offer__appro__497AA94B].sql
GO
ALTER TABLE [dbo].[usm_offering] ADD CONSTRAINT [DF__usm_offer__appro__497AA94B] DEFAULT (0) FOR [approval_level]
GO
--SqlScripter----[dbo].[DF__usm_offer__defau__4B62F1BD].sql
GO
ALTER TABLE [dbo].[usm_offering] ADD CONSTRAINT [DF__usm_offer__defau__4B62F1BD] DEFAULT (2) FOR [default_on_approval_status]
GO
--SqlScripter----[dbo].[DF__usm_offeri__type__4A6ECD84].sql
GO
ALTER TABLE [dbo].[usm_offering] ADD CONSTRAINT [DF__usm_offeri__type__4A6ECD84] DEFAULT (0) FOR [type]
GO
--SqlScripter----[dbo].[DF__usm_plann__statu__5F69EA6A].sql
GO
ALTER TABLE [dbo].[usm_planning_set] ADD CONSTRAINT [DF__usm_plann__statu__5F69EA6A] DEFAULT (1) FOR [status]
GO
--SqlScripter----[dbo].[DF__usm_plugi__load___642E9F87].sql
GO
ALTER TABLE [dbo].[usm_plugin] ADD CONSTRAINT [DF__usm_plugi__load___642E9F87] DEFAULT (0) FOR [load_on_startup]
GO
--SqlScripter----[dbo].[DF__usm_plugi__persi__62465715].sql
GO
ALTER TABLE [dbo].[usm_plugin] ADD CONSTRAINT [DF__usm_plugi__persi__62465715] DEFAULT (0) FOR [persistent]
GO
--SqlScripter----[dbo].[DF__usm_plugi__stati__633A7B4E].sql
GO
ALTER TABLE [dbo].[usm_plugin] ADD CONSTRAINT [DF__usm_plugi__stati__633A7B4E] DEFAULT (0) FOR [static]
GO
--SqlScripter----[dbo].[DF__usm_porta__full___68F354A4].sql
GO
ALTER TABLE [dbo].[usm_portal_content] ADD CONSTRAINT [DF__usm_porta__full___68F354A4] DEFAULT (0) FOR [full_size]
GO
--SqlScripter----[dbo].[DF__usm_porta__is_hi__6BCFC14F].sql
GO
ALTER TABLE [dbo].[usm_portal_content] ADD CONSTRAINT [DF__usm_porta__is_hi__6BCFC14F] DEFAULT (0) FOR [is_hidden]
GO
--SqlScripter----[dbo].[DF__usm_porta__new_w__6ADB9D16].sql
GO
ALTER TABLE [dbo].[usm_portal_content] ADD CONSTRAINT [DF__usm_porta__new_w__6ADB9D16] DEFAULT (0) FOR [new_window]
GO
--SqlScripter----[dbo].[DF__usm_porta__resiz__6CC3E588].sql
GO
ALTER TABLE [dbo].[usm_portal_content] ADD CONSTRAINT [DF__usm_porta__resiz__6CC3E588] DEFAULT (0) FOR [resize]
GO
--SqlScripter----[dbo].[DF__usm_porta__separ__69E778DD].sql
GO
ALTER TABLE [dbo].[usm_portal_content] ADD CONSTRAINT [DF__usm_porta__separ__69E778DD] DEFAULT (0) FOR [separate_window]
GO
--SqlScripter----[dbo].[DF__usm_porta__creat__71889AA5].sql
GO
ALTER TABLE [dbo].[usm_portal_template] ADD CONSTRAINT [DF__usm_porta__creat__71889AA5] DEFAULT ('today') FOR [created_date]
GO
--SqlScripter----[dbo].[DF__usm_porta__is_sy__6FA05233].sql
GO
ALTER TABLE [dbo].[usm_portal_template] ADD CONSTRAINT [DF__usm_porta__is_sy__6FA05233] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_porta__new_w__727CBEDE].sql
GO
ALTER TABLE [dbo].[usm_portal_template] ADD CONSTRAINT [DF__usm_porta__new_w__727CBEDE] DEFAULT (0) FOR [new_window]
GO
--SqlScripter----[dbo].[DF__usm_porta__parse__7094766C].sql
GO
ALTER TABLE [dbo].[usm_portal_template] ADD CONSTRAINT [DF__usm_porta__parse__7094766C] DEFAULT (0) FOR [parse_content]
GO
--SqlScripter----[dbo].[DF__usm_pwd_p__first__75592B89].sql
GO
ALTER TABLE [dbo].[usm_pwd_policy] ADD CONSTRAINT [DF__usm_pwd_p__first__75592B89] DEFAULT (0) FOR [first_time_change]
GO
--SqlScripter----[dbo].[DF__usm_queue__creat__78359834].sql
GO
ALTER TABLE [dbo].[usm_queue_item] ADD CONSTRAINT [DF__usm_queue__creat__78359834] DEFAULT ('today') FOR [created_time]
GO
--SqlScripter----[dbo].[DF__usm_queue__creat__7B1204DF].sql
GO
ALTER TABLE [dbo].[usm_queue_item_detail] ADD CONSTRAINT [DF__usm_queue__creat__7B1204DF] DEFAULT ('today') FOR [created_time]
GO
--SqlScripter----[dbo].[DF__usm_rate___appro__7DEE718A].sql
GO
ALTER TABLE [dbo].[usm_rate_definition] ADD CONSTRAINT [DF__usm_rate___appro__7DEE718A] DEFAULT (0) FOR [approval_level]
GO
--SqlScripter----[dbo].[DF__usm_rate___track__7EE295C3].sql
GO
ALTER TABLE [dbo].[usm_rate_definition] ADD CONSTRAINT [DF__usm_rate___track__7EE295C3] DEFAULT (0) FOR [track_as_asset]
GO
--SqlScripter----[dbo].[DF__usm_repor__statu__09602436].sql
GO
ALTER TABLE [dbo].[usm_report_data] ADD CONSTRAINT [DF__usm_repor__statu__09602436] DEFAULT (0) FOR [status]
GO
--SqlScripter----[dbo].[DF__usm_repor__exter__0C3C90E1].sql
GO
ALTER TABLE [dbo].[usm_report_dataview] ADD CONSTRAINT [DF__usm_repor__exter__0C3C90E1] DEFAULT (0) FOR [external_cleanup]
GO
--SqlScripter----[dbo].[DF__usm_reque__creat__222BD200].sql
GO
ALTER TABLE [dbo].[usm_request] ADD CONSTRAINT [DF__usm_reque__creat__222BD200] DEFAULT ('today') FOR [created_date]
GO
--SqlScripter----[dbo].[DF__usm_reque__modif__231FF639].sql
GO
ALTER TABLE [dbo].[usm_request] ADD CONSTRAINT [DF__usm_reque__modif__231FF639] DEFAULT ('today') FOR [modified_date]
GO
--SqlScripter----[dbo].[DF__usm_reque__creat__25FC62E4].sql
GO
ALTER TABLE [dbo].[usm_request_pending_action] ADD CONSTRAINT [DF__usm_reque__creat__25FC62E4] DEFAULT ('today') FOR [created_date]
GO
--SqlScripter----[dbo].[DF__usm_rsc_syst__id__3A035B91].sql
GO
ALTER TABLE [dbo].[usm_rsc_system] ADD CONSTRAINT [DF__usm_rsc_syst__id__3A035B91] DEFAULT (1) FOR [id]
GO
--SqlScripter----[dbo].[DF__usm_rule__is_hid__3CDFC83C].sql
GO
ALTER TABLE [dbo].[usm_rule] ADD CONSTRAINT [DF__usm_rule__is_hid__3CDFC83C] DEFAULT (0) FOR [is_hidden]
GO
--SqlScripter----[dbo].[DF__usm_rule__is_sys__3DD3EC75].sql
GO
ALTER TABLE [dbo].[usm_rule] ADD CONSTRAINT [DF__usm_rule__is_sys__3DD3EC75] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_rule___is_sy__40B05920].sql
GO
ALTER TABLE [dbo].[usm_rule_action] ADD CONSTRAINT [DF__usm_rule___is_sy__40B05920] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_rule___is_hi__438CC5CB].sql
GO
ALTER TABLE [dbo].[usm_rule_condition] ADD CONSTRAINT [DF__usm_rule___is_hi__438CC5CB] DEFAULT (0) FOR [is_hidden]
GO
--SqlScripter----[dbo].[DF__usm_rule___is_sy__4480EA04].sql
GO
ALTER TABLE [dbo].[usm_rule_condition] ADD CONSTRAINT [DF__usm_rule___is_sy__4480EA04] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_rule___event__48517AE8].sql
GO
ALTER TABLE [dbo].[usm_rule_event_type] ADD CONSTRAINT [DF__usm_rule___event__48517AE8] DEFAULT (0) FOR [event_dependency]
GO
--SqlScripter----[dbo].[DF__usm_rule___is_sy__475D56AF].sql
GO
ALTER TABLE [dbo].[usm_rule_event_type] ADD CONSTRAINT [DF__usm_rule___is_sy__475D56AF] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_rule___save___49459F21].sql
GO
ALTER TABLE [dbo].[usm_rule_event_type] ADD CONSTRAINT [DF__usm_rule___save___49459F21] DEFAULT (-1) FOR [save_level]
GO
--SqlScripter----[dbo].[DF__usm_servi__prior__611D28B2].sql
GO
ALTER TABLE [dbo].[usm_service_desk_ticket] ADD CONSTRAINT [DF__usm_servi__prior__611D28B2] DEFAULT (1) FOR [priority_id]
GO
--SqlScripter----[dbo].[DF__usm_servi__servi__60290479].sql
GO
ALTER TABLE [dbo].[usm_service_desk_ticket] ADD CONSTRAINT [DF__usm_servi__servi__60290479] DEFAULT (1) FOR [service_desk_ticket_id]
GO
--SqlScripter----[dbo].[DF__usm_settl__recor__6D82FF97].sql
GO
ALTER TABLE [dbo].[usm_settlement] ADD CONSTRAINT [DF__usm_settl__recor__6D82FF97] DEFAULT ('today') FOR [recorded_date]
GO
--SqlScripter----[dbo].[DF__usm_slo_i__repor__055A8928].sql
GO
ALTER TABLE [dbo].[usm_slo_instance] ADD CONSTRAINT [DF__usm_slo_i__repor__055A8928] DEFAULT (-1) FOR [report_interval]
GO
--SqlScripter----[dbo].[DF__usm_slo_i__slo_w__064EAD61].sql
GO
ALTER TABLE [dbo].[usm_slo_instance] ADD CONSTRAINT [DF__usm_slo_i__slo_w__064EAD61] DEFAULT (0) FOR [slo_weight]
GO
--SqlScripter----[dbo].[DF__usm_slo_t__repor__0B13627E].sql
GO
ALTER TABLE [dbo].[usm_slo_template] ADD CONSTRAINT [DF__usm_slo_t__repor__0B13627E] DEFAULT (-1) FOR [report_interval]
GO
--SqlScripter----[dbo].[DF__usm_slo_t__slo_w__0C0786B7].sql
GO
ALTER TABLE [dbo].[usm_slo_template] ADD CONSTRAINT [DF__usm_slo_t__slo_w__0C0786B7] DEFAULT (0) FOR [slo_weight]
GO
--SqlScripter----[dbo].[DF__usm_subsc__group__1B49CA47].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] ADD CONSTRAINT [DF__usm_subsc__group__1B49CA47] DEFAULT (1) FOR [group_id]
GO
--SqlScripter----[dbo].[DF__usm_syste__time___200E7F64].sql
GO
ALTER TABLE [dbo].[usm_system_alert] ADD CONSTRAINT [DF__usm_syste__time___200E7F64] DEFAULT ('today') FOR [time_stamp]
GO
--SqlScripter----[dbo].[DF__usm_syste__parti__23DF1048].sql
GO
ALTER TABLE [dbo].[usm_system_change] ADD CONSTRAINT [DF__usm_syste__parti__23DF1048] DEFAULT (1) FOR [partial_event]
GO
--SqlScripter----[dbo].[DF__usm_syste__times__22EAEC0F].sql
GO
ALTER TABLE [dbo].[usm_system_change] ADD CONSTRAINT [DF__usm_syste__times__22EAEC0F] DEFAULT ('today') FOR [timestamp]
GO
--SqlScripter----[dbo].[DF__usm_syste__clien__2B803210].sql
GO
ALTER TABLE [dbo].[usm_system_install] ADD CONSTRAINT [DF__usm_syste__clien__2B803210] DEFAULT (0) FOR [client_side_processing]
GO
--SqlScripter----[dbo].[DF__usm_syste__concu__2C745649].sql
GO
ALTER TABLE [dbo].[usm_system_install] ADD CONSTRAINT [DF__usm_syste__concu__2C745649] DEFAULT (0) FOR [concurrent_logon]
GO
--SqlScripter----[dbo].[DF__usm_syste__log_m__2A8C0DD7].sql
GO
ALTER TABLE [dbo].[usm_system_install] ADD CONSTRAINT [DF__usm_syste__log_m__2A8C0DD7] DEFAULT (0) FOR [log_messages]
GO
--SqlScripter----[dbo].[DF__usm_syste__super__2D687A82].sql
GO
ALTER TABLE [dbo].[usm_system_install] ADD CONSTRAINT [DF__usm_syste__super__2D687A82] DEFAULT (0) FOR [super_tenant_enabled]
GO
--SqlScripter----[dbo].[DF__usm_syste__use_c__2997E99E].sql
GO
ALTER TABLE [dbo].[usm_system_install] ADD CONSTRAINT [DF__usm_syste__use_c__2997E99E] DEFAULT (0) FOR [use_cache]
GO
--SqlScripter----[dbo].[DF__usm_tenan__decim__34157811].sql
GO
ALTER TABLE [dbo].[usm_tenant] ADD CONSTRAINT [DF__usm_tenan__decim__34157811] DEFAULT (0) FOR [decimal_format]
GO
--SqlScripter----[dbo].[DF__usm_tenan__opene__332153D8].sql
GO
ALTER TABLE [dbo].[usm_tenant] ADD CONSTRAINT [DF__usm_tenan__opene__332153D8] DEFAULT ('today') FOR [opened_date]
GO
--SqlScripter----[dbo].[DF__usm_tenan__singl__35099C4A].sql
GO
ALTER TABLE [dbo].[usm_tenant] ADD CONSTRAINT [DF__usm_tenan__singl__35099C4A] DEFAULT (1) FOR [single_account_mode]
GO
--SqlScripter----[dbo].[DF__usm_tenan__statu__322D2F9F].sql
GO
ALTER TABLE [dbo].[usm_tenant] ADD CONSTRAINT [DF__usm_tenan__statu__322D2F9F] DEFAULT (1) FOR [status]
GO
--SqlScripter----[dbo].[DF__usm_user__status__3D9EE24B].sql
GO
ALTER TABLE [dbo].[usm_user] ADD CONSTRAINT [DF__usm_user__status__3D9EE24B] DEFAULT (1) FOR [status]
GO
--SqlScripter----[dbo].[DF__usm_webse__is_sy__444BDFDA].sql
GO
ALTER TABLE [dbo].[usm_webservice] ADD CONSTRAINT [DF__usm_webse__is_sy__444BDFDA] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_webse__load___42639768].sql
GO
ALTER TABLE [dbo].[usm_webservice] ADD CONSTRAINT [DF__usm_webse__load___42639768] DEFAULT (0) FOR [load_on_startup]
GO
--SqlScripter----[dbo].[DF__usm_webse__stati__4357BBA1].sql
GO
ALTER TABLE [dbo].[usm_webservice] ADD CONSTRAINT [DF__usm_webse__stati__4357BBA1] DEFAULT (0) FOR [static]
GO
--SqlScripter----[dbo].[DF__usm_webse__is_sy__47284C85].sql
GO
ALTER TABLE [dbo].[usm_webservice_method] ADD CONSTRAINT [DF__usm_webse__is_sy__47284C85] DEFAULT (0) FOR [is_system]
GO
--SqlScripter----[dbo].[DF__usm_webse__load___481C70BE].sql
GO
ALTER TABLE [dbo].[usm_webservice_method] ADD CONSTRAINT [DF__usm_webse__load___481C70BE] DEFAULT (0) FOR [load_on_startup]
GO
--SqlScripter----[dbo].[DF__usm_webse__use_c__491094F7].sql
GO
ALTER TABLE [dbo].[usm_webservice_method] ADD CONSTRAINT [DF__usm_webse__use_c__491094F7] DEFAULT (0) FOR [use_cache]
GO
--SqlScripter----[dbo].[DF__ut_dataso__lactd__47D32352].sql
GO
ALTER TABLE [dbo].[ut_datasource_log] ADD CONSTRAINT [DF__ut_dataso__lactd__47D32352] DEFAULT (' ') FOR [lactdate]
GO
--SqlScripter----[dbo].[DF__ut_dataso__lacti__45EADAE0].sql
GO
ALTER TABLE [dbo].[ut_datasource_log] ADD CONSTRAINT [DF__ut_dataso__lacti__45EADAE0] DEFAULT (' ') FOR [lactivity]
GO
--SqlScripter----[dbo].[DF__ut_dataso__lactr__46DEFF19].sql
GO
ALTER TABLE [dbo].[ut_datasource_log] ADD CONSTRAINT [DF__ut_dataso__lactr__46DEFF19] DEFAULT (' ') FOR [lactresult]
GO
--SqlScripter----[dbo].[DF__wf_ids__category__7D5B0B5B].sql
GO
ALTER TABLE [dbo].[wf_ids] ADD CONSTRAINT [DF__wf_ids__category__7D5B0B5B] DEFAULT (' ') FOR [category]
GO
--SqlScripter----[dbo].[DF__wf_ids__id__7C66E722].sql
GO
ALTER TABLE [dbo].[wf_ids] ADD CONSTRAINT [DF__wf_ids__id__7C66E722] DEFAULT (0) FOR [id]
GO
--SqlScripter----[dbo].[DF__wf_locks__inuse__7212AA8A].sql
GO
ALTER TABLE [dbo].[wf_locks] ADD CONSTRAINT [DF__wf_locks__inuse__7212AA8A] DEFAULT (' ') FOR [inuse]
GO
--SqlScripter----[dbo].[DF__wf_locks__lastch__712A3EA0].sql
GO
ALTER TABLE [dbo].[wf_locks] ADD CONSTRAINT [DF__wf_locks__lastch__712A3EA0] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__wfschema__lastch__67A0D466].sql
GO
ALTER TABLE [dbo].[wfschema] ADD CONSTRAINT [DF__wfschema__lastch__67A0D466] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__workflow___lastc__69891CD8].sql
GO
ALTER TABLE [dbo].[workflow_configuration] ADD CONSTRAINT [DF__workflow___lastc__69891CD8] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__workflow___lastc__5B3AFD81].sql
GO
ALTER TABLE [dbo].[workflow_groups] ADD CONSTRAINT [DF__workflow___lastc__5B3AFD81] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__workitems__lastc__6E4DD1F5].sql
GO
ALTER TABLE [dbo].[workitems] ADD CONSTRAINT [DF__workitems__lastc__6E4DD1F5] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__workitems__nodei__033D368C].sql
GO
ALTER TABLE [dbo].[workitems] ADD CONSTRAINT [DF__workitems__nodei__033D368C] DEFAULT ('') FOR [nodeid]
GO
--SqlScripter----[dbo].[DF__workitems__proce__02491253].sql
GO
ALTER TABLE [dbo].[workitems] ADD CONSTRAINT [DF__workitems__proce__02491253] DEFAULT ('') FOR [processid]
GO
--SqlScripter----[dbo].[DF__workitems__trans__04315AC5].sql
GO
ALTER TABLE [dbo].[workitems] ADD CONSTRAINT [DF__workitems__trans__04315AC5] DEFAULT (0) FOR [transient]
GO
--SqlScripter----[dbo].[DF__worklist__lastch__66ACB02D].sql
GO
ALTER TABLE [dbo].[worklist] ADD CONSTRAINT [DF__worklist__lastch__66ACB02D] DEFAULT (0) FOR [lastcheckin]
GO
--SqlScripter----[dbo].[DF__worklist__proces__0619A337].sql
GO
ALTER TABLE [dbo].[worklist] ADD CONSTRAINT [DF__worklist__proces__0619A337] DEFAULT (' ') FOR [processname]
GO
--SqlScripter----[dbo].[DF__wsm_engin__creat__413A6905].sql
GO
ALTER TABLE [dbo].[wsm_engine] ADD CONSTRAINT [DF__wsm_engin__creat__413A6905] DEFAULT (' ') FOR [create_date]
GO
--SqlScripter----[dbo].[DF__wsm_image__is_ca__4DA03FEA].sql
GO
ALTER TABLE [dbo].[wsm_image] ADD CONSTRAINT [DF__wsm_image__is_ca__4DA03FEA] DEFAULT (0) FOR [is_calibrated]
GO
--SqlScripter----[dbo].[DF__wsm_model__updat__69485A5F].sql
GO
ALTER TABLE [dbo].[wsm_model] ADD CONSTRAINT [DF__wsm_model__updat__69485A5F] DEFAULT (1) FOR [updatewv]
GO
--SqlScripter----[dbo].[DF__wtdbpvque__inclu__0E44D4E4].sql
GO
ALTER TABLE [dbo].[wtdbpvqueryinfo] ADD CONSTRAINT [DF__wtdbpvque__inclu__0E44D4E4] DEFAULT (1) FOR [include_subclasses]
GO
--SqlScripter----[dbo].[DF__wtmqchann__MqCha__4DCBF3CA].sql
GO
ALTER TABLE [dbo].[wtmqchannelinst] ADD CONSTRAINT [DF__wtmqchann__MqCha__4DCBF3CA] DEFAULT ('') FOR [MqChannelInstType]
GO
--SqlScripter----[dbo].[DF__wtmqmgrin__MqsCm__50A86075].sql
GO
ALTER TABLE [dbo].[wtmqmgrinst] ADD CONSTRAINT [DF__wtmqmgrin__MqsCm__50A86075] DEFAULT ('520') FOR [MqsCmdLevel]
GO
--SqlScripter----[dbo].[DF__wtmqmgrin__MqsLi__519C84AE].sql
GO
ALTER TABLE [dbo].[wtmqmgrinst] ADD CONSTRAINT [DF__wtmqmgrin__MqsLi__519C84AE] DEFAULT ('1414') FOR [MqsListenPort]
GO
--SqlScripter----[dbo].[DF__wtmqmgrin__MqsPl__4FB43C3C].sql
GO
ALTER TABLE [dbo].[wtmqmgrinst] ADD CONSTRAINT [DF__wtmqmgrin__MqsPl__4FB43C3C] DEFAULT ('UNKNOWN') FOR [MqsPlatform]
GO
--SqlScripter----[dbo].[DF__wtmqmgrin__MqsRe__4EC01803].sql
GO
ALTER TABLE [dbo].[wtmqmgrinst] ADD CONSTRAINT [DF__wtmqmgrin__MqsRe__4EC01803] DEFAULT (2) FOR [MqsRemote]
GO
--SqlScripter----[dbo].[DF__wturm__urm_alarm__48C67C34].sql
GO
ALTER TABLE [dbo].[wturm] ADD CONSTRAINT [DF__wturm__urm_alarm__48C67C34] DEFAULT ('') FOR [urm_alarmmsg]
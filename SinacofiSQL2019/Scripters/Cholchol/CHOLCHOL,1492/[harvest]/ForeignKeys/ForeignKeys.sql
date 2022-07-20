
GO
--SqlScripter----[dbo].[action].[$actio_r00003db000000000].sql
GO
ALTER TABLE [dbo].[action] WITH NOCHECK ADD CONSTRAINT [$actio_r00003db000000000] FOREIGN KEY ([actiontype])
REFERENCES [dbo].[actiontype] ([actiontype])
GO
ALTER TABLE [dbo].[action] WITH CHECK CHECK CONSTRAINT [$actio_r00003db000000000]
GO
--SqlScripter----[dbo].[actiongroup].[$actio_r00003dfa00000000].sql
GO
ALTER TABLE [dbo].[actiongroup] WITH NOCHECK ADD CONSTRAINT [$actio_r00003dfa00000000] FOREIGN KEY ([requestid])
REFERENCES [dbo].[request_pki] ([requestid])
GO
ALTER TABLE [dbo].[actiongroup] WITH CHECK CHECK CONSTRAINT [$actio_r00003dfa00000000]
GO
--SqlScripter----[dbo].[amephis].[$ameph_r0000085a00000000].sql
GO
ALTER TABLE [dbo].[amephis] WITH NOCHECK ADD CONSTRAINT [$ameph_r0000085a00000000] FOREIGN KEY ([epid], [domainid])
REFERENCES [dbo].[amepdef] ([epid], [domainid])
GO
ALTER TABLE [dbo].[amephis] WITH CHECK CHECK CONSTRAINT [$ameph_r0000085a00000000]
GO
--SqlScripter----[dbo].[application_option].[$appli_r00001b9500000000].sql
GO
ALTER TABLE [dbo].[application_option] WITH NOCHECK ADD CONSTRAINT [$appli_r00001b9500000000] FOREIGN KEY ([unit_id])
REFERENCES [dbo].[system_configuration] ([unit_id])
GO
ALTER TABLE [dbo].[application_option] WITH CHECK CHECK CONSTRAINT [$appli_r00001b9500000000]
GO
--SqlScripter----[dbo].[applied_remediation].[$appli_r00001b7700000000].sql
GO
ALTER TABLE [dbo].[applied_remediation] WITH NOCHECK ADD CONSTRAINT [$appli_r00001b7700000000] FOREIGN KEY ([applied_remed_status_id])
REFERENCES [dbo].[applied_remediation_status] ([applied_remed_status_id])
GO
ALTER TABLE [dbo].[applied_remediation] WITH CHECK CHECK CONSTRAINT [$appli_r00001b7700000000]
GO
--SqlScripter----[dbo].[applied_remediation].[$appli_r00001b8100000000].sql
GO
ALTER TABLE [dbo].[applied_remediation] WITH NOCHECK ADD CONSTRAINT [$appli_r00001b8100000000] FOREIGN KEY ([asset_detection_profile_rec_id])
REFERENCES [dbo].[asset_detection_profile] ([asset_detection_profile_rec_id])
GO
ALTER TABLE [dbo].[applied_remediation] WITH CHECK CHECK CONSTRAINT [$appli_r00001b8100000000]
GO
--SqlScripter----[dbo].[applied_remediation].[$appli_r00001b8b00000000].sql
GO
ALTER TABLE [dbo].[applied_remediation] WITH NOCHECK ADD CONSTRAINT [$appli_r00001b8b00000000] FOREIGN KEY ([remediation_profile_id])
REFERENCES [dbo].[remediation_profile] ([remed_profile_id])
GO
ALTER TABLE [dbo].[applied_remediation] WITH CHECK CHECK CONSTRAINT [$appli_r00001b8b00000000]
GO
--SqlScripter----[dbo].[approvalaction].[$appro_r00003ddf00000000].sql
GO
ALTER TABLE [dbo].[approvalaction] WITH NOCHECK ADD CONSTRAINT [$appro_r00003ddf00000000] FOREIGN KEY ([actionid])
REFERENCES [dbo].[action] ([actionid])
GO
ALTER TABLE [dbo].[approvalaction] WITH CHECK CHECK CONSTRAINT [$appro_r00003ddf00000000]
GO
--SqlScripter----[dbo].[arg_job_task].[arg_job_task_fk01].sql
GO
ALTER TABLE [dbo].[arg_job_task] WITH NOCHECK ADD CONSTRAINT [arg_job_task_fk01] FOREIGN KEY ([job_id])
REFERENCES [dbo].[arg_job] ([job_id])
GO
ALTER TABLE [dbo].[arg_job_task] WITH CHECK CHECK CONSTRAINT [arg_job_task_fk01]
GO
--SqlScripter----[dbo].[asmo_object].[typefk].sql
GO
ALTER TABLE [dbo].[asmo_object] WITH NOCHECK ADD CONSTRAINT [typefk] FOREIGN KEY ([object_type])
REFERENCES [dbo].[asmo_type] ([type_id])
GO
ALTER TABLE [dbo].[asmo_object] WITH CHECK CHECK CONSTRAINT [typefk]
GO
--SqlScripter----[dbo].[asmo_platform].[platformtypefk].sql
GO
ALTER TABLE [dbo].[asmo_platform] WITH NOCHECK ADD CONSTRAINT [platformtypefk] FOREIGN KEY ([platform_type_id])
REFERENCES [dbo].[asmo_type] ([type_id])
GO
ALTER TABLE [dbo].[asmo_platform] WITH CHECK CHECK CONSTRAINT [platformtypefk]
GO
--SqlScripter----[dbo].[asmo_rpt].[eventfk].sql
GO
ALTER TABLE [dbo].[asmo_rpt] WITH NOCHECK ADD CONSTRAINT [eventfk] FOREIGN KEY ([event_id])
REFERENCES [dbo].[asmo_event] ([event_id])
GO
ALTER TABLE [dbo].[asmo_rpt] WITH CHECK CHECK CONSTRAINT [eventfk]
GO
--SqlScripter----[dbo].[asmo_rpt].[newstatefk].sql
GO
ALTER TABLE [dbo].[asmo_rpt] WITH NOCHECK ADD CONSTRAINT [newstatefk] FOREIGN KEY ([new_state_id])
REFERENCES [dbo].[asmo_state] ([state_id])
GO
ALTER TABLE [dbo].[asmo_rpt] WITH CHECK CHECK CONSTRAINT [newstatefk]
GO
--SqlScripter----[dbo].[asmo_rpt].[objectfk].sql
GO
ALTER TABLE [dbo].[asmo_rpt] WITH NOCHECK ADD CONSTRAINT [objectfk] FOREIGN KEY ([object_id])
REFERENCES [dbo].[asmo_object] ([object_id])
GO
ALTER TABLE [dbo].[asmo_rpt] WITH CHECK CHECK CONSTRAINT [objectfk]
GO
--SqlScripter----[dbo].[asmo_rpt].[oldstatefk].sql
GO
ALTER TABLE [dbo].[asmo_rpt] WITH NOCHECK ADD CONSTRAINT [oldstatefk] FOREIGN KEY ([old_state_id])
REFERENCES [dbo].[asmo_state] ([state_id])
GO
ALTER TABLE [dbo].[asmo_rpt] WITH CHECK CHECK CONSTRAINT [oldstatefk]
GO
--SqlScripter----[dbo].[asmo_rpt].[platformfk].sql
GO
ALTER TABLE [dbo].[asmo_rpt] WITH NOCHECK ADD CONSTRAINT [platformfk] FOREIGN KEY ([platform_id])
REFERENCES [dbo].[asmo_platform] ([platform_id])
GO
ALTER TABLE [dbo].[asmo_rpt] WITH CHECK CHECK CONSTRAINT [platformfk]
GO
--SqlScripter----[dbo].[asset_detection_profile].[$asset_r00001b6d00000000].sql
GO
ALTER TABLE [dbo].[asset_detection_profile] WITH NOCHECK ADD CONSTRAINT [$asset_r00001b6d00000000] FOREIGN KEY ([asset_detect_profile_status_id])
REFERENCES [dbo].[asset_detection_profile_status] ([asset_detect_profile_status_id])
GO
ALTER TABLE [dbo].[asset_detection_profile] WITH CHECK CHECK CONSTRAINT [$asset_r00001b6d00000000]
GO
--SqlScripter----[dbo].[asset_group].[$asset_r00001c8900000000].sql
GO
ALTER TABLE [dbo].[asset_group] WITH NOCHECK ADD CONSTRAINT [$asset_r00001c8900000000] FOREIGN KEY ([config_standard_set_id])
REFERENCES [dbo].[configuration_standard_set] ([config_standard_set_id])
GO
ALTER TABLE [dbo].[asset_group] WITH CHECK CHECK CONSTRAINT [$asset_r00001c8900000000]
GO
--SqlScripter----[dbo].[asset_group].[$asset_r00001c9200000000].sql
GO
ALTER TABLE [dbo].[asset_group] WITH NOCHECK ADD CONSTRAINT [$asset_r00001c9200000000] FOREIGN KEY ([protection_level_id])
REFERENCES [dbo].[protection_level] ([protection_level_id])
GO
ALTER TABLE [dbo].[asset_group] WITH CHECK CHECK CONSTRAINT [$asset_r00001c9200000000]
GO
--SqlScripter----[dbo].[asset_group_process_schedule].[$asset_r00001b0f00000000].sql
GO
ALTER TABLE [dbo].[asset_group_process_schedule] WITH NOCHECK ADD CONSTRAINT [$asset_r00001b0f00000000] FOREIGN KEY ([process_schedule_id])
REFERENCES [dbo].[process_schedule] ([process_schedule_id])
GO
ALTER TABLE [dbo].[asset_group_process_schedule] WITH CHECK CHECK CONSTRAINT [$asset_r00001b0f00000000]
GO
--SqlScripter----[dbo].[asset_group_process_schedule].[$asset_r00001b1900000000].sql
GO
ALTER TABLE [dbo].[asset_group_process_schedule] WITH NOCHECK ADD CONSTRAINT [$asset_r00001b1900000000] FOREIGN KEY ([asset_group_id])
REFERENCES [dbo].[vunerability_asset_group] ([asset_group_id])
GO
ALTER TABLE [dbo].[asset_group_process_schedule] WITH CHECK CHECK CONSTRAINT [$asset_r00001b1900000000]
GO
--SqlScripter----[dbo].[asset_group_software_product].[$asset_r00001c9b00000000].sql
GO
ALTER TABLE [dbo].[asset_group_software_product] WITH NOCHECK ADD CONSTRAINT [$asset_r00001c9b00000000] FOREIGN KEY ([asset_group_id])
REFERENCES [dbo].[asset_group] ([asset_group_id])
GO
ALTER TABLE [dbo].[asset_group_software_product] WITH CHECK CHECK CONSTRAINT [$asset_r00001c9b00000000]
GO
--SqlScripter----[dbo].[asset_group_software_product].[$asset_r00001ca400000000].sql
GO
ALTER TABLE [dbo].[asset_group_software_product] WITH NOCHECK ADD CONSTRAINT [$asset_r00001ca400000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[asset_group_software_product] WITH CHECK CHECK CONSTRAINT [$asset_r00001ca400000000]
GO
--SqlScripter----[dbo].[asset_software_delivery_job].[$asset_r00001cad00000000].sql
GO
ALTER TABLE [dbo].[asset_software_delivery_job] WITH NOCHECK ADD CONSTRAINT [$asset_r00001cad00000000] FOREIGN KEY ([software_delivery_job_id])
REFERENCES [dbo].[software_delivery_job] ([software_delivery_job_id])
GO
ALTER TABLE [dbo].[asset_software_delivery_job] WITH CHECK CHECK CONSTRAINT [$asset_r00001cad00000000]
GO
--SqlScripter----[dbo].[asset_software_delivery_job].[$asset_r00001cb600000000].sql
GO
ALTER TABLE [dbo].[asset_software_delivery_job] WITH NOCHECK ADD CONSTRAINT [$asset_r00001cb600000000] FOREIGN KEY ([software_delivery_server_id])
REFERENCES [dbo].[software_delivery_server] ([software_delivery_server_id])
GO
ALTER TABLE [dbo].[asset_software_delivery_job] WITH CHECK CHECK CONSTRAINT [$asset_r00001cb600000000]
GO
--SqlScripter----[dbo].[asset_software_delivery_job].[$asset_r00001cbf00000000].sql
GO
ALTER TABLE [dbo].[asset_software_delivery_job] WITH NOCHECK ADD CONSTRAINT [$asset_r00001cbf00000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[asset_software_delivery_job] WITH CHECK CHECK CONSTRAINT [$asset_r00001cbf00000000]
GO
--SqlScripter----[dbo].[asset_vulnerability].[$asset_r00001cc800000000].sql
GO
ALTER TABLE [dbo].[asset_vulnerability] WITH NOCHECK ADD CONSTRAINT [$asset_r00001cc800000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[asset_vulnerability] WITH CHECK CHECK CONSTRAINT [$asset_r00001cc800000000]
GO
--SqlScripter----[dbo].[asset_vulnerability].[$asset_r00001cd100000000].sql
GO
ALTER TABLE [dbo].[asset_vulnerability] WITH NOCHECK ADD CONSTRAINT [$asset_r00001cd100000000] FOREIGN KEY ([vuln_id])
REFERENCES [dbo].[vulnerability] ([vuln_id])
GO
ALTER TABLE [dbo].[asset_vulnerability] WITH CHECK CHECK CONSTRAINT [$asset_r00001cd100000000]
GO
--SqlScripter----[dbo].[bp_standard_category].[$bp_st_r00001bd100000000].sql
GO
ALTER TABLE [dbo].[bp_standard_category] WITH NOCHECK ADD CONSTRAINT [$bp_st_r00001bd100000000] FOREIGN KEY ([config_standard_set_id])
REFERENCES [dbo].[configuration_standard_set] ([config_standard_set_id])
GO
ALTER TABLE [dbo].[bp_standard_category] WITH CHECK CHECK CONSTRAINT [$bp_st_r00001bd100000000]
GO
--SqlScripter----[dbo].[ca_agent].[$ca_ag_r0000086400000000].sql
GO
ALTER TABLE [dbo].[ca_agent] WITH NOCHECK ADD CONSTRAINT [$ca_ag_r0000086400000000] FOREIGN KEY ([server_uuid])
REFERENCES [dbo].[ca_server] ([server_uuid])
GO
ALTER TABLE [dbo].[ca_agent] WITH CHECK CHECK CONSTRAINT [$ca_ag_r0000086400000000]
GO
--SqlScripter----[dbo].[ca_asset].[$ca_as_r000001e900000000].sql
GO
ALTER TABLE [dbo].[ca_asset] WITH NOCHECK ADD CONSTRAINT [$ca_as_r000001e900000000] FOREIGN KEY ([asset_type_id])
REFERENCES [dbo].[ca_asset_type] ([asset_type_id])
GO
ALTER TABLE [dbo].[ca_asset] WITH CHECK CHECK CONSTRAINT [$ca_as_r000001e900000000]
GO
--SqlScripter----[dbo].[ca_asset_class].[$ca_as_r0000020700000000].sql
GO
ALTER TABLE [dbo].[ca_asset_class] WITH NOCHECK ADD CONSTRAINT [$ca_as_r0000020700000000] FOREIGN KEY ([hierarchy_id], [class_id])
REFERENCES [dbo].[ca_class_hierarchy] ([hierarchy_id], [child_class_id])
GO
ALTER TABLE [dbo].[ca_asset_class] WITH CHECK CHECK CONSTRAINT [$ca_as_r0000020700000000]
GO
--SqlScripter----[dbo].[ca_asset_class].[$ca_as_r0000021000000000].sql
GO
ALTER TABLE [dbo].[ca_asset_class] WITH NOCHECK ADD CONSTRAINT [$ca_as_r0000021000000000] FOREIGN KEY ([hierarchy_id])
REFERENCES [dbo].[ca_hierarchy] ([hierarchy_id])
GO
ALTER TABLE [dbo].[ca_asset_class] WITH CHECK CHECK CONSTRAINT [$ca_as_r0000021000000000]
GO
--SqlScripter----[dbo].[ca_asset_class].[$ca_as_r0000021900000000].sql
GO
ALTER TABLE [dbo].[ca_asset_class] WITH NOCHECK ADD CONSTRAINT [$ca_as_r0000021900000000] FOREIGN KEY ([logical_asset_uuid])
REFERENCES [dbo].[ca_logical_asset] ([logical_asset_uuid])
GO
ALTER TABLE [dbo].[ca_asset_class] WITH CHECK CHECK CONSTRAINT [$ca_as_r0000021900000000]
GO
--SqlScripter----[dbo].[ca_asset_source].[$ca_as_r000001f300000000].sql
GO
ALTER TABLE [dbo].[ca_asset_source] WITH NOCHECK ADD CONSTRAINT [$ca_as_r000001f300000000] FOREIGN KEY ([subschema_id])
REFERENCES [dbo].[ca_asset_subschema] ([subschema_id])
GO
ALTER TABLE [dbo].[ca_asset_source] WITH CHECK CHECK CONSTRAINT [$ca_as_r000001f300000000]
GO
--SqlScripter----[dbo].[ca_asset_source].[$ca_as_r000001fd00000000].sql
GO
ALTER TABLE [dbo].[ca_asset_source] WITH NOCHECK ADD CONSTRAINT [$ca_as_r000001fd00000000] FOREIGN KEY ([source_location_uuid])
REFERENCES [dbo].[ca_asset_source_location] ([source_location_uuid])
GO
ALTER TABLE [dbo].[ca_asset_source] WITH CHECK CHECK CONSTRAINT [$ca_as_r000001fd00000000]
GO
--SqlScripter----[dbo].[ca_asset_source].[$ca_as_r0000066500000000].sql
GO
ALTER TABLE [dbo].[ca_asset_source] WITH NOCHECK ADD CONSTRAINT [$ca_as_r0000066500000000] FOREIGN KEY ([logical_asset_uuid])
REFERENCES [dbo].[ca_logical_asset] ([logical_asset_uuid])
GO
ALTER TABLE [dbo].[ca_asset_source] WITH CHECK CHECK CONSTRAINT [$ca_as_r0000066500000000]
GO
--SqlScripter----[dbo].[ca_category_member].[$ca_ca_r0000022200000000].sql
GO
ALTER TABLE [dbo].[ca_category_member] WITH NOCHECK ADD CONSTRAINT [$ca_ca_r0000022200000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_category_member] WITH CHECK CHECK CONSTRAINT [$ca_ca_r0000022200000000]
GO
--SqlScripter----[dbo].[ca_category_member].[$ca_ca_r0000022c00000000].sql
GO
ALTER TABLE [dbo].[ca_category_member] WITH NOCHECK ADD CONSTRAINT [$ca_ca_r0000022c00000000] FOREIGN KEY ([category_uuid])
REFERENCES [dbo].[ca_category_def] ([category_uuid])
GO
ALTER TABLE [dbo].[ca_category_member] WITH CHECK CHECK CONSTRAINT [$ca_ca_r0000022c00000000]
GO
--SqlScripter----[dbo].[ca_class_ace].[$ca_cl_r0000086e00000000].sql
GO
ALTER TABLE [dbo].[ca_class_ace] WITH NOCHECK ADD CONSTRAINT [$ca_cl_r0000086e00000000] FOREIGN KEY ([class_def_uuid])
REFERENCES [dbo].[ca_security_class_def] ([class_def_uuid])
GO
ALTER TABLE [dbo].[ca_class_ace] WITH CHECK CHECK CONSTRAINT [$ca_cl_r0000086e00000000]
GO
--SqlScripter----[dbo].[ca_class_ace].[$ca_cl_r0000087800000000].sql
GO
ALTER TABLE [dbo].[ca_class_ace] WITH NOCHECK ADD CONSTRAINT [$ca_cl_r0000087800000000] FOREIGN KEY ([security_profile_uuid])
REFERENCES [dbo].[ca_security_profile] ([security_profile_uuid])
GO
ALTER TABLE [dbo].[ca_class_ace] WITH CHECK CHECK CONSTRAINT [$ca_cl_r0000087800000000]
GO
--SqlScripter----[dbo].[ca_class_hierarchy].[$ca_cl_r000002e300000000].sql
GO
ALTER TABLE [dbo].[ca_class_hierarchy] WITH NOCHECK ADD CONSTRAINT [$ca_cl_r000002e300000000] FOREIGN KEY ([hierarchy_id])
REFERENCES [dbo].[ca_hierarchy] ([hierarchy_id])
GO
ALTER TABLE [dbo].[ca_class_hierarchy] WITH CHECK CHECK CONSTRAINT [$ca_cl_r000002e300000000]
GO
--SqlScripter----[dbo].[ca_class_hierarchy].[$ca_cl_r000002ec00000000].sql
GO
ALTER TABLE [dbo].[ca_class_hierarchy] WITH NOCHECK ADD CONSTRAINT [$ca_cl_r000002ec00000000] FOREIGN KEY ([parent_class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_class_hierarchy] WITH CHECK CHECK CONSTRAINT [$ca_cl_r000002ec00000000]
GO
--SqlScripter----[dbo].[ca_class_hierarchy].[$ca_cl_r000002f500000000].sql
GO
ALTER TABLE [dbo].[ca_class_hierarchy] WITH NOCHECK ADD CONSTRAINT [$ca_cl_r000002f500000000] FOREIGN KEY ([child_class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_class_hierarchy] WITH CHECK CHECK CONSTRAINT [$ca_cl_r000002f500000000]
GO
--SqlScripter----[dbo].[ca_company].[ca_company_fk01].sql
GO
ALTER TABLE [dbo].[ca_company] WITH NOCHECK ADD CONSTRAINT [ca_company_fk01] FOREIGN KEY ([primary_contact_uuid])
REFERENCES [dbo].[ca_contact] ([contact_uuid])
GO
ALTER TABLE [dbo].[ca_company] WITH CHECK CHECK CONSTRAINT [ca_company_fk01]
GO
--SqlScripter----[dbo].[ca_company].[ca_company_fk02].sql
GO
ALTER TABLE [dbo].[ca_company] WITH NOCHECK ADD CONSTRAINT [ca_company_fk02] FOREIGN KEY ([company_type])
REFERENCES [dbo].[ca_company_type] ([id])
GO
ALTER TABLE [dbo].[ca_company] WITH CHECK CHECK CONSTRAINT [ca_company_fk02]
GO
--SqlScripter----[dbo].[ca_company].[ca_company_fk03].sql
GO
ALTER TABLE [dbo].[ca_company] WITH NOCHECK ADD CONSTRAINT [ca_company_fk03] FOREIGN KEY ([parent_company_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_company] WITH CHECK CHECK CONSTRAINT [ca_company_fk03]
GO
--SqlScripter----[dbo].[ca_company].[ca_company_fk04].sql
GO
ALTER TABLE [dbo].[ca_company] WITH NOCHECK ADD CONSTRAINT [ca_company_fk04] FOREIGN KEY ([location_uuid])
REFERENCES [dbo].[ca_location] ([location_uuid])
GO
ALTER TABLE [dbo].[ca_company] WITH CHECK CHECK CONSTRAINT [ca_company_fk04]
GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_fk01].sql
GO
ALTER TABLE [dbo].[ca_contact] WITH NOCHECK ADD CONSTRAINT [ca_contact_fk01] FOREIGN KEY ([contact_uuid])
REFERENCES [dbo].[ca_contact] ([contact_uuid])
GO
ALTER TABLE [dbo].[ca_contact] WITH CHECK CHECK CONSTRAINT [ca_contact_fk01]
GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_fk02].sql
GO
ALTER TABLE [dbo].[ca_contact] WITH NOCHECK ADD CONSTRAINT [ca_contact_fk02] FOREIGN KEY ([location_uuid])
REFERENCES [dbo].[ca_location] ([location_uuid])
GO
ALTER TABLE [dbo].[ca_contact] WITH CHECK CHECK CONSTRAINT [ca_contact_fk02]
GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_fk03].sql
GO
ALTER TABLE [dbo].[ca_contact] WITH NOCHECK ADD CONSTRAINT [ca_contact_fk03] FOREIGN KEY ([admin_organization_uuid])
REFERENCES [dbo].[ca_organization] ([organization_uuid])
GO
ALTER TABLE [dbo].[ca_contact] WITH CHECK CHECK CONSTRAINT [ca_contact_fk03]
GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_fk04].sql
GO
ALTER TABLE [dbo].[ca_contact] WITH NOCHECK ADD CONSTRAINT [ca_contact_fk04] FOREIGN KEY ([organization_uuid])
REFERENCES [dbo].[ca_organization] ([organization_uuid])
GO
ALTER TABLE [dbo].[ca_contact] WITH CHECK CHECK CONSTRAINT [ca_contact_fk04]
GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_fk05].sql
GO
ALTER TABLE [dbo].[ca_contact] WITH NOCHECK ADD CONSTRAINT [ca_contact_fk05] FOREIGN KEY ([company_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_contact] WITH CHECK CHECK CONSTRAINT [ca_contact_fk05]
GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_fk06].sql
GO
ALTER TABLE [dbo].[ca_contact] WITH NOCHECK ADD CONSTRAINT [ca_contact_fk06] FOREIGN KEY ([job_title])
REFERENCES [dbo].[ca_job_title] ([id])
GO
ALTER TABLE [dbo].[ca_contact] WITH CHECK CHECK CONSTRAINT [ca_contact_fk06]
GO
--SqlScripter----[dbo].[ca_contact].[ca_contact_fk07].sql
GO
ALTER TABLE [dbo].[ca_contact] WITH NOCHECK ADD CONSTRAINT [ca_contact_fk07] FOREIGN KEY ([contact_type])
REFERENCES [dbo].[ca_contact_type] ([id])
GO
ALTER TABLE [dbo].[ca_contact] WITH CHECK CHECK CONSTRAINT [ca_contact_fk07]
GO
--SqlScripter----[dbo].[ca_contact_type].[ca_contact_type_fk01].sql
GO
ALTER TABLE [dbo].[ca_contact_type] WITH NOCHECK ADD CONSTRAINT [ca_contact_type_fk01] FOREIGN KEY ([user_uuid])
REFERENCES [dbo].[ca_discovered_user] ([user_uuid])
GO
ALTER TABLE [dbo].[ca_contact_type] WITH CHECK CHECK CONSTRAINT [ca_contact_type_fk01]
GO
--SqlScripter----[dbo].[ca_disc_event].[$ca_di_r0000052700000000].sql
GO
ALTER TABLE [dbo].[ca_disc_event] WITH NOCHECK ADD CONSTRAINT [$ca_di_r0000052700000000] FOREIGN KEY ([logical_asset_uuid])
REFERENCES [dbo].[ca_logical_asset] ([logical_asset_uuid])
GO
ALTER TABLE [dbo].[ca_disc_event] WITH CHECK CHECK CONSTRAINT [$ca_di_r0000052700000000]
GO
--SqlScripter----[dbo].[ca_discovered_hardware].[$ca_di_r000002ac00000000].sql
GO
ALTER TABLE [dbo].[ca_discovered_hardware] WITH NOCHECK ADD CONSTRAINT [$ca_di_r000002ac00000000] FOREIGN KEY ([asset_source_uuid])
REFERENCES [dbo].[ca_asset_source] ([asset_source_uuid])
GO
ALTER TABLE [dbo].[ca_discovered_hardware] WITH CHECK CHECK CONSTRAINT [$ca_di_r000002ac00000000]
GO
--SqlScripter----[dbo].[ca_discovered_hardware].[$ca_di_r00000a2600000000].sql
GO
ALTER TABLE [dbo].[ca_discovered_hardware] WITH NOCHECK ADD CONSTRAINT [$ca_di_r00000a2600000000] FOREIGN KEY ([domain_uuid])
REFERENCES [dbo].[ca_n_tier] ([domain_uuid])
GO
ALTER TABLE [dbo].[ca_discovered_hardware] WITH CHECK CHECK CONSTRAINT [$ca_di_r00000a2600000000]
GO
--SqlScripter----[dbo].[ca_discovered_hardware_ext_sys].[$ca_di_r000002b500000000].sql
GO
ALTER TABLE [dbo].[ca_discovered_hardware_ext_sys] WITH NOCHECK ADD CONSTRAINT [$ca_di_r000002b500000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[ca_discovered_hardware_ext_sys] WITH CHECK CHECK CONSTRAINT [$ca_di_r000002b500000000]
GO
--SqlScripter----[dbo].[ca_discovered_software].[$ca_di_r000002be00000000].sql
GO
ALTER TABLE [dbo].[ca_discovered_software] WITH NOCHECK ADD CONSTRAINT [$ca_di_r000002be00000000] FOREIGN KEY ([license_uuid])
REFERENCES [dbo].[ca_software_license] ([license_uuid])
GO
ALTER TABLE [dbo].[ca_discovered_software] WITH CHECK CHECK CONSTRAINT [$ca_di_r000002be00000000]
GO
--SqlScripter----[dbo].[ca_discovered_software].[$ca_di_r000002c700000000].sql
GO
ALTER TABLE [dbo].[ca_discovered_software] WITH NOCHECK ADD CONSTRAINT [$ca_di_r000002c700000000] FOREIGN KEY ([asset_source_uuid])
REFERENCES [dbo].[ca_asset_source] ([asset_source_uuid])
GO
ALTER TABLE [dbo].[ca_discovered_software] WITH CHECK CHECK CONSTRAINT [$ca_di_r000002c700000000]
GO
--SqlScripter----[dbo].[ca_discovered_software].[$ca_di_r000002d000000000].sql
GO
ALTER TABLE [dbo].[ca_discovered_software] WITH NOCHECK ADD CONSTRAINT [$ca_di_r000002d000000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_discovered_software] WITH CHECK CHECK CONSTRAINT [$ca_di_r000002d000000000]
GO
--SqlScripter----[dbo].[ca_discovered_software_prop].[$ca_di_r000002d900000000].sql
GO
ALTER TABLE [dbo].[ca_discovered_software_prop] WITH NOCHECK ADD CONSTRAINT [$ca_di_r000002d900000000] FOREIGN KEY ([dis_sw_uuid])
REFERENCES [dbo].[ca_discovered_software] ([dis_sw_uuid])
GO
ALTER TABLE [dbo].[ca_discovered_software_prop] WITH CHECK CHECK CONSTRAINT [$ca_di_r000002d900000000]
GO
--SqlScripter----[dbo].[ca_discovered_user].[$ca_di_r00000a2f00000000].sql
GO
ALTER TABLE [dbo].[ca_discovered_user] WITH NOCHECK ADD CONSTRAINT [$ca_di_r00000a2f00000000] FOREIGN KEY ([domain_uuid])
REFERENCES [dbo].[ca_n_tier] ([domain_uuid])
GO
ALTER TABLE [dbo].[ca_discovered_user] WITH CHECK CHECK CONSTRAINT [$ca_di_r00000a2f00000000]
GO
--SqlScripter----[dbo].[ca_download_file].[$ca_do_r0000058f00000000].sql
GO
ALTER TABLE [dbo].[ca_download_file] WITH NOCHECK ADD CONSTRAINT [$ca_do_r0000058f00000000] FOREIGN KEY ([install_pkg_uuid])
REFERENCES [dbo].[ca_install_package] ([install_pkg_uuid])
GO
ALTER TABLE [dbo].[ca_download_file] WITH CHECK CHECK CONSTRAINT [$ca_do_r0000058f00000000]
GO
--SqlScripter----[dbo].[ca_download_file].[$ca_do_r0000059900000000].sql
GO
ALTER TABLE [dbo].[ca_download_file] WITH NOCHECK ADD CONSTRAINT [$ca_do_r0000059900000000] FOREIGN KEY ([source_type_id])
REFERENCES [dbo].[ca_source_type] ([source_type_id])
GO
ALTER TABLE [dbo].[ca_download_file] WITH CHECK CHECK CONSTRAINT [$ca_do_r0000059900000000]
GO
--SqlScripter----[dbo].[ca_download_file].[$ca_do_r00001d2c00000000].sql
GO
ALTER TABLE [dbo].[ca_download_file] WITH NOCHECK ADD CONSTRAINT [$ca_do_r00001d2c00000000] FOREIGN KEY ([compression_type_id])
REFERENCES [dbo].[compression_type] ([compression_type_id])
GO
ALTER TABLE [dbo].[ca_download_file] WITH CHECK CHECK CONSTRAINT [$ca_do_r00001d2c00000000]
GO
--SqlScripter----[dbo].[ca_download_file].[$ca_do_r00001d3600000000].sql
GO
ALTER TABLE [dbo].[ca_download_file] WITH NOCHECK ADD CONSTRAINT [$ca_do_r00001d3600000000] FOREIGN KEY ([package_type_id])
REFERENCES [dbo].[package_type] ([package_type_id])
GO
ALTER TABLE [dbo].[ca_download_file] WITH CHECK CHECK CONSTRAINT [$ca_do_r00001d3600000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_combo_rules].[$ca_ds_r0000189f00000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_combo_rules] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r0000189f00000000] FOREIGN KEY ([hierarchy_id])
REFERENCES [dbo].[ca_hierarchy] ([hierarchy_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_combo_rules] WITH CHECK CHECK CONSTRAINT [$ca_ds_r0000189f00000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_combo_rules].[$ca_ds_r000018a900000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_combo_rules] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018a900000000] FOREIGN KEY ([class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_combo_rules] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018a900000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_combo_rules].[$ca_ds_r000018b300000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_combo_rules] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018b300000000] FOREIGN KEY ([combination_id])
REFERENCES [dbo].[ca_dscv_class_rules] ([classify_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_combo_rules] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018b300000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_method_params].[$ca_ds_r000018d100000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_method_params] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018d100000000] FOREIGN KEY ([method_id])
REFERENCES [dbo].[ca_dscv_class_methods] ([method_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_method_params] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018d100000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_relationships].[$ca_ds_r000018db00000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018db00000000] FOREIGN KEY ([dst_hierarchy_id])
REFERENCES [dbo].[ca_hierarchy] ([hierarchy_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018db00000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_relationships].[$ca_ds_r000018e500000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018e500000000] FOREIGN KEY ([src_hierarchy_id])
REFERENCES [dbo].[ca_hierarchy] ([hierarchy_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018e500000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_relationships].[$ca_ds_r000018ef00000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018ef00000000] FOREIGN KEY ([dst_class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018ef00000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_relationships].[$ca_ds_r000018f900000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018f900000000] FOREIGN KEY ([src_class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_relationships] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018f900000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_rules].[$ca_ds_r000018bd00000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_rules] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018bd00000000] FOREIGN KEY ([hierarchy_id])
REFERENCES [dbo].[ca_hierarchy] ([hierarchy_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_rules] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018bd00000000]
GO
--SqlScripter----[dbo].[ca_dscv_class_rules].[$ca_ds_r000018c700000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_class_rules] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r000018c700000000] FOREIGN KEY ([class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_dscv_class_rules] WITH CHECK CHECK CONSTRAINT [$ca_ds_r000018c700000000]
GO
--SqlScripter----[dbo].[ca_dscv_method_instances].[$ca_ds_r0000188b00000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_method_instances] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r0000188b00000000] FOREIGN KEY ([method_id])
REFERENCES [dbo].[ca_dscv_class_methods] ([method_id])
GO
ALTER TABLE [dbo].[ca_dscv_method_instances] WITH CHECK CHECK CONSTRAINT [$ca_ds_r0000188b00000000]
GO
--SqlScripter----[dbo].[ca_dscv_method_instances].[$ca_ds_r0000189500000000].sql
GO
ALTER TABLE [dbo].[ca_dscv_method_instances] WITH NOCHECK ADD CONSTRAINT [$ca_ds_r0000189500000000] FOREIGN KEY ([classify_id])
REFERENCES [dbo].[ca_dscv_class_rules] ([classify_id])
GO
ALTER TABLE [dbo].[ca_dscv_method_instances] WITH CHECK CHECK CONSTRAINT [$ca_ds_r0000189500000000]
GO
--SqlScripter----[dbo].[ca_engine].[$ca_en_r0000088200000000].sql
GO
ALTER TABLE [dbo].[ca_engine] WITH NOCHECK ADD CONSTRAINT [$ca_en_r0000088200000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[ca_engine] WITH CHECK CHECK CONSTRAINT [$ca_en_r0000088200000000]
GO
--SqlScripter----[dbo].[ca_group_def].[$ca_gr_r0000088c00000000].sql
GO
ALTER TABLE [dbo].[ca_group_def] WITH NOCHECK ADD CONSTRAINT [$ca_gr_r0000088c00000000] FOREIGN KEY ([evaluation_uuid])
REFERENCES [dbo].[ca_engine] ([engine_uuid])
GO
ALTER TABLE [dbo].[ca_group_def] WITH CHECK CHECK CONSTRAINT [$ca_gr_r0000088c00000000]
GO
--SqlScripter----[dbo].[ca_group_def].[$ca_gr_r0000089600000000].sql
GO
ALTER TABLE [dbo].[ca_group_def] WITH NOCHECK ADD CONSTRAINT [$ca_gr_r0000089600000000] FOREIGN KEY ([query_uuid])
REFERENCES [dbo].[ca_query_def] ([query_uuid])
GO
ALTER TABLE [dbo].[ca_group_def] WITH CHECK CHECK CONSTRAINT [$ca_gr_r0000089600000000]
GO
--SqlScripter----[dbo].[ca_group_member].[$ca_gr_r000008a000000000].sql
GO
ALTER TABLE [dbo].[ca_group_member] WITH NOCHECK ADD CONSTRAINT [$ca_gr_r000008a000000000] FOREIGN KEY ([group_uuid])
REFERENCES [dbo].[ca_group_def] ([group_uuid])
GO
ALTER TABLE [dbo].[ca_group_member] WITH CHECK CHECK CONSTRAINT [$ca_gr_r000008a000000000]
GO
--SqlScripter----[dbo].[ca_install_package].[$ca_in_r000005d500000000].sql
GO
ALTER TABLE [dbo].[ca_install_package] WITH NOCHECK ADD CONSTRAINT [$ca_in_r000005d500000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_install_package] WITH CHECK CHECK CONSTRAINT [$ca_in_r000005d500000000]
GO
--SqlScripter----[dbo].[ca_install_package].[$ca_in_r000005df00000000].sql
GO
ALTER TABLE [dbo].[ca_install_package] WITH NOCHECK ADD CONSTRAINT [$ca_in_r000005df00000000] FOREIGN KEY ([source_type_id])
REFERENCES [dbo].[ca_source_type] ([source_type_id])
GO
ALTER TABLE [dbo].[ca_install_package] WITH CHECK CHECK CONSTRAINT [$ca_in_r000005df00000000]
GO
--SqlScripter----[dbo].[ca_install_package].[$ca_re_r000005b711111111].sql
GO
ALTER TABLE [dbo].[ca_install_package] WITH NOCHECK ADD CONSTRAINT [$ca_re_r000005b711111111] FOREIGN KEY ([lang_code])
REFERENCES [dbo].[ca_language] ([lang_code])
GO
ALTER TABLE [dbo].[ca_install_package] WITH CHECK CHECK CONSTRAINT [$ca_re_r000005b711111111]
GO
--SqlScripter----[dbo].[ca_install_step].[$ca_in_r000005e900000000].sql
GO
ALTER TABLE [dbo].[ca_install_step] WITH NOCHECK ADD CONSTRAINT [$ca_in_r000005e900000000] FOREIGN KEY ([install_pkg_uuid])
REFERENCES [dbo].[ca_install_package] ([install_pkg_uuid])
GO
ALTER TABLE [dbo].[ca_install_step] WITH CHECK CHECK CONSTRAINT [$ca_in_r000005e900000000]
GO
--SqlScripter----[dbo].[ca_install_step].[$ca_in_r000005f300000000].sql
GO
ALTER TABLE [dbo].[ca_install_step] WITH NOCHECK ADD CONSTRAINT [$ca_in_r000005f300000000] FOREIGN KEY ([source_type_id])
REFERENCES [dbo].[ca_source_type] ([source_type_id])
GO
ALTER TABLE [dbo].[ca_install_step] WITH CHECK CHECK CONSTRAINT [$ca_in_r000005f300000000]
GO
--SqlScripter----[dbo].[ca_link_config_item].[$ca_li_r0000031100000000].sql
GO
ALTER TABLE [dbo].[ca_link_config_item] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000031100000000] FOREIGN KEY ([link_type_id])
REFERENCES [dbo].[ca_link_type] ([link_type_id])
GO
ALTER TABLE [dbo].[ca_link_config_item] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000031100000000]
GO
--SqlScripter----[dbo].[ca_link_config_item].[$ca_li_r0000031b00000000].sql
GO
ALTER TABLE [dbo].[ca_link_config_item] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000031b00000000] FOREIGN KEY ([config_item_uuid_2], [asset_uuid_2])
REFERENCES [dbo].[ca_config_item] ([config_item_uuid], [asset_uuid])
GO
ALTER TABLE [dbo].[ca_link_config_item] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000031b00000000]
GO
--SqlScripter----[dbo].[ca_link_config_item].[$ca_li_r0000032500000000].sql
GO
ALTER TABLE [dbo].[ca_link_config_item] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000032500000000] FOREIGN KEY ([config_item_uuid_1], [asset_uuid_1])
REFERENCES [dbo].[ca_config_item] ([config_item_uuid], [asset_uuid])
GO
ALTER TABLE [dbo].[ca_link_config_item] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000032500000000]
GO
--SqlScripter----[dbo].[ca_link_config_item_doc].[$ca_li_r0000032e00000000].sql
GO
ALTER TABLE [dbo].[ca_link_config_item_doc] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000032e00000000] FOREIGN KEY ([doc_uuid])
REFERENCES [dbo].[ca_document] ([doc_uuid])
GO
ALTER TABLE [dbo].[ca_link_config_item_doc] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000032e00000000]
GO
--SqlScripter----[dbo].[ca_link_config_item_doc].[$ca_li_r0000033700000000].sql
GO
ALTER TABLE [dbo].[ca_link_config_item_doc] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000033700000000] FOREIGN KEY ([config_item_uuid], [asset_uuid])
REFERENCES [dbo].[ca_config_item] ([config_item_uuid], [asset_uuid])
GO
ALTER TABLE [dbo].[ca_link_config_item_doc] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000033700000000]
GO
--SqlScripter----[dbo].[ca_link_configured_service].[$ca_li_r0000034100000000].sql
GO
ALTER TABLE [dbo].[ca_link_configured_service] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000034100000000] FOREIGN KEY ([named_config_uuid])
REFERENCES [dbo].[ca_named_configuration] ([named_config_uuid])
GO
ALTER TABLE [dbo].[ca_link_configured_service] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000034100000000]
GO
--SqlScripter----[dbo].[ca_link_configured_service].[$ca_li_r0000034a00000000].sql
GO
ALTER TABLE [dbo].[ca_link_configured_service] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000034a00000000] FOREIGN KEY ([own_resource_uuid])
REFERENCES [dbo].[ca_owned_resource] ([own_resource_uuid])
GO
ALTER TABLE [dbo].[ca_link_configured_service] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000034a00000000]
GO
--SqlScripter----[dbo].[ca_link_contact_user].[$ca_li_r0000035400000000].sql
GO
ALTER TABLE [dbo].[ca_link_contact_user] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000035400000000] FOREIGN KEY ([contact_uuid])
REFERENCES [dbo].[ca_contact] ([contact_uuid])
GO
ALTER TABLE [dbo].[ca_link_contact_user] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000035400000000]
GO
--SqlScripter----[dbo].[ca_link_contact_user].[$ca_li_r0000035d00000000].sql
GO
ALTER TABLE [dbo].[ca_link_contact_user] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000035d00000000] FOREIGN KEY ([user_uuid])
REFERENCES [dbo].[ca_discovered_user] ([user_uuid])
GO
ALTER TABLE [dbo].[ca_link_contact_user] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000035d00000000]
GO
--SqlScripter----[dbo].[ca_link_dir_details_map].[$ca_li_r000008aa00000000].sql
GO
ALTER TABLE [dbo].[ca_link_dir_details_map] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000008aa00000000] FOREIGN KEY ([dir_schema_uuid])
REFERENCES [dbo].[ca_directory_schema_map] ([dir_schema_uuid])
GO
ALTER TABLE [dbo].[ca_link_dir_details_map] WITH CHECK CHECK CONSTRAINT [$ca_li_r000008aa00000000]
GO
--SqlScripter----[dbo].[ca_link_dir_details_map].[$ca_li_r000008b400000000].sql
GO
ALTER TABLE [dbo].[ca_link_dir_details_map] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000008b400000000] FOREIGN KEY ([directory_uuid])
REFERENCES [dbo].[ca_directory_details] ([directory_uuid])
GO
ALTER TABLE [dbo].[ca_link_dir_details_map] WITH CHECK CHECK CONSTRAINT [$ca_li_r000008b400000000]
GO
--SqlScripter----[dbo].[ca_link_dis_hw].[$ca_li_r0000036700000000].sql
GO
ALTER TABLE [dbo].[ca_link_dis_hw] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000036700000000] FOREIGN KEY ([secondary_dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[ca_link_dis_hw] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000036700000000]
GO
--SqlScripter----[dbo].[ca_link_dis_hw_user].[$ca_li_r0000037100000000].sql
GO
ALTER TABLE [dbo].[ca_link_dis_hw_user] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000037100000000] FOREIGN KEY ([user_uuid])
REFERENCES [dbo].[ca_discovered_user] ([user_uuid])
GO
ALTER TABLE [dbo].[ca_link_dis_hw_user] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000037100000000]
GO
--SqlScripter----[dbo].[ca_link_dis_hw_user].[$ca_li_r0000037b00000000].sql
GO
ALTER TABLE [dbo].[ca_link_dis_hw_user] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000037b00000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[ca_link_dis_hw_user] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000037b00000000]
GO
--SqlScripter----[dbo].[ca_link_dis_user_sec_profile].[$ca_li_r000008be00000000].sql
GO
ALTER TABLE [dbo].[ca_link_dis_user_sec_profile] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000008be00000000] FOREIGN KEY ([user_uuid])
REFERENCES [dbo].[ca_discovered_user] ([user_uuid])
GO
ALTER TABLE [dbo].[ca_link_dis_user_sec_profile] WITH CHECK CHECK CONSTRAINT [$ca_li_r000008be00000000]
GO
--SqlScripter----[dbo].[ca_link_dis_user_sec_profile].[$ca_li_r000008c800000000].sql
GO
ALTER TABLE [dbo].[ca_link_dis_user_sec_profile] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000008c800000000] FOREIGN KEY ([security_profile_uuid])
REFERENCES [dbo].[ca_security_profile] ([security_profile_uuid])
GO
ALTER TABLE [dbo].[ca_link_dis_user_sec_profile] WITH CHECK CHECK CONSTRAINT [$ca_li_r000008c800000000]
GO
--SqlScripter----[dbo].[ca_link_lic_def_domain].[ca_link_lic_def_domain_fk01].sql
GO
ALTER TABLE [dbo].[ca_link_lic_def_domain] WITH NOCHECK ADD CONSTRAINT [ca_link_lic_def_domain_fk01] FOREIGN KEY ([lic_def_uuid])
REFERENCES [dbo].[ca_license_def] ([lic_def_uuid])
GO
ALTER TABLE [dbo].[ca_link_lic_def_domain] WITH CHECK CHECK CONSTRAINT [ca_link_lic_def_domain_fk01]
GO
--SqlScripter----[dbo].[ca_link_lic_def_domain].[ca_link_lic_def_domain_fk02].sql
GO
ALTER TABLE [dbo].[ca_link_lic_def_domain] WITH NOCHECK ADD CONSTRAINT [ca_link_lic_def_domain_fk02] FOREIGN KEY ([domain_uuid])
REFERENCES [dbo].[ca_n_tier] ([domain_uuid])
GO
ALTER TABLE [dbo].[ca_link_lic_def_domain] WITH CHECK CHECK CONSTRAINT [ca_link_lic_def_domain_fk02]
GO
--SqlScripter----[dbo].[ca_link_license_sw_def].[$ca_li_r0000038500000000].sql
GO
ALTER TABLE [dbo].[ca_link_license_sw_def] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000038500000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_link_license_sw_def] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000038500000000]
GO
--SqlScripter----[dbo].[ca_link_license_sw_def].[$ca_li_r0000038f00000000].sql
GO
ALTER TABLE [dbo].[ca_link_license_sw_def] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000038f00000000] FOREIGN KEY ([license_uuid])
REFERENCES [dbo].[ca_software_license] ([license_uuid])
GO
ALTER TABLE [dbo].[ca_link_license_sw_def] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000038f00000000]
GO
--SqlScripter----[dbo].[ca_link_logical_asset_class_def].[$ca_li_r000002fe00000000].sql
GO
ALTER TABLE [dbo].[ca_link_logical_asset_class_def] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000002fe00000000] FOREIGN KEY ([class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_link_logical_asset_class_def] WITH CHECK CHECK CONSTRAINT [$ca_li_r000002fe00000000]
GO
--SqlScripter----[dbo].[ca_link_logical_asset_class_def].[$ca_li_r0000030700000000].sql
GO
ALTER TABLE [dbo].[ca_link_logical_asset_class_def] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000030700000000] FOREIGN KEY ([logical_asset_uuid])
REFERENCES [dbo].[ca_logical_asset] ([logical_asset_uuid])
GO
ALTER TABLE [dbo].[ca_link_logical_asset_class_def] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000030700000000]
GO
--SqlScripter----[dbo].[ca_link_named_config_doc].[$ca_li_r0000039800000000].sql
GO
ALTER TABLE [dbo].[ca_link_named_config_doc] WITH NOCHECK ADD CONSTRAINT [$ca_li_r0000039800000000] FOREIGN KEY ([named_config_uuid])
REFERENCES [dbo].[ca_named_configuration] ([named_config_uuid])
GO
ALTER TABLE [dbo].[ca_link_named_config_doc] WITH CHECK CHECK CONSTRAINT [$ca_li_r0000039800000000]
GO
--SqlScripter----[dbo].[ca_link_named_config_doc].[$ca_li_r000003a200000000].sql
GO
ALTER TABLE [dbo].[ca_link_named_config_doc] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000003a200000000] FOREIGN KEY ([doc_uuid])
REFERENCES [dbo].[ca_document] ([doc_uuid])
GO
ALTER TABLE [dbo].[ca_link_named_config_doc] WITH CHECK CHECK CONSTRAINT [$ca_li_r000003a200000000]
GO
--SqlScripter----[dbo].[ca_link_named_config_item].[$ca_li_r000003ab00000000].sql
GO
ALTER TABLE [dbo].[ca_link_named_config_item] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000003ab00000000] FOREIGN KEY ([named_config_uuid])
REFERENCES [dbo].[ca_named_configuration] ([named_config_uuid])
GO
ALTER TABLE [dbo].[ca_link_named_config_item] WITH CHECK CHECK CONSTRAINT [$ca_li_r000003ab00000000]
GO
--SqlScripter----[dbo].[ca_link_named_config_item].[$ca_li_r000003b400000000].sql
GO
ALTER TABLE [dbo].[ca_link_named_config_item] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000003b400000000] FOREIGN KEY ([config_item_uuid], [asset_uuid])
REFERENCES [dbo].[ca_config_item] ([config_item_uuid], [asset_uuid])
GO
ALTER TABLE [dbo].[ca_link_named_config_item] WITH CHECK CHECK CONSTRAINT [$ca_li_r000003b400000000]
GO
--SqlScripter----[dbo].[ca_link_sw_def].[$ca_li_r000003be00000000].sql
GO
ALTER TABLE [dbo].[ca_link_sw_def] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000003be00000000] FOREIGN KEY ([source_type_id])
REFERENCES [dbo].[ca_source_type] ([source_type_id])
GO
ALTER TABLE [dbo].[ca_link_sw_def] WITH CHECK CHECK CONSTRAINT [$ca_li_r000003be00000000]
GO
--SqlScripter----[dbo].[ca_link_sw_def].[$ca_li_r000003c800000000].sql
GO
ALTER TABLE [dbo].[ca_link_sw_def] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000003c800000000] FOREIGN KEY ([link_type_id])
REFERENCES [dbo].[ca_link_type] ([link_type_id])
GO
ALTER TABLE [dbo].[ca_link_sw_def] WITH CHECK CHECK CONSTRAINT [$ca_li_r000003c800000000]
GO
--SqlScripter----[dbo].[ca_link_sw_def].[$ca_li_r000003d200000000].sql
GO
ALTER TABLE [dbo].[ca_link_sw_def] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000003d200000000] FOREIGN KEY ([primary_sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_link_sw_def] WITH CHECK CHECK CONSTRAINT [$ca_li_r000003d200000000]
GO
--SqlScripter----[dbo].[ca_link_sw_def].[$ca_li_r000003db00000000].sql
GO
ALTER TABLE [dbo].[ca_link_sw_def] WITH NOCHECK ADD CONSTRAINT [$ca_li_r000003db00000000] FOREIGN KEY ([secondary_sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_link_sw_def] WITH CHECK CHECK CONSTRAINT [$ca_li_r000003db00000000]
GO
--SqlScripter----[dbo].[ca_location].[ca_location_fk01].sql
GO
ALTER TABLE [dbo].[ca_location] WITH NOCHECK ADD CONSTRAINT [ca_location_fk01] FOREIGN KEY ([primary_contact_uuid])
REFERENCES [dbo].[ca_contact] ([contact_uuid])
GO
ALTER TABLE [dbo].[ca_location] WITH CHECK CHECK CONSTRAINT [ca_location_fk01]
GO
--SqlScripter----[dbo].[ca_location].[ca_location_fk02].sql
GO
ALTER TABLE [dbo].[ca_location] WITH NOCHECK ADD CONSTRAINT [ca_location_fk02] FOREIGN KEY ([site_id])
REFERENCES [dbo].[ca_site] ([id])
GO
ALTER TABLE [dbo].[ca_location] WITH CHECK CHECK CONSTRAINT [ca_location_fk02]
GO
--SqlScripter----[dbo].[ca_location].[ca_location_fk03].sql
GO
ALTER TABLE [dbo].[ca_location] WITH NOCHECK ADD CONSTRAINT [ca_location_fk03] FOREIGN KEY ([geo_coord_type])
REFERENCES [dbo].[ca_geo_coord_type] ([id])
GO
ALTER TABLE [dbo].[ca_location] WITH CHECK CHECK CONSTRAINT [ca_location_fk03]
GO
--SqlScripter----[dbo].[ca_location].[ca_location_fk04].sql
GO
ALTER TABLE [dbo].[ca_location] WITH NOCHECK ADD CONSTRAINT [ca_location_fk04] FOREIGN KEY ([state])
REFERENCES [dbo].[ca_state_province] ([id])
GO
ALTER TABLE [dbo].[ca_location] WITH CHECK CHECK CONSTRAINT [ca_location_fk04]
GO
--SqlScripter----[dbo].[ca_logical_asset].[$ca_lo_r0000066e00000000].sql
GO
ALTER TABLE [dbo].[ca_logical_asset] WITH NOCHECK ADD CONSTRAINT [$ca_lo_r0000066e00000000] FOREIGN KEY ([asset_uuid])
REFERENCES [dbo].[ca_asset] ([asset_uuid])
GO
ALTER TABLE [dbo].[ca_logical_asset] WITH CHECK CHECK CONSTRAINT [$ca_lo_r0000066e00000000]
GO
--SqlScripter----[dbo].[ca_logical_asset_property].[$ca_lo_r0000067700000000].sql
GO
ALTER TABLE [dbo].[ca_logical_asset_property] WITH NOCHECK ADD CONSTRAINT [$ca_lo_r0000067700000000] FOREIGN KEY ([logical_asset_uuid])
REFERENCES [dbo].[ca_logical_asset] ([logical_asset_uuid])
GO
ALTER TABLE [dbo].[ca_logical_asset_property] WITH CHECK CHECK CONSTRAINT [$ca_lo_r0000067700000000]
GO
--SqlScripter----[dbo].[ca_manager_component].[$ca_ma_r000008d100000000].sql
GO
ALTER TABLE [dbo].[ca_manager_component] WITH NOCHECK ADD CONSTRAINT [$ca_ma_r000008d100000000] FOREIGN KEY ([manager_uuid])
REFERENCES [dbo].[ca_manager] ([manager_uuid])
GO
ALTER TABLE [dbo].[ca_manager_component] WITH CHECK CHECK CONSTRAINT [$ca_ma_r000008d100000000]
GO
--SqlScripter----[dbo].[ca_n_tier].[$ca_n__r000008db00000000].sql
GO
ALTER TABLE [dbo].[ca_n_tier] WITH NOCHECK ADD CONSTRAINT [$ca_n__r000008db00000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[ca_n_tier] WITH CHECK CHECK CONSTRAINT [$ca_n__r000008db00000000]
GO
--SqlScripter----[dbo].[ca_n_tier].[$ca_n__r000008e500000000].sql
GO
ALTER TABLE [dbo].[ca_n_tier] WITH NOCHECK ADD CONSTRAINT [$ca_n__r000008e500000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_asset] ([asset_uuid])
GO
ALTER TABLE [dbo].[ca_n_tier] WITH CHECK CHECK CONSTRAINT [$ca_n__r000008e500000000]
GO
--SqlScripter----[dbo].[ca_n_tier].[$ca_n__r000008ef00000000].sql
GO
ALTER TABLE [dbo].[ca_n_tier] WITH NOCHECK ADD CONSTRAINT [$ca_n__r000008ef00000000] FOREIGN KEY ([parent_domain_uuid])
REFERENCES [dbo].[ca_n_tier] ([domain_uuid])
GO
ALTER TABLE [dbo].[ca_n_tier] WITH CHECK CHECK CONSTRAINT [$ca_n__r000008ef00000000]
GO
--SqlScripter----[dbo].[ca_organization].[ca_organization_fk01].sql
GO
ALTER TABLE [dbo].[ca_organization] WITH NOCHECK ADD CONSTRAINT [ca_organization_fk01] FOREIGN KEY ([contact_uuid])
REFERENCES [dbo].[ca_contact] ([contact_uuid])
GO
ALTER TABLE [dbo].[ca_organization] WITH CHECK CHECK CONSTRAINT [ca_organization_fk01]
GO
--SqlScripter----[dbo].[ca_organization].[ca_organization_fk02].sql
GO
ALTER TABLE [dbo].[ca_organization] WITH NOCHECK ADD CONSTRAINT [ca_organization_fk02] FOREIGN KEY ([parent_org_uuid])
REFERENCES [dbo].[ca_organization] ([organization_uuid])
GO
ALTER TABLE [dbo].[ca_organization] WITH CHECK CHECK CONSTRAINT [ca_organization_fk02]
GO
--SqlScripter----[dbo].[ca_organization].[ca_organization_fk03].sql
GO
ALTER TABLE [dbo].[ca_organization] WITH NOCHECK ADD CONSTRAINT [ca_organization_fk03] FOREIGN KEY ([location_uuid])
REFERENCES [dbo].[ca_location] ([location_uuid])
GO
ALTER TABLE [dbo].[ca_organization] WITH CHECK CHECK CONSTRAINT [ca_organization_fk03]
GO
--SqlScripter----[dbo].[ca_organization].[ca_organization_fk04].sql
GO
ALTER TABLE [dbo].[ca_organization] WITH NOCHECK ADD CONSTRAINT [ca_organization_fk04] FOREIGN KEY ([company_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_organization] WITH CHECK CHECK CONSTRAINT [ca_organization_fk04]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk01].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk01] FOREIGN KEY ([asset_type_id])
REFERENCES [dbo].[ca_asset_type] ([asset_type_id])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk01]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk02].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk02] FOREIGN KEY ([location_uuid])
REFERENCES [dbo].[ca_location] ([location_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk02]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk03].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk03] FOREIGN KEY ([resource_owner_uuid])
REFERENCES [dbo].[ca_contact] ([contact_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk03]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk04].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk04] FOREIGN KEY ([resource_contact_uuid])
REFERENCES [dbo].[ca_contact] ([contact_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk04]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk05].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk05] FOREIGN KEY ([org_bought_for_uuid])
REFERENCES [dbo].[ca_organization] ([organization_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk05]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk06].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk06] FOREIGN KEY ([responsible_org_uuid])
REFERENCES [dbo].[ca_organization] ([organization_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk06]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk07].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk07] FOREIGN KEY ([maintenance_org_uuid])
REFERENCES [dbo].[ca_organization] ([organization_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk07]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk08].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk08] FOREIGN KEY ([responsible_vendor_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk08]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk09].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk09] FOREIGN KEY ([manufacturer_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk09]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk10].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk10] FOREIGN KEY ([resource_capacity_unit])
REFERENCES [dbo].[ca_capacity_unit] ([id])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk10]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk11].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk11] FOREIGN KEY ([model_uuid])
REFERENCES [dbo].[ca_model_def] ([model_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk11]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk12].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk12] FOREIGN KEY ([resource_status])
REFERENCES [dbo].[ca_resource_status] ([id])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk12]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk13].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk13] FOREIGN KEY ([resource_class])
REFERENCES [dbo].[ca_resource_class] ([id])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk13]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk14].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk14] FOREIGN KEY ([resource_family])
REFERENCES [dbo].[ca_resource_family] ([id])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk14]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk15].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk15] FOREIGN KEY ([supply_vendor_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk15]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk16].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk16] FOREIGN KEY ([maintenance_vendor_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk16]
GO
--SqlScripter----[dbo].[ca_owned_resource].[ca_owned_resource_fk17].sql
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH NOCHECK ADD CONSTRAINT [ca_owned_resource_fk17] FOREIGN KEY ([company_bought_for_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_owned_resource] WITH CHECK CHECK CONSTRAINT [ca_owned_resource_fk17]
GO
--SqlScripter----[dbo].[ca_query_result].[$ca_qu_r000008f900000000].sql
GO
ALTER TABLE [dbo].[ca_query_result] WITH NOCHECK ADD CONSTRAINT [$ca_qu_r000008f900000000] FOREIGN KEY ([query_uuid])
REFERENCES [dbo].[ca_query_def] ([query_uuid])
GO
ALTER TABLE [dbo].[ca_query_result] WITH CHECK CHECK CONSTRAINT [$ca_qu_r000008f900000000]
GO
--SqlScripter----[dbo].[ca_query_result].[$ca_qu_r0000090200000000].sql
GO
ALTER TABLE [dbo].[ca_query_result] WITH NOCHECK ADD CONSTRAINT [$ca_qu_r0000090200000000] FOREIGN KEY ([query_version_uuid], [query_uuid])
REFERENCES [dbo].[ca_query_version] ([query_version_uuid], [query_uuid])
GO
ALTER TABLE [dbo].[ca_query_result] WITH CHECK CHECK CONSTRAINT [$ca_qu_r0000090200000000]
GO
--SqlScripter----[dbo].[ca_query_version].[$ca_qu_r0000090c00000000].sql
GO
ALTER TABLE [dbo].[ca_query_version] WITH NOCHECK ADD CONSTRAINT [$ca_qu_r0000090c00000000] FOREIGN KEY ([query_uuid])
REFERENCES [dbo].[ca_query_def] ([query_uuid])
GO
ALTER TABLE [dbo].[ca_query_version] WITH CHECK CHECK CONSTRAINT [$ca_qu_r0000090c00000000]
GO
--SqlScripter----[dbo].[ca_replication_status].[$ca_re_r0000091600000000].sql
GO
ALTER TABLE [dbo].[ca_replication_status] WITH NOCHECK ADD CONSTRAINT [$ca_re_r0000091600000000] FOREIGN KEY ([replication_conf_uuid])
REFERENCES [dbo].[ca_replication_conf] ([replication_conf_uuid])
GO
ALTER TABLE [dbo].[ca_replication_status] WITH CHECK CHECK CONSTRAINT [$ca_re_r0000091600000000]
GO
--SqlScripter----[dbo].[ca_requirement_spec].[$ca_re_r000005a300000000].sql
GO
ALTER TABLE [dbo].[ca_requirement_spec] WITH NOCHECK ADD CONSTRAINT [$ca_re_r000005a300000000] FOREIGN KEY ([source_type_id])
REFERENCES [dbo].[ca_source_type] ([source_type_id])
GO
ALTER TABLE [dbo].[ca_requirement_spec] WITH CHECK CHECK CONSTRAINT [$ca_re_r000005a300000000]
GO
--SqlScripter----[dbo].[ca_requirement_spec_group].[$ca_re_r000005ad00000000].sql
GO
ALTER TABLE [dbo].[ca_requirement_spec_group] WITH NOCHECK ADD CONSTRAINT [$ca_re_r000005ad00000000] FOREIGN KEY ([owner_object_uuid], [requirement_spec_type])
REFERENCES [dbo].[ca_requirement_spec] ([owner_object_uuid], [requirement_spec_type])
GO
ALTER TABLE [dbo].[ca_requirement_spec_group] WITH CHECK CHECK CONSTRAINT [$ca_re_r000005ad00000000]
GO
--SqlScripter----[dbo].[ca_requirement_spec_item].[$ca_re_r000005b700000000].sql
GO
ALTER TABLE [dbo].[ca_requirement_spec_item] WITH NOCHECK ADD CONSTRAINT [$ca_re_r000005b700000000] FOREIGN KEY ([lang_code])
REFERENCES [dbo].[ca_language] ([lang_code])
GO
ALTER TABLE [dbo].[ca_requirement_spec_item] WITH CHECK CHECK CONSTRAINT [$ca_re_r000005b700000000]
GO
--SqlScripter----[dbo].[ca_requirement_spec_item].[$ca_re_r000005c100000000].sql
GO
ALTER TABLE [dbo].[ca_requirement_spec_item] WITH NOCHECK ADD CONSTRAINT [$ca_re_r000005c100000000] FOREIGN KEY ([owner_object_uuid], [requirement_spec_type], [group_sequence])
REFERENCES [dbo].[ca_requirement_spec_group] ([owner_object_uuid], [requirement_spec_type], [group_sequence])
GO
ALTER TABLE [dbo].[ca_requirement_spec_item] WITH CHECK CHECK CONSTRAINT [$ca_re_r000005c100000000]
GO
--SqlScripter----[dbo].[ca_requirement_spec_item].[$ca_re_r000005cb00000000].sql
GO
ALTER TABLE [dbo].[ca_requirement_spec_item] WITH NOCHECK ADD CONSTRAINT [$ca_re_r000005cb00000000] FOREIGN KEY ([class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_requirement_spec_item] WITH CHECK CHECK CONSTRAINT [$ca_re_r000005cb00000000]
GO
--SqlScripter----[dbo].[ca_server].[$ca_se_r0000091f00000000].sql
GO
ALTER TABLE [dbo].[ca_server] WITH NOCHECK ADD CONSTRAINT [$ca_se_r0000091f00000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[ca_server] WITH CHECK CHECK CONSTRAINT [$ca_se_r0000091f00000000]
GO
--SqlScripter----[dbo].[ca_server_component].[$ca_se_r0000092900000000].sql
GO
ALTER TABLE [dbo].[ca_server_component] WITH NOCHECK ADD CONSTRAINT [$ca_se_r0000092900000000] FOREIGN KEY ([server_uuid])
REFERENCES [dbo].[ca_server] ([server_uuid])
GO
ALTER TABLE [dbo].[ca_server_component] WITH CHECK CHECK CONSTRAINT [$ca_se_r0000092900000000]
GO
--SqlScripter----[dbo].[ca_server_push_status].[$ca_se_r0000093300000000].sql
GO
ALTER TABLE [dbo].[ca_server_push_status] WITH NOCHECK ADD CONSTRAINT [$ca_se_r0000093300000000] FOREIGN KEY ([server_uuid])
REFERENCES [dbo].[ca_server] ([server_uuid])
GO
ALTER TABLE [dbo].[ca_server_push_status] WITH CHECK CHECK CONSTRAINT [$ca_se_r0000093300000000]
GO
--SqlScripter----[dbo].[ca_server_queue].[$ca_se_r0000093c00000000].sql
GO
ALTER TABLE [dbo].[ca_server_queue] WITH NOCHECK ADD CONSTRAINT [$ca_se_r0000093c00000000] FOREIGN KEY ([server_uuid])
REFERENCES [dbo].[ca_server] ([server_uuid])
GO
ALTER TABLE [dbo].[ca_server_queue] WITH CHECK CHECK CONSTRAINT [$ca_se_r0000093c00000000]
GO
--SqlScripter----[dbo].[ca_software_def].[$ca_so_r000004cf00000000].sql
GO
ALTER TABLE [dbo].[ca_software_def] WITH NOCHECK ADD CONSTRAINT [$ca_so_r000004cf00000000] FOREIGN KEY ([manufacturer_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[ca_software_def] WITH CHECK CHECK CONSTRAINT [$ca_so_r000004cf00000000]
GO
--SqlScripter----[dbo].[ca_software_def].[$ca_so_r000004d800000000].sql
GO
ALTER TABLE [dbo].[ca_software_def] WITH NOCHECK ADD CONSTRAINT [$ca_so_r000004d800000000] FOREIGN KEY ([source_type_id])
REFERENCES [dbo].[ca_source_type] ([source_type_id])
GO
ALTER TABLE [dbo].[ca_software_def] WITH CHECK CHECK CONSTRAINT [$ca_so_r000004d800000000]
GO
--SqlScripter----[dbo].[ca_software_def].[$ca_so_r000004e200000000].sql
GO
ALTER TABLE [dbo].[ca_software_def] WITH NOCHECK ADD CONSTRAINT [$ca_so_r000004e200000000] FOREIGN KEY ([software_type_id])
REFERENCES [dbo].[ca_software_type] ([software_type_id])
GO
ALTER TABLE [dbo].[ca_software_def] WITH CHECK CHECK CONSTRAINT [$ca_so_r000004e200000000]
GO
--SqlScripter----[dbo].[ca_software_def].[$ca_so_r000004eb00000000].sql
GO
ALTER TABLE [dbo].[ca_software_def] WITH NOCHECK ADD CONSTRAINT [$ca_so_r000004eb00000000] FOREIGN KEY ([family_sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_software_def] WITH CHECK CHECK CONSTRAINT [$ca_so_r000004eb00000000]
GO
--SqlScripter----[dbo].[ca_software_def].[$ca_so_r0000064300000000].sql
GO
ALTER TABLE [dbo].[ca_software_def] WITH NOCHECK ADD CONSTRAINT [$ca_so_r0000064300000000] FOREIGN KEY ([class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_software_def] WITH CHECK CHECK CONSTRAINT [$ca_so_r0000064300000000]
GO
--SqlScripter----[dbo].[ca_software_def].[$ca_so_r0000065b00000000].sql
GO
ALTER TABLE [dbo].[ca_software_def] WITH NOCHECK ADD CONSTRAINT [$ca_so_r0000065b00000000] FOREIGN KEY ([lang_code])
REFERENCES [dbo].[ca_language] ([lang_code])
GO
ALTER TABLE [dbo].[ca_software_def] WITH CHECK CHECK CONSTRAINT [$ca_so_r0000065b00000000]
GO
--SqlScripter----[dbo].[ca_software_def].[$ca_so_r00001c7500000000].sql
GO
ALTER TABLE [dbo].[ca_software_def] WITH NOCHECK ADD CONSTRAINT [$ca_so_r00001c7500000000] FOREIGN KEY ([bit_support_id])
REFERENCES [dbo].[bit_support] ([bit_support_id])
GO
ALTER TABLE [dbo].[ca_software_def] WITH CHECK CHECK CONSTRAINT [$ca_so_r00001c7500000000]
GO
--SqlScripter----[dbo].[ca_software_def].[$ca_so_r00001c7f00000000].sql
GO
ALTER TABLE [dbo].[ca_software_def] WITH NOCHECK ADD CONSTRAINT [$ca_so_r00001c7f00000000] FOREIGN KEY ([chip_set_id])
REFERENCES [dbo].[chip_set] ([chip_set_id])
GO
ALTER TABLE [dbo].[ca_software_def] WITH CHECK CHECK CONSTRAINT [$ca_so_r00001c7f00000000]
GO
--SqlScripter----[dbo].[ca_software_def_class_def_matrix].[$ca_so_r00001d4000000000].sql
GO
ALTER TABLE [dbo].[ca_software_def_class_def_matrix] WITH NOCHECK ADD CONSTRAINT [$ca_so_r00001d4000000000] FOREIGN KEY ([sw_def_class_def_matrix_type_id])
REFERENCES [dbo].[ca_link_type] ([link_type_id])
GO
ALTER TABLE [dbo].[ca_software_def_class_def_matrix] WITH CHECK CHECK CONSTRAINT [$ca_so_r00001d4000000000]
GO
--SqlScripter----[dbo].[ca_software_def_class_def_matrix].[$ca_so_r00001d4a00000000].sql
GO
ALTER TABLE [dbo].[ca_software_def_class_def_matrix] WITH NOCHECK ADD CONSTRAINT [$ca_so_r00001d4a00000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_software_def_class_def_matrix] WITH CHECK CHECK CONSTRAINT [$ca_so_r00001d4a00000000]
GO
--SqlScripter----[dbo].[ca_software_def_class_def_matrix].[$ca_so_r00001d5400000000].sql
GO
ALTER TABLE [dbo].[ca_software_def_class_def_matrix] WITH NOCHECK ADD CONSTRAINT [$ca_so_r00001d5400000000] FOREIGN KEY ([class_id])
REFERENCES [dbo].[ca_class_def] ([class_id])
GO
ALTER TABLE [dbo].[ca_software_def_class_def_matrix] WITH CHECK CHECK CONSTRAINT [$ca_so_r00001d5400000000]
GO
--SqlScripter----[dbo].[ca_software_def_types].[$ca_so_r0000054400000000].sql
GO
ALTER TABLE [dbo].[ca_software_def_types] WITH NOCHECK ADD CONSTRAINT [$ca_so_r0000054400000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_software_def_types] WITH CHECK CHECK CONSTRAINT [$ca_so_r0000054400000000]
GO
--SqlScripter----[dbo].[ca_software_def_types].[$ca_so_r0000054d00000000].sql
GO
ALTER TABLE [dbo].[ca_software_def_types] WITH NOCHECK ADD CONSTRAINT [$ca_so_r0000054d00000000] FOREIGN KEY ([software_type_id])
REFERENCES [dbo].[ca_software_type] ([software_type_id])
GO
ALTER TABLE [dbo].[ca_software_def_types] WITH CHECK CHECK CONSTRAINT [$ca_so_r0000054d00000000]
GO
--SqlScripter----[dbo].[ca_software_license].[$ca_so_r000004f500000000].sql
GO
ALTER TABLE [dbo].[ca_software_license] WITH NOCHECK ADD CONSTRAINT [$ca_so_r000004f500000000] FOREIGN KEY ([license_type_id])
REFERENCES [dbo].[ca_license_type] ([id])
GO
ALTER TABLE [dbo].[ca_software_license] WITH CHECK CHECK CONSTRAINT [$ca_so_r000004f500000000]
GO
--SqlScripter----[dbo].[ca_software_signature].[$ca_so_r000004fe00000000].sql
GO
ALTER TABLE [dbo].[ca_software_signature] WITH NOCHECK ADD CONSTRAINT [$ca_so_r000004fe00000000] FOREIGN KEY ([source_type_id])
REFERENCES [dbo].[ca_source_type] ([source_type_id])
GO
ALTER TABLE [dbo].[ca_software_signature] WITH CHECK CHECK CONSTRAINT [$ca_so_r000004fe00000000]
GO
--SqlScripter----[dbo].[ca_software_signature].[$ca_so_r0000050800000000].sql
GO
ALTER TABLE [dbo].[ca_software_signature] WITH NOCHECK ADD CONSTRAINT [$ca_so_r0000050800000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[ca_software_signature] WITH CHECK CHECK CONSTRAINT [$ca_so_r0000050800000000]
GO
--SqlScripter----[dbo].[ca_software_signature].[$ca_so_r00001c6b00000000].sql
GO
ALTER TABLE [dbo].[ca_software_signature] WITH NOCHECK ADD CONSTRAINT [$ca_so_r00001c6b00000000] FOREIGN KEY ([signature_os_group_id])
REFERENCES [dbo].[signature_os_group] ([signature_os_group_id])
GO
ALTER TABLE [dbo].[ca_software_signature] WITH CHECK CHECK CONSTRAINT [$ca_so_r00001c6b00000000]
GO
--SqlScripter----[dbo].[certificaterequest].[$certi_r00003d9d00000000].sql
GO
ALTER TABLE [dbo].[certificaterequest] WITH NOCHECK ADD CONSTRAINT [$certi_r00003d9d00000000] FOREIGN KEY ([requestid])
REFERENCES [dbo].[request_pki] ([requestid])
GO
ALTER TABLE [dbo].[certificaterequest] WITH CHECK CHECK CONSTRAINT [$certi_r00003d9d00000000]
GO
--SqlScripter----[dbo].[columndefinition].[$colum_r0000159800000000].sql
GO
ALTER TABLE [dbo].[columndefinition] WITH NOCHECK ADD CONSTRAINT [$colum_r0000159800000000] FOREIGN KEY ([tableidx])
REFERENCES [dbo].[tabledefinition] ([tableidx])
GO
ALTER TABLE [dbo].[columndefinition] WITH CHECK CHECK CONSTRAINT [$colum_r0000159800000000]
GO
--SqlScripter----[dbo].[columndefinition].[$colum_r000015a200000000].sql
GO
ALTER TABLE [dbo].[columndefinition] WITH NOCHECK ADD CONSTRAINT [$colum_r000015a200000000] FOREIGN KEY ([typeid])
REFERENCES [dbo].[mibvariabletype] ([typeid])
GO
ALTER TABLE [dbo].[columndefinition] WITH CHECK CHECK CONSTRAINT [$colum_r000015a200000000]
GO
--SqlScripter----[dbo].[componentofindex].[$compo_r000015ac00000000].sql
GO
ALTER TABLE [dbo].[componentofindex] WITH NOCHECK ADD CONSTRAINT [$compo_r000015ac00000000] FOREIGN KEY ([componentmibindexidx])
REFERENCES [dbo].[indextable] ([componentmibindexidx])
GO
ALTER TABLE [dbo].[componentofindex] WITH CHECK CHECK CONSTRAINT [$compo_r000015ac00000000]
GO
--SqlScripter----[dbo].[componentofindex].[$compo_r000015b600000000].sql
GO
ALTER TABLE [dbo].[componentofindex] WITH NOCHECK ADD CONSTRAINT [$compo_r000015b600000000] FOREIGN KEY ([mibidx], [oididxformib])
REFERENCES [dbo].[mibstructure] ([mibidx], [oididxformib])
GO
ALTER TABLE [dbo].[componentofindex] WITH CHECK CHECK CONSTRAINT [$compo_r000015b600000000]
GO
--SqlScripter----[dbo].[config_vuln_category_matrix].[$confi_r00001bdb00000000].sql
GO
ALTER TABLE [dbo].[config_vuln_category_matrix] WITH NOCHECK ADD CONSTRAINT [$confi_r00001bdb00000000] FOREIGN KEY ([vuln_id])
REFERENCES [dbo].[configuration_standard_vuln] ([vuln_id])
GO
ALTER TABLE [dbo].[config_vuln_category_matrix] WITH CHECK CHECK CONSTRAINT [$confi_r00001bdb00000000]
GO
--SqlScripter----[dbo].[config_vuln_category_matrix].[$confi_r00001be500000000].sql
GO
ALTER TABLE [dbo].[config_vuln_category_matrix] WITH NOCHECK ADD CONSTRAINT [$confi_r00001be500000000] FOREIGN KEY ([bp_standard_category_id])
REFERENCES [dbo].[bp_standard_category] ([bp_standard_category_id])
GO
ALTER TABLE [dbo].[config_vuln_category_matrix] WITH CHECK CHECK CONSTRAINT [$confi_r00001be500000000]
GO
--SqlScripter----[dbo].[configuration_standard_vuln].[$confi_r00001b5b00000000].sql
GO
ALTER TABLE [dbo].[configuration_standard_vuln] WITH NOCHECK ADD CONSTRAINT [$confi_r00001b5b00000000] FOREIGN KEY ([vuln_id])
REFERENCES [dbo].[vulnerability] ([vuln_id])
GO
ALTER TABLE [dbo].[configuration_standard_vuln] WITH CHECK CHECK CONSTRAINT [$confi_r00001b5b00000000]
GO
--SqlScripter----[dbo].[dbh_sql_bind_variables_ora].[dbh_sql_bind_var_ora_sql_fk].sql
GO
ALTER TABLE [dbo].[dbh_sql_bind_variables_ora] WITH NOCHECK ADD CONSTRAINT [dbh_sql_bind_var_ora_sql_fk] FOREIGN KEY ([sql_id])
REFERENCES [dbo].[dbh_sql_ora] ([sql_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dbh_sql_bind_variables_ora] WITH CHECK CHECK CONSTRAINT [dbh_sql_bind_var_ora_sql_fk]
GO
--SqlScripter----[dbo].[dbh_sql_ora].[dbh_sql_ora_capture_fk].sql
GO
ALTER TABLE [dbo].[dbh_sql_ora] WITH NOCHECK ADD CONSTRAINT [dbh_sql_ora_capture_fk] FOREIGN KEY ([capture_id])
REFERENCES [dbo].[dbh_captures] ([capture_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dbh_sql_ora] WITH CHECK CHECK CONSTRAINT [dbh_sql_ora_capture_fk]
GO
--SqlScripter----[dbo].[dbh_sql_tables_ora].[dbh_sql_tables_ora_sql_fk].sql
GO
ALTER TABLE [dbo].[dbh_sql_tables_ora] WITH NOCHECK ADD CONSTRAINT [dbh_sql_tables_ora_sql_fk] FOREIGN KEY ([sql_id])
REFERENCES [dbo].[dbh_sql_ora] ([sql_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dbh_sql_tables_ora] WITH CHECK CHECK CONSTRAINT [dbh_sql_tables_ora_sql_fk]
GO
--SqlScripter----[dbo].[dbh_sql_udb].[dbh_sql_udb_capture_fk].sql
GO
ALTER TABLE [dbo].[dbh_sql_udb] WITH NOCHECK ADD CONSTRAINT [dbh_sql_udb_capture_fk] FOREIGN KEY ([capture_id])
REFERENCES [dbo].[dbh_captures] ([capture_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dbh_sql_udb] WITH CHECK CHECK CONSTRAINT [dbh_sql_udb_capture_fk]
GO
--SqlScripter----[dbo].[detection_profile].[$detec_r00001bef00000000].sql
GO
ALTER TABLE [dbo].[detection_profile] WITH NOCHECK ADD CONSTRAINT [$detec_r00001bef00000000] FOREIGN KEY ([vuln_id])
REFERENCES [dbo].[vulnerability] ([vuln_id])
GO
ALTER TABLE [dbo].[detection_profile] WITH CHECK CHECK CONSTRAINT [$detec_r00001bef00000000]
GO
--SqlScripter----[dbo].[detection_profile].[$detec_r00001bf900000000].sql
GO
ALTER TABLE [dbo].[detection_profile] WITH NOCHECK ADD CONSTRAINT [$detec_r00001bf900000000] FOREIGN KEY ([inventory_profile_id])
REFERENCES [dbo].[inventory_profile] ([inventory_profile_id])
GO
ALTER TABLE [dbo].[detection_profile] WITH CHECK CHECK CONSTRAINT [$detec_r00001bf900000000]
GO
--SqlScripter----[dbo].[discoveryvariable].[$disco_r000015c000000000].sql
GO
ALTER TABLE [dbo].[discoveryvariable] WITH NOCHECK ADD CONSTRAINT [$disco_r000015c000000000] FOREIGN KEY ([typeid])
REFERENCES [dbo].[mibvariabletype] ([typeid])
GO
ALTER TABLE [dbo].[discoveryvariable] WITH CHECK CHECK CONSTRAINT [$disco_r000015c000000000]
GO
--SqlScripter----[dbo].[discoveryvariable].[$disco_r000015ca00000000].sql
GO
ALTER TABLE [dbo].[discoveryvariable] WITH NOCHECK ADD CONSTRAINT [$disco_r000015ca00000000] FOREIGN KEY ([mibidx])
REFERENCES [dbo].[mibdefinition] ([mibidx])
GO
ALTER TABLE [dbo].[discoveryvariable] WITH CHECK CHECK CONSTRAINT [$disco_r000015ca00000000]
GO
--SqlScripter----[dbo].[discoveryvariable].[$disco_r000015d400000000].sql
GO
ALTER TABLE [dbo].[discoveryvariable] WITH NOCHECK ADD CONSTRAINT [$disco_r000015d400000000] FOREIGN KEY ([mibidx], [oididxformib])
REFERENCES [dbo].[mibstructure] ([mibidx], [oididxformib])
GO
ALTER TABLE [dbo].[discoveryvariable] WITH CHECK CHECK CONSTRAINT [$disco_r000015d400000000]
GO
--SqlScripter----[dbo].[emailaction].[$email_r00003de800000000].sql
GO
ALTER TABLE [dbo].[emailaction] WITH NOCHECK ADD CONSTRAINT [$email_r00003de800000000] FOREIGN KEY ([actionid])
REFERENCES [dbo].[action] ([actionid])
GO
ALTER TABLE [dbo].[emailaction] WITH CHECK CHECK CONSTRAINT [$email_r00003de800000000]
GO
--SqlScripter----[dbo].[evm_appliance_configuration].[$evm_a_r00001af200000000].sql
GO
ALTER TABLE [dbo].[evm_appliance_configuration] WITH NOCHECK ADD CONSTRAINT [$evm_a_r00001af200000000] FOREIGN KEY ([unit_id])
REFERENCES [dbo].[vuln_management_configuration] ([unit_id])
GO
ALTER TABLE [dbo].[evm_appliance_configuration] WITH CHECK CHECK CONSTRAINT [$evm_a_r00001af200000000]
GO
--SqlScripter----[dbo].[evm_company].[$evm_c_r00001b6400000000].sql
GO
ALTER TABLE [dbo].[evm_company] WITH NOCHECK ADD CONSTRAINT [$evm_c_r00001b6400000000] FOREIGN KEY ([company_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[evm_company] WITH CHECK CHECK CONSTRAINT [$evm_c_r00001b6400000000]
GO
--SqlScripter----[dbo].[evm_discovered_software].[$evm_d_r00001b5200000000].sql
GO
ALTER TABLE [dbo].[evm_discovered_software] WITH NOCHECK ADD CONSTRAINT [$evm_d_r00001b5200000000] FOREIGN KEY ([dis_sw_uuid])
REFERENCES [dbo].[ca_discovered_software] ([dis_sw_uuid])
GO
ALTER TABLE [dbo].[evm_discovered_software] WITH CHECK CHECK CONSTRAINT [$evm_d_r00001b5200000000]
GO
--SqlScripter----[dbo].[externalaction].[$exter_r00003e0400000000].sql
GO
ALTER TABLE [dbo].[externalaction] WITH NOCHECK ADD CONSTRAINT [$exter_r00003e0400000000] FOREIGN KEY ([actionid])
REFERENCES [dbo].[action] ([actionid])
GO
ALTER TABLE [dbo].[externalaction] WITH CHECK CHECK CONSTRAINT [$exter_r00003e0400000000]
GO
--SqlScripter----[dbo].[gdcdiscovery].[$gdcdi_r000015de00000000].sql
GO
ALTER TABLE [dbo].[gdcdiscovery] WITH NOCHECK ADD CONSTRAINT [$gdcdi_r000015de00000000] FOREIGN KEY ([mibidx])
REFERENCES [dbo].[mibdefinition] ([mibidx])
GO
ALTER TABLE [dbo].[gdcdiscovery] WITH CHECK CHECK CONSTRAINT [$gdcdi_r000015de00000000]
GO
--SqlScripter----[dbo].[gla_hours].[$gla_h_r000019c700000000].sql
GO
ALTER TABLE [dbo].[gla_hours] WITH NOCHECK ADD CONSTRAINT [$gla_h_r000019c700000000] FOREIGN KEY ([obj_id])
REFERENCES [dbo].[gla_objects] ([obj_id])
GO
ALTER TABLE [dbo].[gla_hours] WITH CHECK CHECK CONSTRAINT [$gla_h_r000019c700000000]
GO
--SqlScripter----[dbo].[gla_objects].[$gla_o_r000019d100000000].sql
GO
ALTER TABLE [dbo].[gla_objects] WITH NOCHECK ADD CONSTRAINT [$gla_o_r000019d100000000] FOREIGN KEY ([scan_index], [agent_id])
REFERENCES [dbo].[gla_sdamaps] ([scan_index], [agent_id])
GO
ALTER TABLE [dbo].[gla_objects] WITH CHECK CHECK CONSTRAINT [$gla_o_r000019d100000000]
GO
--SqlScripter----[dbo].[gla_sdamaps].[$gla_s_r000019db00000000].sql
GO
ALTER TABLE [dbo].[gla_sdamaps] WITH NOCHECK ADD CONSTRAINT [$gla_s_r000019db00000000] FOREIGN KEY ([agent_id])
REFERENCES [dbo].[gla_agents] ([agent_id])
GO
ALTER TABLE [dbo].[gla_sdamaps] WITH CHECK CHECK CONSTRAINT [$gla_s_r000019db00000000]
GO
--SqlScripter----[dbo].[global_status_event].[$globa_r00001b3e00000000].sql
GO
ALTER TABLE [dbo].[global_status_event] WITH NOCHECK ADD CONSTRAINT [$globa_r00001b3e00000000] FOREIGN KEY ([old_status_id])
REFERENCES [dbo].[asset_detection_profile_status] ([asset_detect_profile_status_id])
GO
ALTER TABLE [dbo].[global_status_event] WITH CHECK CHECK CONSTRAINT [$globa_r00001b3e00000000]
GO
--SqlScripter----[dbo].[global_status_event].[$globa_r00001b4800000000].sql
GO
ALTER TABLE [dbo].[global_status_event] WITH NOCHECK ADD CONSTRAINT [$globa_r00001b4800000000] FOREIGN KEY ([new_status_id])
REFERENCES [dbo].[asset_detection_profile_status] ([asset_detect_profile_status_id])
GO
ALTER TABLE [dbo].[global_status_event] WITH CHECK CHECK CONSTRAINT [$globa_r00001b4800000000]
GO
--SqlScripter----[dbo].[HARACTION].[HARACTION_RTID_FK].sql
GO
ALTER TABLE [dbo].[HARACTION] WITH NOCHECK ADD CONSTRAINT [HARACTION_RTID_FK] FOREIGN KEY ([resourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARACTION] WITH CHECK CHECK CONSTRAINT [HARACTION_RTID_FK]
GO
--SqlScripter----[dbo].[harallchildrenpath].[HARALLCHILDRENPATH_VERID_FK].sql
GO
ALTER TABLE [dbo].[harallchildrenpath] WITH NOCHECK ADD CONSTRAINT [HARALLCHILDRENPATH_VERID_FK] FOREIGN KEY ([versionobjid])
REFERENCES [dbo].[harversions] ([versionobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harallchildrenpath] WITH CHECK CHECK CONSTRAINT [HARALLCHILDRENPATH_VERID_FK]
GO
--SqlScripter----[dbo].[harapprove].[HARAPPROVE_SPID_FK].sql
GO
ALTER TABLE [dbo].[harapprove] WITH NOCHECK ADD CONSTRAINT [HARAPPROVE_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harapprove] WITH CHECK CHECK CONSTRAINT [HARAPPROVE_SPID_FK]
GO
--SqlScripter----[dbo].[harapprovehist].[HARAPPROVEHIST_ENVID_FK].sql
GO
ALTER TABLE [dbo].[harapprovehist] WITH NOCHECK ADD CONSTRAINT [HARAPPROVEHIST_ENVID_FK] FOREIGN KEY ([envobjid])
REFERENCES [dbo].[harenvironment] ([envobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harapprovehist] WITH CHECK CHECK CONSTRAINT [HARAPPROVEHIST_ENVID_FK]
GO
--SqlScripter----[dbo].[harapprovelist].[HARAPPROVELIST_SPID_FK].sql
GO
ALTER TABLE [dbo].[harapprovelist] WITH NOCHECK ADD CONSTRAINT [HARAPPROVELIST_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harapprovelist] WITH CHECK CHECK CONSTRAINT [HARAPPROVELIST_SPID_FK]
GO
--SqlScripter----[dbo].[harapprovelist].[HARAPPROVELIST_USRGRP_FK].sql
GO
ALTER TABLE [dbo].[harapprovelist] WITH NOCHECK ADD CONSTRAINT [HARAPPROVELIST_USRGRP_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harapprovelist] WITH CHECK CHECK CONSTRAINT [HARAPPROVELIST_USRGRP_FK]
GO
--SqlScripter----[dbo].[harapprovelist].[HARAPPROVELIST_USRID_FK].sql
GO
ALTER TABLE [dbo].[harapprovelist] WITH NOCHECK ADD CONSTRAINT [HARAPPROVELIST_USRID_FK] FOREIGN KEY ([usrobjid])
REFERENCES [dbo].[haruser] ([usrobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harapprovelist] WITH CHECK CHECK CONSTRAINT [HARAPPROVELIST_USRID_FK]
GO
--SqlScripter----[dbo].[harassocpkg].[HARASSOCPKG_AID_FK].sql
GO
ALTER TABLE [dbo].[harassocpkg] WITH NOCHECK ADD CONSTRAINT [HARASSOCPKG_AID_FK] FOREIGN KEY ([assocpkgid])
REFERENCES [dbo].[harpackage] ([packageobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harassocpkg] WITH CHECK CHECK CONSTRAINT [HARASSOCPKG_AID_FK]
GO
--SqlScripter----[dbo].[harassocpkg].[HARASSOCPKG_FID_FK].sql
GO
ALTER TABLE [dbo].[harassocpkg] WITH NOCHECK ADD CONSTRAINT [HARASSOCPKG_FID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harassocpkg] WITH CHECK CHECK CONSTRAINT [HARASSOCPKG_FID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENT].[HARAUDITEVENT_ACTID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENT] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENT_ACTID_FK] FOREIGN KEY ([actionobjid])
REFERENCES [dbo].[HARACTION] ([actionobjid])
GO
ALTER TABLE [dbo].[HARAUDITEVENT] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENT_ACTID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENT].[HARAUDITEVENT_RTID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENT] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENT_RTID_FK] FOREIGN KEY ([resourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARAUDITEVENT] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENT_RTID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTDESCRIPTION].[HARAUDITEVENTDESC_AUDID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTDESCRIPTION] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTDESC_AUDID_FK] FOREIGN KEY ([auditeventobjid])
REFERENCES [dbo].[HARAUDITEVENT] ([auditeventobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARAUDITEVENTDESCRIPTION] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTDESC_AUDID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL1].[HARAUDITEVENTRSRCL1_AUDID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL1] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTRSRCL1_AUDID_FK] FOREIGN KEY ([auditeventobjid])
REFERENCES [dbo].[HARAUDITEVENT] ([auditeventobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL1] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTRSRCL1_AUDID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL1].[HARAUDITEVENTRSRCL1_RTID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL1] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTRSRCL1_RTID_FK] FOREIGN KEY ([resourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL1] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTRSRCL1_RTID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL2].[HARAUDITEVENTRSRCL2_AUDID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL2] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTRSRCL2_AUDID_FK] FOREIGN KEY ([auditeventobjid])
REFERENCES [dbo].[HARAUDITEVENT] ([auditeventobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL2] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTRSRCL2_AUDID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL2].[HARAUDITEVENTRSRCL2_RTID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL2] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTRSRCL2_RTID_FK] FOREIGN KEY ([resourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL2] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTRSRCL2_RTID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL3].[HARAUDITEVENTRSRCL3_AUDID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL3] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTRSRCL3_AUDID_FK] FOREIGN KEY ([auditeventobjid])
REFERENCES [dbo].[HARAUDITEVENT] ([auditeventobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL3] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTRSRCL3_AUDID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL3].[HARAUDITEVENTRSRCL3_RTID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL3] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTRSRCL3_RTID_FK] FOREIGN KEY ([resourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL3] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTRSRCL3_RTID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL4].[HARAUDITEVENTRSRCL4_AUDID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL4] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTRSRCL4_AUDID_FK] FOREIGN KEY ([auditeventobjid])
REFERENCES [dbo].[HARAUDITEVENT] ([auditeventobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL4] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTRSRCL4_AUDID_FK]
GO
--SqlScripter----[dbo].[HARAUDITEVENTRESOURCEL4].[HARAUDITEVENTRSRCL4_RTID_FK].sql
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL4] WITH NOCHECK ADD CONSTRAINT [HARAUDITEVENTRSRCL4_RTID_FK] FOREIGN KEY ([resourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARAUDITEVENTRESOURCEL4] WITH CHECK CHECK CONSTRAINT [HARAUDITEVENTRSRCL4_RTID_FK]
GO
--SqlScripter----[dbo].[harbranch].[HARBRANCH_ITEMID_FK].sql
GO
ALTER TABLE [dbo].[harbranch] WITH NOCHECK ADD CONSTRAINT [HARBRANCH_ITEMID_FK] FOREIGN KEY ([itemobjid])
REFERENCES [dbo].[haritems] ([itemobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harbranch] WITH CHECK CHECK CONSTRAINT [HARBRANCH_ITEMID_FK]
GO
--SqlScripter----[dbo].[harcheckinproc].[HARCHECKINPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harcheckinproc] WITH NOCHECK ADD CONSTRAINT [HARCHECKINPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harcheckinproc] WITH CHECK CHECK CONSTRAINT [HARCHECKINPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harcheckoutproc].[HARCHECKOUTPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harcheckoutproc] WITH NOCHECK ADD CONSTRAINT [HARCHECKOUTPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harcheckoutproc] WITH CHECK CHECK CONSTRAINT [HARCHECKOUTPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harcomment].[HARCOMMENT_FORMID_FK].sql
GO
ALTER TABLE [dbo].[harcomment] WITH NOCHECK ADD CONSTRAINT [HARCOMMENT_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harcomment] WITH CHECK CHECK CONSTRAINT [HARCOMMENT_FORMID_FK]
GO
--SqlScripter----[dbo].[harconmrgproc].[HARCONMRGPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harconmrgproc] WITH NOCHECK ADD CONSTRAINT [HARCONMRGPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harconmrgproc] WITH CHECK CHECK CONSTRAINT [HARCONMRGPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harcrpkgproc].[HARCRPKGPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harcrpkgproc] WITH NOCHECK ADD CONSTRAINT [HARCRPKGPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harcrpkgproc] WITH CHECK CHECK CONSTRAINT [HARCRPKGPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harcrsenvmrgproc].[HARCRSENVMRGPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harcrsenvmrgproc] WITH NOCHECK ADD CONSTRAINT [HARCRSENVMRGPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harcrsenvmrgproc] WITH CHECK CHECK CONSTRAINT [HARCRSENVMRGPROC_SPID_FK]
GO
--SqlScripter----[dbo].[hardefect].[HARDEFECT_FORMID_FK].sql
GO
ALTER TABLE [dbo].[hardefect] WITH NOCHECK ADD CONSTRAINT [HARDEFECT_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hardefect] WITH CHECK CHECK CONSTRAINT [HARDEFECT_FORMID_FK]
GO
--SqlScripter----[dbo].[hardelpkgproc].[hardelpkgproc_SPID_FK].sql
GO
ALTER TABLE [dbo].[hardelpkgproc] WITH NOCHECK ADD CONSTRAINT [hardelpkgproc_SPID_FK] FOREIGN KEY ([STATEOBJID], [PROCESSOBJID])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hardelpkgproc] WITH CHECK CHECK CONSTRAINT [hardelpkgproc_SPID_FK]
GO
--SqlScripter----[dbo].[hardelversproc].[HARDELVERSPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[hardelversproc] WITH NOCHECK ADD CONSTRAINT [HARDELVERSPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hardelversproc] WITH CHECK CHECK CONSTRAINT [HARDELVERSPROC_SPID_FK]
GO
--SqlScripter----[dbo].[hardemoteproc].[HARDEMOTEPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[hardemoteproc] WITH NOCHECK ADD CONSTRAINT [HARDEMOTEPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hardemoteproc] WITH CHECK CHECK CONSTRAINT [HARDEMOTEPROC_SPID_FK]
GO
--SqlScripter----[dbo].[hardware_sd_server_matrix].[$hardw_r00001d0800000000].sql
GO
ALTER TABLE [dbo].[hardware_sd_server_matrix] WITH NOCHECK ADD CONSTRAINT [$hardw_r00001d0800000000] FOREIGN KEY ([software_delivery_server_id])
REFERENCES [dbo].[software_delivery_server] ([software_delivery_server_id])
GO
ALTER TABLE [dbo].[hardware_sd_server_matrix] WITH CHECK CHECK CONSTRAINT [$hardw_r00001d0800000000]
GO
--SqlScripter----[dbo].[hardware_sd_server_matrix].[$hardw_r00001d1100000000].sql
GO
ALTER TABLE [dbo].[hardware_sd_server_matrix] WITH NOCHECK ADD CONSTRAINT [$hardw_r00001d1100000000] FOREIGN KEY ([dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[hardware_sd_server_matrix] WITH CHECK CHECK CONSTRAINT [$hardw_r00001d1100000000]
GO
--SqlScripter----[dbo].[hardware_software_dvy_jb_file].[$hardw_r00001d1a00000000].sql
GO
ALTER TABLE [dbo].[hardware_software_dvy_jb_file] WITH NOCHECK ADD CONSTRAINT [$hardw_r00001d1a00000000] FOREIGN KEY ([software_delivery_job_file_id])
REFERENCES [dbo].[software_delivery_job_file] ([software_delivery_job_file_id])
GO
ALTER TABLE [dbo].[hardware_software_dvy_jb_file] WITH CHECK CHECK CONSTRAINT [$hardw_r00001d1a00000000]
GO
--SqlScripter----[dbo].[hardware_software_dvy_jb_file].[$hardw_r00001d2300000000].sql
GO
ALTER TABLE [dbo].[hardware_software_dvy_jb_file] WITH NOCHECK ADD CONSTRAINT [$hardw_r00001d2300000000] FOREIGN KEY ([asset_software_delivery_job_id])
REFERENCES [dbo].[asset_software_delivery_job] ([asset_software_delivery_job_id])
GO
ALTER TABLE [dbo].[hardware_software_dvy_jb_file] WITH CHECK CHECK CONSTRAINT [$hardw_r00001d2300000000]
GO
--SqlScripter----[dbo].[harenvironmentaccess].[HARENVACCESS_ENVID_FK].sql
GO
ALTER TABLE [dbo].[harenvironmentaccess] WITH NOCHECK ADD CONSTRAINT [HARENVACCESS_ENVID_FK] FOREIGN KEY ([envobjid])
REFERENCES [dbo].[harenvironment] ([envobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harenvironmentaccess] WITH CHECK CHECK CONSTRAINT [HARENVACCESS_ENVID_FK]
GO
--SqlScripter----[dbo].[harenvironmentaccess].[HARENVACCESS_USRGRPID_FK].sql
GO
ALTER TABLE [dbo].[harenvironmentaccess] WITH NOCHECK ADD CONSTRAINT [HARENVACCESS_USRGRPID_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harenvironmentaccess] WITH CHECK CHECK CONSTRAINT [HARENVACCESS_USRGRPID_FK]
GO
--SqlScripter----[dbo].[haresd].[HARESD_FORMID_FK].sql
GO
ALTER TABLE [dbo].[haresd] WITH NOCHECK ADD CONSTRAINT [HARESD_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[haresd] WITH CHECK CHECK CONSTRAINT [HARESD_FORMID_FK]
GO
--SqlScripter----[dbo].[HAREXECUTABLEACTION].[HAREXECUTABLEACTION_ACTID_FK].sql
GO
ALTER TABLE [dbo].[HAREXECUTABLEACTION] WITH NOCHECK ADD CONSTRAINT [HAREXECUTABLEACTION_ACTID_FK] FOREIGN KEY ([actionobjid])
REFERENCES [dbo].[HARACTION] ([actionobjid])
GO
ALTER TABLE [dbo].[HAREXECUTABLEACTION] WITH CHECK CHECK CONSTRAINT [HAREXECUTABLEACTION_ACTID_FK]
GO
--SqlScripter----[dbo].[HAREXECUTABLEACTION].[HAREXECUTABLEACTION_RTID_FK].sql
GO
ALTER TABLE [dbo].[HAREXECUTABLEACTION] WITH NOCHECK ADD CONSTRAINT [HAREXECUTABLEACTION_RTID_FK] FOREIGN KEY ([resourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HAREXECUTABLEACTION] WITH CHECK CHECK CONSTRAINT [HAREXECUTABLEACTION_RTID_FK]
GO
--SqlScripter----[dbo].[harexternassoc].[harexternassoc_pkg_fk].sql
GO
ALTER TABLE [dbo].[harexternassoc] WITH NOCHECK ADD CONSTRAINT [harexternassoc_pkg_fk] FOREIGN KEY ([packageobjid])
REFERENCES [dbo].[harpackage] ([packageobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harexternassoc] WITH CHECK CHECK CONSTRAINT [harexternassoc_pkg_fk]
GO
--SqlScripter----[dbo].[harexternassoc].[harexternassoc_usr_fk].sql
GO
ALTER TABLE [dbo].[harexternassoc] WITH NOCHECK ADD CONSTRAINT [harexternassoc_usr_fk] FOREIGN KEY ([usrobjid])
REFERENCES [dbo].[harallusers] ([usrobjid])
GO
ALTER TABLE [dbo].[harexternassoc] WITH CHECK CHECK CONSTRAINT [harexternassoc_usr_fk]
GO
--SqlScripter----[dbo].[harfileextension].[HARFILEEXTENSION_REPID_FK].sql
GO
ALTER TABLE [dbo].[harfileextension] WITH NOCHECK ADD CONSTRAINT [HARFILEEXTENSION_REPID_FK] FOREIGN KEY ([repositobjid])
REFERENCES [dbo].[harrepository] ([repositobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harfileextension] WITH CHECK CHECK CONSTRAINT [HARFILEEXTENSION_REPID_FK]
GO
--SqlScripter----[dbo].[harform].[HARFORM_FTID_FK].sql
GO
ALTER TABLE [dbo].[harform] WITH NOCHECK ADD CONSTRAINT [HARFORM_FTID_FK] FOREIGN KEY ([formtypeobjid])
REFERENCES [dbo].[harformtype] ([formtypeobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harform] WITH CHECK CHECK CONSTRAINT [HARFORM_FTID_FK]
GO
--SqlScripter----[dbo].[harformhistory].[HARFORMHIST_FORMID_FK].sql
GO
ALTER TABLE [dbo].[harformhistory] WITH NOCHECK ADD CONSTRAINT [HARFORMHIST_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harformhistory] WITH CHECK CHECK CONSTRAINT [HARFORMHIST_FORMID_FK]
GO
--SqlScripter----[dbo].[HARFORMTEMPLATES].[HARFORMTEMPLATES_FTID_FK].sql
GO
ALTER TABLE [dbo].[HARFORMTEMPLATES] WITH NOCHECK ADD CONSTRAINT [HARFORMTEMPLATES_FTID_FK] FOREIGN KEY ([FORMTYPEOBJID])
REFERENCES [dbo].[harformtype] ([formtypeobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARFORMTEMPLATES] WITH CHECK CHECK CONSTRAINT [HARFORMTEMPLATES_FTID_FK]
GO
--SqlScripter----[dbo].[harformtypeaccess].[HARFORMTYPEACCESS_FTID_FK].sql
GO
ALTER TABLE [dbo].[harformtypeaccess] WITH NOCHECK ADD CONSTRAINT [HARFORMTYPEACCESS_FTID_FK] FOREIGN KEY ([formtypeobjid])
REFERENCES [dbo].[harformtype] ([formtypeobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harformtypeaccess] WITH CHECK CHECK CONSTRAINT [HARFORMTYPEACCESS_FTID_FK]
GO
--SqlScripter----[dbo].[harformtypeaccess].[HARFORMTYPEACCESS_USRGRPID_FK].sql
GO
ALTER TABLE [dbo].[harformtypeaccess] WITH NOCHECK ADD CONSTRAINT [HARFORMTYPEACCESS_USRGRPID_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harformtypeaccess] WITH CHECK CHECK CONSTRAINT [HARFORMTYPEACCESS_USRGRPID_FK]
GO
--SqlScripter----[dbo].[harformtypedefs].[HARFORMTYPEDEFS_FTID_FK].sql
GO
ALTER TABLE [dbo].[harformtypedefs] WITH NOCHECK ADD CONSTRAINT [HARFORMTYPEDEFS_FTID_FK] FOREIGN KEY ([formtypeobjid])
REFERENCES [dbo].[harformtype] ([formtypeobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harformtypedefs] WITH CHECK CHECK CONSTRAINT [HARFORMTYPEDEFS_FTID_FK]
GO
--SqlScripter----[dbo].[HARGLOBALAUDITPOLICY].[HARGLOBALAUDITPOLICY_ACTID_FK].sql
GO
ALTER TABLE [dbo].[HARGLOBALAUDITPOLICY] WITH NOCHECK ADD CONSTRAINT [HARGLOBALAUDITPOLICY_ACTID_FK] FOREIGN KEY ([actionobjid])
REFERENCES [dbo].[HARACTION] ([actionobjid])
GO
ALTER TABLE [dbo].[HARGLOBALAUDITPOLICY] WITH CHECK CHECK CONSTRAINT [HARGLOBALAUDITPOLICY_ACTID_FK]
GO
--SqlScripter----[dbo].[harharvest].[HARHARVEST_USRGRPID_FK].sql
GO
ALTER TABLE [dbo].[harharvest] WITH NOCHECK ADD CONSTRAINT [HARHARVEST_USRGRPID_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harharvest] WITH CHECK CHECK CONSTRAINT [HARHARVEST_USRGRPID_FK]
GO
--SqlScripter----[dbo].[harintmrgproc].[HARINTMRGPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harintmrgproc] WITH NOCHECK ADD CONSTRAINT [HARINTMRGPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harintmrgproc] WITH CHECK CHECK CONSTRAINT [HARINTMRGPROC_SPID_FK]
GO
--SqlScripter----[dbo].[haritemaccess].[HARITEMACCESS_ITEMID_FK].sql
GO
ALTER TABLE [dbo].[haritemaccess] WITH NOCHECK ADD CONSTRAINT [HARITEMACCESS_ITEMID_FK] FOREIGN KEY ([itemobjid])
REFERENCES [dbo].[haritems] ([itemobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[haritemaccess] WITH CHECK CHECK CONSTRAINT [HARITEMACCESS_ITEMID_FK]
GO
--SqlScripter----[dbo].[haritemaccess].[HARITEMACCESS_USRGRPID_FK].sql
GO
ALTER TABLE [dbo].[haritemaccess] WITH NOCHECK ADD CONSTRAINT [HARITEMACCESS_USRGRPID_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[haritemaccess] WITH CHECK CHECK CONSTRAINT [HARITEMACCESS_USRGRPID_FK]
GO
--SqlScripter----[dbo].[haritemrelationship].[HARITEMREL_ITEMID_FK].sql
GO
ALTER TABLE [dbo].[haritemrelationship] WITH NOCHECK ADD CONSTRAINT [HARITEMREL_ITEMID_FK] FOREIGN KEY ([itemobjid])
REFERENCES [dbo].[haritems] ([itemobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[haritemrelationship] WITH CHECK CHECK CONSTRAINT [HARITEMREL_ITEMID_FK]
GO
--SqlScripter----[dbo].[haritemrelationship].[HARITEMREL_VERID_FK].sql
GO
ALTER TABLE [dbo].[haritemrelationship] WITH NOCHECK ADD CONSTRAINT [HARITEMREL_VERID_FK] FOREIGN KEY ([versionobjid])
REFERENCES [dbo].[harversions] ([versionobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[haritemrelationship] WITH CHECK CHECK CONSTRAINT [HARITEMREL_VERID_FK]
GO
--SqlScripter----[dbo].[harlinkedprocess].[HARLINKEDPROCESS_SPID_FK].sql
GO
ALTER TABLE [dbo].[harlinkedprocess] WITH NOCHECK ADD CONSTRAINT [HARLINKEDPROCESS_SPID_FK] FOREIGN KEY ([stateobjid], [parentprocobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harlinkedprocess] WITH CHECK CHECK CONSTRAINT [HARLINKEDPROCESS_SPID_FK]
GO
--SqlScripter----[dbo].[harlinkedprocess].[HARLINKEDPROCESS_STATEID_FK].sql
GO
ALTER TABLE [dbo].[harlinkedprocess] WITH NOCHECK ADD CONSTRAINT [HARLINKEDPROCESS_STATEID_FK] FOREIGN KEY ([stateobjid])
REFERENCES [dbo].[harstate] ([stateobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harlinkedprocess] WITH CHECK CHECK CONSTRAINT [HARLINKEDPROCESS_STATEID_FK]
GO
--SqlScripter----[dbo].[harlistdiffproc].[HARLISTDIFFPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harlistdiffproc] WITH NOCHECK ADD CONSTRAINT [HARLISTDIFFPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harlistdiffproc] WITH CHECK CHECK CONSTRAINT [HARLISTDIFFPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harlistversproc].[HARLISTVERSPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harlistversproc] WITH NOCHECK ADD CONSTRAINT [HARLISTVERSPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harlistversproc] WITH CHECK CHECK CONSTRAINT [HARLISTVERSPROC_SPID_FK]
GO
--SqlScripter----[dbo].[HARMOVEITEMPROC].[HARMOVEITEMPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[HARMOVEITEMPROC] WITH NOCHECK ADD CONSTRAINT [HARMOVEITEMPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARMOVEITEMPROC] WITH CHECK CHECK CONSTRAINT [HARMOVEITEMPROC_SPID_FK]
GO
--SqlScripter----[dbo].[HARMOVEPATHPROC].[HARMOVEPATHPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[HARMOVEPATHPROC] WITH NOCHECK ADD CONSTRAINT [HARMOVEPATHPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARMOVEPATHPROC] WITH CHECK CHECK CONSTRAINT [HARMOVEPATHPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harmovepkgproc].[HARMOVEPKGPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harmovepkgproc] WITH NOCHECK ADD CONSTRAINT [HARMOVEPKGPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harmovepkgproc] WITH CHECK CHECK CONSTRAINT [HARMOVEPKGPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harmr].[HARMR_FORMID_FK].sql
GO
ALTER TABLE [dbo].[harmr] WITH NOCHECK ADD CONSTRAINT [HARMR_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harmr] WITH CHECK CHECK CONSTRAINT [HARMR_FORMID_FK]
GO
--SqlScripter----[dbo].[harnotify].[HARNOTIFY_PPID_FK].sql
GO
ALTER TABLE [dbo].[harnotify] WITH NOCHECK ADD CONSTRAINT [HARNOTIFY_PPID_FK] FOREIGN KEY ([parentprocobjid], [processobjid])
REFERENCES [dbo].[harlinkedprocess] ([parentprocobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harnotify] WITH CHECK CHECK CONSTRAINT [HARNOTIFY_PPID_FK]
GO
--SqlScripter----[dbo].[harnotifylist].[HARNOTIFYLIST_PPID_FK].sql
GO
ALTER TABLE [dbo].[harnotifylist] WITH NOCHECK ADD CONSTRAINT [HARNOTIFYLIST_PPID_FK] FOREIGN KEY ([parentprocobjid], [processobjid])
REFERENCES [dbo].[harlinkedprocess] ([parentprocobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harnotifylist] WITH CHECK CHECK CONSTRAINT [HARNOTIFYLIST_PPID_FK]
GO
--SqlScripter----[dbo].[harnotifylist].[HARNOTIFYLIST_USRGRPID_FK].sql
GO
ALTER TABLE [dbo].[harnotifylist] WITH NOCHECK ADD CONSTRAINT [HARNOTIFYLIST_USRGRPID_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harnotifylist] WITH CHECK CHECK CONSTRAINT [HARNOTIFYLIST_USRGRPID_FK]
GO
--SqlScripter----[dbo].[harnotifylist].[HARNOTIFYLIST_USRID_FK].sql
GO
ALTER TABLE [dbo].[harnotifylist] WITH NOCHECK ADD CONSTRAINT [HARNOTIFYLIST_USRID_FK] FOREIGN KEY ([usrobjid])
REFERENCES [dbo].[haruser] ([usrobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harnotifylist] WITH CHECK CHECK CONSTRAINT [HARNOTIFYLIST_USRID_FK]
GO
--SqlScripter----[dbo].[HARONDEMANDCR].[HARONDEMANDCR_FK].sql
GO
ALTER TABLE [dbo].[HARONDEMANDCR] WITH NOCHECK ADD CONSTRAINT [HARONDEMANDCR_FK] FOREIGN KEY ([FORMOBJID])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARONDEMANDCR] WITH CHECK CHECK CONSTRAINT [HARONDEMANDCR_FK]
GO
--SqlScripter----[dbo].[harpac].[HARPAC_FORMID_FK].sql
GO
ALTER TABLE [dbo].[harpac] WITH NOCHECK ADD CONSTRAINT [HARPAC_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpac] WITH CHECK CHECK CONSTRAINT [HARPAC_FORMID_FK]
GO
--SqlScripter----[dbo].[harpackage].[harpackage_aid_fk].sql
GO
ALTER TABLE [dbo].[harpackage] WITH NOCHECK ADD CONSTRAINT [harpackage_aid_fk] FOREIGN KEY ([assigneeid])
REFERENCES [dbo].[harallusers] ([usrobjid])
GO
ALTER TABLE [dbo].[harpackage] WITH CHECK CHECK CONSTRAINT [harpackage_aid_fk]
GO
--SqlScripter----[dbo].[harpackage].[HARPACKAGE_ENVID_FK].sql
GO
ALTER TABLE [dbo].[harpackage] WITH NOCHECK ADD CONSTRAINT [HARPACKAGE_ENVID_FK] FOREIGN KEY ([envobjid])
REFERENCES [dbo].[harenvironment] ([envobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpackage] WITH CHECK CHECK CONSTRAINT [HARPACKAGE_ENVID_FK]
GO
--SqlScripter----[dbo].[harpackagegroup].[HARPACKAGEGROUP_ENVID_FK].sql
GO
ALTER TABLE [dbo].[harpackagegroup] WITH NOCHECK ADD CONSTRAINT [HARPACKAGEGROUP_ENVID_FK] FOREIGN KEY ([envobjid])
REFERENCES [dbo].[harenvironment] ([envobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpackagegroup] WITH CHECK CHECK CONSTRAINT [HARPACKAGEGROUP_ENVID_FK]
GO
--SqlScripter----[dbo].[harpackagestatus].[HARPACKAGESTATUS_FK].sql
GO
ALTER TABLE [dbo].[harpackagestatus] WITH NOCHECK ADD CONSTRAINT [HARPACKAGESTATUS_FK] FOREIGN KEY ([packageobjid])
REFERENCES [dbo].[harpackage] ([packageobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpackagestatus] WITH CHECK CHECK CONSTRAINT [HARPACKAGESTATUS_FK]
GO
--SqlScripter----[dbo].[harpasswordhistory].[HARPASSWORDHISTORY_FK].sql
GO
ALTER TABLE [dbo].[harpasswordhistory] WITH NOCHECK ADD CONSTRAINT [HARPASSWORDHISTORY_FK] FOREIGN KEY ([usrobjid])
REFERENCES [dbo].[haruser] ([usrobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpasswordhistory] WITH CHECK CHECK CONSTRAINT [HARPASSWORDHISTORY_FK]
GO
--SqlScripter----[dbo].[harpasswordpolicy].[harpasswordpolicy_modid_fk].sql
GO
ALTER TABLE [dbo].[harpasswordpolicy] WITH NOCHECK ADD CONSTRAINT [harpasswordpolicy_modid_fk] FOREIGN KEY ([modifierid])
REFERENCES [dbo].[harallusers] ([usrobjid])
GO
ALTER TABLE [dbo].[harpasswordpolicy] WITH CHECK CHECK CONSTRAINT [harpasswordpolicy_modid_fk]
GO
--SqlScripter----[dbo].[harpathfullname].[HARPATHFULLNAME_VERID_FK].sql
GO
ALTER TABLE [dbo].[harpathfullname] WITH NOCHECK ADD CONSTRAINT [HARPATHFULLNAME_VERID_FK] FOREIGN KEY ([versionobjid])
REFERENCES [dbo].[harversions] ([versionobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpathfullname] WITH CHECK CHECK CONSTRAINT [HARPATHFULLNAME_VERID_FK]
GO
--SqlScripter----[dbo].[harpkgsincmew].[HARPKGSINCMEW_FK].sql
GO
ALTER TABLE [dbo].[harpkgsincmew] WITH NOCHECK ADD CONSTRAINT [HARPKGSINCMEW_FK] FOREIGN KEY ([packageobjid])
REFERENCES [dbo].[harpackage] ([packageobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpkgsincmew] WITH CHECK CHECK CONSTRAINT [HARPKGSINCMEW_FK]
GO
--SqlScripter----[dbo].[harpkgsinpkggrp].[HARPKGSINGRP_PKGGRPID_FK].sql
GO
ALTER TABLE [dbo].[harpkgsinpkggrp] WITH NOCHECK ADD CONSTRAINT [HARPKGSINGRP_PKGGRPID_FK] FOREIGN KEY ([pkggrpobjid])
REFERENCES [dbo].[harpackagegroup] ([pkggrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpkgsinpkggrp] WITH CHECK CHECK CONSTRAINT [HARPKGSINGRP_PKGGRPID_FK]
GO
--SqlScripter----[dbo].[harproblemreport].[HARPROBLEMREPORT_FORMID_FK].sql
GO
ALTER TABLE [dbo].[harproblemreport] WITH NOCHECK ADD CONSTRAINT [HARPROBLEMREPORT_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harproblemreport] WITH CHECK CHECK CONSTRAINT [HARPROBLEMREPORT_FORMID_FK]
GO
--SqlScripter----[dbo].[harpromoteproc].[HARPROMOTEPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harpromoteproc] WITH NOCHECK ADD CONSTRAINT [HARPROMOTEPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harpromoteproc] WITH CHECK CHECK CONSTRAINT [HARPROMOTEPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harqanda].[HARQANDA_FORMID_FK].sql
GO
ALTER TABLE [dbo].[harqanda] WITH NOCHECK ADD CONSTRAINT [HARQANDA_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harqanda] WITH CHECK CHECK CONSTRAINT [HARQANDA_FORMID_FK]
GO
--SqlScripter----[dbo].[harremitemproc].[HARREMITEMPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harremitemproc] WITH NOCHECK ADD CONSTRAINT [HARREMITEMPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harremitemproc] WITH CHECK CHECK CONSTRAINT [HARREMITEMPROC_SPID_FK]
GO
--SqlScripter----[dbo].[HARREMOVEPATHPROC].[HARREMOVEPATHPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[HARREMOVEPATHPROC] WITH NOCHECK ADD CONSTRAINT [HARREMOVEPATHPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARREMOVEPATHPROC] WITH CHECK CHECK CONSTRAINT [HARREMOVEPATHPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harrenameitemproc].[HARRENAMEITEMPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harrenameitemproc] WITH NOCHECK ADD CONSTRAINT [HARRENAMEITEMPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harrenameitemproc] WITH CHECK CHECK CONSTRAINT [HARRENAMEITEMPROC_SPID_FK]
GO
--SqlScripter----[dbo].[HARRENAMEPATHPROC].[HARRENAMEPATHPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[HARRENAMEPATHPROC] WITH NOCHECK ADD CONSTRAINT [HARRENAMEPATHPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARRENAMEPATHPROC] WITH CHECK CHECK CONSTRAINT [HARRENAMEPATHPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harrepinview].[HARREPINVIEW_REPID_FK].sql
GO
ALTER TABLE [dbo].[harrepinview] WITH NOCHECK ADD CONSTRAINT [HARREPINVIEW_REPID_FK] FOREIGN KEY ([repositobjid])
REFERENCES [dbo].[harrepository] ([repositobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harrepinview] WITH CHECK CHECK CONSTRAINT [HARREPINVIEW_REPID_FK]
GO
--SqlScripter----[dbo].[harrepinview].[HARREPINVIEW_VIEWID_FK].sql
GO
ALTER TABLE [dbo].[harrepinview] WITH NOCHECK ADD CONSTRAINT [HARREPINVIEW_VIEWID_FK] FOREIGN KEY ([viewobjid])
REFERENCES [dbo].[harview] ([viewobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harrepinview] WITH CHECK CHECK CONSTRAINT [HARREPINVIEW_VIEWID_FK]
GO
--SqlScripter----[dbo].[harrepositoryaccess].[HARREPACCESS_REPID_FK].sql
GO
ALTER TABLE [dbo].[harrepositoryaccess] WITH NOCHECK ADD CONSTRAINT [HARREPACCESS_REPID_FK] FOREIGN KEY ([repositobjid])
REFERENCES [dbo].[harrepository] ([repositobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harrepositoryaccess] WITH CHECK CHECK CONSTRAINT [HARREPACCESS_REPID_FK]
GO
--SqlScripter----[dbo].[harrepositoryaccess].[HARREPACCESS_USRGRP_FK].sql
GO
ALTER TABLE [dbo].[harrepositoryaccess] WITH NOCHECK ADD CONSTRAINT [HARREPACCESS_USRGRP_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harrepositoryaccess] WITH CHECK CHECK CONSTRAINT [HARREPACCESS_USRGRP_FK]
GO
--SqlScripter----[dbo].[HARRESOURCETYPECHILD].[HARRESOURCETYPECHILD_CLDID_FK].sql
GO
ALTER TABLE [dbo].[HARRESOURCETYPECHILD] WITH NOCHECK ADD CONSTRAINT [HARRESOURCETYPECHILD_CLDID_FK] FOREIGN KEY ([childresourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARRESOURCETYPECHILD] WITH CHECK CHECK CONSTRAINT [HARRESOURCETYPECHILD_CLDID_FK]
GO
--SqlScripter----[dbo].[HARRESOURCETYPECHILD].[HARRESOURCETYPECHILD_PARID_FK].sql
GO
ALTER TABLE [dbo].[HARRESOURCETYPECHILD] WITH NOCHECK ADD CONSTRAINT [HARRESOURCETYPECHILD_PARID_FK] FOREIGN KEY ([parentresourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARRESOURCETYPECHILD] WITH CHECK CHECK CONSTRAINT [HARRESOURCETYPECHILD_PARID_FK]
GO
--SqlScripter----[dbo].[HARRESOURCETYPEDESCENDANT].[HARRESOURCETYPEDESC_ANCID_FK].sql
GO
ALTER TABLE [dbo].[HARRESOURCETYPEDESCENDANT] WITH NOCHECK ADD CONSTRAINT [HARRESOURCETYPEDESC_ANCID_FK] FOREIGN KEY ([ancestorresourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARRESOURCETYPEDESCENDANT] WITH CHECK CHECK CONSTRAINT [HARRESOURCETYPEDESC_ANCID_FK]
GO
--SqlScripter----[dbo].[HARRESOURCETYPEDESCENDANT].[HARRESOURCETYPEDESC_DESID_FK].sql
GO
ALTER TABLE [dbo].[HARRESOURCETYPEDESCENDANT] WITH NOCHECK ADD CONSTRAINT [HARRESOURCETYPEDESC_DESID_FK] FOREIGN KEY ([descendantresourcetypeobjid])
REFERENCES [dbo].[HARRESOURCETYPE] ([resourcetypeobjid])
GO
ALTER TABLE [dbo].[HARRESOURCETYPEDESCENDANT] WITH CHECK CHECK CONSTRAINT [HARRESOURCETYPEDESC_DESID_FK]
GO
--SqlScripter----[dbo].[harsnapviewproc].[HARSNAPVIEWPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harsnapviewproc] WITH NOCHECK ADD CONSTRAINT [HARSNAPVIEWPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harsnapviewproc] WITH CHECK CHECK CONSTRAINT [HARSNAPVIEWPROC_SPID_FK]
GO
--SqlScripter----[dbo].[harstate].[HARSTATE_ENVID_FK].sql
GO
ALTER TABLE [dbo].[harstate] WITH NOCHECK ADD CONSTRAINT [HARSTATE_ENVID_FK] FOREIGN KEY ([envobjid])
REFERENCES [dbo].[harenvironment] ([envobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harstate] WITH CHECK CHECK CONSTRAINT [HARSTATE_ENVID_FK]
GO
--SqlScripter----[dbo].[harstate].[harstate_pmstatusindex_fk].sql
GO
ALTER TABLE [dbo].[harstate] WITH NOCHECK ADD CONSTRAINT [harstate_pmstatusindex_fk] FOREIGN KEY ([pmstatusindex])
REFERENCES [dbo].[harpmstatus] ([pmstatusindex])
GO
ALTER TABLE [dbo].[harstate] WITH CHECK CHECK CONSTRAINT [harstate_pmstatusindex_fk]
GO
--SqlScripter----[dbo].[harstate].[HARSTATE_STATUS_FK].sql
GO
ALTER TABLE [dbo].[harstate] WITH NOCHECK ADD CONSTRAINT [HARSTATE_STATUS_FK] FOREIGN KEY ([pmstatusindex])
REFERENCES [dbo].[harpmstatus] ([pmstatusindex])
GO
ALTER TABLE [dbo].[harstate] WITH CHECK CHECK CONSTRAINT [HARSTATE_STATUS_FK]
GO
--SqlScripter----[dbo].[harstate].[harstate_viewid_fk].sql
GO
ALTER TABLE [dbo].[harstate] WITH NOCHECK ADD CONSTRAINT [harstate_viewid_fk] FOREIGN KEY ([viewobjid])
REFERENCES [dbo].[harview] ([viewobjid])
GO
ALTER TABLE [dbo].[harstate] WITH CHECK CHECK CONSTRAINT [harstate_viewid_fk]
GO
--SqlScripter----[dbo].[harstateaccess].[HARSTATEACCESS_STATEID_FK].sql
GO
ALTER TABLE [dbo].[harstateaccess] WITH NOCHECK ADD CONSTRAINT [HARSTATEACCESS_STATEID_FK] FOREIGN KEY ([stateobjid])
REFERENCES [dbo].[harstate] ([stateobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harstateaccess] WITH CHECK CHECK CONSTRAINT [HARSTATEACCESS_STATEID_FK]
GO
--SqlScripter----[dbo].[harstateaccess].[HARSTATEACCESS_USRGRPID_FK].sql
GO
ALTER TABLE [dbo].[harstateaccess] WITH NOCHECK ADD CONSTRAINT [HARSTATEACCESS_USRGRPID_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harstateaccess] WITH CHECK CHECK CONSTRAINT [HARSTATEACCESS_USRGRPID_FK]
GO
--SqlScripter----[dbo].[harstateprocessaccess].[HARSTATEPROCACCESS_SPID_FK].sql
GO
ALTER TABLE [dbo].[harstateprocessaccess] WITH NOCHECK ADD CONSTRAINT [HARSTATEPROCACCESS_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harstateprocessaccess] WITH CHECK CHECK CONSTRAINT [HARSTATEPROCACCESS_SPID_FK]
GO
--SqlScripter----[dbo].[harstateprocessaccess].[HARSTATEPROCACCESS_USRGRP_FK].sql
GO
ALTER TABLE [dbo].[harstateprocessaccess] WITH NOCHECK ADD CONSTRAINT [HARSTATEPROCACCESS_USRGRP_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harstateprocessaccess] WITH CHECK CHECK CONSTRAINT [HARSTATEPROCACCESS_USRGRP_FK]
GO
--SqlScripter----[dbo].[harswitchpkgproc].[HARSWITCHPKGPROC_SPID_FK].sql
GO
ALTER TABLE [dbo].[harswitchpkgproc] WITH NOCHECK ADD CONSTRAINT [HARSWITCHPKGPROC_SPID_FK] FOREIGN KEY ([stateobjid], [processobjid])
REFERENCES [dbo].[harstateprocess] ([stateobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harswitchpkgproc] WITH CHECK CHECK CONSTRAINT [HARSWITCHPKGPROC_SPID_FK]
GO
--SqlScripter----[dbo].[hartestinginfo].[HARTESTINGINFO_FORMID_FK].sql
GO
ALTER TABLE [dbo].[hartestinginfo] WITH NOCHECK ADD CONSTRAINT [HARTESTINGINFO_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hartestinginfo] WITH CHECK CHECK CONSTRAINT [HARTESTINGINFO_FORMID_FK]
GO
--SqlScripter----[dbo].[harudp].[HARUDP_PPID_FK].sql
GO
ALTER TABLE [dbo].[harudp] WITH NOCHECK ADD CONSTRAINT [HARUDP_PPID_FK] FOREIGN KEY ([parentprocobjid], [processobjid])
REFERENCES [dbo].[harlinkedprocess] ([parentprocobjid], [processobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harudp] WITH CHECK CHECK CONSTRAINT [HARUDP_PPID_FK]
GO
--SqlScripter----[dbo].[harusddeployinfo].[HARUSDDEPLOYINFO_ATTID_FK].sql
GO
ALTER TABLE [dbo].[harusddeployinfo] WITH NOCHECK ADD CONSTRAINT [HARUSDDEPLOYINFO_ATTID_FK] FOREIGN KEY ([attachmentobjid])
REFERENCES [dbo].[harformattachment] ([attachmentobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harusddeployinfo] WITH CHECK CHECK CONSTRAINT [HARUSDDEPLOYINFO_ATTID_FK]
GO
--SqlScripter----[dbo].[harusddeployinfo].[harusddeployinfo_fk].sql
GO
ALTER TABLE [dbo].[harusddeployinfo] WITH NOCHECK ADD CONSTRAINT [harusddeployinfo_fk] FOREIGN KEY ([packageobjid])
REFERENCES [dbo].[harpackage] ([packageobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harusddeployinfo] WITH CHECK CHECK CONSTRAINT [harusddeployinfo_fk]
GO
--SqlScripter----[dbo].[harusddeployinfo].[HARUSDDEPLOYINFO_FRMID_FK].sql
GO
ALTER TABLE [dbo].[harusddeployinfo] WITH NOCHECK ADD CONSTRAINT [HARUSDDEPLOYINFO_FRMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harusddeployinfo] WITH CHECK CHECK CONSTRAINT [HARUSDDEPLOYINFO_FRMID_FK]
GO
--SqlScripter----[dbo].[harusdpackageinfo].[HARUSDPACKAGEINFO_FRMID_FK].sql
GO
ALTER TABLE [dbo].[harusdpackageinfo] WITH NOCHECK ADD CONSTRAINT [HARUSDPACKAGEINFO_FRMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harusdpackageinfo] WITH CHECK CHECK CONSTRAINT [HARUSDPACKAGEINFO_FRMID_FK]
GO
--SqlScripter----[dbo].[harusdplatforminfo].[HARUSDPLATFORMINFO_FRMID_FK].sql
GO
ALTER TABLE [dbo].[harusdplatforminfo] WITH NOCHECK ADD CONSTRAINT [HARUSDPLATFORMINFO_FRMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harusdplatforminfo] WITH CHECK CHECK CONSTRAINT [HARUSDPLATFORMINFO_FRMID_FK]
GO
--SqlScripter----[dbo].[harusercontact].[HARUSERCONTACT_FORMID_FK].sql
GO
ALTER TABLE [dbo].[harusercontact] WITH NOCHECK ADD CONSTRAINT [HARUSERCONTACT_FORMID_FK] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harusercontact] WITH CHECK CHECK CONSTRAINT [HARUSERCONTACT_FORMID_FK]
GO
--SqlScripter----[dbo].[haruserdata].[HARUSERDATA_FK].sql
GO
ALTER TABLE [dbo].[haruserdata] WITH NOCHECK ADD CONSTRAINT [HARUSERDATA_FK] FOREIGN KEY ([usrobjid])
REFERENCES [dbo].[harallusers] ([usrobjid])
GO
ALTER TABLE [dbo].[haruserdata] WITH CHECK CHECK CONSTRAINT [HARUSERDATA_FK]
GO
--SqlScripter----[dbo].[haruserdata].[HARUSERDATA_USRID_FK].sql
GO
ALTER TABLE [dbo].[haruserdata] WITH NOCHECK ADD CONSTRAINT [HARUSERDATA_USRID_FK] FOREIGN KEY ([usrobjid])
REFERENCES [dbo].[haruser] ([usrobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[haruserdata] WITH CHECK CHECK CONSTRAINT [HARUSERDATA_USRID_FK]
GO
--SqlScripter----[dbo].[harusersingroup].[HARUSRINGRP_USRGRPID_FK].sql
GO
ALTER TABLE [dbo].[harusersingroup] WITH NOCHECK ADD CONSTRAINT [HARUSRINGRP_USRGRPID_FK] FOREIGN KEY ([usrgrpobjid])
REFERENCES [dbo].[harusergroup] ([usrgrpobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harusersingroup] WITH CHECK CHECK CONSTRAINT [HARUSRINGRP_USRGRPID_FK]
GO
--SqlScripter----[dbo].[harusersingroup].[HARUSRINGRP_USRID_FK].sql
GO
ALTER TABLE [dbo].[harusersingroup] WITH NOCHECK ADD CONSTRAINT [HARUSRINGRP_USRID_FK] FOREIGN KEY ([usrobjid])
REFERENCES [dbo].[haruser] ([usrobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harusersingroup] WITH CHECK CHECK CONSTRAINT [HARUSRINGRP_USRID_FK]
GO
--SqlScripter----[dbo].[harversiondata].[HARVERSIONDATA_ITMID_FK].sql
GO
ALTER TABLE [dbo].[harversiondata] WITH NOCHECK ADD CONSTRAINT [HARVERSIONDATA_ITMID_FK] FOREIGN KEY ([itemobjid])
REFERENCES [dbo].[haritems] ([itemobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harversiondata] WITH CHECK CHECK CONSTRAINT [HARVERSIONDATA_ITMID_FK]
GO
--SqlScripter----[dbo].[harversiondelta].[HARVERSIONDELTA_CHIDID_FK].sql
GO
ALTER TABLE [dbo].[harversiondelta] WITH NOCHECK ADD CONSTRAINT [HARVERSIONDELTA_CHIDID_FK] FOREIGN KEY ([childversiondataid])
REFERENCES [dbo].[harversiondata] ([versiondataobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harversiondelta] WITH CHECK CHECK CONSTRAINT [HARVERSIONDELTA_CHIDID_FK]
GO
--SqlScripter----[dbo].[harversioninview].[HARVERSIONINVIEW_VERID_FK].sql
GO
ALTER TABLE [dbo].[harversioninview] WITH NOCHECK ADD CONSTRAINT [HARVERSIONINVIEW_VERID_FK] FOREIGN KEY ([versionobjid])
REFERENCES [dbo].[harversions] ([versionobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harversioninview] WITH CHECK CHECK CONSTRAINT [HARVERSIONINVIEW_VERID_FK]
GO
--SqlScripter----[dbo].[harversioninview].[HARVERSIONINVIEW_VIEWID_FK].sql
GO
ALTER TABLE [dbo].[harversioninview] WITH NOCHECK ADD CONSTRAINT [HARVERSIONINVIEW_VIEWID_FK] FOREIGN KEY ([viewobjid])
REFERENCES [dbo].[harview] ([viewobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harversioninview] WITH CHECK CHECK CONSTRAINT [HARVERSIONINVIEW_VIEWID_FK]
GO
--SqlScripter----[dbo].[harversions].[HARVERSION_NAMEID_FK].sql
GO
ALTER TABLE [dbo].[harversions] WITH NOCHECK ADD CONSTRAINT [HARVERSION_NAMEID_FK] FOREIGN KEY ([ITEMNAMEID])
REFERENCES [dbo].[HARITEMNAME] ([nameobjid])
GO
ALTER TABLE [dbo].[harversions] WITH CHECK CHECK CONSTRAINT [HARVERSION_NAMEID_FK]
GO
--SqlScripter----[dbo].[harversions].[HARVERSIONS_PATHVERID_FK].sql
GO
ALTER TABLE [dbo].[harversions] WITH NOCHECK ADD CONSTRAINT [HARVERSIONS_PATHVERID_FK] FOREIGN KEY ([PATHVERSIONID])
REFERENCES [dbo].[harversions] ([versionobjid])
GO
ALTER TABLE [dbo].[harversions] WITH CHECK CHECK CONSTRAINT [HARVERSIONS_PATHVERID_FK]
GO
--SqlScripter----[dbo].[harversions].[harversions_pkgid_fk].sql
GO
ALTER TABLE [dbo].[harversions] WITH NOCHECK ADD CONSTRAINT [harversions_pkgid_fk] FOREIGN KEY ([packageobjid])
REFERENCES [dbo].[harpackage] ([packageobjid])
GO
ALTER TABLE [dbo].[harversions] WITH CHECK CHECK CONSTRAINT [harversions_pkgid_fk]
GO
--SqlScripter----[dbo].[HARVERSIONTRACKING].[HARVERSIONTRACKING_VERID_FK].sql
GO
ALTER TABLE [dbo].[HARVERSIONTRACKING] WITH NOCHECK ADD CONSTRAINT [HARVERSIONTRACKING_VERID_FK] FOREIGN KEY ([VERSIONOBJID])
REFERENCES [dbo].[harversions] ([versionobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HARVERSIONTRACKING] WITH CHECK CHECK CONSTRAINT [HARVERSIONTRACKING_VERID_FK]
GO
--SqlScripter----[dbo].[harview].[HARVIEW_ENVID_FK].sql
GO
ALTER TABLE [dbo].[harview] WITH NOCHECK ADD CONSTRAINT [HARVIEW_ENVID_FK] FOREIGN KEY ([envobjid])
REFERENCES [dbo].[harenvironment] ([envobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[harview] WITH CHECK CHECK CONSTRAINT [HARVIEW_ENVID_FK]
GO
--SqlScripter----[dbo].[mdb_patch].[$mdb_p_r00004af900000000].sql
GO
ALTER TABLE [dbo].[mdb_patch] WITH NOCHECK ADD CONSTRAINT [$mdb_p_r00004af900000000] FOREIGN KEY ([checkpointid])
REFERENCES [dbo].[mdb_checkpoint] ([checkpointid])
GO
ALTER TABLE [dbo].[mdb_patch] WITH CHECK CHECK CONSTRAINT [$mdb_p_r00004af900000000]
GO
--SqlScripter----[dbo].[mdb_patch].[$mdb_p_r00004b0300000000].sql
GO
ALTER TABLE [dbo].[mdb_patch] WITH NOCHECK ADD CONSTRAINT [$mdb_p_r00004b0300000000] FOREIGN KEY ([mdbmajorversion], [mdbminorversion])
REFERENCES [dbo].[mdb] ([mdbmajorversion], [mdbminorversion])
GO
ALTER TABLE [dbo].[mdb_patch] WITH CHECK CHECK CONSTRAINT [$mdb_p_r00004b0300000000]
GO
--SqlScripter----[dbo].[mdb_patch].[$mdb_p_r00004b0d00000000].sql
GO
ALTER TABLE [dbo].[mdb_patch] WITH NOCHECK ADD CONSTRAINT [$mdb_p_r00004b0d00000000] FOREIGN KEY ([servicepacknumber])
REFERENCES [dbo].[mdb_service_pack] ([servicepacknumber])
GO
ALTER TABLE [dbo].[mdb_patch] WITH CHECK CHECK CONSTRAINT [$mdb_p_r00004b0d00000000]
GO
--SqlScripter----[dbo].[mdb_service_pack].[$mdb_s_r00004b1700000000].sql
GO
ALTER TABLE [dbo].[mdb_service_pack] WITH NOCHECK ADD CONSTRAINT [$mdb_s_r00004b1700000000] FOREIGN KEY ([checkpointid])
REFERENCES [dbo].[mdb_checkpoint] ([checkpointid])
GO
ALTER TABLE [dbo].[mdb_service_pack] WITH CHECK CHECK CONSTRAINT [$mdb_s_r00004b1700000000]
GO
--SqlScripter----[dbo].[mibdefinition].[$mibde_r000015e800000000].sql
GO
ALTER TABLE [dbo].[mibdefinition] WITH NOCHECK ADD CONSTRAINT [$mibde_r000015e800000000] FOREIGN KEY ([mib_id])
REFERENCES [dbo].[network_mib] ([id])
GO
ALTER TABLE [dbo].[mibdefinition] WITH CHECK CHECK CONSTRAINT [$mibde_r000015e800000000]
GO
--SqlScripter----[dbo].[mibstructure].[$mibst_r000015f200000000].sql
GO
ALTER TABLE [dbo].[mibstructure] WITH NOCHECK ADD CONSTRAINT [$mibst_r000015f200000000] FOREIGN KEY ([componentmibindexidx])
REFERENCES [dbo].[indextable] ([componentmibindexidx])
GO
ALTER TABLE [dbo].[mibstructure] WITH CHECK CHECK CONSTRAINT [$mibst_r000015f200000000]
GO
--SqlScripter----[dbo].[mibstructure].[$mibst_r000015fc00000000].sql
GO
ALTER TABLE [dbo].[mibstructure] WITH NOCHECK ADD CONSTRAINT [$mibst_r000015fc00000000] FOREIGN KEY ([mibidx])
REFERENCES [dbo].[mibdefinition] ([mibidx])
GO
ALTER TABLE [dbo].[mibstructure] WITH CHECK CHECK CONSTRAINT [$mibst_r000015fc00000000]
GO
--SqlScripter----[dbo].[mibvariabletype].[$mibva_r0000160600000000].sql
GO
ALTER TABLE [dbo].[mibvariabletype] WITH NOCHECK ADD CONSTRAINT [$mibva_r0000160600000000] FOREIGN KEY ([basetypeidx])
REFERENCES [dbo].[mibvariabletype] ([typeid])
GO
ALTER TABLE [dbo].[mibvariabletype] WITH CHECK CHECK CONSTRAINT [$mibva_r0000160600000000]
GO
--SqlScripter----[dbo].[ot1sinac].[FK__ot1sinac__formob__01EAB64E].sql
GO
ALTER TABLE [dbo].[ot1sinac] WITH NOCHECK ADD CONSTRAINT [FK__ot1sinac__formob__01EAB64E] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ot1sinac] WITH CHECK CHECK CONSTRAINT [FK__ot1sinac__formob__01EAB64E]
GO
--SqlScripter----[dbo].[ot2sinac].[FK__ot2sinac__formob__2CC005BA].sql
GO
ALTER TABLE [dbo].[ot2sinac] WITH NOCHECK ADD CONSTRAINT [FK__ot2sinac__formob__2CC005BA] FOREIGN KEY ([formobjid])
REFERENCES [dbo].[harform] ([formobjid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ot2sinac] WITH CHECK CHECK CONSTRAINT [FK__ot2sinac__formob__2CC005BA]
GO
--SqlScripter----[dbo].[pollrowdefinition].[$pollr_r0000161000000000].sql
GO
ALTER TABLE [dbo].[pollrowdefinition] WITH NOCHECK ADD CONSTRAINT [$pollr_r0000161000000000] FOREIGN KEY ([mibidx], [oididxformib])
REFERENCES [dbo].[mibstructure] ([mibidx], [oididxformib])
GO
ALTER TABLE [dbo].[pollrowdefinition] WITH CHECK CHECK CONSTRAINT [$pollr_r0000161000000000]
GO
--SqlScripter----[dbo].[por_distrib_item].[$por_d_r0000367600000000].sql
GO
ALTER TABLE [dbo].[por_distrib_item] WITH NOCHECK ADD CONSTRAINT [$por_d_r0000367600000000] FOREIGN KEY ([distrib_order_id])
REFERENCES [dbo].[por_distrib_order] ([distrib_order_id])
GO
ALTER TABLE [dbo].[por_distrib_item] WITH CHECK CHECK CONSTRAINT [$por_d_r0000367600000000]
GO
--SqlScripter----[dbo].[por_distrib_item].[$por_d_r0000368000000000].sql
GO
ALTER TABLE [dbo].[por_distrib_item] WITH NOCHECK ADD CONSTRAINT [$por_d_r0000368000000000] FOREIGN KEY ([wp_id])
REFERENCES [dbo].[por_wp] ([wp_id])
GO
ALTER TABLE [dbo].[por_distrib_item] WITH CHECK CHECK CONSTRAINT [$por_d_r0000368000000000]
GO
--SqlScripter----[dbo].[por_distrib_item].[$por_d_r0000368a00000000].sql
GO
ALTER TABLE [dbo].[por_distrib_item] WITH NOCHECK ADD CONSTRAINT [$por_d_r0000368a00000000] FOREIGN KEY ([audience_id])
REFERENCES [dbo].[por_audience] ([audience_id])
GO
ALTER TABLE [dbo].[por_distrib_item] WITH CHECK CHECK CONSTRAINT [$por_d_r0000368a00000000]
GO
--SqlScripter----[dbo].[por_distrib_order].[$por_d_r0000369400000000].sql
GO
ALTER TABLE [dbo].[por_distrib_order] WITH NOCHECK ADD CONSTRAINT [$por_d_r0000369400000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_distrib_order] WITH CHECK CHECK CONSTRAINT [$por_d_r0000369400000000]
GO
--SqlScripter----[dbo].[por_distrib_order_state].[$por_d_r0000369e00000000].sql
GO
ALTER TABLE [dbo].[por_distrib_order_state] WITH NOCHECK ADD CONSTRAINT [$por_d_r0000369e00000000] FOREIGN KEY ([distrib_order_id])
REFERENCES [dbo].[por_distrib_order] ([distrib_order_id])
GO
ALTER TABLE [dbo].[por_distrib_order_state] WITH CHECK CHECK CONSTRAINT [$por_d_r0000369e00000000]
GO
--SqlScripter----[dbo].[por_distrib_summary].[$por_d_r000036a800000000].sql
GO
ALTER TABLE [dbo].[por_distrib_summary] WITH NOCHECK ADD CONSTRAINT [$por_d_r000036a800000000] FOREIGN KEY ([wp_id])
REFERENCES [dbo].[por_wp] ([wp_id])
GO
ALTER TABLE [dbo].[por_distrib_summary] WITH CHECK CHECK CONSTRAINT [$por_d_r000036a800000000]
GO
--SqlScripter----[dbo].[por_distrib_summary].[$por_d_r000036b200000000].sql
GO
ALTER TABLE [dbo].[por_distrib_summary] WITH NOCHECK ADD CONSTRAINT [$por_d_r000036b200000000] FOREIGN KEY ([distrib_order_id])
REFERENCES [dbo].[por_distrib_order] ([distrib_order_id])
GO
ALTER TABLE [dbo].[por_distrib_summary] WITH CHECK CHECK CONSTRAINT [$por_d_r000036b200000000]
GO
--SqlScripter----[dbo].[por_mime_type_mapping].[$por_m_r0000366100000000].sql
GO
ALTER TABLE [dbo].[por_mime_type_mapping] WITH NOCHECK ADD CONSTRAINT [$por_m_r0000366100000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_mime_type_mapping] WITH CHECK CHECK CONSTRAINT [$por_m_r0000366100000000]
GO
--SqlScripter----[dbo].[por_portlet_applic].[$por_p_r000036bc00000000].sql
GO
ALTER TABLE [dbo].[por_portlet_applic] WITH NOCHECK ADD CONSTRAINT [$por_p_r000036bc00000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_portlet_applic] WITH CHECK CHECK CONSTRAINT [$por_p_r000036bc00000000]
GO
--SqlScripter----[dbo].[por_portlet_defn].[$por_p_r000036c600000000].sql
GO
ALTER TABLE [dbo].[por_portlet_defn] WITH NOCHECK ADD CONSTRAINT [$por_p_r000036c600000000] FOREIGN KEY ([portlet_applic_id])
REFERENCES [dbo].[por_portlet_applic] ([portlet_applic_id])
GO
ALTER TABLE [dbo].[por_portlet_defn] WITH CHECK CHECK CONSTRAINT [$por_p_r000036c600000000]
GO
--SqlScripter----[dbo].[por_portlet_defn].[$por_p_r000036d000000000].sql
GO
ALTER TABLE [dbo].[por_portlet_defn] WITH NOCHECK ADD CONSTRAINT [$por_p_r000036d000000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_portlet_defn] WITH CHECK CHECK CONSTRAINT [$por_p_r000036d000000000]
GO
--SqlScripter----[dbo].[por_portlet_entity].[$por_p_r000036da00000000].sql
GO
ALTER TABLE [dbo].[por_portlet_entity] WITH NOCHECK ADD CONSTRAINT [$por_p_r000036da00000000] FOREIGN KEY ([portlet_defn_id])
REFERENCES [dbo].[por_portlet_defn] ([portlet_defn_id])
GO
ALTER TABLE [dbo].[por_portlet_entity] WITH CHECK CHECK CONSTRAINT [$por_p_r000036da00000000]
GO
--SqlScripter----[dbo].[por_portlet_entity].[$por_p_r000036e400000000].sql
GO
ALTER TABLE [dbo].[por_portlet_entity] WITH NOCHECK ADD CONSTRAINT [$por_p_r000036e400000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_portlet_entity] WITH CHECK CHECK CONSTRAINT [$por_p_r000036e400000000]
GO
--SqlScripter----[dbo].[por_portlet_user_prefs].[$por_p_r000036ee00000000].sql
GO
ALTER TABLE [dbo].[por_portlet_user_prefs] WITH NOCHECK ADD CONSTRAINT [$por_p_r000036ee00000000] FOREIGN KEY ([portlet_entity_id])
REFERENCES [dbo].[por_portlet_entity] ([portlet_entity_id])
GO
ALTER TABLE [dbo].[por_portlet_user_prefs] WITH CHECK CHECK CONSTRAINT [$por_p_r000036ee00000000]
GO
--SqlScripter----[dbo].[por_wp].[$por_w_r000036f800000000].sql
GO
ALTER TABLE [dbo].[por_wp] WITH NOCHECK ADD CONSTRAINT [$por_w_r000036f800000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_wp] WITH CHECK CHECK CONSTRAINT [$por_w_r000036f800000000]
GO
--SqlScripter----[dbo].[por_wp_fav].[$por_w_r0000370200000000].sql
GO
ALTER TABLE [dbo].[por_wp_fav] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000370200000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_wp_fav] WITH CHECK CHECK CONSTRAINT [$por_w_r0000370200000000]
GO
--SqlScripter----[dbo].[por_wp_fav_dflt].[$por_w_r0000370c00000000].sql
GO
ALTER TABLE [dbo].[por_wp_fav_dflt] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000370c00000000] FOREIGN KEY ([wp_fav_id])
REFERENCES [dbo].[por_wp_fav] ([wp_fav_id])
GO
ALTER TABLE [dbo].[por_wp_fav_dflt] WITH CHECK CHECK CONSTRAINT [$por_w_r0000370c00000000]
GO
--SqlScripter----[dbo].[por_wp_layout_data].[$por_w_r0000371600000000].sql
GO
ALTER TABLE [dbo].[por_wp_layout_data] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000371600000000] FOREIGN KEY ([wp_id])
REFERENCES [dbo].[por_wp] ([wp_id])
GO
ALTER TABLE [dbo].[por_wp_layout_data] WITH CHECK CHECK CONSTRAINT [$por_w_r0000371600000000]
GO
--SqlScripter----[dbo].[por_wp_metadata].[$por_w_r0000372000000000].sql
GO
ALTER TABLE [dbo].[por_wp_metadata] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000372000000000] FOREIGN KEY ([cat_name])
REFERENCES [dbo].[por_wp_metadata_cat] ([cat_name])
GO
ALTER TABLE [dbo].[por_wp_metadata] WITH CHECK CHECK CONSTRAINT [$por_w_r0000372000000000]
GO
--SqlScripter----[dbo].[por_wp_metadata].[$por_w_r0000372a00000000].sql
GO
ALTER TABLE [dbo].[por_wp_metadata] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000372a00000000] FOREIGN KEY ([wp_id])
REFERENCES [dbo].[por_wp] ([wp_id])
GO
ALTER TABLE [dbo].[por_wp_metadata] WITH CHECK CHECK CONSTRAINT [$por_w_r0000372a00000000]
GO
--SqlScripter----[dbo].[por_wp_metadata_cat].[$por_w_r0000373400000000].sql
GO
ALTER TABLE [dbo].[por_wp_metadata_cat] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000373400000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_wp_metadata_cat] WITH CHECK CHECK CONSTRAINT [$por_w_r0000373400000000]
GO
--SqlScripter----[dbo].[por_wp_portlet].[$por_w_r0000373e00000000].sql
GO
ALTER TABLE [dbo].[por_wp_portlet] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000373e00000000] FOREIGN KEY ([portlet_entity_id])
REFERENCES [dbo].[por_portlet_entity] ([portlet_entity_id])
GO
ALTER TABLE [dbo].[por_wp_portlet] WITH CHECK CHECK CONSTRAINT [$por_w_r0000373e00000000]
GO
--SqlScripter----[dbo].[por_wp_portlet].[$por_w_r0000374800000000].sql
GO
ALTER TABLE [dbo].[por_wp_portlet] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000374800000000] FOREIGN KEY ([wp_id])
REFERENCES [dbo].[por_wp] ([wp_id])
GO
ALTER TABLE [dbo].[por_wp_portlet] WITH CHECK CHECK CONSTRAINT [$por_w_r0000374800000000]
GO
--SqlScripter----[dbo].[por_wp_to_wp_fav].[$por_w_r0000375200000000].sql
GO
ALTER TABLE [dbo].[por_wp_to_wp_fav] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000375200000000] FOREIGN KEY ([wp_fav_id])
REFERENCES [dbo].[por_wp_fav] ([wp_fav_id])
GO
ALTER TABLE [dbo].[por_wp_to_wp_fav] WITH CHECK CHECK CONSTRAINT [$por_w_r0000375200000000]
GO
--SqlScripter----[dbo].[por_wp_to_wp_fav].[$por_w_r0000375c00000000].sql
GO
ALTER TABLE [dbo].[por_wp_to_wp_fav] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000375c00000000] FOREIGN KEY ([wp_id])
REFERENCES [dbo].[por_wp] ([wp_id])
GO
ALTER TABLE [dbo].[por_wp_to_wp_fav] WITH CHECK CHECK CONSTRAINT [$por_w_r0000375c00000000]
GO
--SqlScripter----[dbo].[por_wsrp_portlet_handle].[$por_w_r0000376600000000].sql
GO
ALTER TABLE [dbo].[por_wsrp_portlet_handle] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000376600000000] FOREIGN KEY ([wsrp_reg_id])
REFERENCES [dbo].[por_wsrp_reg] ([wsrp_reg_id])
GO
ALTER TABLE [dbo].[por_wsrp_portlet_handle] WITH CHECK CHECK CONSTRAINT [$por_w_r0000376600000000]
GO
--SqlScripter----[dbo].[por_wsrp_prod].[$por_w_r0000377000000000].sql
GO
ALTER TABLE [dbo].[por_wsrp_prod] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000377000000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_wsrp_prod] WITH CHECK CHECK CONSTRAINT [$por_w_r0000377000000000]
GO
--SqlScripter----[dbo].[por_wsrp_prod].[$por_w_r0000377a00000000].sql
GO
ALTER TABLE [dbo].[por_wsrp_prod] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000377a00000000] FOREIGN KEY ([wsrp_reg_data_id])
REFERENCES [dbo].[por_wsrp_reg_data] ([wsrp_reg_data_id])
GO
ALTER TABLE [dbo].[por_wsrp_prod] WITH CHECK CHECK CONSTRAINT [$por_w_r0000377a00000000]
GO
--SqlScripter----[dbo].[por_wsrp_prod].[$por_w_r0000378400000000].sql
GO
ALTER TABLE [dbo].[por_wsrp_prod] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000378400000000] FOREIGN KEY ([wsrp_reg_context_id])
REFERENCES [dbo].[por_wsrp_reg_context] ([wsrp_reg_context_id])
GO
ALTER TABLE [dbo].[por_wsrp_prod] WITH CHECK CHECK CONSTRAINT [$por_w_r0000378400000000]
GO
--SqlScripter----[dbo].[por_wsrp_reg].[$por_w_r0000378e00000000].sql
GO
ALTER TABLE [dbo].[por_wsrp_reg] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000378e00000000] FOREIGN KEY ([wsrp_reg_data_id])
REFERENCES [dbo].[por_wsrp_reg_data] ([wsrp_reg_data_id])
GO
ALTER TABLE [dbo].[por_wsrp_reg] WITH CHECK CHECK CONSTRAINT [$por_w_r0000378e00000000]
GO
--SqlScripter----[dbo].[por_wsrp_reg].[$por_w_r0000379800000000].sql
GO
ALTER TABLE [dbo].[por_wsrp_reg] WITH NOCHECK ADD CONSTRAINT [$por_w_r0000379800000000] FOREIGN KEY ([reg_context])
REFERENCES [dbo].[por_wsrp_reg_context] ([wsrp_reg_context_id])
GO
ALTER TABLE [dbo].[por_wsrp_reg] WITH CHECK CHECK CONSTRAINT [$por_w_r0000379800000000]
GO
--SqlScripter----[dbo].[por_wsrp_reg].[$por_w_r000037a200000000].sql
GO
ALTER TABLE [dbo].[por_wsrp_reg] WITH NOCHECK ADD CONSTRAINT [$por_w_r000037a200000000] FOREIGN KEY ([portal_instance_id])
REFERENCES [dbo].[por_portal_instance] ([portal_instance_id])
GO
ALTER TABLE [dbo].[por_wsrp_reg] WITH CHECK CHECK CONSTRAINT [$por_w_r000037a200000000]
GO
--SqlScripter----[dbo].[process_schedule].[$proce_r00001acb00000000].sql
GO
ALTER TABLE [dbo].[process_schedule] WITH NOCHECK ADD CONSTRAINT [$proce_r00001acb00000000] FOREIGN KEY ([process_type_id])
REFERENCES [dbo].[process_type] ([process_type_id])
GO
ALTER TABLE [dbo].[process_schedule] WITH CHECK CHECK CONSTRAINT [$proce_r00001acb00000000]
GO
--SqlScripter----[dbo].[profile_expression_step].[$profi_r00001c3d00000000].sql
GO
ALTER TABLE [dbo].[profile_expression_step] WITH NOCHECK ADD CONSTRAINT [$profi_r00001c3d00000000] FOREIGN KEY ([inventory_profile_id])
REFERENCES [dbo].[inventory_profile] ([inventory_profile_id])
GO
ALTER TABLE [dbo].[profile_expression_step] WITH CHECK CHECK CONSTRAINT [$profi_r00001c3d00000000]
GO
--SqlScripter----[dbo].[profile_expression_step].[$profi_r00001c4700000000].sql
GO
ALTER TABLE [dbo].[profile_expression_step] WITH NOCHECK ADD CONSTRAINT [$profi_r00001c4700000000] FOREIGN KEY ([group_expression_step_id])
REFERENCES [dbo].[profile_expression_step] ([profile_expression_step_id])
GO
ALTER TABLE [dbo].[profile_expression_step] WITH CHECK CHECK CONSTRAINT [$profi_r00001c4700000000]
GO
--SqlScripter----[dbo].[profile_expression_step].[$profi_r00001c5100000000].sql
GO
ALTER TABLE [dbo].[profile_expression_step] WITH NOCHECK ADD CONSTRAINT [$profi_r00001c5100000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[profile_expression_step] WITH CHECK CHECK CONSTRAINT [$profi_r00001c5100000000]
GO
--SqlScripter----[dbo].[racaction].[$racac_r00003dd600000000].sql
GO
ALTER TABLE [dbo].[racaction] WITH NOCHECK ADD CONSTRAINT [$racac_r00003dd600000000] FOREIGN KEY ([actionid])
REFERENCES [dbo].[action] ([actionid])
GO
ALTER TABLE [dbo].[racaction] WITH CHECK CHECK CONSTRAINT [$racac_r00003dd600000000]
GO
--SqlScripter----[dbo].[recoverrequest].[$recov_r00003dc400000000].sql
GO
ALTER TABLE [dbo].[recoverrequest] WITH NOCHECK ADD CONSTRAINT [$recov_r00003dc400000000] FOREIGN KEY ([requestid])
REFERENCES [dbo].[request_pki] ([requestid])
GO
ALTER TABLE [dbo].[recoverrequest] WITH CHECK CHECK CONSTRAINT [$recov_r00003dc400000000]
GO
--SqlScripter----[dbo].[ref_ref_source_matrix].[$ref_r_r00001bbd00000000].sql
GO
ALTER TABLE [dbo].[ref_ref_source_matrix] WITH NOCHECK ADD CONSTRAINT [$ref_r_r00001bbd00000000] FOREIGN KEY ([reference_source_id_2])
REFERENCES [dbo].[reference_source] ([reference_source_id])
GO
ALTER TABLE [dbo].[ref_ref_source_matrix] WITH CHECK CHECK CONSTRAINT [$ref_r_r00001bbd00000000]
GO
--SqlScripter----[dbo].[ref_ref_source_matrix].[$ref_r_r00001bc700000000].sql
GO
ALTER TABLE [dbo].[ref_ref_source_matrix] WITH NOCHECK ADD CONSTRAINT [$ref_r_r00001bc700000000] FOREIGN KEY ([reference_source_id_1])
REFERENCES [dbo].[reference_source] ([reference_source_id])
GO
ALTER TABLE [dbo].[ref_ref_source_matrix] WITH CHECK CHECK CONSTRAINT [$ref_r_r00001bc700000000]
GO
--SqlScripter----[dbo].[reference_source].[$refer_r00001b9f00000000].sql
GO
ALTER TABLE [dbo].[reference_source] WITH NOCHECK ADD CONSTRAINT [$refer_r00001b9f00000000] FOREIGN KEY ([reference_group_id])
REFERENCES [dbo].[reference_group] ([reference_group_id])
GO
ALTER TABLE [dbo].[reference_source] WITH CHECK CHECK CONSTRAINT [$refer_r00001b9f00000000]
GO
--SqlScripter----[dbo].[reference_source_vuln_matrix].[$refer_r00001ba900000000].sql
GO
ALTER TABLE [dbo].[reference_source_vuln_matrix] WITH NOCHECK ADD CONSTRAINT [$refer_r00001ba900000000] FOREIGN KEY ([vuln_id])
REFERENCES [dbo].[vulnerability] ([vuln_id])
GO
ALTER TABLE [dbo].[reference_source_vuln_matrix] WITH CHECK CHECK CONSTRAINT [$refer_r00001ba900000000]
GO
--SqlScripter----[dbo].[reference_source_vuln_matrix].[$refer_r00001bb300000000].sql
GO
ALTER TABLE [dbo].[reference_source_vuln_matrix] WITH NOCHECK ADD CONSTRAINT [$refer_r00001bb300000000] FOREIGN KEY ([reference_source_id])
REFERENCES [dbo].[reference_source] ([reference_source_id])
GO
ALTER TABLE [dbo].[reference_source_vuln_matrix] WITH CHECK CHECK CONSTRAINT [$refer_r00001bb300000000]
GO
--SqlScripter----[dbo].[release].[$relea_r00001b3500000000].sql
GO
ALTER TABLE [dbo].[release] WITH NOCHECK ADD CONSTRAINT [$relea_r00001b3500000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[release] WITH CHECK CHECK CONSTRAINT [$relea_r00001b3500000000]
GO
--SqlScripter----[dbo].[remed_prof_detect_prof_matrix].[$remed_r00001c0200000000].sql
GO
ALTER TABLE [dbo].[remed_prof_detect_prof_matrix] WITH NOCHECK ADD CONSTRAINT [$remed_r00001c0200000000] FOREIGN KEY ([remed_profile_id])
REFERENCES [dbo].[remediation_profile] ([remed_profile_id])
GO
ALTER TABLE [dbo].[remed_prof_detect_prof_matrix] WITH CHECK CHECK CONSTRAINT [$remed_r00001c0200000000]
GO
--SqlScripter----[dbo].[remed_prof_detect_prof_matrix].[$remed_r00001c0c00000000].sql
GO
ALTER TABLE [dbo].[remed_prof_detect_prof_matrix] WITH NOCHECK ADD CONSTRAINT [$remed_r00001c0c00000000] FOREIGN KEY ([detect_profile_id])
REFERENCES [dbo].[detection_profile] ([inventory_profile_id])
GO
ALTER TABLE [dbo].[remed_prof_detect_prof_matrix] WITH CHECK CHECK CONSTRAINT [$remed_r00001c0c00000000]
GO
--SqlScripter----[dbo].[remediation_profile].[$remed_r00001b2c00000000].sql
GO
ALTER TABLE [dbo].[remediation_profile] WITH NOCHECK ADD CONSTRAINT [$remed_r00001b2c00000000] FOREIGN KEY ([remed_profile_id])
REFERENCES [dbo].[inventory_profile] ([inventory_profile_id])
GO
ALTER TABLE [dbo].[remediation_profile] WITH CHECK CHECK CONSTRAINT [$remed_r00001b2c00000000]
GO
--SqlScripter----[dbo].[renewalrequest].[$renew_r00003dcd00000000].sql
GO
ALTER TABLE [dbo].[renewalrequest] WITH NOCHECK ADD CONSTRAINT [$renew_r00003dcd00000000] FOREIGN KEY ([requestid])
REFERENCES [dbo].[request_pki] ([requestid])
GO
ALTER TABLE [dbo].[renewalrequest] WITH CHECK CHECK CONSTRAINT [$renew_r00003dcd00000000]
GO
--SqlScripter----[dbo].[request_pki].[$reque_r00003dba00000000].sql
GO
ALTER TABLE [dbo].[request_pki] WITH NOCHECK ADD CONSTRAINT [$reque_r00003dba00000000] FOREIGN KEY ([requesttype])
REFERENCES [dbo].[requesttype] ([requesttype])
GO
ALTER TABLE [dbo].[request_pki] WITH CHECK CHECK CONSTRAINT [$reque_r00003dba00000000]
GO
--SqlScripter----[dbo].[resourcemonitoring].[$resou_r0000161a00000000].sql
GO
ALTER TABLE [dbo].[resourcemonitoring] WITH NOCHECK ADD CONSTRAINT [$resou_r0000161a00000000] FOREIGN KEY ([mibidx])
REFERENCES [dbo].[mibdefinition] ([mibidx])
GO
ALTER TABLE [dbo].[resourcemonitoring] WITH CHECK CHECK CONSTRAINT [$resou_r0000161a00000000]
GO
--SqlScripter----[dbo].[revocationrequest].[$revoc_r00003df100000000].sql
GO
ALTER TABLE [dbo].[revocationrequest] WITH NOCHECK ADD CONSTRAINT [$revoc_r00003df100000000] FOREIGN KEY ([requestid])
REFERENCES [dbo].[request_pki] ([requestid])
GO
ALTER TABLE [dbo].[revocationrequest] WITH CHECK CHECK CONSTRAINT [$revoc_r00003df100000000]
GO
--SqlScripter----[dbo].[sd_server_download_file].[$sd_se_r00001cda00000000].sql
GO
ALTER TABLE [dbo].[sd_server_download_file] WITH NOCHECK ADD CONSTRAINT [$sd_se_r00001cda00000000] FOREIGN KEY ([software_delivery_server_id])
REFERENCES [dbo].[software_delivery_server] ([software_delivery_server_id])
GO
ALTER TABLE [dbo].[sd_server_download_file] WITH CHECK CHECK CONSTRAINT [$sd_se_r00001cda00000000]
GO
--SqlScripter----[dbo].[service].[$servi_r00001ce300000000].sql
GO
ALTER TABLE [dbo].[service] WITH NOCHECK ADD CONSTRAINT [$servi_r00001ce300000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[service] WITH CHECK CHECK CONSTRAINT [$servi_r00001ce300000000]
GO
--SqlScripter----[dbo].[software_delivery_job].[$softw_r00001cec00000000].sql
GO
ALTER TABLE [dbo].[software_delivery_job] WITH NOCHECK ADD CONSTRAINT [$softw_r00001cec00000000] FOREIGN KEY ([depends_on_software_dlvy_job_id])
REFERENCES [dbo].[software_delivery_job] ([software_delivery_job_id])
GO
ALTER TABLE [dbo].[software_delivery_job] WITH CHECK CHECK CONSTRAINT [$softw_r00001cec00000000]
GO
--SqlScripter----[dbo].[software_delivery_job].[$softw_r00001cf600000000].sql
GO
ALTER TABLE [dbo].[software_delivery_job] WITH NOCHECK ADD CONSTRAINT [$softw_r00001cf600000000] FOREIGN KEY ([test_dis_hw_uuid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
GO
ALTER TABLE [dbo].[software_delivery_job] WITH CHECK CHECK CONSTRAINT [$softw_r00001cf600000000]
GO
--SqlScripter----[dbo].[software_delivery_job_file].[$softw_r00001cff00000000].sql
GO
ALTER TABLE [dbo].[software_delivery_job_file] WITH NOCHECK ADD CONSTRAINT [$softw_r00001cff00000000] FOREIGN KEY ([software_delivery_job_id])
REFERENCES [dbo].[software_delivery_job] ([software_delivery_job_id])
GO
ALTER TABLE [dbo].[software_delivery_job_file] WITH CHECK CHECK CONSTRAINT [$softw_r00001cff00000000]
GO
--SqlScripter----[dbo].[software_vulnerability].[$softw_r00001c1600000000].sql
GO
ALTER TABLE [dbo].[software_vulnerability] WITH NOCHECK ADD CONSTRAINT [$softw_r00001c1600000000] FOREIGN KEY ([vuln_id])
REFERENCES [dbo].[vulnerability] ([vuln_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[software_vulnerability] WITH CHECK CHECK CONSTRAINT [$softw_r00001c1600000000]
GO
--SqlScripter----[dbo].[software_vulnerability].[$softw_r00001c1f00000000].sql
GO
ALTER TABLE [dbo].[software_vulnerability] WITH NOCHECK ADD CONSTRAINT [$softw_r00001c1f00000000] FOREIGN KEY ([root_cause_id])
REFERENCES [dbo].[root_cause] ([root_cause_id])
GO
ALTER TABLE [dbo].[software_vulnerability] WITH CHECK CHECK CONSTRAINT [$softw_r00001c1f00000000]
GO
--SqlScripter----[dbo].[system_configuration].[$syste_r00001ad500000000].sql
GO
ALTER TABLE [dbo].[system_configuration] WITH NOCHECK ADD CONSTRAINT [$syste_r00001ad500000000] FOREIGN KEY ([application_type_id])
REFERENCES [dbo].[application_type] ([application_type_id])
GO
ALTER TABLE [dbo].[system_configuration] WITH CHECK CHECK CONSTRAINT [$syste_r00001ad500000000]
GO
--SqlScripter----[dbo].[tablesdescription].[$table_r0000162400000000].sql
GO
ALTER TABLE [dbo].[tablesdescription] WITH NOCHECK ADD CONSTRAINT [$table_r0000162400000000] FOREIGN KEY ([mibidx], [oididxformib])
REFERENCES [dbo].[mibstructure] ([mibidx], [oididxformib])
GO
ALTER TABLE [dbo].[tablesdescription] WITH CHECK CHECK CONSTRAINT [$table_r0000162400000000]
GO
--SqlScripter----[dbo].[tablesdescription].[$table_r0000162e00000000].sql
GO
ALTER TABLE [dbo].[tablesdescription] WITH NOCHECK ADD CONSTRAINT [$table_r0000162e00000000] FOREIGN KEY ([tableidx], [orderofcolumn])
REFERENCES [dbo].[columndefinition] ([tableidx], [orderofcolumn])
GO
ALTER TABLE [dbo].[tablesdescription] WITH CHECK CHECK CONSTRAINT [$table_r0000162e00000000]
GO
--SqlScripter----[dbo].[thresholddesc].[$thres_r0000163800000000].sql
GO
ALTER TABLE [dbo].[thresholddesc] WITH NOCHECK ADD CONSTRAINT [$thres_r0000163800000000] FOREIGN KEY ([mibidx])
REFERENCES [dbo].[mibdefinition] ([mibidx])
GO
ALTER TABLE [dbo].[thresholddesc] WITH CHECK CHECK CONSTRAINT [$thres_r0000163800000000]
GO
--SqlScripter----[dbo].[tng_class_ext].[FK__tng_class__class__4A0FA628].sql
GO
ALTER TABLE [dbo].[tng_class_ext] WITH NOCHECK ADD CONSTRAINT [FK__tng_class__class__4A0FA628] FOREIGN KEY ([class_id])
REFERENCES [dbo].[tng_class] ([class_id])
GO
ALTER TABLE [dbo].[tng_class_ext] WITH CHECK CHECK CONSTRAINT [FK__tng_class__class__4A0FA628]
GO
--SqlScripter----[dbo].[tng_property_definition].[FK__tng_prope__class__4B03CA61].sql
GO
ALTER TABLE [dbo].[tng_property_definition] WITH NOCHECK ADD CONSTRAINT [FK__tng_prope__class__4B03CA61] FOREIGN KEY ([class_id])
REFERENCES [dbo].[tng_class] ([class_id])
GO
ALTER TABLE [dbo].[tng_property_definition] WITH CHECK CHECK CONSTRAINT [FK__tng_prope__class__4B03CA61]
GO
--SqlScripter----[dbo].[tplmemo].[tplmemo_fk01].sql
GO
ALTER TABLE [dbo].[tplmemo] WITH NOCHECK ADD CONSTRAINT [tplmemo_fk01] FOREIGN KEY ([tpid], [domainid])
REFERENCES [dbo].[nctpldef] ([tpid], [domainid])
GO
ALTER TABLE [dbo].[tplmemo] WITH CHECK CHECK CONSTRAINT [tplmemo_fk01]
GO
--SqlScripter----[dbo].[ujo_ha_process].[FK__ujo_ha_pr__ha_de__4CEC12D3].sql
GO
ALTER TABLE [dbo].[ujo_ha_process] WITH NOCHECK ADD CONSTRAINT [FK__ujo_ha_pr__ha_de__4CEC12D3] FOREIGN KEY ([ha_designator_id])
REFERENCES [dbo].[ujo_ha_designator] ([id])
GO
ALTER TABLE [dbo].[ujo_ha_process] WITH CHECK CHECK CONSTRAINT [FK__ujo_ha_pr__ha_de__4CEC12D3]
GO
--SqlScripter----[dbo].[ujo_ha_process].[FK__ujo_ha_pr__ha_st__4DE0370C].sql
GO
ALTER TABLE [dbo].[ujo_ha_process] WITH NOCHECK ADD CONSTRAINT [FK__ujo_ha_pr__ha_st__4DE0370C] FOREIGN KEY ([ha_status_id])
REFERENCES [dbo].[ujo_ha_status] ([id])
GO
ALTER TABLE [dbo].[ujo_ha_process] WITH CHECK CHECK CONSTRAINT [FK__ujo_ha_pr__ha_st__4DE0370C]
GO
--SqlScripter----[dbo].[ujo_sys_ha_state].[FK__ujo_sys_h__ha_st__4ED45B45].sql
GO
ALTER TABLE [dbo].[ujo_sys_ha_state] WITH NOCHECK ADD CONSTRAINT [FK__ujo_sys_h__ha_st__4ED45B45] FOREIGN KEY ([ha_state_id])
REFERENCES [dbo].[ujo_ha_state] ([id])
GO
ALTER TABLE [dbo].[ujo_sys_ha_state] WITH CHECK CHECK CONSTRAINT [FK__ujo_sys_h__ha_st__4ED45B45]
GO
--SqlScripter----[dbo].[und_error].[und_error_probe_id_fk].sql
GO
ALTER TABLE [dbo].[und_error] WITH NOCHECK ADD CONSTRAINT [und_error_probe_id_fk] FOREIGN KEY ([probe_id])
REFERENCES [dbo].[und_probe] ([probe_id])
GO
ALTER TABLE [dbo].[und_error] WITH CHECK CHECK CONSTRAINT [und_error_probe_id_fk]
GO
--SqlScripter----[dbo].[und_error].[und_error_task_id_fk].sql
GO
ALTER TABLE [dbo].[und_error] WITH NOCHECK ADD CONSTRAINT [und_error_task_id_fk] FOREIGN KEY ([task_id])
REFERENCES [dbo].[und_task] ([task_id])
GO
ALTER TABLE [dbo].[und_error] WITH CHECK CHECK CONSTRAINT [und_error_task_id_fk]
GO
--SqlScripter----[dbo].[und_job].[und_job_user_id_fk].sql
GO
ALTER TABLE [dbo].[und_job] WITH NOCHECK ADD CONSTRAINT [und_job_user_id_fk] FOREIGN KEY ([user_id])
REFERENCES [dbo].[und_user] ([user_id])
GO
ALTER TABLE [dbo].[und_job] WITH CHECK CHECK CONSTRAINT [und_job_user_id_fk]
GO
--SqlScripter----[dbo].[und_task].[und_task_job_id_fk].sql
GO
ALTER TABLE [dbo].[und_task] WITH NOCHECK ADD CONSTRAINT [und_task_job_id_fk] FOREIGN KEY ([job_id])
REFERENCES [dbo].[und_job] ([job_id])
GO
ALTER TABLE [dbo].[und_task] WITH CHECK CHECK CONSTRAINT [und_task_job_id_fk]
GO
--SqlScripter----[dbo].[und_task].[und_task_probe_id_fk].sql
GO
ALTER TABLE [dbo].[und_task] WITH NOCHECK ADD CONSTRAINT [und_task_probe_id_fk] FOREIGN KEY ([probe_id])
REFERENCES [dbo].[und_probe] ([probe_id])
GO
ALTER TABLE [dbo].[und_task] WITH CHECK CHECK CONSTRAINT [und_task_probe_id_fk]
GO
--SqlScripter----[dbo].[und_task].[und_task_user_id_fk].sql
GO
ALTER TABLE [dbo].[und_task] WITH NOCHECK ADD CONSTRAINT [und_task_user_id_fk] FOREIGN KEY ([user_id])
REFERENCES [dbo].[und_user] ([user_id])
GO
ALTER TABLE [dbo].[und_task] WITH CHECK CHECK CONSTRAINT [und_task_user_id_fk]
GO
--SqlScripter----[dbo].[upm_baseline_group].[$upm_b_r0000065100000000].sql
GO
ALTER TABLE [dbo].[upm_baseline_group] WITH NOCHECK ADD CONSTRAINT [$upm_b_r0000065100000000] FOREIGN KEY ([baseline_uuid])
REFERENCES [dbo].[upm_baseline_sw] ([baseline_uuid])
GO
ALTER TABLE [dbo].[upm_baseline_group] WITH CHECK CHECK CONSTRAINT [$upm_b_r0000065100000000]
GO
--SqlScripter----[dbo].[upm_baseline_patch].[$upm_b_r000005fd00000000].sql
GO
ALTER TABLE [dbo].[upm_baseline_patch] WITH NOCHECK ADD CONSTRAINT [$upm_b_r000005fd00000000] FOREIGN KEY ([install_pkg_uuid])
REFERENCES [dbo].[ca_install_package] ([install_pkg_uuid])
GO
ALTER TABLE [dbo].[upm_baseline_patch] WITH CHECK CHECK CONSTRAINT [$upm_b_r000005fd00000000]
GO
--SqlScripter----[dbo].[upm_baseline_patch].[$upm_b_r0000060700000000].sql
GO
ALTER TABLE [dbo].[upm_baseline_patch] WITH NOCHECK ADD CONSTRAINT [$upm_b_r0000060700000000] FOREIGN KEY ([baseline_uuid])
REFERENCES [dbo].[upm_baseline_sw] ([baseline_uuid])
GO
ALTER TABLE [dbo].[upm_baseline_patch] WITH CHECK CHECK CONSTRAINT [$upm_b_r0000060700000000]
GO
--SqlScripter----[dbo].[upm_baseline_sw].[$upm_b_r0000061100000000].sql
GO
ALTER TABLE [dbo].[upm_baseline_sw] WITH NOCHECK ADD CONSTRAINT [$upm_b_r0000061100000000] FOREIGN KEY ([sw_def_uuid])
REFERENCES [dbo].[ca_software_def] ([sw_def_uuid])
GO
ALTER TABLE [dbo].[upm_baseline_sw] WITH CHECK CHECK CONSTRAINT [$upm_b_r0000061100000000]
GO
--SqlScripter----[dbo].[upm_credential].[$upm_c_r0000061b00000000].sql
GO
ALTER TABLE [dbo].[upm_credential] WITH NOCHECK ADD CONSTRAINT [$upm_c_r0000061b00000000] FOREIGN KEY ([company_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[upm_credential] WITH CHECK CHECK CONSTRAINT [$upm_c_r0000061b00000000]
GO
--SqlScripter----[dbo].[upm_deployment].[$upm_d_r0000062500000000].sql
GO
ALTER TABLE [dbo].[upm_deployment] WITH NOCHECK ADD CONSTRAINT [$upm_d_r0000062500000000] FOREIGN KEY ([install_pkg_uuid])
REFERENCES [dbo].[ca_install_package] ([install_pkg_uuid])
GO
ALTER TABLE [dbo].[upm_deployment] WITH CHECK CHECK CONSTRAINT [$upm_d_r0000062500000000]
GO
--SqlScripter----[dbo].[upm_download].[$upm_d_r0000062f00000000].sql
GO
ALTER TABLE [dbo].[upm_download] WITH NOCHECK ADD CONSTRAINT [$upm_d_r0000062f00000000] FOREIGN KEY ([download_file_uuid])
REFERENCES [dbo].[ca_download_file] ([download_file_uuid])
GO
ALTER TABLE [dbo].[upm_download] WITH CHECK CHECK CONSTRAINT [$upm_d_r0000062f00000000]
GO
--SqlScripter----[dbo].[upm_portlet_content].[$upm_p_r0000063900000000].sql
GO
ALTER TABLE [dbo].[upm_portlet_content] WITH NOCHECK ADD CONSTRAINT [$upm_p_r0000063900000000] FOREIGN KEY ([user_uuid], [type])
REFERENCES [dbo].[upm_portlet] ([user_uuid], [type])
GO
ALTER TABLE [dbo].[upm_portlet_content] WITH CHECK CHECK CONSTRAINT [$upm_p_r0000063900000000]
GO
--SqlScripter----[dbo].[urc_computer].[$urc_c_r000009d900000000].sql
GO
ALTER TABLE [dbo].[urc_computer] WITH NOCHECK ADD CONSTRAINT [$urc_c_r000009d900000000] FOREIGN KEY ([uid])
REFERENCES [dbo].[ca_discovered_hardware] ([dis_hw_uuid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[urc_computer] WITH CHECK CHECK CONSTRAINT [$urc_c_r000009d900000000]
GO
--SqlScripter----[dbo].[user_acct_asset_group_matrix].[$user__r00001c5b00000000].sql
GO
ALTER TABLE [dbo].[user_acct_asset_group_matrix] WITH NOCHECK ADD CONSTRAINT [$user__r00001c5b00000000] FOREIGN KEY ([asset_group_id])
REFERENCES [dbo].[vunerability_asset_group] ([asset_group_id])
GO
ALTER TABLE [dbo].[user_acct_asset_group_matrix] WITH CHECK CHECK CONSTRAINT [$user__r00001c5b00000000]
GO
--SqlScripter----[dbo].[usm_account].[$usm_a_r0000203100000000].sql
GO
ALTER TABLE [dbo].[usm_account] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000203100000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_account] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000203100000000]
GO
--SqlScripter----[dbo].[usm_account].[$usm_a_r0000203b00000000].sql
GO
ALTER TABLE [dbo].[usm_account] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000203b00000000] FOREIGN KEY ([tenant_id])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_account] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000203b00000000]
GO
--SqlScripter----[dbo].[usm_account_app_user].[$usm_a_r0000204500000000].sql
GO
ALTER TABLE [dbo].[usm_account_app_user] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000204500000000] FOREIGN KEY ([account_id])
REFERENCES [dbo].[usm_account] ([account_id])
GO
ALTER TABLE [dbo].[usm_account_app_user] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000204500000000]
GO
--SqlScripter----[dbo].[usm_account_app_user].[$usm_a_r0000204f00000000].sql
GO
ALTER TABLE [dbo].[usm_account_app_user] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000204f00000000] FOREIGN KEY ([app_user_id])
REFERENCES [dbo].[usm_appuser] ([appuser_id])
GO
ALTER TABLE [dbo].[usm_account_app_user] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000204f00000000]
GO
--SqlScripter----[dbo].[usm_account_app_user].[$usm_a_r00002e7d00000000].sql
GO
ALTER TABLE [dbo].[usm_account_app_user] WITH NOCHECK ADD CONSTRAINT [$usm_a_r00002e7d00000000] FOREIGN KEY ([account_id])
REFERENCES [dbo].[usm_account] ([account_id])
GO
ALTER TABLE [dbo].[usm_account_app_user] WITH CHECK CHECK CONSTRAINT [$usm_a_r00002e7d00000000]
GO
--SqlScripter----[dbo].[usm_account_app_user].[$usm_a_r00002e8700000000].sql
GO
ALTER TABLE [dbo].[usm_account_app_user] WITH NOCHECK ADD CONSTRAINT [$usm_a_r00002e8700000000] FOREIGN KEY ([app_user_id])
REFERENCES [dbo].[usm_appuser] ([appuser_id])
GO
ALTER TABLE [dbo].[usm_account_app_user] WITH CHECK CHECK CONSTRAINT [$usm_a_r00002e8700000000]
GO
--SqlScripter----[dbo].[usm_adjustment].[$usm_a_r0000205900000000].sql
GO
ALTER TABLE [dbo].[usm_adjustment] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000205900000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_adjustment] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000205900000000]
GO
--SqlScripter----[dbo].[usm_analysis].[$usm_a_r0000206300000000].sql
GO
ALTER TABLE [dbo].[usm_analysis] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000206300000000] FOREIGN KEY ([report_group_id])
REFERENCES [dbo].[usm_report_group] ([report_group_id])
GO
ALTER TABLE [dbo].[usm_analysis] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000206300000000]
GO
--SqlScripter----[dbo].[usm_analysis].[$usm_a_r0000206d00000000].sql
GO
ALTER TABLE [dbo].[usm_analysis] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000206d00000000] FOREIGN KEY ([analyze_job_id])
REFERENCES [dbo].[usm_analyze_job] ([analyze_job_id])
GO
ALTER TABLE [dbo].[usm_analysis] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000206d00000000]
GO
--SqlScripter----[dbo].[usm_analysis_layout_set].[$usm_a_r00002d1500000000].sql
GO
ALTER TABLE [dbo].[usm_analysis_layout_set] WITH NOCHECK ADD CONSTRAINT [$usm_a_r00002d1500000000] FOREIGN KEY ([report_layout_id])
REFERENCES [dbo].[usm_report_layout] ([report_layout_id])
GO
ALTER TABLE [dbo].[usm_analysis_layout_set] WITH CHECK CHECK CONSTRAINT [$usm_a_r00002d1500000000]
GO
--SqlScripter----[dbo].[usm_analyze_export_option].[$usm_a_r0000207700000000].sql
GO
ALTER TABLE [dbo].[usm_analyze_export_option] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000207700000000] FOREIGN KEY ([analyze_job_id])
REFERENCES [dbo].[usm_analyze_job] ([analyze_job_id])
GO
ALTER TABLE [dbo].[usm_analyze_export_option] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000207700000000]
GO
--SqlScripter----[dbo].[usm_analyze_job].[$usm_a_r0000208100000000].sql
GO
ALTER TABLE [dbo].[usm_analyze_job] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000208100000000] FOREIGN KEY ([scope_id])
REFERENCES [dbo].[usm_scope] ([scope_id])
GO
ALTER TABLE [dbo].[usm_analyze_job] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000208100000000]
GO
--SqlScripter----[dbo].[usm_analyze_job_option].[$usm_a_r0000208b00000000].sql
GO
ALTER TABLE [dbo].[usm_analyze_job_option] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000208b00000000] FOREIGN KEY ([analyze_job_id])
REFERENCES [dbo].[usm_analyze_job] ([analyze_job_id])
GO
ALTER TABLE [dbo].[usm_analyze_job_option] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000208b00000000]
GO
--SqlScripter----[dbo].[usm_analyze_schedule].[$usm_a_r0000209500000000].sql
GO
ALTER TABLE [dbo].[usm_analyze_schedule] WITH NOCHECK ADD CONSTRAINT [$usm_a_r0000209500000000] FOREIGN KEY ([analyze_job_id])
REFERENCES [dbo].[usm_analyze_job] ([analyze_job_id])
GO
ALTER TABLE [dbo].[usm_analyze_schedule] WITH CHECK CHECK CONSTRAINT [$usm_a_r0000209500000000]
GO
--SqlScripter----[dbo].[usm_analyzed_event_data].[$usm_a_r00002d1f00000000].sql
GO
ALTER TABLE [dbo].[usm_analyzed_event_data] WITH NOCHECK ADD CONSTRAINT [$usm_a_r00002d1f00000000] FOREIGN KEY ([event_instance_id])
REFERENCES [dbo].[usm_event_instance] ([event_instance_id])
GO
ALTER TABLE [dbo].[usm_analyzed_event_data] WITH CHECK CHECK CONSTRAINT [$usm_a_r00002d1f00000000]
GO
--SqlScripter----[dbo].[usm_attr_reference_plugin_attr].[$usm_a_r000020a900000000].sql
GO
ALTER TABLE [dbo].[usm_attr_reference_plugin_attr] WITH NOCHECK ADD CONSTRAINT [$usm_a_r000020a900000000] FOREIGN KEY ([attr_reference_plugin_id])
REFERENCES [dbo].[usm_attr_reference_plugin] ([attr_reference_plugin_id])
GO
ALTER TABLE [dbo].[usm_attr_reference_plugin_attr] WITH CHECK CHECK CONSTRAINT [$usm_a_r000020a900000000]
GO
--SqlScripter----[dbo].[usm_billing_account].[$usm_b_r000020b300000000].sql
GO
ALTER TABLE [dbo].[usm_billing_account] WITH NOCHECK ADD CONSTRAINT [$usm_b_r000020b300000000] FOREIGN KEY ([currency_type_code])
REFERENCES [dbo].[ca_currency_type] ([currency_type_code])
GO
ALTER TABLE [dbo].[usm_billing_account] WITH CHECK CHECK CONSTRAINT [$usm_b_r000020b300000000]
GO
--SqlScripter----[dbo].[usm_billing_account].[$usm_b_r000020bd00000000].sql
GO
ALTER TABLE [dbo].[usm_billing_account] WITH NOCHECK ADD CONSTRAINT [$usm_b_r000020bd00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_billing_account] WITH CHECK CHECK CONSTRAINT [$usm_b_r000020bd00000000]
GO
--SqlScripter----[dbo].[usm_billing_account].[$usm_b_r000020c700000000].sql
GO
ALTER TABLE [dbo].[usm_billing_account] WITH NOCHECK ADD CONSTRAINT [$usm_b_r000020c700000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_account] ([account_id])
GO
ALTER TABLE [dbo].[usm_billing_account] WITH CHECK CHECK CONSTRAINT [$usm_b_r000020c700000000]
GO
--SqlScripter----[dbo].[usm_billing_group].[$usm_b_r000020d100000000].sql
GO
ALTER TABLE [dbo].[usm_billing_group] WITH NOCHECK ADD CONSTRAINT [$usm_b_r000020d100000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_billing_group] WITH CHECK CHECK CONSTRAINT [$usm_b_r000020d100000000]
GO
--SqlScripter----[dbo].[usm_billing_group].[$usm_b_r000020db00000000].sql
GO
ALTER TABLE [dbo].[usm_billing_group] WITH NOCHECK ADD CONSTRAINT [$usm_b_r000020db00000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_billing_group] WITH CHECK CHECK CONSTRAINT [$usm_b_r000020db00000000]
GO
--SqlScripter----[dbo].[usm_billing_group].[$usm_b_r000020e500000000].sql
GO
ALTER TABLE [dbo].[usm_billing_group] WITH NOCHECK ADD CONSTRAINT [$usm_b_r000020e500000000] FOREIGN KEY ([report_data_id])
REFERENCES [dbo].[usm_report_data] ([report_data_id])
GO
ALTER TABLE [dbo].[usm_billing_group] WITH CHECK CHECK CONSTRAINT [$usm_b_r000020e500000000]
GO
--SqlScripter----[dbo].[usm_billing_group].[$usm_b_r0000300300000000].sql
GO
ALTER TABLE [dbo].[usm_billing_group] WITH NOCHECK ADD CONSTRAINT [$usm_b_r0000300300000000] FOREIGN KEY ([report_data_id])
REFERENCES [dbo].[usm_report_data] ([report_data_id])
GO
ALTER TABLE [dbo].[usm_billing_group] WITH CHECK CHECK CONSTRAINT [$usm_b_r0000300300000000]
GO
--SqlScripter----[dbo].[usm_branding_template].[$usm_b_r000020ef00000000].sql
GO
ALTER TABLE [dbo].[usm_branding_template] WITH NOCHECK ADD CONSTRAINT [$usm_b_r000020ef00000000] FOREIGN KEY ([branding_template_parent_id])
REFERENCES [dbo].[usm_branding_template] ([branding_template_id])
GO
ALTER TABLE [dbo].[usm_branding_template] WITH CHECK CHECK CONSTRAINT [$usm_b_r000020ef00000000]
GO
--SqlScripter----[dbo].[usm_bus_queue].[$usm_b_r0000210300000000].sql
GO
ALTER TABLE [dbo].[usm_bus_queue] WITH NOCHECK ADD CONSTRAINT [$usm_b_r0000210300000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_bus_queue] WITH CHECK CHECK CONSTRAINT [$usm_b_r0000210300000000]
GO
--SqlScripter----[dbo].[usm_cache_listener].[$usm_c_r0000210d00000000].sql
GO
ALTER TABLE [dbo].[usm_cache_listener] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000210d00000000] FOREIGN KEY ([cache_id])
REFERENCES [dbo].[usm_cache] ([cache_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_cache_listener] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000210d00000000]
GO
--SqlScripter----[dbo].[usm_calendar_category].[$usm_c_r0000211700000000].sql
GO
ALTER TABLE [dbo].[usm_calendar_category] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000211700000000] FOREIGN KEY ([calendar_oid])
REFERENCES [dbo].[usm_calendar] ([calendar_oid])
GO
ALTER TABLE [dbo].[usm_calendar_category] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000211700000000]
GO
--SqlScripter----[dbo].[usm_calendar_category].[$usm_c_r0000212100000000].sql
GO
ALTER TABLE [dbo].[usm_calendar_category] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000212100000000] FOREIGN KEY ([event_category_oid])
REFERENCES [dbo].[usm_event_category] ([event_category_oid])
GO
ALTER TABLE [dbo].[usm_calendar_category] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000212100000000]
GO
--SqlScripter----[dbo].[usm_collection_profile_attrs].[$usm_c_r0000212b00000000].sql
GO
ALTER TABLE [dbo].[usm_collection_profile_attrs] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000212b00000000] FOREIGN KEY ([metric_attr_spec_id])
REFERENCES [dbo].[usm_metric_attr_spec] ([metric_attr_spec_id])
GO
ALTER TABLE [dbo].[usm_collection_profile_attrs] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000212b00000000]
GO
--SqlScripter----[dbo].[usm_collection_profile_attrs].[$usm_c_r0000213500000000].sql
GO
ALTER TABLE [dbo].[usm_collection_profile_attrs] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000213500000000] FOREIGN KEY ([collection_profile_metric_id])
REFERENCES [dbo].[usm_collection_profile_metric] ([collection_profile_metric_id])
GO
ALTER TABLE [dbo].[usm_collection_profile_attrs] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000213500000000]
GO
--SqlScripter----[dbo].[usm_collection_profile_metric].[$usm_c_r0000213f00000000].sql
GO
ALTER TABLE [dbo].[usm_collection_profile_metric] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000213f00000000] FOREIGN KEY ([agent_host_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_collection_profile_metric] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000213f00000000]
GO
--SqlScripter----[dbo].[usm_collection_profile_metric].[$usm_c_r0000214900000000].sql
GO
ALTER TABLE [dbo].[usm_collection_profile_metric] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000214900000000] FOREIGN KEY ([metric_id])
REFERENCES [dbo].[usm_metric] ([metric_id])
GO
ALTER TABLE [dbo].[usm_collection_profile_metric] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000214900000000]
GO
--SqlScripter----[dbo].[usm_collection_profile_metric].[$usm_c_r0000215300000000].sql
GO
ALTER TABLE [dbo].[usm_collection_profile_metric] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000215300000000] FOREIGN KEY ([collection_profile_id])
REFERENCES [dbo].[usm_collection_profile] ([collection_profile_id])
GO
ALTER TABLE [dbo].[usm_collection_profile_metric] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000215300000000]
GO
--SqlScripter----[dbo].[usm_collector].[$usm_c_r0000215d00000000].sql
GO
ALTER TABLE [dbo].[usm_collector] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000215d00000000] FOREIGN KEY ([parent_collector])
REFERENCES [dbo].[usm_collector] ([collector_id])
GO
ALTER TABLE [dbo].[usm_collector] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000215d00000000]
GO
--SqlScripter----[dbo].[usm_comp_instance].[$usm_c_r0000216700000000].sql
GO
ALTER TABLE [dbo].[usm_comp_instance] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000216700000000] FOREIGN KEY ([schema_instance_id])
REFERENCES [dbo].[usm_schema_instance] ([schema_instance_id])
GO
ALTER TABLE [dbo].[usm_comp_instance] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000216700000000]
GO
--SqlScripter----[dbo].[usm_comp_instance].[$usm_c_r0000217100000000].sql
GO
ALTER TABLE [dbo].[usm_comp_instance] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000217100000000] FOREIGN KEY ([inst_host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_comp_instance] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000217100000000]
GO
--SqlScripter----[dbo].[usm_comp_instance].[$usm_c_r0000217b00000000].sql
GO
ALTER TABLE [dbo].[usm_comp_instance] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000217b00000000] FOREIGN KEY ([sm_component_id])
REFERENCES [dbo].[usm_link_schema_component] ([smcomponent_id])
GO
ALTER TABLE [dbo].[usm_comp_instance] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000217b00000000]
GO
--SqlScripter----[dbo].[usm_contact_domain].[$usm_c_r0000218500000000].sql
GO
ALTER TABLE [dbo].[usm_contact_domain] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000218500000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_contact_domain] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000218500000000]
GO
--SqlScripter----[dbo].[usm_contact_domain].[$usm_c_r00002e9b00000000].sql
GO
ALTER TABLE [dbo].[usm_contact_domain] WITH NOCHECK ADD CONSTRAINT [$usm_c_r00002e9b00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_contact_domain] WITH CHECK CHECK CONSTRAINT [$usm_c_r00002e9b00000000]
GO
--SqlScripter----[dbo].[usm_contact_domain_role].[$usm_c_r0000218f00000000].sql
GO
ALTER TABLE [dbo].[usm_contact_domain_role] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000218f00000000] FOREIGN KEY ([role_id])
REFERENCES [dbo].[usm_role] ([role_id])
GO
ALTER TABLE [dbo].[usm_contact_domain_role] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000218f00000000]
GO
--SqlScripter----[dbo].[usm_contact_domain_role].[$usm_c_r0000219900000000].sql
GO
ALTER TABLE [dbo].[usm_contact_domain_role] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000219900000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_contact_domain_role] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000219900000000]
GO
--SqlScripter----[dbo].[usm_contact_domain_role].[$usm_c_r00002ea500000000].sql
GO
ALTER TABLE [dbo].[usm_contact_domain_role] WITH NOCHECK ADD CONSTRAINT [$usm_c_r00002ea500000000] FOREIGN KEY ([role_id])
REFERENCES [dbo].[usm_role] ([role_id])
GO
ALTER TABLE [dbo].[usm_contact_domain_role] WITH CHECK CHECK CONSTRAINT [$usm_c_r00002ea500000000]
GO
--SqlScripter----[dbo].[usm_contact_domain_role].[$usm_c_r00002eaf00000000].sql
GO
ALTER TABLE [dbo].[usm_contact_domain_role] WITH NOCHECK ADD CONSTRAINT [$usm_c_r00002eaf00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_contact_domain_role] WITH CHECK CHECK CONSTRAINT [$usm_c_r00002eaf00000000]
GO
--SqlScripter----[dbo].[usm_contact_extension].[$usm_c_r000021a300000000].sql
GO
ALTER TABLE [dbo].[usm_contact_extension] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021a300000000] FOREIGN KEY ([locale_code])
REFERENCES [dbo].[ca_locale] ([locale_code])
GO
ALTER TABLE [dbo].[usm_contact_extension] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021a300000000]
GO
--SqlScripter----[dbo].[usm_contact_extension].[$usm_c_r000021ad00000000].sql
GO
ALTER TABLE [dbo].[usm_contact_extension] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021ad00000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_contact_extension] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021ad00000000]
GO
--SqlScripter----[dbo].[usm_contact_extension].[$usm_c_r00002eb900000000].sql
GO
ALTER TABLE [dbo].[usm_contact_extension] WITH NOCHECK ADD CONSTRAINT [$usm_c_r00002eb900000000] FOREIGN KEY ([locale_code])
REFERENCES [dbo].[ca_locale] ([locale_code])
GO
ALTER TABLE [dbo].[usm_contact_extension] WITH CHECK CHECK CONSTRAINT [$usm_c_r00002eb900000000]
GO
--SqlScripter----[dbo].[usm_contact_extension].[$usm_c_r00002ec300000000].sql
GO
ALTER TABLE [dbo].[usm_contact_extension] WITH NOCHECK ADD CONSTRAINT [$usm_c_r00002ec300000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_contact_extension] WITH CHECK CHECK CONSTRAINT [$usm_c_r00002ec300000000]
GO
--SqlScripter----[dbo].[usm_contract].[$usm_c_r000021b700000000].sql
GO
ALTER TABLE [dbo].[usm_contract] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021b700000000] FOREIGN KEY ([tenant_id])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_contract] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021b700000000]
GO
--SqlScripter----[dbo].[usm_contract].[$usm_c_r000021c100000000].sql
GO
ALTER TABLE [dbo].[usm_contract] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021c100000000] FOREIGN KEY ([account_id])
REFERENCES [dbo].[usm_account] ([account_id])
GO
ALTER TABLE [dbo].[usm_contract] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021c100000000]
GO
--SqlScripter----[dbo].[usm_contract_action].[$usm_c_r000021cb00000000].sql
GO
ALTER TABLE [dbo].[usm_contract_action] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021cb00000000] FOREIGN KEY ([rule_id])
REFERENCES [dbo].[usm_rule] ([rule_id])
GO
ALTER TABLE [dbo].[usm_contract_action] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021cb00000000]
GO
--SqlScripter----[dbo].[usm_contract_action].[$usm_c_r000021d500000000].sql
GO
ALTER TABLE [dbo].[usm_contract_action] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021d500000000] FOREIGN KEY ([slo_instance_id])
REFERENCES [dbo].[usm_slo_instance] ([slo_instance_id])
GO
ALTER TABLE [dbo].[usm_contract_action] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021d500000000]
GO
--SqlScripter----[dbo].[usm_contract_action].[$usm_c_r000021df00000000].sql
GO
ALTER TABLE [dbo].[usm_contract_action] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021df00000000] FOREIGN KEY ([contract_id])
REFERENCES [dbo].[usm_contract] ([contract_id])
GO
ALTER TABLE [dbo].[usm_contract_action] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021df00000000]
GO
--SqlScripter----[dbo].[usm_cor_data].[$usm_c_r000021e900000000].sql
GO
ALTER TABLE [dbo].[usm_cor_data] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021e900000000] FOREIGN KEY ([server_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_cor_data] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021e900000000]
GO
--SqlScripter----[dbo].[usm_cor_data].[$usm_c_r000021f300000000].sql
GO
ALTER TABLE [dbo].[usm_cor_data] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021f300000000] FOREIGN KEY ([metric_id])
REFERENCES [dbo].[usm_metric] ([metric_id])
GO
ALTER TABLE [dbo].[usm_cor_data] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021f300000000]
GO
--SqlScripter----[dbo].[usm_cor_metric_capability].[$usm_c_r000021fd00000000].sql
GO
ALTER TABLE [dbo].[usm_cor_metric_capability] WITH NOCHECK ADD CONSTRAINT [$usm_c_r000021fd00000000] FOREIGN KEY ([metric_id])
REFERENCES [dbo].[usm_metric] ([metric_id])
GO
ALTER TABLE [dbo].[usm_cor_metric_capability] WITH CHECK CHECK CONSTRAINT [$usm_c_r000021fd00000000]
GO
--SqlScripter----[dbo].[usm_cost_pool].[$usm_c_r0000220700000000].sql
GO
ALTER TABLE [dbo].[usm_cost_pool] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000220700000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_cost_pool] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000220700000000]
GO
--SqlScripter----[dbo].[usm_cost_pool].[$usm_c_r00002dab00000000].sql
GO
ALTER TABLE [dbo].[usm_cost_pool] WITH NOCHECK ADD CONSTRAINT [$usm_c_r00002dab00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_cost_pool] WITH CHECK CHECK CONSTRAINT [$usm_c_r00002dab00000000]
GO
--SqlScripter----[dbo].[usm_cp_inclusion].[$usm_c_r0000221100000000].sql
GO
ALTER TABLE [dbo].[usm_cp_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000221100000000] FOREIGN KEY ([cp_id])
REFERENCES [dbo].[usm_cost_pool] ([cp_id])
GO
ALTER TABLE [dbo].[usm_cp_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000221100000000]
GO
--SqlScripter----[dbo].[usm_cp_inclusion].[$usm_c_r0000221b00000000].sql
GO
ALTER TABLE [dbo].[usm_cp_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_c_r0000221b00000000] FOREIGN KEY ([item_id])
REFERENCES [dbo].[usm_rate_definition] ([item_id])
GO
ALTER TABLE [dbo].[usm_cp_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_c_r0000221b00000000]
GO
--SqlScripter----[dbo].[usm_cp_inclusion].[$usm_c_r00002f7700000000].sql
GO
ALTER TABLE [dbo].[usm_cp_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_c_r00002f7700000000] FOREIGN KEY ([cp_id])
REFERENCES [dbo].[usm_cost_pool] ([cp_id])
GO
ALTER TABLE [dbo].[usm_cp_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_c_r00002f7700000000]
GO
--SqlScripter----[dbo].[usm_dash].[$usm_d_r0000222500000000].sql
GO
ALTER TABLE [dbo].[usm_dash] WITH NOCHECK ADD CONSTRAINT [$usm_d_r0000222500000000] FOREIGN KEY ([tenant_id])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_dash] WITH CHECK CHECK CONSTRAINT [$usm_d_r0000222500000000]
GO
--SqlScripter----[dbo].[usm_dash].[$usm_d_r00002ecd00000000].sql
GO
ALTER TABLE [dbo].[usm_dash] WITH NOCHECK ADD CONSTRAINT [$usm_d_r00002ecd00000000] FOREIGN KEY ([tenant_id])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_dash] WITH CHECK CHECK CONSTRAINT [$usm_d_r00002ecd00000000]
GO
--SqlScripter----[dbo].[usm_db].[$usm_d_r0000223900000000].sql
GO
ALTER TABLE [dbo].[usm_db] WITH NOCHECK ADD CONSTRAINT [$usm_d_r0000223900000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_db] WITH CHECK CHECK CONSTRAINT [$usm_d_r0000223900000000]
GO
--SqlScripter----[dbo].[usm_dca_app_status].[$usm_d_r0000224300000000].sql
GO
ALTER TABLE [dbo].[usm_dca_app_status] WITH NOCHECK ADD CONSTRAINT [$usm_d_r0000224300000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_dca_app_status] WITH CHECK CHECK CONSTRAINT [$usm_d_r0000224300000000]
GO
--SqlScripter----[dbo].[usm_dca_comp_status].[$usm_d_r0000224d00000000].sql
GO
ALTER TABLE [dbo].[usm_dca_comp_status] WITH NOCHECK ADD CONSTRAINT [$usm_d_r0000224d00000000] FOREIGN KEY ([event_instance_id])
REFERENCES [dbo].[usm_event_instance] ([event_instance_id])
GO
ALTER TABLE [dbo].[usm_dca_comp_status] WITH CHECK CHECK CONSTRAINT [$usm_d_r0000224d00000000]
GO
--SqlScripter----[dbo].[usm_dca_comp_status].[$usm_d_r0000225700000000].sql
GO
ALTER TABLE [dbo].[usm_dca_comp_status] WITH NOCHECK ADD CONSTRAINT [$usm_d_r0000225700000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_dca_comp_status] WITH CHECK CHECK CONSTRAINT [$usm_d_r0000225700000000]
GO
--SqlScripter----[dbo].[usm_dependency].[$usm_d_r0000226100000000].sql
GO
ALTER TABLE [dbo].[usm_dependency] WITH NOCHECK ADD CONSTRAINT [$usm_d_r0000226100000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_dependency] WITH CHECK CHECK CONSTRAINT [$usm_d_r0000226100000000]
GO
--SqlScripter----[dbo].[usm_dm_event_data].[$usm_d_r00002d2900000000].sql
GO
ALTER TABLE [dbo].[usm_dm_event_data] WITH NOCHECK ADD CONSTRAINT [$usm_d_r00002d2900000000] FOREIGN KEY ([event_instance_id])
REFERENCES [dbo].[usm_event_instance] ([event_instance_id])
GO
ALTER TABLE [dbo].[usm_dm_event_data] WITH CHECK CHECK CONSTRAINT [$usm_d_r00002d2900000000]
GO
--SqlScripter----[dbo].[usm_doctmpl_layoutlist].[$usm_d_r0000226b00000000].sql
GO
ALTER TABLE [dbo].[usm_doctmpl_layoutlist] WITH NOCHECK ADD CONSTRAINT [$usm_d_r0000226b00000000] FOREIGN KEY ([document_template_id])
REFERENCES [dbo].[usm_document_template] ([document_template_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_doctmpl_layoutlist] WITH CHECK CHECK CONSTRAINT [$usm_d_r0000226b00000000]
GO
--SqlScripter----[dbo].[usm_event_category].[$usm_e_r0000227500000000].sql
GO
ALTER TABLE [dbo].[usm_event_category] WITH NOCHECK ADD CONSTRAINT [$usm_e_r0000227500000000] FOREIGN KEY ([exporter_oid])
REFERENCES [dbo].[usm_exporter] ([exporter_oid])
GO
ALTER TABLE [dbo].[usm_event_category] WITH CHECK CHECK CONSTRAINT [$usm_e_r0000227500000000]
GO
--SqlScripter----[dbo].[usm_event_category_value].[$usm_e_r0000227f00000000].sql
GO
ALTER TABLE [dbo].[usm_event_category_value] WITH NOCHECK ADD CONSTRAINT [$usm_e_r0000227f00000000] FOREIGN KEY ([event_category_oid])
REFERENCES [dbo].[usm_event_category] ([event_category_oid])
GO
ALTER TABLE [dbo].[usm_event_category_value] WITH CHECK CHECK CONSTRAINT [$usm_e_r0000227f00000000]
GO
--SqlScripter----[dbo].[usm_event_data].[$usm_e_r0000228900000000].sql
GO
ALTER TABLE [dbo].[usm_event_data] WITH NOCHECK ADD CONSTRAINT [$usm_e_r0000228900000000] FOREIGN KEY ([event_instance_id])
REFERENCES [dbo].[usm_event_instance] ([event_instance_id])
GO
ALTER TABLE [dbo].[usm_event_data] WITH CHECK CHECK CONSTRAINT [$usm_e_r0000228900000000]
GO
--SqlScripter----[dbo].[usm_event_instance].[$usm_e_r0000229300000000].sql
GO
ALTER TABLE [dbo].[usm_event_instance] WITH NOCHECK ADD CONSTRAINT [$usm_e_r0000229300000000] FOREIGN KEY ([target_host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_event_instance] WITH CHECK CHECK CONSTRAINT [$usm_e_r0000229300000000]
GO
--SqlScripter----[dbo].[usm_event_instance].[$usm_e_r0000229d00000000].sql
GO
ALTER TABLE [dbo].[usm_event_instance] WITH NOCHECK ADD CONSTRAINT [$usm_e_r0000229d00000000] FOREIGN KEY ([agent_host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_event_instance] WITH CHECK CHECK CONSTRAINT [$usm_e_r0000229d00000000]
GO
--SqlScripter----[dbo].[usm_event_instance].[$usm_e_r000022a700000000].sql
GO
ALTER TABLE [dbo].[usm_event_instance] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022a700000000] FOREIGN KEY ([schema_comp_id])
REFERENCES [dbo].[usm_schema_comp] ([schema_comp_id])
GO
ALTER TABLE [dbo].[usm_event_instance] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022a700000000]
GO
--SqlScripter----[dbo].[usm_event_instance].[$usm_e_r000022b100000000].sql
GO
ALTER TABLE [dbo].[usm_event_instance] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022b100000000] FOREIGN KEY ([event_id])
REFERENCES [dbo].[usm_event_type] ([event_id])
GO
ALTER TABLE [dbo].[usm_event_instance] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022b100000000]
GO
--SqlScripter----[dbo].[usm_event_instance_value].[$usm_e_r000022bb00000000].sql
GO
ALTER TABLE [dbo].[usm_event_instance_value] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022bb00000000] FOREIGN KEY ([event_instance_id])
REFERENCES [dbo].[usm_event_instance] ([event_instance_id])
GO
ALTER TABLE [dbo].[usm_event_instance_value] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022bb00000000]
GO
--SqlScripter----[dbo].[usm_event_instance_value].[$usm_e_r000022c500000000].sql
GO
ALTER TABLE [dbo].[usm_event_instance_value] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022c500000000] FOREIGN KEY ([metric_attribute_value_id])
REFERENCES [dbo].[usm_metric_attr_value] ([metric_attribute_value_id])
GO
ALTER TABLE [dbo].[usm_event_instance_value] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022c500000000]
GO
--SqlScripter----[dbo].[usm_event_type].[$usm_e_r000022cf00000000].sql
GO
ALTER TABLE [dbo].[usm_event_type] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022cf00000000] FOREIGN KEY ([collector_id])
REFERENCES [dbo].[usm_collector] ([collector_id])
GO
ALTER TABLE [dbo].[usm_event_type] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022cf00000000]
GO
--SqlScripter----[dbo].[usm_event_type_attributes].[$usm_e_r000022d900000000].sql
GO
ALTER TABLE [dbo].[usm_event_type_attributes] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022d900000000] FOREIGN KEY ([event_id])
REFERENCES [dbo].[usm_event_type] ([event_id])
GO
ALTER TABLE [dbo].[usm_event_type_attributes] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022d900000000]
GO
--SqlScripter----[dbo].[usm_event_type_collector].[$usm_e_r000022e300000000].sql
GO
ALTER TABLE [dbo].[usm_event_type_collector] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022e300000000] FOREIGN KEY ([collector_id])
REFERENCES [dbo].[usm_collector] ([collector_id])
GO
ALTER TABLE [dbo].[usm_event_type_collector] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022e300000000]
GO
--SqlScripter----[dbo].[usm_event_type_collector].[$usm_e_r000022ed00000000].sql
GO
ALTER TABLE [dbo].[usm_event_type_collector] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022ed00000000] FOREIGN KEY ([event_type_id])
REFERENCES [dbo].[usm_event_type] ([event_id])
GO
ALTER TABLE [dbo].[usm_event_type_collector] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022ed00000000]
GO
--SqlScripter----[dbo].[usm_export].[$usm_e_r000022f700000000].sql
GO
ALTER TABLE [dbo].[usm_export] WITH NOCHECK ADD CONSTRAINT [$usm_e_r000022f700000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_export] WITH CHECK CHECK CONSTRAINT [$usm_e_r000022f700000000]
GO
--SqlScripter----[dbo].[usm_fiscal_period].[$usm_f_r0000230100000000].sql
GO
ALTER TABLE [dbo].[usm_fiscal_period] WITH NOCHECK ADD CONSTRAINT [$usm_f_r0000230100000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_fiscal_period] WITH CHECK CHECK CONSTRAINT [$usm_f_r0000230100000000]
GO
--SqlScripter----[dbo].[usm_guinode_content].[$usm_g_r0000230b00000000].sql
GO
ALTER TABLE [dbo].[usm_guinode_content] WITH NOCHECK ADD CONSTRAINT [$usm_g_r0000230b00000000] FOREIGN KEY ([guinode_id])
REFERENCES [dbo].[usm_guinode] ([guinode_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_guinode_content] WITH CHECK CHECK CONSTRAINT [$usm_g_r0000230b00000000]
GO
--SqlScripter----[dbo].[usm_host].[$usm_h_r0000231500000000].sql
GO
ALTER TABLE [dbo].[usm_host] WITH NOCHECK ADD CONSTRAINT [$usm_h_r0000231500000000] FOREIGN KEY ([host_type_id])
REFERENCES [dbo].[usm_host_type] ([host_type_id])
GO
ALTER TABLE [dbo].[usm_host] WITH CHECK CHECK CONSTRAINT [$usm_h_r0000231500000000]
GO
--SqlScripter----[dbo].[usm_host_element].[$usm_h_r0000231f00000000].sql
GO
ALTER TABLE [dbo].[usm_host_element] WITH NOCHECK ADD CONSTRAINT [$usm_h_r0000231f00000000] FOREIGN KEY ([host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_host_element] WITH CHECK CHECK CONSTRAINT [$usm_h_r0000231f00000000]
GO
--SqlScripter----[dbo].[usm_import_attribute].[$usm_i_r0000232900000000].sql
GO
ALTER TABLE [dbo].[usm_import_attribute] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000232900000000] FOREIGN KEY ([importer_spec_id])
REFERENCES [dbo].[usm_importer_spec] ([importer_spec_id])
GO
ALTER TABLE [dbo].[usm_import_attribute] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000232900000000]
GO
--SqlScripter----[dbo].[usm_import_attribute].[$usm_i_r0000233300000000].sql
GO
ALTER TABLE [dbo].[usm_import_attribute] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000233300000000] FOREIGN KEY ([importer_instance_id])
REFERENCES [dbo].[usm_importer_instance] ([importer_instance_id])
GO
ALTER TABLE [dbo].[usm_import_attribute] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000233300000000]
GO
--SqlScripter----[dbo].[usm_import_rule].[$usm_i_r0000233d00000000].sql
GO
ALTER TABLE [dbo].[usm_import_rule] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000233d00000000] FOREIGN KEY ([importer_id])
REFERENCES [dbo].[usm_importer] ([importer_id])
GO
ALTER TABLE [dbo].[usm_import_rule] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000233d00000000]
GO
--SqlScripter----[dbo].[usm_importer].[$usm_i_r0000234700000000].sql
GO
ALTER TABLE [dbo].[usm_importer] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000234700000000] FOREIGN KEY ([metric_folder_id])
REFERENCES [dbo].[usm_metric_folder] ([metric_folder_id])
GO
ALTER TABLE [dbo].[usm_importer] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000234700000000]
GO
--SqlScripter----[dbo].[usm_importer_instance].[$usm_i_r0000235100000000].sql
GO
ALTER TABLE [dbo].[usm_importer_instance] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000235100000000] FOREIGN KEY ([server_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_importer_instance] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000235100000000]
GO
--SqlScripter----[dbo].[usm_importer_instance].[$usm_i_r0000235b00000000].sql
GO
ALTER TABLE [dbo].[usm_importer_instance] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000235b00000000] FOREIGN KEY ([importer_id])
REFERENCES [dbo].[usm_importer] ([importer_id])
GO
ALTER TABLE [dbo].[usm_importer_instance] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000235b00000000]
GO
--SqlScripter----[dbo].[usm_importer_spec].[$usm_i_r0000236500000000].sql
GO
ALTER TABLE [dbo].[usm_importer_spec] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000236500000000] FOREIGN KEY ([importer_id])
REFERENCES [dbo].[usm_importer] ([importer_id])
GO
ALTER TABLE [dbo].[usm_importer_spec] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000236500000000]
GO
--SqlScripter----[dbo].[usm_importer_spec_value].[$usm_i_r0000236f00000000].sql
GO
ALTER TABLE [dbo].[usm_importer_spec_value] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000236f00000000] FOREIGN KEY ([importer_spec_id])
REFERENCES [dbo].[usm_importer_spec] ([importer_spec_id])
GO
ALTER TABLE [dbo].[usm_importer_spec_value] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000236f00000000]
GO
--SqlScripter----[dbo].[usm_install].[$usm_i_r0000237900000000].sql
GO
ALTER TABLE [dbo].[usm_install] WITH NOCHECK ADD CONSTRAINT [$usm_i_r0000237900000000] FOREIGN KEY ([host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_install] WITH CHECK CHECK CONSTRAINT [$usm_i_r0000237900000000]
GO
--SqlScripter----[dbo].[usm_last_analysis].[$usm_l_r0000238300000000].sql
GO
ALTER TABLE [dbo].[usm_last_analysis] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000238300000000] FOREIGN KEY ([analyze_job_id])
REFERENCES [dbo].[usm_analyze_job] ([analyze_job_id])
GO
ALTER TABLE [dbo].[usm_last_analysis] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000238300000000]
GO
--SqlScripter----[dbo].[usm_launchpad_content].[$usm_l_r0000238d00000000].sql
GO
ALTER TABLE [dbo].[usm_launchpad_content] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000238d00000000] FOREIGN KEY ([launchpad_id])
REFERENCES [dbo].[usm_launchpad] ([launchpad_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_launchpad_content] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000238d00000000]
GO
--SqlScripter----[dbo].[usm_link_account_user].[$usm_l_r0000239700000000].sql
GO
ALTER TABLE [dbo].[usm_link_account_user] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000239700000000] FOREIGN KEY ([account_id])
REFERENCES [dbo].[usm_account] ([account_id])
GO
ALTER TABLE [dbo].[usm_link_account_user] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000239700000000]
GO
--SqlScripter----[dbo].[usm_link_account_user].[$usm_l_r00002ed700000000].sql
GO
ALTER TABLE [dbo].[usm_link_account_user] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002ed700000000] FOREIGN KEY ([account_id])
REFERENCES [dbo].[usm_account] ([account_id])
GO
ALTER TABLE [dbo].[usm_link_account_user] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002ed700000000]
GO
--SqlScripter----[dbo].[usm_link_analysis_layout].[$usm_l_r000023a100000000].sql
GO
ALTER TABLE [dbo].[usm_link_analysis_layout] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023a100000000] FOREIGN KEY ([report_layout_id])
REFERENCES [dbo].[usm_report_layout] ([report_layout_id])
GO
ALTER TABLE [dbo].[usm_link_analysis_layout] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023a100000000]
GO
--SqlScripter----[dbo].[usm_link_analysis_layout].[$usm_l_r000023ab00000000].sql
GO
ALTER TABLE [dbo].[usm_link_analysis_layout] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023ab00000000] FOREIGN KEY ([analysis_id])
REFERENCES [dbo].[usm_analysis] ([analysis_id])
GO
ALTER TABLE [dbo].[usm_link_analysis_layout] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023ab00000000]
GO
--SqlScripter----[dbo].[usm_link_analyze_func_metr_cat].[$usm_l_r000023b500000000].sql
GO
ALTER TABLE [dbo].[usm_link_analyze_func_metr_cat] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023b500000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_link_analyze_func_metr_cat] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023b500000000]
GO
--SqlScripter----[dbo].[usm_link_analyze_func_metr_cat].[$usm_l_r000023bf00000000].sql
GO
ALTER TABLE [dbo].[usm_link_analyze_func_metr_cat] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023bf00000000] FOREIGN KEY ([analyze_function_id])
REFERENCES [dbo].[usm_analyze_function] ([analyze_function_id])
GO
ALTER TABLE [dbo].[usm_link_analyze_func_metr_cat] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023bf00000000]
GO
--SqlScripter----[dbo].[usm_link_analyze_job_group].[$usm_l_r000023c900000000].sql
GO
ALTER TABLE [dbo].[usm_link_analyze_job_group] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023c900000000] FOREIGN KEY ([report_group_id])
REFERENCES [dbo].[usm_report_group] ([report_group_id])
GO
ALTER TABLE [dbo].[usm_link_analyze_job_group] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023c900000000]
GO
--SqlScripter----[dbo].[usm_link_analyze_job_group].[$usm_l_r000023d300000000].sql
GO
ALTER TABLE [dbo].[usm_link_analyze_job_group] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023d300000000] FOREIGN KEY ([analyze_job_id])
REFERENCES [dbo].[usm_analyze_job] ([analyze_job_id])
GO
ALTER TABLE [dbo].[usm_link_analyze_job_group] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023d300000000]
GO
--SqlScripter----[dbo].[usm_link_analyze_job_ticket].[$usm_l_r000023dd00000000].sql
GO
ALTER TABLE [dbo].[usm_link_analyze_job_ticket] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023dd00000000] FOREIGN KEY ([analyze_job_id])
REFERENCES [dbo].[usm_analyze_job] ([analyze_job_id])
GO
ALTER TABLE [dbo].[usm_link_analyze_job_ticket] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023dd00000000]
GO
--SqlScripter----[dbo].[usm_link_analyze_job_ticket].[$usm_l_r000023e700000000].sql
GO
ALTER TABLE [dbo].[usm_link_analyze_job_ticket] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023e700000000] FOREIGN KEY ([service_desk_ticket_id])
REFERENCES [dbo].[usm_service_desk_ticket] ([service_desk_ticket_id])
GO
ALTER TABLE [dbo].[usm_link_analyze_job_ticket] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023e700000000]
GO
--SqlScripter----[dbo].[usm_link_billing_account_group].[$usm_l_r000023f100000000].sql
GO
ALTER TABLE [dbo].[usm_link_billing_account_group] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023f100000000] FOREIGN KEY ([group_id])
REFERENCES [dbo].[usm_billing_group] ([group_id])
GO
ALTER TABLE [dbo].[usm_link_billing_account_group] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023f100000000]
GO
--SqlScripter----[dbo].[usm_link_billing_account_group].[$usm_l_r000023fb00000000].sql
GO
ALTER TABLE [dbo].[usm_link_billing_account_group] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000023fb00000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_link_billing_account_group] WITH CHECK CHECK CONSTRAINT [$usm_l_r000023fb00000000]
GO
--SqlScripter----[dbo].[usm_link_calendar_contract].[$usm_l_r00002d3300000000].sql
GO
ALTER TABLE [dbo].[usm_link_calendar_contract] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d3300000000] FOREIGN KEY ([calendar_oid])
REFERENCES [dbo].[usm_calendar] ([calendar_oid])
GO
ALTER TABLE [dbo].[usm_link_calendar_contract] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d3300000000]
GO
--SqlScripter----[dbo].[usm_link_calendar_contract].[$usm_l_r00002d3d00000000].sql
GO
ALTER TABLE [dbo].[usm_link_calendar_contract] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d3d00000000] FOREIGN KEY ([contract_id])
REFERENCES [dbo].[usm_contract] ([contract_id])
GO
ALTER TABLE [dbo].[usm_link_calendar_contract] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d3d00000000]
GO
--SqlScripter----[dbo].[usm_link_contract_sla_inst].[$usm_l_r0000240500000000].sql
GO
ALTER TABLE [dbo].[usm_link_contract_sla_inst] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000240500000000] FOREIGN KEY ([sla_instance_id])
REFERENCES [dbo].[usm_sla_instance] ([sla_instance_id])
GO
ALTER TABLE [dbo].[usm_link_contract_sla_inst] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000240500000000]
GO
--SqlScripter----[dbo].[usm_link_contract_sla_inst].[$usm_l_r0000240f00000000].sql
GO
ALTER TABLE [dbo].[usm_link_contract_sla_inst] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000240f00000000] FOREIGN KEY ([contract_id])
REFERENCES [dbo].[usm_contract] ([contract_id])
GO
ALTER TABLE [dbo].[usm_link_contract_sla_inst] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000240f00000000]
GO
--SqlScripter----[dbo].[usm_link_event_inst_metr_inst].[$usm_l_r0000241900000000].sql
GO
ALTER TABLE [dbo].[usm_link_event_inst_metr_inst] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000241900000000] FOREIGN KEY ([event_instance_id])
REFERENCES [dbo].[usm_event_instance] ([event_instance_id])
GO
ALTER TABLE [dbo].[usm_link_event_inst_metr_inst] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000241900000000]
GO
--SqlScripter----[dbo].[usm_link_event_inst_metr_inst].[$usm_l_r0000242300000000].sql
GO
ALTER TABLE [dbo].[usm_link_event_inst_metr_inst] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000242300000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_link_event_inst_metr_inst] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000242300000000]
GO
--SqlScripter----[dbo].[usm_link_event_metric_category].[$usm_l_r0000242d00000000].sql
GO
ALTER TABLE [dbo].[usm_link_event_metric_category] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000242d00000000] FOREIGN KEY ([event_id])
REFERENCES [dbo].[usm_event_type] ([event_id])
GO
ALTER TABLE [dbo].[usm_link_event_metric_category] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000242d00000000]
GO
--SqlScripter----[dbo].[usm_link_event_metric_category].[$usm_l_r0000243700000000].sql
GO
ALTER TABLE [dbo].[usm_link_event_metric_category] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000243700000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_link_event_metric_category] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000243700000000]
GO
--SqlScripter----[dbo].[usm_link_guinode_guinode].[$usm_l_r0000244100000000].sql
GO
ALTER TABLE [dbo].[usm_link_guinode_guinode] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000244100000000] FOREIGN KEY ([guinode_id])
REFERENCES [dbo].[usm_guinode] ([guinode_id])
GO
ALTER TABLE [dbo].[usm_link_guinode_guinode] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000244100000000]
GO
--SqlScripter----[dbo].[usm_link_guinode_guinode].[$usm_l_r0000244b00000000].sql
GO
ALTER TABLE [dbo].[usm_link_guinode_guinode] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000244b00000000] FOREIGN KEY ([guinode_parent_id])
REFERENCES [dbo].[usm_guinode] ([guinode_id])
GO
ALTER TABLE [dbo].[usm_link_guinode_guinode] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000244b00000000]
GO
--SqlScripter----[dbo].[usm_link_importer_inst_metric].[$usm_l_r0000245500000000].sql
GO
ALTER TABLE [dbo].[usm_link_importer_inst_metric] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000245500000000] FOREIGN KEY ([importer_instance_id])
REFERENCES [dbo].[usm_importer_instance] ([importer_instance_id])
GO
ALTER TABLE [dbo].[usm_link_importer_inst_metric] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000245500000000]
GO
--SqlScripter----[dbo].[usm_link_importer_inst_metric].[$usm_l_r0000245f00000000].sql
GO
ALTER TABLE [dbo].[usm_link_importer_inst_metric] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000245f00000000] FOREIGN KEY ([metric_id])
REFERENCES [dbo].[usm_metric] ([metric_id])
GO
ALTER TABLE [dbo].[usm_link_importer_inst_metric] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000245f00000000]
GO
--SqlScripter----[dbo].[usm_link_install_comp_subcomp].[$usm_l_r0000246900000000].sql
GO
ALTER TABLE [dbo].[usm_link_install_comp_subcomp] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000246900000000] FOREIGN KEY ([installed_component_id])
REFERENCES [dbo].[usm_installed_component] ([installed_component_id])
GO
ALTER TABLE [dbo].[usm_link_install_comp_subcomp] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000246900000000]
GO
--SqlScripter----[dbo].[usm_link_install_comp_subcomp].[$usm_l_r0000247300000000].sql
GO
ALTER TABLE [dbo].[usm_link_install_comp_subcomp] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000247300000000] FOREIGN KEY ([installed_subcomponent_id])
REFERENCES [dbo].[usm_installed_subcomponent] ([installed_subcomponent_id])
GO
ALTER TABLE [dbo].[usm_link_install_comp_subcomp] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000247300000000]
GO
--SqlScripter----[dbo].[usm_link_launchpad_launchpad].[$usm_l_r0000247d00000000].sql
GO
ALTER TABLE [dbo].[usm_link_launchpad_launchpad] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000247d00000000] FOREIGN KEY ([launchpad_id])
REFERENCES [dbo].[usm_launchpad] ([launchpad_id])
GO
ALTER TABLE [dbo].[usm_link_launchpad_launchpad] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000247d00000000]
GO
--SqlScripter----[dbo].[usm_link_launchpad_launchpad].[$usm_l_r0000248700000000].sql
GO
ALTER TABLE [dbo].[usm_link_launchpad_launchpad] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000248700000000] FOREIGN KEY ([launchpad_parent_id])
REFERENCES [dbo].[usm_launchpad] ([launchpad_id])
GO
ALTER TABLE [dbo].[usm_link_launchpad_launchpad] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000248700000000]
GO
--SqlScripter----[dbo].[usm_link_method_method].[$usm_l_r0000249100000000].sql
GO
ALTER TABLE [dbo].[usm_link_method_method] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000249100000000] FOREIGN KEY ([method_parent_id])
REFERENCES [dbo].[usm_method] ([method_id])
GO
ALTER TABLE [dbo].[usm_link_method_method] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000249100000000]
GO
--SqlScripter----[dbo].[usm_link_method_method].[$usm_l_r0000249b00000000].sql
GO
ALTER TABLE [dbo].[usm_link_method_method] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000249b00000000] FOREIGN KEY ([method_id])
REFERENCES [dbo].[usm_method] ([method_id])
GO
ALTER TABLE [dbo].[usm_link_method_method] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000249b00000000]
GO
--SqlScripter----[dbo].[usm_link_metric_schema_comp].[$usm_l_r000024a500000000].sql
GO
ALTER TABLE [dbo].[usm_link_metric_schema_comp] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024a500000000] FOREIGN KEY ([metric_id])
REFERENCES [dbo].[usm_metric] ([metric_id])
GO
ALTER TABLE [dbo].[usm_link_metric_schema_comp] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024a500000000]
GO
--SqlScripter----[dbo].[usm_link_metric_schema_comp].[$usm_l_r000024af00000000].sql
GO
ALTER TABLE [dbo].[usm_link_metric_schema_comp] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024af00000000] FOREIGN KEY ([schema_comp_id])
REFERENCES [dbo].[usm_schema_comp] ([schema_comp_id])
GO
ALTER TABLE [dbo].[usm_link_metric_schema_comp] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024af00000000]
GO
--SqlScripter----[dbo].[usm_link_metric_scope].[$usm_l_r000024b900000000].sql
GO
ALTER TABLE [dbo].[usm_link_metric_scope] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024b900000000] FOREIGN KEY ([service_goal_id])
REFERENCES [dbo].[usm_service_goal] ([service_goal_id])
GO
ALTER TABLE [dbo].[usm_link_metric_scope] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024b900000000]
GO
--SqlScripter----[dbo].[usm_link_metric_scope].[$usm_l_r000024c300000000].sql
GO
ALTER TABLE [dbo].[usm_link_metric_scope] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024c300000000] FOREIGN KEY ([scope_id])
REFERENCES [dbo].[usm_scope] ([scope_id])
GO
ALTER TABLE [dbo].[usm_link_metric_scope] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024c300000000]
GO
--SqlScripter----[dbo].[usm_link_metric_scope].[$usm_l_r000024cd00000000].sql
GO
ALTER TABLE [dbo].[usm_link_metric_scope] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024cd00000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_link_metric_scope] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024cd00000000]
GO
--SqlScripter----[dbo].[usm_link_mr_import_event_inst].[$usm_l_r00002d4700000000].sql
GO
ALTER TABLE [dbo].[usm_link_mr_import_event_inst] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d4700000000] FOREIGN KEY ([event_instance_id])
REFERENCES [dbo].[usm_event_instance] ([event_instance_id])
GO
ALTER TABLE [dbo].[usm_link_mr_import_event_inst] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d4700000000]
GO
--SqlScripter----[dbo].[usm_link_mr_import_event_inst].[$usm_l_r00002d5100000000].sql
GO
ALTER TABLE [dbo].[usm_link_mr_import_event_inst] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d5100000000] FOREIGN KEY ([import_id])
REFERENCES [dbo].[usm_mr_import] ([id])
GO
ALTER TABLE [dbo].[usm_link_mr_import_event_inst] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d5100000000]
GO
--SqlScripter----[dbo].[usm_link_object_keyword].[$usm_l_r000024d700000000].sql
GO
ALTER TABLE [dbo].[usm_link_object_keyword] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024d700000000] FOREIGN KEY ([keyword_id])
REFERENCES [dbo].[usm_keyword] ([keyword_id])
GO
ALTER TABLE [dbo].[usm_link_object_keyword] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024d700000000]
GO
--SqlScripter----[dbo].[usm_link_plugin_plugintype].[$usm_l_r000024e100000000].sql
GO
ALTER TABLE [dbo].[usm_link_plugin_plugintype] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024e100000000] FOREIGN KEY ([plugin_type_id])
REFERENCES [dbo].[usm_plugin_type] ([plugin_type_id])
GO
ALTER TABLE [dbo].[usm_link_plugin_plugintype] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024e100000000]
GO
--SqlScripter----[dbo].[usm_link_plugin_plugintype].[$usm_l_r000024eb00000000].sql
GO
ALTER TABLE [dbo].[usm_link_plugin_plugintype] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024eb00000000] FOREIGN KEY ([plugin_id])
REFERENCES [dbo].[usm_plugin] ([plugin_id])
GO
ALTER TABLE [dbo].[usm_link_plugin_plugintype] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024eb00000000]
GO
--SqlScripter----[dbo].[usm_link_profile_hosts].[$usm_l_r000024f500000000].sql
GO
ALTER TABLE [dbo].[usm_link_profile_hosts] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024f500000000] FOREIGN KEY ([target_host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_link_profile_hosts] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024f500000000]
GO
--SqlScripter----[dbo].[usm_link_profile_hosts].[$usm_l_r000024ff00000000].sql
GO
ALTER TABLE [dbo].[usm_link_profile_hosts] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000024ff00000000] FOREIGN KEY ([collection_profile_id])
REFERENCES [dbo].[usm_collection_profile] ([collection_profile_id])
GO
ALTER TABLE [dbo].[usm_link_profile_hosts] WITH CHECK CHECK CONSTRAINT [$usm_l_r000024ff00000000]
GO
--SqlScripter----[dbo].[usm_link_report_variable_data].[$usm_l_r0000250900000000].sql
GO
ALTER TABLE [dbo].[usm_link_report_variable_data] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000250900000000] FOREIGN KEY ([report_variable_id])
REFERENCES [dbo].[usm_report_variable] ([report_variable_id])
GO
ALTER TABLE [dbo].[usm_link_report_variable_data] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000250900000000]
GO
--SqlScripter----[dbo].[usm_link_report_variable_data].[$usm_l_r0000251300000000].sql
GO
ALTER TABLE [dbo].[usm_link_report_variable_data] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000251300000000] FOREIGN KEY ([report_data_id])
REFERENCES [dbo].[usm_report_data] ([report_data_id])
GO
ALTER TABLE [dbo].[usm_link_report_variable_data] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000251300000000]
GO
--SqlScripter----[dbo].[usm_link_report_variable_data].[$usm_l_r0000301700000000].sql
GO
ALTER TABLE [dbo].[usm_link_report_variable_data] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000301700000000] FOREIGN KEY ([report_data_id])
REFERENCES [dbo].[usm_report_data] ([report_data_id])
GO
ALTER TABLE [dbo].[usm_link_report_variable_data] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000301700000000]
GO
--SqlScripter----[dbo].[usm_link_resource_outage].[$usm_l_r00002d5b00000000].sql
GO
ALTER TABLE [dbo].[usm_link_resource_outage] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d5b00000000] FOREIGN KEY ([sla_instance_id])
REFERENCES [dbo].[usm_sla_instance] ([sla_instance_id])
GO
ALTER TABLE [dbo].[usm_link_resource_outage] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d5b00000000]
GO
--SqlScripter----[dbo].[usm_link_resource_outage].[$usm_l_r00002d6500000000].sql
GO
ALTER TABLE [dbo].[usm_link_resource_outage] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d6500000000] FOREIGN KEY ([host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_link_resource_outage] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d6500000000]
GO
--SqlScripter----[dbo].[usm_link_resource_outage].[$usm_l_r00002d6f00000000].sql
GO
ALTER TABLE [dbo].[usm_link_resource_outage] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d6f00000000] FOREIGN KEY ([calendar_oid])
REFERENCES [dbo].[usm_calendar] ([calendar_oid])
GO
ALTER TABLE [dbo].[usm_link_resource_outage] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d6f00000000]
GO
--SqlScripter----[dbo].[usm_link_rtapp_account].[$usm_l_r0000251d00000000].sql
GO
ALTER TABLE [dbo].[usm_link_rtapp_account] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000251d00000000] FOREIGN KEY ([account_id])
REFERENCES [dbo].[usm_account] ([account_id])
GO
ALTER TABLE [dbo].[usm_link_rtapp_account] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000251d00000000]
GO
--SqlScripter----[dbo].[usm_link_rtapp_account].[$usm_l_r0000252700000000].sql
GO
ALTER TABLE [dbo].[usm_link_rtapp_account] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000252700000000] FOREIGN KEY ([runtime_application_id])
REFERENCES [dbo].[usm_runtime_application] ([runtime_application_id])
GO
ALTER TABLE [dbo].[usm_link_rtapp_account] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000252700000000]
GO
--SqlScripter----[dbo].[usm_link_schema_component].[$usm_l_r0000253100000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_component] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000253100000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_link_schema_component] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000253100000000]
GO
--SqlScripter----[dbo].[usm_link_schema_component].[$usm_l_r0000253b00000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_component] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000253b00000000] FOREIGN KEY ([schema_comp_id])
REFERENCES [dbo].[usm_schema_comp] ([schema_comp_id])
GO
ALTER TABLE [dbo].[usm_link_schema_component] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000253b00000000]
GO
--SqlScripter----[dbo].[usm_link_schema_inst_metr_cat].[$usm_l_r0000254500000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_inst_metr_cat] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000254500000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_link_schema_inst_metr_cat] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000254500000000]
GO
--SqlScripter----[dbo].[usm_link_schema_inst_metr_cat].[$usm_l_r0000254f00000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_inst_metr_cat] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000254f00000000] FOREIGN KEY ([schema_instance_id])
REFERENCES [dbo].[usm_schema_instance] ([schema_instance_id])
GO
ALTER TABLE [dbo].[usm_link_schema_inst_metr_cat] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000254f00000000]
GO
--SqlScripter----[dbo].[usm_link_schema_metr_category].[$usm_l_r0000255900000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_metr_category] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000255900000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_link_schema_metr_category] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000255900000000]
GO
--SqlScripter----[dbo].[usm_link_schema_metr_category].[$usm_l_r0000256300000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_metr_category] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000256300000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_link_schema_metr_category] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000256300000000]
GO
--SqlScripter----[dbo].[usm_link_schema_slo_template].[$usm_l_r0000256d00000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_slo_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000256d00000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_link_schema_slo_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000256d00000000]
GO
--SqlScripter----[dbo].[usm_link_schema_slo_template].[$usm_l_r0000257700000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_slo_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000257700000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_link_schema_slo_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000257700000000]
GO
--SqlScripter----[dbo].[usm_link_schema_slo_template].[$usm_l_r0000305d00000000].sql
GO
ALTER TABLE [dbo].[usm_link_schema_slo_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000305d00000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_link_schema_slo_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000305d00000000]
GO
--SqlScripter----[dbo].[usm_link_scope_layout].[$usm_l_r0000258100000000].sql
GO
ALTER TABLE [dbo].[usm_link_scope_layout] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000258100000000] FOREIGN KEY ([report_layout_id])
REFERENCES [dbo].[usm_report_layout] ([report_layout_id])
GO
ALTER TABLE [dbo].[usm_link_scope_layout] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000258100000000]
GO
--SqlScripter----[dbo].[usm_link_scope_layout].[$usm_l_r0000258b00000000].sql
GO
ALTER TABLE [dbo].[usm_link_scope_layout] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000258b00000000] FOREIGN KEY ([scope_id])
REFERENCES [dbo].[usm_scope] ([scope_id])
GO
ALTER TABLE [dbo].[usm_link_scope_layout] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000258b00000000]
GO
--SqlScripter----[dbo].[usm_link_server_systeminstall].[$usm_l_r0000259500000000].sql
GO
ALTER TABLE [dbo].[usm_link_server_systeminstall] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000259500000000] FOREIGN KEY ([server_id])
REFERENCES [dbo].[usm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_link_server_systeminstall] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000259500000000]
GO
--SqlScripter----[dbo].[usm_link_server_systeminstall].[$usm_l_r0000259f00000000].sql
GO
ALTER TABLE [dbo].[usm_link_server_systeminstall] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000259f00000000] FOREIGN KEY ([system_install_id])
REFERENCES [dbo].[usm_system_install] ([system_install_id])
GO
ALTER TABLE [dbo].[usm_link_server_systeminstall] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000259f00000000]
GO
--SqlScripter----[dbo].[usm_link_service_event].[$usm_l_r00002ee100000000].sql
GO
ALTER TABLE [dbo].[usm_link_service_event] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002ee100000000] FOREIGN KEY ([calendar_oid])
REFERENCES [dbo].[usm_calendar] ([calendar_oid])
GO
ALTER TABLE [dbo].[usm_link_service_event] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002ee100000000]
GO
--SqlScripter----[dbo].[usm_link_service_event].[$usm_l_r00002eeb00000000].sql
GO
ALTER TABLE [dbo].[usm_link_service_event] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002eeb00000000] FOREIGN KEY ([contract_id])
REFERENCES [dbo].[usm_contract] ([contract_id])
GO
ALTER TABLE [dbo].[usm_link_service_event] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002eeb00000000]
GO
--SqlScripter----[dbo].[usm_link_service_event_metr_in].[$usm_l_r000025a900000000].sql
GO
ALTER TABLE [dbo].[usm_link_service_event_metr_in] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025a900000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_link_service_event_metr_in] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025a900000000]
GO
--SqlScripter----[dbo].[usm_link_service_event_metr_in].[$usm_l_r000025b300000000].sql
GO
ALTER TABLE [dbo].[usm_link_service_event_metr_in] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025b300000000] FOREIGN KEY ([service_event_id])
REFERENCES [dbo].[usm_service_event] ([service_event_id])
GO
ALTER TABLE [dbo].[usm_link_service_event_metr_in] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025b300000000]
GO
--SqlScripter----[dbo].[usm_link_service_event_ticket].[$usm_l_r000025bd00000000].sql
GO
ALTER TABLE [dbo].[usm_link_service_event_ticket] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025bd00000000] FOREIGN KEY ([service_event_id])
REFERENCES [dbo].[usm_service_event] ([service_event_id])
GO
ALTER TABLE [dbo].[usm_link_service_event_ticket] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025bd00000000]
GO
--SqlScripter----[dbo].[usm_link_service_event_ticket].[$usm_l_r000025c700000000].sql
GO
ALTER TABLE [dbo].[usm_link_service_event_ticket] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025c700000000] FOREIGN KEY ([service_desk_ticket_id])
REFERENCES [dbo].[usm_service_desk_ticket] ([service_desk_ticket_id])
GO
ALTER TABLE [dbo].[usm_link_service_event_ticket] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025c700000000]
GO
--SqlScripter----[dbo].[usm_link_slo_instance_instance].[$usm_l_r00002d7900000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_instance_instance] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d7900000000] FOREIGN KEY ([slo_instance_id])
REFERENCES [dbo].[usm_slo_instance] ([slo_instance_id])
GO
ALTER TABLE [dbo].[usm_link_slo_instance_instance] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d7900000000]
GO
--SqlScripter----[dbo].[usm_link_slo_instance_instance].[$usm_l_r00002d8300000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_instance_instance] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002d8300000000] FOREIGN KEY ([slo_instance_parent_id])
REFERENCES [dbo].[usm_slo_instance] ([slo_instance_id])
GO
ALTER TABLE [dbo].[usm_link_slo_instance_instance] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002d8300000000]
GO
--SqlScripter----[dbo].[usm_link_slo_package_template].[$usm_l_r000025d100000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_package_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025d100000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_link_slo_package_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025d100000000]
GO
--SqlScripter----[dbo].[usm_link_slo_package_template].[$usm_l_r000025db00000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_package_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025db00000000] FOREIGN KEY ([slo_package_id])
REFERENCES [dbo].[usm_slo_package] ([slo_package_id])
GO
ALTER TABLE [dbo].[usm_link_slo_package_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025db00000000]
GO
--SqlScripter----[dbo].[usm_link_slo_package_template].[$usm_l_r0000304900000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_package_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000304900000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_link_slo_package_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000304900000000]
GO
--SqlScripter----[dbo].[usm_link_slo_template_template].[$usm_l_r000025e500000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025e500000000] FOREIGN KEY ([slo_template_parent_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025e500000000]
GO
--SqlScripter----[dbo].[usm_link_slo_template_template].[$usm_l_r000025ef00000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025ef00000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025ef00000000]
GO
--SqlScripter----[dbo].[usm_link_slo_template_template].[$usm_l_r0000303500000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000303500000000] FOREIGN KEY ([slo_template_parent_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000303500000000]
GO
--SqlScripter----[dbo].[usm_link_slo_template_template].[$usm_l_r0000303f00000000].sql
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000303f00000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_link_slo_template_template] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000303f00000000]
GO
--SqlScripter----[dbo].[usm_link_subscription_asset].[$usm_l_r000025f900000000].sql
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] WITH NOCHECK ADD CONSTRAINT [$usm_l_r000025f900000000] FOREIGN KEY ([request_id])
REFERENCES [dbo].[usm_request] ([request_id])
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] WITH CHECK CHECK CONSTRAINT [$usm_l_r000025f900000000]
GO
--SqlScripter----[dbo].[usm_link_subscription_asset].[$usm_l_r0000260300000000].sql
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000260300000000] FOREIGN KEY ([request_item_id])
REFERENCES [dbo].[usm_subscription_detail] ([id])
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000260300000000]
GO
--SqlScripter----[dbo].[usm_link_subscription_asset].[$usm_l_r00002fbd00000000].sql
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002fbd00000000] FOREIGN KEY ([request_id])
REFERENCES [dbo].[usm_request] ([request_id])
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002fbd00000000]
GO
--SqlScripter----[dbo].[usm_link_subscription_asset].[$usm_l_r00002fdb00000000].sql
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] WITH NOCHECK ADD CONSTRAINT [$usm_l_r00002fdb00000000] FOREIGN KEY ([request_item_id])
REFERENCES [dbo].[usm_subscription_detail] ([id])
GO
ALTER TABLE [dbo].[usm_link_subscription_asset] WITH CHECK CHECK CONSTRAINT [$usm_l_r00002fdb00000000]
GO
--SqlScripter----[dbo].[usm_link_sysinstall_installcom].[$usm_l_r0000260d00000000].sql
GO
ALTER TABLE [dbo].[usm_link_sysinstall_installcom] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000260d00000000] FOREIGN KEY ([system_install_id])
REFERENCES [dbo].[usm_system_install] ([system_install_id])
GO
ALTER TABLE [dbo].[usm_link_sysinstall_installcom] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000260d00000000]
GO
--SqlScripter----[dbo].[usm_link_sysinstall_installcom].[$usm_l_r0000261700000000].sql
GO
ALTER TABLE [dbo].[usm_link_sysinstall_installcom] WITH NOCHECK ADD CONSTRAINT [$usm_l_r0000261700000000] FOREIGN KEY ([installed_component_id])
REFERENCES [dbo].[usm_installed_component] ([installed_component_id])
GO
ALTER TABLE [dbo].[usm_link_sysinstall_installcom] WITH CHECK CHECK CONSTRAINT [$usm_l_r0000261700000000]
GO
--SqlScripter----[dbo].[usm_meter_gui_cfg].[$usm_m_r0000262100000000].sql
GO
ALTER TABLE [dbo].[usm_meter_gui_cfg] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000262100000000] FOREIGN KEY ([guinode_id])
REFERENCES [dbo].[usm_guinode] ([guinode_id])
GO
ALTER TABLE [dbo].[usm_meter_gui_cfg] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000262100000000]
GO
--SqlScripter----[dbo].[usm_metering_package].[$usm_m_r0000262b00000000].sql
GO
ALTER TABLE [dbo].[usm_metering_package] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000262b00000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_metering_package] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000262b00000000]
GO
--SqlScripter----[dbo].[usm_method].[$usm_m_r0000263500000000].sql
GO
ALTER TABLE [dbo].[usm_method] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000263500000000] FOREIGN KEY ([guinode_id])
REFERENCES [dbo].[usm_guinode] ([guinode_id])
GO
ALTER TABLE [dbo].[usm_method] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000263500000000]
GO
--SqlScripter----[dbo].[usm_method_input].[$usm_m_r0000263f00000000].sql
GO
ALTER TABLE [dbo].[usm_method_input] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000263f00000000] FOREIGN KEY ([method_id])
REFERENCES [dbo].[usm_method] ([method_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_method_input] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000263f00000000]
GO
--SqlScripter----[dbo].[usm_method_optional_input].[$usm_m_r0000264900000000].sql
GO
ALTER TABLE [dbo].[usm_method_optional_input] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000264900000000] FOREIGN KEY ([method_id])
REFERENCES [dbo].[usm_method] ([method_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_method_optional_input] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000264900000000]
GO
--SqlScripter----[dbo].[usm_metric].[$usm_m_r0000265300000000].sql
GO
ALTER TABLE [dbo].[usm_metric] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000265300000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_metric] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000265300000000]
GO
--SqlScripter----[dbo].[usm_metric].[$usm_m_r0000265d00000000].sql
GO
ALTER TABLE [dbo].[usm_metric] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000265d00000000] FOREIGN KEY ([metric_folder_id])
REFERENCES [dbo].[usm_metric_folder] ([metric_folder_id])
GO
ALTER TABLE [dbo].[usm_metric] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000265d00000000]
GO
--SqlScripter----[dbo].[usm_metric].[$usm_m_r0000266700000000].sql
GO
ALTER TABLE [dbo].[usm_metric] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000266700000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_metric] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000266700000000]
GO
--SqlScripter----[dbo].[usm_metric].[$usm_m_r0000267100000000].sql
GO
ALTER TABLE [dbo].[usm_metric] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000267100000000] FOREIGN KEY ([collector_id])
REFERENCES [dbo].[usm_collector] ([collector_id])
GO
ALTER TABLE [dbo].[usm_metric] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000267100000000]
GO
--SqlScripter----[dbo].[usm_metric_analyzer_attrs].[$usm_m_r0000267b00000000].sql
GO
ALTER TABLE [dbo].[usm_metric_analyzer_attrs] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000267b00000000] FOREIGN KEY ([metric_analyzer_id])
REFERENCES [dbo].[usm_metric_analyzer] ([metric_analyzer_id])
GO
ALTER TABLE [dbo].[usm_metric_analyzer_attrs] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000267b00000000]
GO
--SqlScripter----[dbo].[usm_metric_analyzer_attrs].[$usm_m_r00002ef500000000].sql
GO
ALTER TABLE [dbo].[usm_metric_analyzer_attrs] WITH NOCHECK ADD CONSTRAINT [$usm_m_r00002ef500000000] FOREIGN KEY ([metric_analyzer_id])
REFERENCES [dbo].[usm_metric_analyzer] ([metric_analyzer_id])
GO
ALTER TABLE [dbo].[usm_metric_analyzer_attrs] WITH CHECK CHECK CONSTRAINT [$usm_m_r00002ef500000000]
GO
--SqlScripter----[dbo].[usm_metric_attr_spec].[$usm_m_r0000268500000000].sql
GO
ALTER TABLE [dbo].[usm_metric_attr_spec] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000268500000000] FOREIGN KEY ([attr_reference_plugin_id])
REFERENCES [dbo].[usm_attr_reference_plugin] ([attr_reference_plugin_id])
GO
ALTER TABLE [dbo].[usm_metric_attr_spec] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000268500000000]
GO
--SqlScripter----[dbo].[usm_metric_attr_spec].[$usm_m_r0000268f00000000].sql
GO
ALTER TABLE [dbo].[usm_metric_attr_spec] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000268f00000000] FOREIGN KEY ([metric_id])
REFERENCES [dbo].[usm_metric] ([metric_id])
GO
ALTER TABLE [dbo].[usm_metric_attr_spec] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000268f00000000]
GO
--SqlScripter----[dbo].[usm_metric_attr_spec_value].[$usm_m_r0000269900000000].sql
GO
ALTER TABLE [dbo].[usm_metric_attr_spec_value] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000269900000000] FOREIGN KEY ([metric_attr_spec_id])
REFERENCES [dbo].[usm_metric_attr_spec] ([metric_attr_spec_id])
GO
ALTER TABLE [dbo].[usm_metric_attr_spec_value] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000269900000000]
GO
--SqlScripter----[dbo].[usm_metric_attr_value].[$usm_m_r000026a300000000].sql
GO
ALTER TABLE [dbo].[usm_metric_attr_value] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026a300000000] FOREIGN KEY ([attr_reference_plugin_id])
REFERENCES [dbo].[usm_attr_reference_plugin] ([attr_reference_plugin_id])
GO
ALTER TABLE [dbo].[usm_metric_attr_value] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026a300000000]
GO
--SqlScripter----[dbo].[usm_metric_attr_value].[$usm_m_r000026ad00000000].sql
GO
ALTER TABLE [dbo].[usm_metric_attr_value] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026ad00000000] FOREIGN KEY ([metric_attr_spec_id])
REFERENCES [dbo].[usm_metric_attr_spec] ([metric_attr_spec_id])
GO
ALTER TABLE [dbo].[usm_metric_attr_value] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026ad00000000]
GO
--SqlScripter----[dbo].[usm_metric_category].[$usm_m_r000026b700000000].sql
GO
ALTER TABLE [dbo].[usm_metric_category] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026b700000000] FOREIGN KEY ([metric_analyzer_id])
REFERENCES [dbo].[usm_metric_analyzer] ([metric_analyzer_id])
GO
ALTER TABLE [dbo].[usm_metric_category] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026b700000000]
GO
--SqlScripter----[dbo].[usm_metric_category].[$usm_m_r000026c100000000].sql
GO
ALTER TABLE [dbo].[usm_metric_category] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026c100000000] FOREIGN KEY ([unit_type_id])
REFERENCES [dbo].[usm_unittype] ([unittype_id])
GO
ALTER TABLE [dbo].[usm_metric_category] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026c100000000]
GO
--SqlScripter----[dbo].[usm_metric_category].[$usm_m_r000026cb00000000].sql
GO
ALTER TABLE [dbo].[usm_metric_category] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026cb00000000] FOREIGN KEY ([meter_gui_config_id])
REFERENCES [dbo].[usm_meter_gui_cfg] ([meter_gui_config_id])
GO
ALTER TABLE [dbo].[usm_metric_category] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026cb00000000]
GO
--SqlScripter----[dbo].[usm_metric_folder].[$usm_m_r000026d500000000].sql
GO
ALTER TABLE [dbo].[usm_metric_folder] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026d500000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_metric_folder] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026d500000000]
GO
--SqlScripter----[dbo].[usm_metric_instance].[$usm_m_r000026df00000000].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026df00000000] FOREIGN KEY ([source_metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026df00000000]
GO
--SqlScripter----[dbo].[usm_metric_instance].[$usm_m_r000026e900000000].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026e900000000] FOREIGN KEY ([source_analyze_job_id])
REFERENCES [dbo].[usm_analyze_job] ([analyze_job_id])
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026e900000000]
GO
--SqlScripter----[dbo].[usm_metric_instance].[$usm_m_r000026f300000000].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026f300000000] FOREIGN KEY ([server_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026f300000000]
GO
--SqlScripter----[dbo].[usm_metric_instance].[$usm_m_r000026fd00000000].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_m_r000026fd00000000] FOREIGN KEY ([unittype_id])
REFERENCES [dbo].[usm_unittype] ([unittype_id])
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_m_r000026fd00000000]
GO
--SqlScripter----[dbo].[usm_metric_instance].[$usm_m_r0000270700000000].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000270700000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000270700000000]
GO
--SqlScripter----[dbo].[usm_metric_instance].[$usm_m_r0000271100000000].sql
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000271100000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000271100000000]
GO
--SqlScripter----[dbo].[usm_metric_instance_appuser].[$usm_m_r0000271b00000000].sql
GO
ALTER TABLE [dbo].[usm_metric_instance_appuser] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000271b00000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_metric_instance_appuser] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000271b00000000]
GO
--SqlScripter----[dbo].[usm_metric_resultxxxxx].[$usm_m_r0000272500000000].sql
GO
ALTER TABLE [dbo].[usm_metric_resultxxxxx] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000272500000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_metric_resultxxxxx] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000272500000000]
GO
--SqlScripter----[dbo].[usm_mr_ievent_load].[$usm_m_r00002d8d00000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ievent_load] WITH NOCHECK ADD CONSTRAINT [$usm_m_r00002d8d00000000] FOREIGN KEY ([file_id])
REFERENCES [dbo].[usm_mr_ifile] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ievent_load] WITH CHECK CHECK CONSTRAINT [$usm_m_r00002d8d00000000]
GO
--SqlScripter----[dbo].[usm_mr_ievent_load].[$usm_m_r00002d9700000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ievent_load] WITH NOCHECK ADD CONSTRAINT [$usm_m_r00002d9700000000] FOREIGN KEY ([import_id])
REFERENCES [dbo].[usm_mr_import] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ievent_load] WITH CHECK CHECK CONSTRAINT [$usm_m_r00002d9700000000]
GO
--SqlScripter----[dbo].[usm_mr_ifield].[$usm_m_r0000272f00000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ifield] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000272f00000000] FOREIGN KEY ([ftype_id])
REFERENCES [dbo].[usm_mr_iftype] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ifield] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000272f00000000]
GO
--SqlScripter----[dbo].[usm_mr_ifield].[$usm_m_r0000273900000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ifield] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000273900000000] FOREIGN KEY ([table_id])
REFERENCES [dbo].[usm_mr_itable] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ifield] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000273900000000]
GO
--SqlScripter----[dbo].[usm_mr_ifield].[$usm_m_r00002f8b00000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ifield] WITH NOCHECK ADD CONSTRAINT [$usm_m_r00002f8b00000000] FOREIGN KEY ([table_id])
REFERENCES [dbo].[usm_mr_itable] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ifield] WITH CHECK CHECK CONSTRAINT [$usm_m_r00002f8b00000000]
GO
--SqlScripter----[dbo].[usm_mr_ifile].[$usm_m_r0000274300000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ifile] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000274300000000] FOREIGN KEY ([table_id])
REFERENCES [dbo].[usm_mr_itable] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ifile] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000274300000000]
GO
--SqlScripter----[dbo].[usm_mr_ifile].[$usm_m_r00002db500000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ifile] WITH NOCHECK ADD CONSTRAINT [$usm_m_r00002db500000000] FOREIGN KEY ([table_id])
REFERENCES [dbo].[usm_mr_itable] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ifile] WITH CHECK CHECK CONSTRAINT [$usm_m_r00002db500000000]
GO
--SqlScripter----[dbo].[usm_mr_imap].[$usm_m_r0000274d00000000].sql
GO
ALTER TABLE [dbo].[usm_mr_imap] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000274d00000000] FOREIGN KEY ([mkey])
REFERENCES [dbo].[usm_mr_iftype] ([id])
GO
ALTER TABLE [dbo].[usm_mr_imap] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000274d00000000]
GO
--SqlScripter----[dbo].[usm_mr_import].[$usm_m_r0000275700000000].sql
GO
ALTER TABLE [dbo].[usm_mr_import] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000275700000000] FOREIGN KEY ([table_id])
REFERENCES [dbo].[usm_mr_itable] ([id])
GO
ALTER TABLE [dbo].[usm_mr_import] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000275700000000]
GO
--SqlScripter----[dbo].[usm_mr_import].[$usm_m_r00002dbf00000000].sql
GO
ALTER TABLE [dbo].[usm_mr_import] WITH NOCHECK ADD CONSTRAINT [$usm_m_r00002dbf00000000] FOREIGN KEY ([table_id])
REFERENCES [dbo].[usm_mr_itable] ([id])
GO
ALTER TABLE [dbo].[usm_mr_import] WITH CHECK CHECK CONSTRAINT [$usm_m_r00002dbf00000000]
GO
--SqlScripter----[dbo].[usm_mr_ivalue].[$usm_m_r0000276100000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ivalue] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000276100000000] FOREIGN KEY ([ftype_id])
REFERENCES [dbo].[usm_mr_iftype] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ivalue] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000276100000000]
GO
--SqlScripter----[dbo].[usm_mr_ivalue].[$usm_m_r0000276b00000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ivalue] WITH NOCHECK ADD CONSTRAINT [$usm_m_r0000276b00000000] FOREIGN KEY ([file_id])
REFERENCES [dbo].[usm_mr_ifile] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ivalue] WITH CHECK CHECK CONSTRAINT [$usm_m_r0000276b00000000]
GO
--SqlScripter----[dbo].[usm_mr_ivalue].[$usm_m_r00002f8100000000].sql
GO
ALTER TABLE [dbo].[usm_mr_ivalue] WITH NOCHECK ADD CONSTRAINT [$usm_m_r00002f8100000000] FOREIGN KEY ([file_id])
REFERENCES [dbo].[usm_mr_ifile] ([id])
GO
ALTER TABLE [dbo].[usm_mr_ivalue] WITH CHECK CHECK CONSTRAINT [$usm_m_r00002f8100000000]
GO
--SqlScripter----[dbo].[usm_note].[$usm_n_r0000277500000000].sql
GO
ALTER TABLE [dbo].[usm_note] WITH NOCHECK ADD CONSTRAINT [$usm_n_r0000277500000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_note] WITH CHECK CHECK CONSTRAINT [$usm_n_r0000277500000000]
GO
--SqlScripter----[dbo].[usm_note].[$usm_n_r00002dc900000000].sql
GO
ALTER TABLE [dbo].[usm_note] WITH NOCHECK ADD CONSTRAINT [$usm_n_r00002dc900000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_note] WITH CHECK CHECK CONSTRAINT [$usm_n_r00002dc900000000]
GO
--SqlScripter----[dbo].[usm_offering].[$usm_o_r0000277f00000000].sql
GO
ALTER TABLE [dbo].[usm_offering] WITH NOCHECK ADD CONSTRAINT [$usm_o_r0000277f00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_offering] WITH CHECK CHECK CONSTRAINT [$usm_o_r0000277f00000000]
GO
--SqlScripter----[dbo].[usm_offering].[$usm_o_r00002dd300000000].sql
GO
ALTER TABLE [dbo].[usm_offering] WITH NOCHECK ADD CONSTRAINT [$usm_o_r00002dd300000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_offering] WITH CHECK CHECK CONSTRAINT [$usm_o_r00002dd300000000]
GO
--SqlScripter----[dbo].[usm_offering_ratedef_inclusion].[$usm_o_r0000279300000000].sql
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_o_r0000279300000000] FOREIGN KEY ([child_id])
REFERENCES [dbo].[usm_rate_definition] ([item_id])
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_o_r0000279300000000]
GO
--SqlScripter----[dbo].[usm_offering_ratedef_inclusion].[$usm_o_r0000279d00000000].sql
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_o_r0000279d00000000] FOREIGN KEY ([parent_id])
REFERENCES [dbo].[usm_offering] ([offering_id])
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_o_r0000279d00000000]
GO
--SqlScripter----[dbo].[usm_offering_ratedef_inclusion].[$usm_o_r000027a700000000].sql
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_o_r000027a700000000] FOREIGN KEY ([rate_plan_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_o_r000027a700000000]
GO
--SqlScripter----[dbo].[usm_offering_ratedef_inclusion].[$usm_o_r00002f9500000000].sql
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_o_r00002f9500000000] FOREIGN KEY ([parent_id])
REFERENCES [dbo].[usm_offering] ([offering_id])
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_o_r00002f9500000000]
GO
--SqlScripter----[dbo].[usm_offering_ratedef_inclusion].[$usm_o_r00002fa900000000].sql
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_o_r00002fa900000000] FOREIGN KEY ([rate_plan_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_offering_ratedef_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_o_r00002fa900000000]
GO
--SqlScripter----[dbo].[usm_offering_rplan_inclusion].[$usm_o_r00002d0100000000].sql
GO
ALTER TABLE [dbo].[usm_offering_rplan_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_o_r00002d0100000000] FOREIGN KEY ([child_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_offering_rplan_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_o_r00002d0100000000]
GO
--SqlScripter----[dbo].[usm_offering_rplan_inclusion].[$usm_o_r00002d0b00000000].sql
GO
ALTER TABLE [dbo].[usm_offering_rplan_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_o_r00002d0b00000000] FOREIGN KEY ([parent_id])
REFERENCES [dbo].[usm_offering] ([offering_id])
GO
ALTER TABLE [dbo].[usm_offering_rplan_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_o_r00002d0b00000000]
GO
--SqlScripter----[dbo].[usm_onetime_event].[$usm_o_r000027b100000000].sql
GO
ALTER TABLE [dbo].[usm_onetime_event] WITH NOCHECK ADD CONSTRAINT [$usm_o_r000027b100000000] FOREIGN KEY ([event_category_value_oid])
REFERENCES [dbo].[usm_event_category_value] ([event_category_value_oid])
GO
ALTER TABLE [dbo].[usm_onetime_event] WITH CHECK CHECK CONSTRAINT [$usm_o_r000027b100000000]
GO
--SqlScripter----[dbo].[usm_onetime_event].[$usm_o_r000027bb00000000].sql
GO
ALTER TABLE [dbo].[usm_onetime_event] WITH NOCHECK ADD CONSTRAINT [$usm_o_r000027bb00000000] FOREIGN KEY ([recurring_event_oid])
REFERENCES [dbo].[usm_recurring_event] ([recurring_event_oid])
GO
ALTER TABLE [dbo].[usm_onetime_event] WITH CHECK CHECK CONSTRAINT [$usm_o_r000027bb00000000]
GO
--SqlScripter----[dbo].[usm_onetime_event].[$usm_o_r000027c500000000].sql
GO
ALTER TABLE [dbo].[usm_onetime_event] WITH NOCHECK ADD CONSTRAINT [$usm_o_r000027c500000000] FOREIGN KEY ([event_category_oid])
REFERENCES [dbo].[usm_event_category] ([event_category_oid])
GO
ALTER TABLE [dbo].[usm_onetime_event] WITH CHECK CHECK CONSTRAINT [$usm_o_r000027c500000000]
GO
--SqlScripter----[dbo].[usm_onetime_event].[$usm_o_r000027cf00000000].sql
GO
ALTER TABLE [dbo].[usm_onetime_event] WITH NOCHECK ADD CONSTRAINT [$usm_o_r000027cf00000000] FOREIGN KEY ([calendar_oid])
REFERENCES [dbo].[usm_calendar] ([calendar_oid])
GO
ALTER TABLE [dbo].[usm_onetime_event] WITH CHECK CHECK CONSTRAINT [$usm_o_r000027cf00000000]
GO
--SqlScripter----[dbo].[usm_payment_method].[$usm_p_r000027d900000000].sql
GO
ALTER TABLE [dbo].[usm_payment_method] WITH NOCHECK ADD CONSTRAINT [$usm_p_r000027d900000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_payment_method] WITH CHECK CHECK CONSTRAINT [$usm_p_r000027d900000000]
GO
--SqlScripter----[dbo].[usm_plan].[$usm_p_r000027e300000000].sql
GO
ALTER TABLE [dbo].[usm_plan] WITH NOCHECK ADD CONSTRAINT [$usm_p_r000027e300000000] FOREIGN KEY ([pd_id])
REFERENCES [dbo].[usm_plan_def] ([pd_id])
GO
ALTER TABLE [dbo].[usm_plan] WITH CHECK CHECK CONSTRAINT [$usm_p_r000027e300000000]
GO
--SqlScripter----[dbo].[usm_plan_data].[$usm_p_r000027ed00000000].sql
GO
ALTER TABLE [dbo].[usm_plan_data] WITH NOCHECK ADD CONSTRAINT [$usm_p_r000027ed00000000] FOREIGN KEY ([cp_id])
REFERENCES [dbo].[usm_cost_pool] ([cp_id])
GO
ALTER TABLE [dbo].[usm_plan_data] WITH CHECK CHECK CONSTRAINT [$usm_p_r000027ed00000000]
GO
--SqlScripter----[dbo].[usm_plan_data].[$usm_p_r000027f700000000].sql
GO
ALTER TABLE [dbo].[usm_plan_data] WITH NOCHECK ADD CONSTRAINT [$usm_p_r000027f700000000] FOREIGN KEY ([ps_id])
REFERENCES [dbo].[usm_planning_set] ([ps_id])
GO
ALTER TABLE [dbo].[usm_plan_data] WITH CHECK CHECK CONSTRAINT [$usm_p_r000027f700000000]
GO
--SqlScripter----[dbo].[usm_plan_data].[$usm_p_r0000280100000000].sql
GO
ALTER TABLE [dbo].[usm_plan_data] WITH NOCHECK ADD CONSTRAINT [$usm_p_r0000280100000000] FOREIGN KEY ([fp_id])
REFERENCES [dbo].[usm_fiscal_period] ([fp_id])
GO
ALTER TABLE [dbo].[usm_plan_data] WITH CHECK CHECK CONSTRAINT [$usm_p_r0000280100000000]
GO
--SqlScripter----[dbo].[usm_plan_data].[$usm_p_r00002de700000000].sql
GO
ALTER TABLE [dbo].[usm_plan_data] WITH NOCHECK ADD CONSTRAINT [$usm_p_r00002de700000000] FOREIGN KEY ([cp_id])
REFERENCES [dbo].[usm_cost_pool] ([cp_id])
GO
ALTER TABLE [dbo].[usm_plan_data] WITH CHECK CHECK CONSTRAINT [$usm_p_r00002de700000000]
GO
--SqlScripter----[dbo].[usm_plan_data].[$usm_p_r00002df100000000].sql
GO
ALTER TABLE [dbo].[usm_plan_data] WITH NOCHECK ADD CONSTRAINT [$usm_p_r00002df100000000] FOREIGN KEY ([ps_id])
REFERENCES [dbo].[usm_planning_set] ([ps_id])
GO
ALTER TABLE [dbo].[usm_plan_data] WITH CHECK CHECK CONSTRAINT [$usm_p_r00002df100000000]
GO
--SqlScripter----[dbo].[usm_plan_data].[$usm_p_r00002dfb00000000].sql
GO
ALTER TABLE [dbo].[usm_plan_data] WITH NOCHECK ADD CONSTRAINT [$usm_p_r00002dfb00000000] FOREIGN KEY ([fp_id])
REFERENCES [dbo].[usm_fiscal_period] ([fp_id])
GO
ALTER TABLE [dbo].[usm_plan_data] WITH CHECK CHECK CONSTRAINT [$usm_p_r00002dfb00000000]
GO
--SqlScripter----[dbo].[usm_plan_def].[$usm_p_r0000280b00000000].sql
GO
ALTER TABLE [dbo].[usm_plan_def] WITH NOCHECK ADD CONSTRAINT [$usm_p_r0000280b00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_plan_def] WITH CHECK CHECK CONSTRAINT [$usm_p_r0000280b00000000]
GO
--SqlScripter----[dbo].[usm_planning_set].[$usm_p_r0000281500000000].sql
GO
ALTER TABLE [dbo].[usm_planning_set] WITH NOCHECK ADD CONSTRAINT [$usm_p_r0000281500000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_planning_set] WITH CHECK CHECK CONSTRAINT [$usm_p_r0000281500000000]
GO
--SqlScripter----[dbo].[usm_planning_set].[$usm_p_r00002e0500000000].sql
GO
ALTER TABLE [dbo].[usm_planning_set] WITH NOCHECK ADD CONSTRAINT [$usm_p_r00002e0500000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_planning_set] WITH CHECK CHECK CONSTRAINT [$usm_p_r00002e0500000000]
GO
--SqlScripter----[dbo].[usm_plugin].[$usm_p_r0000281f00000000].sql
GO
ALTER TABLE [dbo].[usm_plugin] WITH NOCHECK ADD CONSTRAINT [$usm_p_r0000281f00000000] FOREIGN KEY ([installed_subcomponent_id])
REFERENCES [dbo].[usm_installed_subcomponent] ([installed_subcomponent_id])
GO
ALTER TABLE [dbo].[usm_plugin] WITH CHECK CHECK CONSTRAINT [$usm_p_r0000281f00000000]
GO
--SqlScripter----[dbo].[usm_plugin_type].[$usm_p_r0000282900000000].sql
GO
ALTER TABLE [dbo].[usm_plugin_type] WITH NOCHECK ADD CONSTRAINT [$usm_p_r0000282900000000] FOREIGN KEY ([installed_subcomponent_id])
REFERENCES [dbo].[usm_installed_subcomponent] ([installed_subcomponent_id])
GO
ALTER TABLE [dbo].[usm_plugin_type] WITH CHECK CHECK CONSTRAINT [$usm_p_r0000282900000000]
GO
--SqlScripter----[dbo].[usm_portal_content].[$usm_p_r0000283300000000].sql
GO
ALTER TABLE [dbo].[usm_portal_content] WITH NOCHECK ADD CONSTRAINT [$usm_p_r0000283300000000] FOREIGN KEY ([portal_template_id])
REFERENCES [dbo].[usm_portal_template] ([portal_template_id])
GO
ALTER TABLE [dbo].[usm_portal_content] WITH CHECK CHECK CONSTRAINT [$usm_p_r0000283300000000]
GO
--SqlScripter----[dbo].[usm_portal_content].[$usm_p_r0000283d00000000].sql
GO
ALTER TABLE [dbo].[usm_portal_content] WITH NOCHECK ADD CONSTRAINT [$usm_p_r0000283d00000000] FOREIGN KEY ([dash_id])
REFERENCES [dbo].[usm_dash] ([dash_id])
GO
ALTER TABLE [dbo].[usm_portal_content] WITH CHECK CHECK CONSTRAINT [$usm_p_r0000283d00000000]
GO
--SqlScripter----[dbo].[usm_portal_content].[$usm_p_r00002fef00000000].sql
GO
ALTER TABLE [dbo].[usm_portal_content] WITH NOCHECK ADD CONSTRAINT [$usm_p_r00002fef00000000] FOREIGN KEY ([dash_id])
REFERENCES [dbo].[usm_dash] ([dash_id])
GO
ALTER TABLE [dbo].[usm_portal_content] WITH CHECK CHECK CONSTRAINT [$usm_p_r00002fef00000000]
GO
--SqlScripter----[dbo].[usm_portal_content].[$usm_p_r00002ff900000000].sql
GO
ALTER TABLE [dbo].[usm_portal_content] WITH NOCHECK ADD CONSTRAINT [$usm_p_r00002ff900000000] FOREIGN KEY ([portal_template_id])
REFERENCES [dbo].[usm_portal_template] ([portal_template_id])
GO
ALTER TABLE [dbo].[usm_portal_content] WITH CHECK CHECK CONSTRAINT [$usm_p_r00002ff900000000]
GO
--SqlScripter----[dbo].[usm_portal_template].[$usm_p_r0000284700000000].sql
GO
ALTER TABLE [dbo].[usm_portal_template] WITH NOCHECK ADD CONSTRAINT [$usm_p_r0000284700000000] FOREIGN KEY ([asset_id])
REFERENCES [dbo].[usm_asset] ([asset_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_portal_template] WITH CHECK CHECK CONSTRAINT [$usm_p_r0000284700000000]
GO
--SqlScripter----[dbo].[usm_queue_item_detail].[$usm_q_r0000285b00000000].sql
GO
ALTER TABLE [dbo].[usm_queue_item_detail] WITH NOCHECK ADD CONSTRAINT [$usm_q_r0000285b00000000] FOREIGN KEY ([queue_item_id], [created_time])
REFERENCES [dbo].[usm_queue_item] ([queue_item_id], [created_time])
GO
ALTER TABLE [dbo].[usm_queue_item_detail] WITH CHECK CHECK CONSTRAINT [$usm_q_r0000285b00000000]
GO
--SqlScripter----[dbo].[usm_queue_item_detail].[$usm_q_r00002e0f00000000].sql
GO
ALTER TABLE [dbo].[usm_queue_item_detail] WITH NOCHECK ADD CONSTRAINT [$usm_q_r00002e0f00000000] FOREIGN KEY ([queue_item_id], [created_time])
REFERENCES [dbo].[usm_queue_item] ([queue_item_id], [created_time])
GO
ALTER TABLE [dbo].[usm_queue_item_detail] WITH CHECK CHECK CONSTRAINT [$usm_q_r00002e0f00000000]
GO
--SqlScripter----[dbo].[usm_rate_plan].[$usm_r_r0000286500000000].sql
GO
ALTER TABLE [dbo].[usm_rate_plan] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000286500000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_rate_plan] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000286500000000]
GO
--SqlScripter----[dbo].[usm_rate_plan].[$usm_r_r00002e1900000000].sql
GO
ALTER TABLE [dbo].[usm_rate_plan] WITH NOCHECK ADD CONSTRAINT [$usm_r_r00002e1900000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_rate_plan] WITH CHECK CHECK CONSTRAINT [$usm_r_r00002e1900000000]
GO
--SqlScripter----[dbo].[usm_rateplan_inclusion].[$usm_r_r0000286f00000000].sql
GO
ALTER TABLE [dbo].[usm_rateplan_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000286f00000000] FOREIGN KEY ([child_id])
REFERENCES [dbo].[usm_rate_definition] ([item_id])
GO
ALTER TABLE [dbo].[usm_rateplan_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000286f00000000]
GO
--SqlScripter----[dbo].[usm_rateplan_inclusion].[$usm_r_r0000287900000000].sql
GO
ALTER TABLE [dbo].[usm_rateplan_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000287900000000] FOREIGN KEY ([parent_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_rateplan_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000287900000000]
GO
--SqlScripter----[dbo].[usm_rateplan_inclusion].[$usm_r_r00002fb300000000].sql
GO
ALTER TABLE [dbo].[usm_rateplan_inclusion] WITH NOCHECK ADD CONSTRAINT [$usm_r_r00002fb300000000] FOREIGN KEY ([parent_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_rateplan_inclusion] WITH CHECK CHECK CONSTRAINT [$usm_r_r00002fb300000000]
GO
--SqlScripter----[dbo].[usm_rateplan_inheritance].[$usm_r_r0000288300000000].sql
GO
ALTER TABLE [dbo].[usm_rateplan_inheritance] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000288300000000] FOREIGN KEY ([item_id])
REFERENCES [dbo].[usm_rate_definition] ([item_id])
GO
ALTER TABLE [dbo].[usm_rateplan_inheritance] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000288300000000]
GO
--SqlScripter----[dbo].[usm_rateplan_inheritance].[$usm_r_r0000288d00000000].sql
GO
ALTER TABLE [dbo].[usm_rateplan_inheritance] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000288d00000000] FOREIGN KEY ([derived_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_rateplan_inheritance] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000288d00000000]
GO
--SqlScripter----[dbo].[usm_rateplan_inheritance].[$usm_r_r00002f9f00000000].sql
GO
ALTER TABLE [dbo].[usm_rateplan_inheritance] WITH NOCHECK ADD CONSTRAINT [$usm_r_r00002f9f00000000] FOREIGN KEY ([derived_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_rateplan_inheritance] WITH CHECK CHECK CONSTRAINT [$usm_r_r00002f9f00000000]
GO
--SqlScripter----[dbo].[usm_recurring_event].[$usm_r_r0000289700000000].sql
GO
ALTER TABLE [dbo].[usm_recurring_event] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000289700000000] FOREIGN KEY ([event_category_value_oid])
REFERENCES [dbo].[usm_event_category_value] ([event_category_value_oid])
GO
ALTER TABLE [dbo].[usm_recurring_event] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000289700000000]
GO
--SqlScripter----[dbo].[usm_recurring_event].[$usm_r_r000028a100000000].sql
GO
ALTER TABLE [dbo].[usm_recurring_event] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028a100000000] FOREIGN KEY ([event_category_oid])
REFERENCES [dbo].[usm_event_category] ([event_category_oid])
GO
ALTER TABLE [dbo].[usm_recurring_event] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028a100000000]
GO
--SqlScripter----[dbo].[usm_recurring_event].[$usm_r_r000028ab00000000].sql
GO
ALTER TABLE [dbo].[usm_recurring_event] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028ab00000000] FOREIGN KEY ([pattern_type_oid])
REFERENCES [dbo].[usm_pattern_type] ([pattern_type_oid])
GO
ALTER TABLE [dbo].[usm_recurring_event] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028ab00000000]
GO
--SqlScripter----[dbo].[usm_recurring_event].[$usm_r_r000028b500000000].sql
GO
ALTER TABLE [dbo].[usm_recurring_event] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028b500000000] FOREIGN KEY ([calendar_oid])
REFERENCES [dbo].[usm_calendar] ([calendar_oid])
GO
ALTER TABLE [dbo].[usm_recurring_event] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028b500000000]
GO
--SqlScripter----[dbo].[usm_report_data].[$usm_r_r000028bf00000000].sql
GO
ALTER TABLE [dbo].[usm_report_data] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028bf00000000] FOREIGN KEY ([db_id])
REFERENCES [dbo].[usm_db] ([db_id])
GO
ALTER TABLE [dbo].[usm_report_data] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028bf00000000]
GO
--SqlScripter----[dbo].[usm_report_data].[$usm_r_r00002f1300000000].sql
GO
ALTER TABLE [dbo].[usm_report_data] WITH NOCHECK ADD CONSTRAINT [$usm_r_r00002f1300000000] FOREIGN KEY ([db_id])
REFERENCES [dbo].[usm_db] ([db_id])
GO
ALTER TABLE [dbo].[usm_report_data] WITH CHECK CHECK CONSTRAINT [$usm_r_r00002f1300000000]
GO
--SqlScripter----[dbo].[usm_report_dataview].[$usm_r_r000028c900000000].sql
GO
ALTER TABLE [dbo].[usm_report_dataview] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028c900000000] FOREIGN KEY ([guinode_id])
REFERENCES [dbo].[usm_guinode] ([guinode_id])
GO
ALTER TABLE [dbo].[usm_report_dataview] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028c900000000]
GO
--SqlScripter----[dbo].[usm_report_dataview].[$usm_r_r000028d300000000].sql
GO
ALTER TABLE [dbo].[usm_report_dataview] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028d300000000] FOREIGN KEY ([report_data_id])
REFERENCES [dbo].[usm_report_data] ([report_data_id])
GO
ALTER TABLE [dbo].[usm_report_dataview] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028d300000000]
GO
--SqlScripter----[dbo].[usm_report_dataview].[$usm_r_r0000300d00000000].sql
GO
ALTER TABLE [dbo].[usm_report_dataview] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000300d00000000] FOREIGN KEY ([report_data_id])
REFERENCES [dbo].[usm_report_data] ([report_data_id])
GO
ALTER TABLE [dbo].[usm_report_dataview] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000300d00000000]
GO
--SqlScripter----[dbo].[usm_report_dataview_field].[$usm_r_r000028dd00000000].sql
GO
ALTER TABLE [dbo].[usm_report_dataview_field] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028dd00000000] FOREIGN KEY ([report_dataview_id])
REFERENCES [dbo].[usm_report_dataview] ([report_dataview_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_report_dataview_field] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028dd00000000]
GO
--SqlScripter----[dbo].[usm_report_group].[$usm_r_r000028e700000000].sql
GO
ALTER TABLE [dbo].[usm_report_group] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028e700000000] FOREIGN KEY ([calendar_oid])
REFERENCES [dbo].[usm_calendar] ([calendar_oid])
GO
ALTER TABLE [dbo].[usm_report_group] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028e700000000]
GO
--SqlScripter----[dbo].[usm_report_group].[$usm_r_r000028f100000000].sql
GO
ALTER TABLE [dbo].[usm_report_group] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028f100000000] FOREIGN KEY ([contract_id])
REFERENCES [dbo].[usm_contract] ([contract_id])
GO
ALTER TABLE [dbo].[usm_report_group] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028f100000000]
GO
--SqlScripter----[dbo].[usm_report_group].[$usm_r_r000028fb00000000].sql
GO
ALTER TABLE [dbo].[usm_report_group] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000028fb00000000] FOREIGN KEY ([report_group_template_id])
REFERENCES [dbo].[usm_report_group_template] ([report_group_template_id])
GO
ALTER TABLE [dbo].[usm_report_group] WITH CHECK CHECK CONSTRAINT [$usm_r_r000028fb00000000]
GO
--SqlScripter----[dbo].[usm_report_group_goal].[$usm_r_r0000290500000000].sql
GO
ALTER TABLE [dbo].[usm_report_group_goal] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000290500000000] FOREIGN KEY ([report_group_id])
REFERENCES [dbo].[usm_report_group] ([report_group_id])
GO
ALTER TABLE [dbo].[usm_report_group_goal] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000290500000000]
GO
--SqlScripter----[dbo].[usm_report_group_goal].[$usm_r_r0000290f00000000].sql
GO
ALTER TABLE [dbo].[usm_report_group_goal] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000290f00000000] FOREIGN KEY ([service_goal_id])
REFERENCES [dbo].[usm_service_goal] ([service_goal_id])
GO
ALTER TABLE [dbo].[usm_report_group_goal] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000290f00000000]
GO
--SqlScripter----[dbo].[usm_report_group_metr_instance].[$usm_r_r0000291900000000].sql
GO
ALTER TABLE [dbo].[usm_report_group_metr_instance] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000291900000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_report_group_metr_instance] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000291900000000]
GO
--SqlScripter----[dbo].[usm_report_group_metr_instance].[$usm_r_r0000292300000000].sql
GO
ALTER TABLE [dbo].[usm_report_group_metr_instance] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000292300000000] FOREIGN KEY ([report_group_id])
REFERENCES [dbo].[usm_report_group] ([report_group_id])
GO
ALTER TABLE [dbo].[usm_report_group_metr_instance] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000292300000000]
GO
--SqlScripter----[dbo].[usm_report_group_template].[$usm_r_r0000292d00000000].sql
GO
ALTER TABLE [dbo].[usm_report_group_template] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000292d00000000] FOREIGN KEY ([slo_package_id])
REFERENCES [dbo].[usm_slo_package] ([slo_package_id])
GO
ALTER TABLE [dbo].[usm_report_group_template] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000292d00000000]
GO
--SqlScripter----[dbo].[usm_report_layout_obj_list].[$usm_r_r0000293700000000].sql
GO
ALTER TABLE [dbo].[usm_report_layout_obj_list] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000293700000000] FOREIGN KEY ([report_dataview_id])
REFERENCES [dbo].[usm_report_dataview] ([report_dataview_id])
GO
ALTER TABLE [dbo].[usm_report_layout_obj_list] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000293700000000]
GO
--SqlScripter----[dbo].[usm_report_layout_obj_list].[$usm_r_r0000294100000000].sql
GO
ALTER TABLE [dbo].[usm_report_layout_obj_list] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000294100000000] FOREIGN KEY ([report_layout_id])
REFERENCES [dbo].[usm_report_layout] ([report_layout_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_report_layout_obj_list] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000294100000000]
GO
--SqlScripter----[dbo].[usm_report_layout_obj_list].[$usm_r_r00002f1d00000000].sql
GO
ALTER TABLE [dbo].[usm_report_layout_obj_list] WITH NOCHECK ADD CONSTRAINT [$usm_r_r00002f1d00000000] FOREIGN KEY ([report_dataview_id])
REFERENCES [dbo].[usm_report_dataview] ([report_dataview_id])
GO
ALTER TABLE [dbo].[usm_report_layout_obj_list] WITH CHECK CHECK CONSTRAINT [$usm_r_r00002f1d00000000]
GO
--SqlScripter----[dbo].[usm_report_profile_attrs].[$usm_r_r0000294b00000000].sql
GO
ALTER TABLE [dbo].[usm_report_profile_attrs] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000294b00000000] FOREIGN KEY ([report_profile_id])
REFERENCES [dbo].[usm_report_profile] ([report_profile_id])
GO
ALTER TABLE [dbo].[usm_report_profile_attrs] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000294b00000000]
GO
--SqlScripter----[dbo].[usm_report_profile_spec_values].[$usm_r_r0000295500000000].sql
GO
ALTER TABLE [dbo].[usm_report_profile_spec_values] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000295500000000] FOREIGN KEY ([attribute_name], [section])
REFERENCES [dbo].[usm_report_profile_spec] ([attribute_name], [section])
GO
ALTER TABLE [dbo].[usm_report_profile_spec_values] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000295500000000]
GO
--SqlScripter----[dbo].[usm_request].[$usm_r_r0000295f00000000].sql
GO
ALTER TABLE [dbo].[usm_request] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000295f00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_request] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000295f00000000]
GO
--SqlScripter----[dbo].[usm_request].[$usm_r_r00002e2300000000].sql
GO
ALTER TABLE [dbo].[usm_request] WITH NOCHECK ADD CONSTRAINT [$usm_r_r00002e2300000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_request] WITH CHECK CHECK CONSTRAINT [$usm_r_r00002e2300000000]
GO
--SqlScripter----[dbo].[usm_request_value].[$usm_r_r0000296900000000].sql
GO
ALTER TABLE [dbo].[usm_request_value] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000296900000000] FOREIGN KEY ([request_id])
REFERENCES [dbo].[usm_request] ([request_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_request_value] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000296900000000]
GO
--SqlScripter----[dbo].[usm_role].[$usm_r_r0000297300000000].sql
GO
ALTER TABLE [dbo].[usm_role] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000297300000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_role] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000297300000000]
GO
--SqlScripter----[dbo].[usm_role_user].[$usm_r_r0000297d00000000].sql
GO
ALTER TABLE [dbo].[usm_role_user] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000297d00000000] FOREIGN KEY ([role_id])
REFERENCES [dbo].[usm_role] ([role_id])
GO
ALTER TABLE [dbo].[usm_role_user] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000297d00000000]
GO
--SqlScripter----[dbo].[usm_role_user].[$usm_r_r00002f3100000000].sql
GO
ALTER TABLE [dbo].[usm_role_user] WITH NOCHECK ADD CONSTRAINT [$usm_r_r00002f3100000000] FOREIGN KEY ([role_id])
REFERENCES [dbo].[usm_role] ([role_id])
GO
ALTER TABLE [dbo].[usm_role_user] WITH CHECK CHECK CONSTRAINT [$usm_r_r00002f3100000000]
GO
--SqlScripter----[dbo].[usm_rsc_nmrefer].[$usm_r_r0000298700000000].sql
GO
ALTER TABLE [dbo].[usm_rsc_nmrefer] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000298700000000] FOREIGN KEY ([method_id])
REFERENCES [dbo].[usm_rsc_method] ([id])
GO
ALTER TABLE [dbo].[usm_rsc_nmrefer] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000298700000000]
GO
--SqlScripter----[dbo].[usm_rsc_nmrefer].[$usm_r_r0000299100000000].sql
GO
ALTER TABLE [dbo].[usm_rsc_nmrefer] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000299100000000] FOREIGN KEY ([node_id])
REFERENCES [dbo].[usm_rsc_node] ([id])
GO
ALTER TABLE [dbo].[usm_rsc_nmrefer] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000299100000000]
GO
--SqlScripter----[dbo].[usm_rsc_parameter].[$usm_r_r0000299b00000000].sql
GO
ALTER TABLE [dbo].[usm_rsc_parameter] WITH NOCHECK ADD CONSTRAINT [$usm_r_r0000299b00000000] FOREIGN KEY ([method_id])
REFERENCES [dbo].[usm_rsc_method] ([id])
GO
ALTER TABLE [dbo].[usm_rsc_parameter] WITH CHECK CHECK CONSTRAINT [$usm_r_r0000299b00000000]
GO
--SqlScripter----[dbo].[usm_rsc_property].[$usm_r_r000029a500000000].sql
GO
ALTER TABLE [dbo].[usm_rsc_property] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029a500000000] FOREIGN KEY ([node_id])
REFERENCES [dbo].[usm_rsc_node] ([id])
GO
ALTER TABLE [dbo].[usm_rsc_property] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029a500000000]
GO
--SqlScripter----[dbo].[usm_rule].[$usm_r_r000029af00000000].sql
GO
ALTER TABLE [dbo].[usm_rule] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029af00000000] FOREIGN KEY ([event_type_id])
REFERENCES [dbo].[usm_rule_event_type] ([event_type_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[usm_rule] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029af00000000]
GO
--SqlScripter----[dbo].[usm_rule_action].[$usm_r_r000029b900000000].sql
GO
ALTER TABLE [dbo].[usm_rule_action] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029b900000000] FOREIGN KEY ([rule_id])
REFERENCES [dbo].[usm_rule] ([rule_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[usm_rule_action] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029b900000000]
GO
--SqlScripter----[dbo].[usm_rule_condition].[$usm_r_r000029c300000000].sql
GO
ALTER TABLE [dbo].[usm_rule_condition] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029c300000000] FOREIGN KEY ([rule_id])
REFERENCES [dbo].[usm_rule] ([rule_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[usm_rule_condition] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029c300000000]
GO
--SqlScripter----[dbo].[usm_rule_event_type].[$usm_r_r000029cd00000000].sql
GO
ALTER TABLE [dbo].[usm_rule_event_type] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029cd00000000] FOREIGN KEY ([installed_subcomponent_id])
REFERENCES [dbo].[usm_installed_subcomponent] ([installed_subcomponent_id])
GO
ALTER TABLE [dbo].[usm_rule_event_type] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029cd00000000]
GO
--SqlScripter----[dbo].[usm_rule_event_type].[$usm_r_r00002f4500000000].sql
GO
ALTER TABLE [dbo].[usm_rule_event_type] WITH NOCHECK ADD CONSTRAINT [$usm_r_r00002f4500000000] FOREIGN KEY ([installed_subcomponent_id])
REFERENCES [dbo].[usm_installed_subcomponent] ([installed_subcomponent_id])
GO
ALTER TABLE [dbo].[usm_rule_event_type] WITH CHECK CHECK CONSTRAINT [$usm_r_r00002f4500000000]
GO
--SqlScripter----[dbo].[usm_runtime_application].[$usm_r_r000029d700000000].sql
GO
ALTER TABLE [dbo].[usm_runtime_application] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029d700000000] FOREIGN KEY ([schema_instance_id])
REFERENCES [dbo].[usm_schema_instance] ([schema_instance_id])
GO
ALTER TABLE [dbo].[usm_runtime_application] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029d700000000]
GO
--SqlScripter----[dbo].[usm_runtime_application].[$usm_r_r000029e100000000].sql
GO
ALTER TABLE [dbo].[usm_runtime_application] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029e100000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_runtime_application] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029e100000000]
GO
--SqlScripter----[dbo].[usm_runtime_component].[$usm_r_r000029eb00000000].sql
GO
ALTER TABLE [dbo].[usm_runtime_component] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029eb00000000] FOREIGN KEY ([db_id])
REFERENCES [dbo].[usm_db] ([db_id])
GO
ALTER TABLE [dbo].[usm_runtime_component] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029eb00000000]
GO
--SqlScripter----[dbo].[usm_runtime_component].[$usm_r_r000029f500000000].sql
GO
ALTER TABLE [dbo].[usm_runtime_component] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029f500000000] FOREIGN KEY ([installed_component_id])
REFERENCES [dbo].[usm_installed_component] ([installed_component_id])
GO
ALTER TABLE [dbo].[usm_runtime_component] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029f500000000]
GO
--SqlScripter----[dbo].[usm_runtimecomp_parameter].[$usm_r_r000029ff00000000].sql
GO
ALTER TABLE [dbo].[usm_runtimecomp_parameter] WITH NOCHECK ADD CONSTRAINT [$usm_r_r000029ff00000000] FOREIGN KEY ([runtime_component_id])
REFERENCES [dbo].[usm_runtime_component] ([runtime_component_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_runtimecomp_parameter] WITH CHECK CHECK CONSTRAINT [$usm_r_r000029ff00000000]
GO
--SqlScripter----[dbo].[usm_schema_instance].[$usm_s_r00002a0900000000].sql
GO
ALTER TABLE [dbo].[usm_schema_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a0900000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_schema_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a0900000000]
GO
--SqlScripter----[dbo].[usm_scope].[$usm_s_r00002a1300000000].sql
GO
ALTER TABLE [dbo].[usm_scope] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a1300000000] FOREIGN KEY ([analyze_function_id])
REFERENCES [dbo].[usm_analyze_function] ([analyze_function_id])
GO
ALTER TABLE [dbo].[usm_scope] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a1300000000]
GO
--SqlScripter----[dbo].[usm_service_desk_ticket].[$usm_s_r00002a1d00000000].sql
GO
ALTER TABLE [dbo].[usm_service_desk_ticket] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a1d00000000] FOREIGN KEY ([server_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_service_desk_ticket] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a1d00000000]
GO
--SqlScripter----[dbo].[usm_service_event].[$usm_s_r00002a2700000000].sql
GO
ALTER TABLE [dbo].[usm_service_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a2700000000] FOREIGN KEY ([event_category_oid])
REFERENCES [dbo].[usm_event_category] ([event_category_oid])
GO
ALTER TABLE [dbo].[usm_service_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a2700000000]
GO
--SqlScripter----[dbo].[usm_service_event].[$usm_s_r00002a3100000000].sql
GO
ALTER TABLE [dbo].[usm_service_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a3100000000] FOREIGN KEY ([calendar_oid])
REFERENCES [dbo].[usm_calendar] ([calendar_oid])
GO
ALTER TABLE [dbo].[usm_service_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a3100000000]
GO
--SqlScripter----[dbo].[usm_service_event].[$usm_s_r00002a3b00000000].sql
GO
ALTER TABLE [dbo].[usm_service_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a3b00000000] FOREIGN KEY ([recurring_event_oid])
REFERENCES [dbo].[usm_recurring_event] ([recurring_event_oid])
GO
ALTER TABLE [dbo].[usm_service_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a3b00000000]
GO
--SqlScripter----[dbo].[usm_service_event].[$usm_s_r00002a4500000000].sql
GO
ALTER TABLE [dbo].[usm_service_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a4500000000] FOREIGN KEY ([onetime_event_oid])
REFERENCES [dbo].[usm_onetime_event] ([onetime_event_oid])
GO
ALTER TABLE [dbo].[usm_service_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a4500000000]
GO
--SqlScripter----[dbo].[usm_service_goal_values].[$usm_s_r00002a4f00000000].sql
GO
ALTER TABLE [dbo].[usm_service_goal_values] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a4f00000000] FOREIGN KEY ([service_goal_id])
REFERENCES [dbo].[usm_service_goal] ([service_goal_id])
GO
ALTER TABLE [dbo].[usm_service_goal_values] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a4f00000000]
GO
--SqlScripter----[dbo].[usm_service_hours].[$usm_s_r00002a5900000000].sql
GO
ALTER TABLE [dbo].[usm_service_hours] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a5900000000] FOREIGN KEY ([report_group_id])
REFERENCES [dbo].[usm_report_group] ([report_group_id])
GO
ALTER TABLE [dbo].[usm_service_hours] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a5900000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002a6300000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a6300000000] FOREIGN KEY ([subscription_detail_id])
REFERENCES [dbo].[usm_subscription_detail] ([id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a6300000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002a6d00000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a6d00000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a6d00000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002a7700000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a7700000000] FOREIGN KEY ([account_id])
REFERENCES [dbo].[usm_account] ([account_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a7700000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002a8100000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a8100000000] FOREIGN KEY ([slo_instance_id])
REFERENCES [dbo].[usm_slo_instance] ([slo_instance_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a8100000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002a8b00000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a8b00000000] FOREIGN KEY ([contract_id])
REFERENCES [dbo].[usm_contract] ([contract_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a8b00000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002a9500000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a9500000000] FOREIGN KEY ([sla_engine_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a9500000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002a9f00000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002a9f00000000] FOREIGN KEY ([schema_instance_id])
REFERENCES [dbo].[usm_schema_instance] ([schema_instance_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002a9f00000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002aa900000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002aa900000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002aa900000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002ab300000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002ab300000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002ab300000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002abd00000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002abd00000000] FOREIGN KEY ([sla_instance_id])
REFERENCES [dbo].[usm_sla_instance] ([sla_instance_id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002abd00000000]
GO
--SqlScripter----[dbo].[usm_serviceconfig].[$usm_s_r00002fd100000000].sql
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002fd100000000] FOREIGN KEY ([subscription_detail_id])
REFERENCES [dbo].[usm_subscription_detail] ([id])
GO
ALTER TABLE [dbo].[usm_serviceconfig] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002fd100000000]
GO
--SqlScripter----[dbo].[usm_settlement].[$usm_s_r00002ac700000000].sql
GO
ALTER TABLE [dbo].[usm_settlement] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002ac700000000] FOREIGN KEY ([adjustment_id])
REFERENCES [dbo].[usm_adjustment] ([adjustment_id])
GO
ALTER TABLE [dbo].[usm_settlement] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002ac700000000]
GO
--SqlScripter----[dbo].[usm_settlement].[$usm_s_r00002ad100000000].sql
GO
ALTER TABLE [dbo].[usm_settlement] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002ad100000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_settlement] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002ad100000000]
GO
--SqlScripter----[dbo].[usm_sla_config].[$usm_s_r00002adb00000000].sql
GO
ALTER TABLE [dbo].[usm_sla_config] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002adb00000000] FOREIGN KEY ([host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_sla_config] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002adb00000000]
GO
--SqlScripter----[dbo].[usm_sla_instance].[$usm_s_r00002ae500000000].sql
GO
ALTER TABLE [dbo].[usm_sla_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002ae500000000] FOREIGN KEY ([tenant_id])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_sla_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002ae500000000]
GO
--SqlScripter----[dbo].[usm_sla_instance].[$usm_s_r00002aef00000000].sql
GO
ALTER TABLE [dbo].[usm_sla_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002aef00000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_sla_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002aef00000000]
GO
--SqlScripter----[dbo].[usm_sla_metric_instance].[$usm_s_r00002af900000000].sql
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002af900000000] FOREIGN KEY ([contract_id])
REFERENCES [dbo].[usm_contract] ([contract_id])
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002af900000000]
GO
--SqlScripter----[dbo].[usm_sla_metric_instance].[$usm_s_r00002b0300000000].sql
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b0300000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b0300000000]
GO
--SqlScripter----[dbo].[usm_sla_metric_instance].[$usm_s_r00002b0d00000000].sql
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b0d00000000] FOREIGN KEY ([sla_instance_id])
REFERENCES [dbo].[usm_sla_instance] ([sla_instance_id])
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b0d00000000]
GO
--SqlScripter----[dbo].[usm_sla_metric_instance].[$usm_s_r00002b1700000000].sql
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b1700000000] FOREIGN KEY ([slo_instance_id])
REFERENCES [dbo].[usm_slo_instance] ([slo_instance_id])
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b1700000000]
GO
--SqlScripter----[dbo].[usm_sla_metric_instance].[$usm_s_r00002b2100000000].sql
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b2100000000] FOREIGN KEY ([sla_config_id])
REFERENCES [dbo].[usm_sla_config] ([sla_config_id])
GO
ALTER TABLE [dbo].[usm_sla_metric_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b2100000000]
GO
--SqlScripter----[dbo].[usm_slm_server].[$usm_s_r00002b2b00000000].sql
GO
ALTER TABLE [dbo].[usm_slm_server] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b2b00000000] FOREIGN KEY ([server_type_id])
REFERENCES [dbo].[usm_slm_server_type] ([server_type_id])
GO
ALTER TABLE [dbo].[usm_slm_server] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b2b00000000]
GO
--SqlScripter----[dbo].[usm_slm_server].[$usm_s_r00002b3500000000].sql
GO
ALTER TABLE [dbo].[usm_slm_server] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b3500000000] FOREIGN KEY ([host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_slm_server] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b3500000000]
GO
--SqlScripter----[dbo].[usm_slm_server_config].[$usm_s_r00002b3f00000000].sql
GO
ALTER TABLE [dbo].[usm_slm_server_config] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b3f00000000] FOREIGN KEY ([server_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_slm_server_config] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b3f00000000]
GO
--SqlScripter----[dbo].[usm_slm_server_status].[$usm_s_r00002b4900000000].sql
GO
ALTER TABLE [dbo].[usm_slm_server_status] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b4900000000] FOREIGN KEY ([type])
REFERENCES [dbo].[usm_slm_server_status_type] ([server_status_type_id])
GO
ALTER TABLE [dbo].[usm_slm_server_status] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b4900000000]
GO
--SqlScripter----[dbo].[usm_slm_server_status].[$usm_s_r00002b5300000000].sql
GO
ALTER TABLE [dbo].[usm_slm_server_status] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b5300000000] FOREIGN KEY ([server_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_slm_server_status] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b5300000000]
GO
--SqlScripter----[dbo].[usm_slm_server_type_spec].[$usm_s_r00002b5d00000000].sql
GO
ALTER TABLE [dbo].[usm_slm_server_type_spec] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b5d00000000] FOREIGN KEY ([server_type_id])
REFERENCES [dbo].[usm_slm_server_type] ([server_type_id])
GO
ALTER TABLE [dbo].[usm_slm_server_type_spec] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b5d00000000]
GO
--SqlScripter----[dbo].[usm_slm_server_type_value].[$usm_s_r00002b6700000000].sql
GO
ALTER TABLE [dbo].[usm_slm_server_type_value] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b6700000000] FOREIGN KEY ([slm_server_type_spec_id])
REFERENCES [dbo].[usm_slm_server_type_spec] ([slm_server_type_spec_id])
GO
ALTER TABLE [dbo].[usm_slm_server_type_value] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b6700000000]
GO
--SqlScripter----[dbo].[usm_slo_instance].[$usm_s_r00002b7100000000].sql
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b7100000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b7100000000]
GO
--SqlScripter----[dbo].[usm_slo_instance].[$usm_s_r00002b8500000000].sql
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b8500000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b8500000000]
GO
--SqlScripter----[dbo].[usm_slo_instance].[$usm_s_r00002b8f00000000].sql
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b8f00000000] FOREIGN KEY ([slo_instance_parent_id])
REFERENCES [dbo].[usm_slo_instance] ([slo_instance_id])
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b8f00000000]
GO
--SqlScripter----[dbo].[usm_slo_instance].[$usm_s_r00002b9900000000].sql
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002b9900000000] FOREIGN KEY ([sla_instance_id])
REFERENCES [dbo].[usm_sla_instance] ([sla_instance_id])
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002b9900000000]
GO
--SqlScripter----[dbo].[usm_slo_instance].[$usm_s_r0000302b00000000].sql
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH NOCHECK ADD CONSTRAINT [$usm_s_r0000302b00000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_slo_instance] WITH CHECK CHECK CONSTRAINT [$usm_s_r0000302b00000000]
GO
--SqlScripter----[dbo].[usm_slo_package].[$usm_s_r00002ba300000000].sql
GO
ALTER TABLE [dbo].[usm_slo_package] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002ba300000000] FOREIGN KEY ([schema_id])
REFERENCES [dbo].[usm_schema] ([schema_id])
GO
ALTER TABLE [dbo].[usm_slo_package] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002ba300000000]
GO
--SqlScripter----[dbo].[usm_slo_template].[$usm_s_r00002bad00000000].sql
GO
ALTER TABLE [dbo].[usm_slo_template] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002bad00000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_slo_template] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002bad00000000]
GO
--SqlScripter----[dbo].[usm_slo_template].[$usm_s_r00002f4f00000000].sql
GO
ALTER TABLE [dbo].[usm_slo_template] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002f4f00000000] FOREIGN KEY ([metric_category_id])
REFERENCES [dbo].[usm_metric_category] ([metric_category_id])
GO
ALTER TABLE [dbo].[usm_slo_template] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002f4f00000000]
GO
--SqlScripter----[dbo].[usm_slo_template_sla_config].[$usm_s_r00002bb700000000].sql
GO
ALTER TABLE [dbo].[usm_slo_template_sla_config] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002bb700000000] FOREIGN KEY ([sla_config_id])
REFERENCES [dbo].[usm_sla_config] ([sla_config_id])
GO
ALTER TABLE [dbo].[usm_slo_template_sla_config] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002bb700000000]
GO
--SqlScripter----[dbo].[usm_slo_template_sla_config].[$usm_s_r00002bc100000000].sql
GO
ALTER TABLE [dbo].[usm_slo_template_sla_config] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002bc100000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_slo_template_sla_config] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002bc100000000]
GO
--SqlScripter----[dbo].[usm_slo_template_sla_config].[$usm_s_r0000305300000000].sql
GO
ALTER TABLE [dbo].[usm_slo_template_sla_config] WITH NOCHECK ADD CONSTRAINT [$usm_s_r0000305300000000] FOREIGN KEY ([slo_template_id])
REFERENCES [dbo].[usm_slo_template] ([slo_template_id])
GO
ALTER TABLE [dbo].[usm_slo_template_sla_config] WITH CHECK CHECK CONSTRAINT [$usm_s_r0000305300000000]
GO
--SqlScripter----[dbo].[usm_slo_threshold].[$usm_s_r00002da100000000].sql
GO
ALTER TABLE [dbo].[usm_slo_threshold] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002da100000000] FOREIGN KEY ([slo_instance_id])
REFERENCES [dbo].[usm_slo_instance] ([slo_instance_id])
GO
ALTER TABLE [dbo].[usm_slo_threshold] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002da100000000]
GO
--SqlScripter----[dbo].[usm_sm_comp].[$usm_s_r00002bcb00000000].sql
GO
ALTER TABLE [dbo].[usm_sm_comp] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002bcb00000000] FOREIGN KEY ([schema_comp_id])
REFERENCES [dbo].[usm_schema_comp] ([schema_comp_id])
GO
ALTER TABLE [dbo].[usm_sm_comp] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002bcb00000000]
GO
--SqlScripter----[dbo].[usm_sm_comp].[$usm_s_r00002bd500000000].sql
GO
ALTER TABLE [dbo].[usm_sm_comp] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002bd500000000] FOREIGN KEY ([inst_host_id])
REFERENCES [dbo].[usm_host] ([host_id])
GO
ALTER TABLE [dbo].[usm_sm_comp] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002bd500000000]
GO
--SqlScripter----[dbo].[usm_sm_comp].[$usm_s_r00002bdf00000000].sql
GO
ALTER TABLE [dbo].[usm_sm_comp] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002bdf00000000] FOREIGN KEY ([metric_instance_id])
REFERENCES [dbo].[usm_metric_instance] ([metric_instance_id])
GO
ALTER TABLE [dbo].[usm_sm_comp] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002bdf00000000]
GO
--SqlScripter----[dbo].[usm_sm_event].[$usm_s_r00002be900000000].sql
GO
ALTER TABLE [dbo].[usm_sm_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002be900000000] FOREIGN KEY ([calendar_category_oid])
REFERENCES [dbo].[usm_calendar_category] ([calendar_category_oid])
GO
ALTER TABLE [dbo].[usm_sm_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002be900000000]
GO
--SqlScripter----[dbo].[usm_sm_event].[$usm_s_r00002bf300000000].sql
GO
ALTER TABLE [dbo].[usm_sm_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002bf300000000] FOREIGN KEY ([onetime_event_oid])
REFERENCES [dbo].[usm_onetime_event] ([onetime_event_oid])
GO
ALTER TABLE [dbo].[usm_sm_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002bf300000000]
GO
--SqlScripter----[dbo].[usm_sm_event].[$usm_s_r00002bfd00000000].sql
GO
ALTER TABLE [dbo].[usm_sm_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002bfd00000000] FOREIGN KEY ([recurring_event_oid])
REFERENCES [dbo].[usm_recurring_event] ([recurring_event_oid])
GO
ALTER TABLE [dbo].[usm_sm_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002bfd00000000]
GO
--SqlScripter----[dbo].[usm_sm_event].[$usm_s_r00002e2d00000000].sql
GO
ALTER TABLE [dbo].[usm_sm_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002e2d00000000] FOREIGN KEY ([calendar_category_oid])
REFERENCES [dbo].[usm_calendar_category] ([calendar_category_oid])
GO
ALTER TABLE [dbo].[usm_sm_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002e2d00000000]
GO
--SqlScripter----[dbo].[usm_sm_event].[$usm_s_r00002e3700000000].sql
GO
ALTER TABLE [dbo].[usm_sm_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002e3700000000] FOREIGN KEY ([onetime_event_oid])
REFERENCES [dbo].[usm_onetime_event] ([onetime_event_oid])
GO
ALTER TABLE [dbo].[usm_sm_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002e3700000000]
GO
--SqlScripter----[dbo].[usm_sm_event].[$usm_s_r00002e4100000000].sql
GO
ALTER TABLE [dbo].[usm_sm_event] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002e4100000000] FOREIGN KEY ([recurring_event_oid])
REFERENCES [dbo].[usm_recurring_event] ([recurring_event_oid])
GO
ALTER TABLE [dbo].[usm_sm_event] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002e4100000000]
GO
--SqlScripter----[dbo].[usm_statement].[$usm_s_r00002c0700000000].sql
GO
ALTER TABLE [dbo].[usm_statement] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c0700000000] FOREIGN KEY ([invoice_history_id])
REFERENCES [dbo].[usm_invoice_history] ([invoice_history_id])
GO
ALTER TABLE [dbo].[usm_statement] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c0700000000]
GO
--SqlScripter----[dbo].[usm_statement].[$usm_s_r00002c1100000000].sql
GO
ALTER TABLE [dbo].[usm_statement] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c1100000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_statement] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c1100000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002c1b00000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c1b00000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c1b00000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002c2500000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c2500000000] FOREIGN KEY ([item_id])
REFERENCES [dbo].[usm_rate_definition] ([item_id])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c2500000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002c2f00000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c2f00000000] FOREIGN KEY ([rate_plan_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c2f00000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002c3900000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c3900000000] FOREIGN KEY ([offering_id])
REFERENCES [dbo].[usm_offering] ([offering_id])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c3900000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002c4300000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c4300000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c4300000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002e4b00000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002e4b00000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002e4b00000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002e5500000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002e5500000000] FOREIGN KEY ([item_id])
REFERENCES [dbo].[usm_rate_definition] ([item_id])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002e5500000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002e5f00000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002e5f00000000] FOREIGN KEY ([rate_plan_id])
REFERENCES [dbo].[usm_rate_plan] ([rate_plan_id])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002e5f00000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002e6900000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002e6900000000] FOREIGN KEY ([offering_id])
REFERENCES [dbo].[usm_offering] ([offering_id])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002e6900000000]
GO
--SqlScripter----[dbo].[usm_subscription_detail].[$usm_s_r00002e7300000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002e7300000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_subscription_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002e7300000000]
GO
--SqlScripter----[dbo].[usm_subscription_mgmt].[$usm_s_r00002c4d00000000].sql
GO
ALTER TABLE [dbo].[usm_subscription_mgmt] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c4d00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_subscription_mgmt] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c4d00000000]
GO
--SqlScripter----[dbo].[usm_system_change_detail].[$usm_s_r00002c5700000000].sql
GO
ALTER TABLE [dbo].[usm_system_change_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c5700000000] FOREIGN KEY ([id])
REFERENCES [dbo].[usm_system_change] ([id])
GO
ALTER TABLE [dbo].[usm_system_change_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c5700000000]
GO
--SqlScripter----[dbo].[usm_system_change_detail].[$usm_s_r00002fe500000000].sql
GO
ALTER TABLE [dbo].[usm_system_change_detail] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002fe500000000] FOREIGN KEY ([id])
REFERENCES [dbo].[usm_system_change] ([id])
GO
ALTER TABLE [dbo].[usm_system_change_detail] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002fe500000000]
GO
--SqlScripter----[dbo].[usm_system_change_detail_ext].[$usm_s_r00002c6100000000].sql
GO
ALTER TABLE [dbo].[usm_system_change_detail_ext] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c6100000000] FOREIGN KEY ([id], [name])
REFERENCES [dbo].[usm_system_change_detail] ([id], [name])
GO
ALTER TABLE [dbo].[usm_system_change_detail_ext] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c6100000000]
GO
--SqlScripter----[dbo].[usm_system_install].[$usm_s_r00002c6b00000000].sql
GO
ALTER TABLE [dbo].[usm_system_install] WITH NOCHECK ADD CONSTRAINT [$usm_s_r00002c6b00000000] FOREIGN KEY ([pwd_policy_id])
REFERENCES [dbo].[usm_pwd_policy] ([pwd_policy_id])
GO
ALTER TABLE [dbo].[usm_system_install] WITH CHECK CHECK CONSTRAINT [$usm_s_r00002c6b00000000]
GO
--SqlScripter----[dbo].[usm_task].[$usm_t_r00002c7500000000].sql
GO
ALTER TABLE [dbo].[usm_task] WITH NOCHECK ADD CONSTRAINT [$usm_t_r00002c7500000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_task] WITH CHECK CHECK CONSTRAINT [$usm_t_r00002c7500000000]
GO
--SqlScripter----[dbo].[usm_task].[$usm_t_r00002c7f00000000].sql
GO
ALTER TABLE [dbo].[usm_task] WITH NOCHECK ADD CONSTRAINT [$usm_t_r00002c7f00000000] FOREIGN KEY ([runtime_component_id])
REFERENCES [dbo].[usm_runtime_component] ([runtime_component_id])
GO
ALTER TABLE [dbo].[usm_task] WITH CHECK CHECK CONSTRAINT [$usm_t_r00002c7f00000000]
GO
--SqlScripter----[dbo].[usm_task].[$usm_t_r00002f5900000000].sql
GO
ALTER TABLE [dbo].[usm_task] WITH NOCHECK ADD CONSTRAINT [$usm_t_r00002f5900000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_task] WITH CHECK CHECK CONSTRAINT [$usm_t_r00002f5900000000]
GO
--SqlScripter----[dbo].[usm_task].[$usm_t_r00002f6300000000].sql
GO
ALTER TABLE [dbo].[usm_task] WITH NOCHECK ADD CONSTRAINT [$usm_t_r00002f6300000000] FOREIGN KEY ([runtime_component_id])
REFERENCES [dbo].[usm_runtime_component] ([runtime_component_id])
GO
ALTER TABLE [dbo].[usm_task] WITH CHECK CHECK CONSTRAINT [$usm_t_r00002f6300000000]
GO
--SqlScripter----[dbo].[usm_tenant].[$usm_t_r00002c9300000000].sql
GO
ALTER TABLE [dbo].[usm_tenant] WITH NOCHECK ADD CONSTRAINT [$usm_t_r00002c9300000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_tenant] WITH CHECK CHECK CONSTRAINT [$usm_t_r00002c9300000000]
GO
--SqlScripter----[dbo].[usm_tenant].[$usm_t_r00002c9d00000000].sql
GO
ALTER TABLE [dbo].[usm_tenant] WITH NOCHECK ADD CONSTRAINT [$usm_t_r00002c9d00000000] FOREIGN KEY ([currency_type_code])
REFERENCES [dbo].[ca_currency_type] ([currency_type_code])
GO
ALTER TABLE [dbo].[usm_tenant] WITH CHECK CHECK CONSTRAINT [$usm_t_r00002c9d00000000]
GO
--SqlScripter----[dbo].[usm_tenant_ext_ldap_conf].[$usm_t_r00002ca700000000].sql
GO
ALTER TABLE [dbo].[usm_tenant_ext_ldap_conf] WITH NOCHECK ADD CONSTRAINT [$usm_t_r00002ca700000000] FOREIGN KEY ([tenant_id])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_tenant_ext_ldap_conf] WITH CHECK CHECK CONSTRAINT [$usm_t_r00002ca700000000]
GO
--SqlScripter----[dbo].[usm_transaction].[$usm_t_r00002cb100000000].sql
GO
ALTER TABLE [dbo].[usm_transaction] WITH NOCHECK ADD CONSTRAINT [$usm_t_r00002cb100000000] FOREIGN KEY ([account_no])
REFERENCES [dbo].[usm_billing_account] ([account_no])
GO
ALTER TABLE [dbo].[usm_transaction] WITH CHECK CHECK CONSTRAINT [$usm_t_r00002cb100000000]
GO
--SqlScripter----[dbo].[usm_user].[$usm_u_r00002cbb00000000].sql
GO
ALTER TABLE [dbo].[usm_user] WITH NOCHECK ADD CONSTRAINT [$usm_u_r00002cbb00000000] FOREIGN KEY ([locale_code])
REFERENCES [dbo].[ca_locale] ([locale_code])
GO
ALTER TABLE [dbo].[usm_user] WITH CHECK CHECK CONSTRAINT [$usm_u_r00002cbb00000000]
GO
--SqlScripter----[dbo].[usm_user].[$usm_u_r00002cc500000000].sql
GO
ALTER TABLE [dbo].[usm_user] WITH NOCHECK ADD CONSTRAINT [$usm_u_r00002cc500000000] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[usm_user] WITH CHECK CHECK CONSTRAINT [$usm_u_r00002cc500000000]
GO
--SqlScripter----[dbo].[usm_user].[$usm_u_r00002ccf00000000].sql
GO
ALTER TABLE [dbo].[usm_user] WITH NOCHECK ADD CONSTRAINT [$usm_u_r00002ccf00000000] FOREIGN KEY ([domain])
REFERENCES [dbo].[usm_tenant] ([tenant_id])
GO
ALTER TABLE [dbo].[usm_user] WITH CHECK CHECK CONSTRAINT [$usm_u_r00002ccf00000000]
GO
--SqlScripter----[dbo].[usm_user_query_history].[$usm_u_r00002f6d00000000].sql
GO
ALTER TABLE [dbo].[usm_user_query_history] WITH NOCHECK ADD CONSTRAINT [$usm_u_r00002f6d00000000] FOREIGN KEY ([guinode_id])
REFERENCES [dbo].[usm_guinode] ([guinode_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usm_user_query_history] WITH CHECK CHECK CONSTRAINT [$usm_u_r00002f6d00000000]
GO
--SqlScripter----[dbo].[usm_webservice_method].[$usm_w_r00002cd900000000].sql
GO
ALTER TABLE [dbo].[usm_webservice_method] WITH NOCHECK ADD CONSTRAINT [$usm_w_r00002cd900000000] FOREIGN KEY ([webservice_id])
REFERENCES [dbo].[usm_webservice] ([webservice_id])
GO
ALTER TABLE [dbo].[usm_webservice_method] WITH CHECK CHECK CONSTRAINT [$usm_w_r00002cd900000000]
GO
--SqlScripter----[dbo].[usm_wmi_classes].[$usm_w_r00002ce300000000].sql
GO
ALTER TABLE [dbo].[usm_wmi_classes] WITH NOCHECK ADD CONSTRAINT [$usm_w_r00002ce300000000] FOREIGN KEY ([server_id])
REFERENCES [dbo].[usm_slm_server] ([server_id])
GO
ALTER TABLE [dbo].[usm_wmi_classes] WITH CHECK CHECK CONSTRAINT [$usm_w_r00002ce300000000]
GO
--SqlScripter----[dbo].[vuln_management_backup_config].[$vuln__r00001b2300000000].sql
GO
ALTER TABLE [dbo].[vuln_management_backup_config] WITH NOCHECK ADD CONSTRAINT [$vuln__r00001b2300000000] FOREIGN KEY ([unit_id])
REFERENCES [dbo].[vuln_management_configuration] ([unit_id])
GO
ALTER TABLE [dbo].[vuln_management_backup_config] WITH CHECK CHECK CONSTRAINT [$vuln__r00001b2300000000]
GO
--SqlScripter----[dbo].[vuln_management_configuration].[$vuln__r00001adf00000000].sql
GO
ALTER TABLE [dbo].[vuln_management_configuration] WITH NOCHECK ADD CONSTRAINT [$vuln__r00001adf00000000] FOREIGN KEY ([preferred_language_id])
REFERENCES [dbo].[language] ([language_id])
GO
ALTER TABLE [dbo].[vuln_management_configuration] WITH CHECK CHECK CONSTRAINT [$vuln__r00001adf00000000]
GO
--SqlScripter----[dbo].[vuln_management_configuration].[$vuln__r00001ae900000000].sql
GO
ALTER TABLE [dbo].[vuln_management_configuration] WITH NOCHECK ADD CONSTRAINT [$vuln__r00001ae900000000] FOREIGN KEY ([unit_id])
REFERENCES [dbo].[system_configuration] ([unit_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[vuln_management_configuration] WITH CHECK CHECK CONSTRAINT [$vuln__r00001ae900000000]
GO
--SqlScripter----[dbo].[vulnerability_vailidation_method].[$vulne_r00001c2900000000].sql
GO
ALTER TABLE [dbo].[vulnerability_vailidation_method] WITH NOCHECK ADD CONSTRAINT [$vulne_r00001c2900000000] FOREIGN KEY ([vuln_id])
REFERENCES [dbo].[software_vulnerability] ([vuln_id])
GO
ALTER TABLE [dbo].[vulnerability_vailidation_method] WITH CHECK CHECK CONSTRAINT [$vulne_r00001c2900000000]
GO
--SqlScripter----[dbo].[vulnerability_vailidation_method].[$vulne_r00001c3300000000].sql
GO
ALTER TABLE [dbo].[vulnerability_vailidation_method] WITH NOCHECK ADD CONSTRAINT [$vulne_r00001c3300000000] FOREIGN KEY ([validation_method_id])
REFERENCES [dbo].[validation_method] ([validation_method_id])
GO
ALTER TABLE [dbo].[vulnerability_vailidation_method] WITH CHECK CHECK CONSTRAINT [$vulne_r00001c3300000000]
GO
--SqlScripter----[dbo].[vunerability_asset_group].[$vuner_r00001afb00000000].sql
GO
ALTER TABLE [dbo].[vunerability_asset_group] WITH NOCHECK ADD CONSTRAINT [$vuner_r00001afb00000000] FOREIGN KEY ([protection_level_id])
REFERENCES [dbo].[protection_level] ([protection_level_id])
GO
ALTER TABLE [dbo].[vunerability_asset_group] WITH CHECK CHECK CONSTRAINT [$vuner_r00001afb00000000]
GO
--SqlScripter----[dbo].[vunerability_asset_group].[$vuner_r00001b0500000000].sql
GO
ALTER TABLE [dbo].[vunerability_asset_group] WITH NOCHECK ADD CONSTRAINT [$vuner_r00001b0500000000] FOREIGN KEY ([unit_id])
REFERENCES [dbo].[evm_appliance_configuration] ([unit_id])
GO
ALTER TABLE [dbo].[vunerability_asset_group] WITH CHECK CHECK CONSTRAINT [$vuner_r00001b0500000000]
GO
--SqlScripter----[dbo].[wsm_accesszone].[r_11].sql
GO
ALTER TABLE [dbo].[wsm_accesszone] WITH NOCHECK ADD CONSTRAINT [r_11] FOREIGN KEY ([level_uuid])
REFERENCES [dbo].[wsm_level] ([level_uuid])
GO
ALTER TABLE [dbo].[wsm_accesszone] WITH CHECK CHECK CONSTRAINT [r_11]
GO
--SqlScripter----[dbo].[wsm_accesszone_coordinates].[r_1496].sql
GO
ALTER TABLE [dbo].[wsm_accesszone_coordinates] WITH NOCHECK ADD CONSTRAINT [r_1496] FOREIGN KEY ([accesszone_uuid])
REFERENCES [dbo].[wsm_accesszone] ([accesszone_uuid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[wsm_accesszone_coordinates] WITH CHECK CHECK CONSTRAINT [r_1496]
GO
--SqlScripter----[dbo].[wsm_accesszone_gui_attrib].[r_1500].sql
GO
ALTER TABLE [dbo].[wsm_accesszone_gui_attrib] WITH NOCHECK ADD CONSTRAINT [r_1500] FOREIGN KEY ([accesszone_uuid])
REFERENCES [dbo].[wsm_accesszone] ([accesszone_uuid])
GO
ALTER TABLE [dbo].[wsm_accesszone_gui_attrib] WITH CHECK CHECK CONSTRAINT [r_1500]
GO
--SqlScripter----[dbo].[wsm_accesszone_gui_attrib].[r_1501].sql
GO
ALTER TABLE [dbo].[wsm_accesszone_gui_attrib] WITH NOCHECK ADD CONSTRAINT [r_1501] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_accesszone_gui_attrib] WITH CHECK CHECK CONSTRAINT [r_1501]
GO
--SqlScripter----[dbo].[wsm_advanced_psk_sched].[r_1542].sql
GO
ALTER TABLE [dbo].[wsm_advanced_psk_sched] WITH NOCHECK ADD CONSTRAINT [r_1542] FOREIGN KEY ([advanced_psk_sched_id])
REFERENCES [dbo].[wsm_advanced_psk] ([advanced_psk_sched_id])
GO
ALTER TABLE [dbo].[wsm_advanced_psk_sched] WITH CHECK CHECK CONSTRAINT [r_1542]
GO
--SqlScripter----[dbo].[wsm_advanced_wep_sched].[r_1541].sql
GO
ALTER TABLE [dbo].[wsm_advanced_wep_sched] WITH NOCHECK ADD CONSTRAINT [r_1541] FOREIGN KEY ([advanced_wep_sched_id])
REFERENCES [dbo].[wsm_advanced_wep] ([advanced_wep_sched_id])
GO
ALTER TABLE [dbo].[wsm_advanced_wep_sched] WITH CHECK CHECK CONSTRAINT [r_1541]
GO
--SqlScripter----[dbo].[wsm_agent].[r_1464].sql
GO
ALTER TABLE [dbo].[wsm_agent] WITH NOCHECK ADD CONSTRAINT [r_1464] FOREIGN KEY ([manager_uuid])
REFERENCES [dbo].[wsm_engine] ([manager_uuid])
GO
ALTER TABLE [dbo].[wsm_agent] WITH CHECK CHECK CONSTRAINT [r_1464]
GO
--SqlScripter----[dbo].[wsm_agent].[r_1466].sql
GO
ALTER TABLE [dbo].[wsm_agent] WITH NOCHECK ADD CONSTRAINT [r_1466] FOREIGN KEY ([current_user_uuid])
REFERENCES [dbo].[wsm_user] ([user_uuid])
GO
ALTER TABLE [dbo].[wsm_agent] WITH CHECK CHECK CONSTRAINT [r_1466]
GO
--SqlScripter----[dbo].[wsm_agent].[r_1467].sql
GO
ALTER TABLE [dbo].[wsm_agent] WITH NOCHECK ADD CONSTRAINT [r_1467] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_agent] WITH CHECK CHECK CONSTRAINT [r_1467]
GO
--SqlScripter----[dbo].[wsm_agent].[r_1487].sql
GO
ALTER TABLE [dbo].[wsm_agent] WITH NOCHECK ADD CONSTRAINT [r_1487] FOREIGN KEY ([locale_code])
REFERENCES [dbo].[ca_locale] ([locale_code])
GO
ALTER TABLE [dbo].[wsm_agent] WITH CHECK CHECK CONSTRAINT [r_1487]
GO
--SqlScripter----[dbo].[wsm_agent].[r_1488].sql
GO
ALTER TABLE [dbo].[wsm_agent] WITH NOCHECK ADD CONSTRAINT [r_1488] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[wsm_agent] WITH CHECK CHECK CONSTRAINT [r_1488]
GO
--SqlScripter----[dbo].[wsm_agent].[r_1510].sql
GO
ALTER TABLE [dbo].[wsm_agent] WITH NOCHECK ADD CONSTRAINT [r_1510] FOREIGN KEY ([agent_status_id])
REFERENCES [dbo].[wsm_status_definition] ([status_id])
GO
ALTER TABLE [dbo].[wsm_agent] WITH CHECK CHECK CONSTRAINT [r_1510]
GO
--SqlScripter----[dbo].[wsm_configuration_history].[r_1578].sql
GO
ALTER TABLE [dbo].[wsm_configuration_history] WITH NOCHECK ADD CONSTRAINT [r_1578] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_configuration_history] WITH CHECK CHECK CONSTRAINT [r_1578]
GO
--SqlScripter----[dbo].[wsm_configuration_item].[r_1472].sql
GO
ALTER TABLE [dbo].[wsm_configuration_item] WITH NOCHECK ADD CONSTRAINT [r_1472] FOREIGN KEY ([config_object_id])
REFERENCES [dbo].[wsm_configuration_object] ([config_object_id])
GO
ALTER TABLE [dbo].[wsm_configuration_item] WITH CHECK CHECK CONSTRAINT [r_1472]
GO
--SqlScripter----[dbo].[wsm_configuration_item].[r_1494].sql
GO
ALTER TABLE [dbo].[wsm_configuration_item] WITH NOCHECK ADD CONSTRAINT [r_1494] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_configuration_item] WITH CHECK CHECK CONSTRAINT [r_1494]
GO
--SqlScripter----[dbo].[wsm_configuration_object].[r_1471].sql
GO
ALTER TABLE [dbo].[wsm_configuration_object] WITH NOCHECK ADD CONSTRAINT [r_1471] FOREIGN KEY ([config_profile_uuid])
REFERENCES [dbo].[wsm_configuration_profile] ([config_profile_uuid])
GO
ALTER TABLE [dbo].[wsm_configuration_object] WITH CHECK CHECK CONSTRAINT [r_1471]
GO
--SqlScripter----[dbo].[wsm_configuration_profile].[r_1475].sql
GO
ALTER TABLE [dbo].[wsm_configuration_profile] WITH NOCHECK ADD CONSTRAINT [r_1475] FOREIGN KEY ([config_type_id])
REFERENCES [dbo].[wsm_configprofile_type] ([config_type_id])
GO
ALTER TABLE [dbo].[wsm_configuration_profile] WITH CHECK CHECK CONSTRAINT [r_1475]
GO
--SqlScripter----[dbo].[wsm_configuration_profile].[r_1476].sql
GO
ALTER TABLE [dbo].[wsm_configuration_profile] WITH NOCHECK ADD CONSTRAINT [r_1476] FOREIGN KEY ([templateuuid])
REFERENCES [dbo].[wsm_template] ([templateuuid])
GO
ALTER TABLE [dbo].[wsm_configuration_profile] WITH CHECK CHECK CONSTRAINT [r_1476]
GO
--SqlScripter----[dbo].[wsm_dc_resource].[r_1544].sql
GO
ALTER TABLE [dbo].[wsm_dc_resource] WITH NOCHECK ADD CONSTRAINT [r_1544] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_dc_resource] WITH CHECK CHECK CONSTRAINT [r_1544]
GO
--SqlScripter----[dbo].[wsm_dc_resource].[r_1545].sql
GO
ALTER TABLE [dbo].[wsm_dc_resource] WITH NOCHECK ADD CONSTRAINT [r_1545] FOREIGN KEY ([templateuuid])
REFERENCES [dbo].[wsm_template] ([templateuuid])
GO
ALTER TABLE [dbo].[wsm_dc_resource] WITH CHECK CHECK CONSTRAINT [r_1545]
GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[r_1580].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1day] WITH NOCHECK ADD CONSTRAINT [r_1580] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1day] WITH CHECK CHECK CONSTRAINT [r_1580]
GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[r_1581].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1day] WITH NOCHECK ADD CONSTRAINT [r_1581] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1day] WITH CHECK CHECK CONSTRAINT [r_1581]
GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[r_1582].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1day] WITH NOCHECK ADD CONSTRAINT [r_1582] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1day] WITH CHECK CHECK CONSTRAINT [r_1582]
GO
--SqlScripter----[dbo].[wsm_dc_val_1day].[r_1583].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1day] WITH NOCHECK ADD CONSTRAINT [r_1583] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1day] WITH CHECK CHECK CONSTRAINT [r_1583]
GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[r_1554].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1hr] WITH NOCHECK ADD CONSTRAINT [r_1554] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1hr] WITH CHECK CHECK CONSTRAINT [r_1554]
GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[r_1556].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1hr] WITH NOCHECK ADD CONSTRAINT [r_1556] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1hr] WITH CHECK CHECK CONSTRAINT [r_1556]
GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[r_1558].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1hr] WITH NOCHECK ADD CONSTRAINT [r_1558] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1hr] WITH CHECK CHECK CONSTRAINT [r_1558]
GO
--SqlScripter----[dbo].[wsm_dc_val_1hr].[r_1561].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1hr] WITH NOCHECK ADD CONSTRAINT [r_1561] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1hr] WITH CHECK CHECK CONSTRAINT [r_1561]
GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[r_1550].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1min] WITH NOCHECK ADD CONSTRAINT [r_1550] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1min] WITH CHECK CHECK CONSTRAINT [r_1550]
GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[r_1551].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1min] WITH NOCHECK ADD CONSTRAINT [r_1551] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1min] WITH CHECK CHECK CONSTRAINT [r_1551]
GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[r_1552].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1min] WITH NOCHECK ADD CONSTRAINT [r_1552] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1min] WITH CHECK CHECK CONSTRAINT [r_1552]
GO
--SqlScripter----[dbo].[wsm_dc_val_1min].[r_1559].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1min] WITH NOCHECK ADD CONSTRAINT [r_1559] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1min] WITH CHECK CHECK CONSTRAINT [r_1559]
GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[r_1553].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1mnth] WITH NOCHECK ADD CONSTRAINT [r_1553] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1mnth] WITH CHECK CHECK CONSTRAINT [r_1553]
GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[r_1555].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1mnth] WITH NOCHECK ADD CONSTRAINT [r_1555] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1mnth] WITH CHECK CHECK CONSTRAINT [r_1555]
GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[r_1557].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1mnth] WITH NOCHECK ADD CONSTRAINT [r_1557] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1mnth] WITH CHECK CHECK CONSTRAINT [r_1557]
GO
--SqlScripter----[dbo].[wsm_dc_val_1mnth].[r_1560].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1mnth] WITH NOCHECK ADD CONSTRAINT [r_1560] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1mnth] WITH CHECK CHECK CONSTRAINT [r_1560]
GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[r_1564].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1week] WITH NOCHECK ADD CONSTRAINT [r_1564] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1week] WITH CHECK CHECK CONSTRAINT [r_1564]
GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[r_1565].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1week] WITH NOCHECK ADD CONSTRAINT [r_1565] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1week] WITH CHECK CHECK CONSTRAINT [r_1565]
GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[r_1566].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1week] WITH NOCHECK ADD CONSTRAINT [r_1566] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1week] WITH CHECK CHECK CONSTRAINT [r_1566]
GO
--SqlScripter----[dbo].[wsm_dc_val_1week].[r_1568].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1week] WITH NOCHECK ADD CONSTRAINT [r_1568] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1week] WITH CHECK CHECK CONSTRAINT [r_1568]
GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[r_1571].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1year] WITH NOCHECK ADD CONSTRAINT [r_1571] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1year] WITH CHECK CHECK CONSTRAINT [r_1571]
GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[r_1573].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1year] WITH NOCHECK ADD CONSTRAINT [r_1573] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1year] WITH CHECK CHECK CONSTRAINT [r_1573]
GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[r_1575].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1year] WITH NOCHECK ADD CONSTRAINT [r_1575] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1year] WITH CHECK CHECK CONSTRAINT [r_1575]
GO
--SqlScripter----[dbo].[wsm_dc_val_1year].[r_1577].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_1year] WITH NOCHECK ADD CONSTRAINT [r_1577] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_1year] WITH CHECK CHECK CONSTRAINT [r_1577]
GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[r_1570].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_30min] WITH NOCHECK ADD CONSTRAINT [r_1570] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_30min] WITH CHECK CHECK CONSTRAINT [r_1570]
GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[r_1572].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_30min] WITH NOCHECK ADD CONSTRAINT [r_1572] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_30min] WITH CHECK CHECK CONSTRAINT [r_1572]
GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[r_1574].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_30min] WITH NOCHECK ADD CONSTRAINT [r_1574] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_30min] WITH CHECK CHECK CONSTRAINT [r_1574]
GO
--SqlScripter----[dbo].[wsm_dc_val_30min].[r_1576].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_30min] WITH NOCHECK ADD CONSTRAINT [r_1576] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_30min] WITH CHECK CHECK CONSTRAINT [r_1576]
GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[r_1546].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_5min] WITH NOCHECK ADD CONSTRAINT [r_1546] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_5min] WITH CHECK CHECK CONSTRAINT [r_1546]
GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[r_1547].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_5min] WITH NOCHECK ADD CONSTRAINT [r_1547] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_5min] WITH CHECK CHECK CONSTRAINT [r_1547]
GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[r_1548].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_5min] WITH NOCHECK ADD CONSTRAINT [r_1548] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_5min] WITH CHECK CHECK CONSTRAINT [r_1548]
GO
--SqlScripter----[dbo].[wsm_dc_val_5min].[r_1549].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_5min] WITH NOCHECK ADD CONSTRAINT [r_1549] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_5min] WITH CHECK CHECK CONSTRAINT [r_1549]
GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[r_1562].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_8hr] WITH NOCHECK ADD CONSTRAINT [r_1562] FOREIGN KEY ([time_id])
REFERENCES [dbo].[wsm_dc_time] ([time_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_8hr] WITH CHECK CHECK CONSTRAINT [r_1562]
GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[r_1563].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_8hr] WITH NOCHECK ADD CONSTRAINT [r_1563] FOREIGN KEY ([day_id])
REFERENCES [dbo].[wsm_dc_day] ([day_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_8hr] WITH CHECK CHECK CONSTRAINT [r_1563]
GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[r_1567].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_8hr] WITH NOCHECK ADD CONSTRAINT [r_1567] FOREIGN KEY ([res_id])
REFERENCES [dbo].[wsm_dc_resource] ([res_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_8hr] WITH CHECK CHECK CONSTRAINT [r_1567]
GO
--SqlScripter----[dbo].[wsm_dc_val_8hr].[r_1569].sql
GO
ALTER TABLE [dbo].[wsm_dc_val_8hr] WITH NOCHECK ADD CONSTRAINT [r_1569] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_dc_val_8hr] WITH CHECK CHECK CONSTRAINT [r_1569]
GO
--SqlScripter----[dbo].[wsm_device].[r_15].sql
GO
ALTER TABLE [dbo].[wsm_device] WITH NOCHECK ADD CONSTRAINT [r_15] FOREIGN KEY ([model_uuid])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_device] WITH CHECK CHECK CONSTRAINT [r_15]
GO
--SqlScripter----[dbo].[wsm_device].[r_1509].sql
GO
ALTER TABLE [dbo].[wsm_device] WITH NOCHECK ADD CONSTRAINT [r_1509] FOREIGN KEY ([status_id])
REFERENCES [dbo].[wsm_status_definition] ([status_id])
GO
ALTER TABLE [dbo].[wsm_device] WITH CHECK CHECK CONSTRAINT [r_1509]
GO
--SqlScripter----[dbo].[wsm_device_attrib_def].[r_1490].sql
GO
ALTER TABLE [dbo].[wsm_device_attrib_def] WITH NOCHECK ADD CONSTRAINT [r_1490] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_device_attrib_def] WITH CHECK CHECK CONSTRAINT [r_1490]
GO
--SqlScripter----[dbo].[wsm_device_attribute].[r_1468].sql
GO
ALTER TABLE [dbo].[wsm_device_attribute] WITH NOCHECK ADD CONSTRAINT [r_1468] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_device_attribute] WITH CHECK CHECK CONSTRAINT [r_1468]
GO
--SqlScripter----[dbo].[wsm_device_attribute].[r_1470].sql
GO
ALTER TABLE [dbo].[wsm_device_attribute] WITH NOCHECK ADD CONSTRAINT [r_1470] FOREIGN KEY ([attribute_id])
REFERENCES [dbo].[wsm_device_attrib_def] ([attribute_id])
GO
ALTER TABLE [dbo].[wsm_device_attribute] WITH CHECK CHECK CONSTRAINT [r_1470]
GO
--SqlScripter----[dbo].[wsm_device_gui_attributes].[r_1502].sql
GO
ALTER TABLE [dbo].[wsm_device_gui_attributes] WITH NOCHECK ADD CONSTRAINT [r_1502] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_device_gui_attributes] WITH CHECK CHECK CONSTRAINT [r_1502]
GO
--SqlScripter----[dbo].[wsm_device_gui_attributes].[r_1503].sql
GO
ALTER TABLE [dbo].[wsm_device_gui_attributes] WITH NOCHECK ADD CONSTRAINT [r_1503] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_device_gui_attributes] WITH CHECK CHECK CONSTRAINT [r_1503]
GO
--SqlScripter----[dbo].[wsm_device_relationship].[$wsm_d_r00004a7e00000000].sql
GO
ALTER TABLE [dbo].[wsm_device_relationship] WITH NOCHECK ADD CONSTRAINT [$wsm_d_r00004a7e00000000] FOREIGN KEY ([device_id_sideb])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_device_relationship] WITH CHECK CHECK CONSTRAINT [$wsm_d_r00004a7e00000000]
GO
--SqlScripter----[dbo].[wsm_device_relationship].[$wsm_d_r00004a8800000000].sql
GO
ALTER TABLE [dbo].[wsm_device_relationship] WITH NOCHECK ADD CONSTRAINT [$wsm_d_r00004a8800000000] FOREIGN KEY ([device_id_sidea])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_device_relationship] WITH CHECK CHECK CONSTRAINT [$wsm_d_r00004a8800000000]
GO
--SqlScripter----[dbo].[wsm_engine].[r_1484].sql
GO
ALTER TABLE [dbo].[wsm_engine] WITH NOCHECK ADD CONSTRAINT [r_1484] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_engine] WITH CHECK CHECK CONSTRAINT [r_1484]
GO
--SqlScripter----[dbo].[wsm_engine].[r_1485].sql
GO
ALTER TABLE [dbo].[wsm_engine] WITH NOCHECK ADD CONSTRAINT [r_1485] FOREIGN KEY ([time_zone_code])
REFERENCES [dbo].[ca_time_zone] ([time_zone_code])
GO
ALTER TABLE [dbo].[wsm_engine] WITH CHECK CHECK CONSTRAINT [r_1485]
GO
--SqlScripter----[dbo].[wsm_engine].[r_1486].sql
GO
ALTER TABLE [dbo].[wsm_engine] WITH NOCHECK ADD CONSTRAINT [r_1486] FOREIGN KEY ([locale_code])
REFERENCES [dbo].[ca_locale] ([locale_code])
GO
ALTER TABLE [dbo].[wsm_engine] WITH CHECK CHECK CONSTRAINT [r_1486]
GO
--SqlScripter----[dbo].[wsm_engine].[r_1511].sql
GO
ALTER TABLE [dbo].[wsm_engine] WITH NOCHECK ADD CONSTRAINT [r_1511] FOREIGN KEY ([status_id])
REFERENCES [dbo].[wsm_status_definition] ([status_id])
GO
ALTER TABLE [dbo].[wsm_engine] WITH CHECK CHECK CONSTRAINT [r_1511]
GO
--SqlScripter----[dbo].[wsm_engine].[r_1543].sql
GO
ALTER TABLE [dbo].[wsm_engine] WITH NOCHECK ADD CONSTRAINT [r_1543] FOREIGN KEY ([config_profile_uuid])
REFERENCES [dbo].[wsm_configuration_profile] ([config_profile_uuid])
GO
ALTER TABLE [dbo].[wsm_engine] WITH CHECK CHECK CONSTRAINT [r_1543]
GO
--SqlScripter----[dbo].[wsm_events].[r_1528].sql
GO
ALTER TABLE [dbo].[wsm_events] WITH NOCHECK ADD CONSTRAINT [r_1528] FOREIGN KEY ([eventdefinition_id])
REFERENCES [dbo].[wsm_event_definitions] ([eventdefinition_id])
GO
ALTER TABLE [dbo].[wsm_events] WITH CHECK CHECK CONSTRAINT [r_1528]
GO
--SqlScripter----[dbo].[wsm_events].[r_1529].sql
GO
ALTER TABLE [dbo].[wsm_events] WITH NOCHECK ADD CONSTRAINT [r_1529] FOREIGN KEY ([associated_device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_events] WITH CHECK CHECK CONSTRAINT [r_1529]
GO
--SqlScripter----[dbo].[wsm_events].[r_1530].sql
GO
ALTER TABLE [dbo].[wsm_events] WITH NOCHECK ADD CONSTRAINT [r_1530] FOREIGN KEY ([source_device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_events] WITH CHECK CHECK CONSTRAINT [r_1530]
GO
--SqlScripter----[dbo].[wsm_events].[r_1579].sql
GO
ALTER TABLE [dbo].[wsm_events] WITH NOCHECK ADD CONSTRAINT [r_1579] FOREIGN KEY ([status_id])
REFERENCES [dbo].[wsm_status_definition] ([status_id])
GO
ALTER TABLE [dbo].[wsm_events] WITH CHECK CHECK CONSTRAINT [r_1579]
GO
--SqlScripter----[dbo].[wsm_global_gui_configuration].[r_1515].sql
GO
ALTER TABLE [dbo].[wsm_global_gui_configuration] WITH NOCHECK ADD CONSTRAINT [r_1515] FOREIGN KEY ([manager_uuid])
REFERENCES [dbo].[wsm_engine] ([manager_uuid])
GO
ALTER TABLE [dbo].[wsm_global_gui_configuration] WITH CHECK CHECK CONSTRAINT [r_1515]
GO
--SqlScripter----[dbo].[wsm_global_gui_configuration].[r_1516].sql
GO
ALTER TABLE [dbo].[wsm_global_gui_configuration] WITH NOCHECK ADD CONSTRAINT [r_1516] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_global_gui_configuration] WITH CHECK CHECK CONSTRAINT [r_1516]
GO
--SqlScripter----[dbo].[wsm_icon_group].[r_128].sql
GO
ALTER TABLE [dbo].[wsm_icon_group] WITH NOCHECK ADD CONSTRAINT [r_128] FOREIGN KEY ([status_id])
REFERENCES [dbo].[wsm_status_definition] ([status_id])
GO
ALTER TABLE [dbo].[wsm_icon_group] WITH CHECK CHECK CONSTRAINT [r_128]
GO
--SqlScripter----[dbo].[wsm_image].[r_9].sql
GO
ALTER TABLE [dbo].[wsm_image] WITH NOCHECK ADD CONSTRAINT [r_9] FOREIGN KEY ([image_type_id])
REFERENCES [dbo].[ca_image_type] ([id])
GO
ALTER TABLE [dbo].[wsm_image] WITH CHECK CHECK CONSTRAINT [r_9]
GO
--SqlScripter----[dbo].[wsm_level].[r_10].sql
GO
ALTER TABLE [dbo].[wsm_level] WITH NOCHECK ADD CONSTRAINT [r_10] FOREIGN KEY ([image_uuid])
REFERENCES [dbo].[wsm_image] ([image_uuid])
GO
ALTER TABLE [dbo].[wsm_level] WITH CHECK CHECK CONSTRAINT [r_10]
GO
--SqlScripter----[dbo].[wsm_level].[r_1499].sql
GO
ALTER TABLE [dbo].[wsm_level] WITH NOCHECK ADD CONSTRAINT [r_1499] FOREIGN KEY ([propogation_model_uuid])
REFERENCES [dbo].[wsm_propogation_model] ([propogation_model_uuid])
GO
ALTER TABLE [dbo].[wsm_level] WITH CHECK CHECK CONSTRAINT [r_1499]
GO
--SqlScripter----[dbo].[wsm_level].[r_6].sql
GO
ALTER TABLE [dbo].[wsm_level] WITH NOCHECK ADD CONSTRAINT [r_6] FOREIGN KEY ([location_id])
REFERENCES [dbo].[wsm_location] ([location_id])
GO
ALTER TABLE [dbo].[wsm_level] WITH CHECK CHECK CONSTRAINT [r_6]
GO
--SqlScripter----[dbo].[wsm_link_attribdef_to_model].[r_1482].sql
GO
ALTER TABLE [dbo].[wsm_link_attribdef_to_model] WITH NOCHECK ADD CONSTRAINT [r_1482] FOREIGN KEY ([attribute_id])
REFERENCES [dbo].[wsm_device_attrib_def] ([attribute_id])
GO
ALTER TABLE [dbo].[wsm_link_attribdef_to_model] WITH CHECK CHECK CONSTRAINT [r_1482]
GO
--SqlScripter----[dbo].[wsm_link_attribdef_to_model].[r_1483].sql
GO
ALTER TABLE [dbo].[wsm_link_attribdef_to_model] WITH NOCHECK ADD CONSTRAINT [r_1483] FOREIGN KEY ([model_uuid])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_link_attribdef_to_model] WITH CHECK CHECK CONSTRAINT [r_1483]
GO
--SqlScripter----[dbo].[wsm_link_config_to_device].[r_1473].sql
GO
ALTER TABLE [dbo].[wsm_link_config_to_device] WITH NOCHECK ADD CONSTRAINT [r_1473] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_link_config_to_device] WITH CHECK CHECK CONSTRAINT [r_1473]
GO
--SqlScripter----[dbo].[wsm_link_config_to_device].[r_1474].sql
GO
ALTER TABLE [dbo].[wsm_link_config_to_device] WITH NOCHECK ADD CONSTRAINT [r_1474] FOREIGN KEY ([config_profile_uuid])
REFERENCES [dbo].[wsm_configuration_profile] ([config_profile_uuid])
GO
ALTER TABLE [dbo].[wsm_link_config_to_device] WITH CHECK CHECK CONSTRAINT [r_1474]
GO
--SqlScripter----[dbo].[wsm_link_firmware_def_to_model].[r_1480].sql
GO
ALTER TABLE [dbo].[wsm_link_firmware_def_to_model] WITH NOCHECK ADD CONSTRAINT [r_1480] FOREIGN KEY ([model_uuid])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_link_firmware_def_to_model] WITH CHECK CHECK CONSTRAINT [r_1480]
GO
--SqlScripter----[dbo].[wsm_link_firmware_def_to_model].[r_1481].sql
GO
ALTER TABLE [dbo].[wsm_link_firmware_def_to_model] WITH NOCHECK ADD CONSTRAINT [r_1481] FOREIGN KEY ([firmware_uuid])
REFERENCES [dbo].[wsm_firmware_definition] ([firmware_uuid])
GO
ALTER TABLE [dbo].[wsm_link_firmware_def_to_model] WITH CHECK CHECK CONSTRAINT [r_1481]
GO
--SqlScripter----[dbo].[wsm_link_firmware_to_device].[r_17].sql
GO
ALTER TABLE [dbo].[wsm_link_firmware_to_device] WITH NOCHECK ADD CONSTRAINT [r_17] FOREIGN KEY ([firmware_uuid])
REFERENCES [dbo].[wsm_firmware_definition] ([firmware_uuid])
GO
ALTER TABLE [dbo].[wsm_link_firmware_to_device] WITH CHECK CHECK CONSTRAINT [r_17]
GO
--SqlScripter----[dbo].[wsm_link_firmware_to_device].[r_18].sql
GO
ALTER TABLE [dbo].[wsm_link_firmware_to_device] WITH NOCHECK ADD CONSTRAINT [r_18] FOREIGN KEY ([device_id])
REFERENCES [dbo].[wsm_device] ([device_id])
GO
ALTER TABLE [dbo].[wsm_link_firmware_to_device] WITH CHECK CHECK CONSTRAINT [r_18]
GO
--SqlScripter----[dbo].[wsm_link_icongrp_to_model].[r_129].sql
GO
ALTER TABLE [dbo].[wsm_link_icongrp_to_model] WITH NOCHECK ADD CONSTRAINT [r_129] FOREIGN KEY ([icongroup_uuid])
REFERENCES [dbo].[wsm_icon_group] ([id])
GO
ALTER TABLE [dbo].[wsm_link_icongrp_to_model] WITH CHECK CHECK CONSTRAINT [r_129]
GO
--SqlScripter----[dbo].[wsm_link_icongrp_to_model].[r_130].sql
GO
ALTER TABLE [dbo].[wsm_link_icongrp_to_model] WITH NOCHECK ADD CONSTRAINT [r_130] FOREIGN KEY ([model_uuid])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_link_icongrp_to_model] WITH CHECK CHECK CONSTRAINT [r_130]
GO
--SqlScripter----[dbo].[wsm_link_model_method_tmplate].[r_1531].sql
GO
ALTER TABLE [dbo].[wsm_link_model_method_tmplate] WITH NOCHECK ADD CONSTRAINT [r_1531] FOREIGN KEY ([model_method_uuid])
REFERENCES [dbo].[wsm_model_method_template] ([model_method_uuid])
GO
ALTER TABLE [dbo].[wsm_link_model_method_tmplate] WITH CHECK CHECK CONSTRAINT [r_1531]
GO
--SqlScripter----[dbo].[wsm_link_model_method_tmplate].[r_1532].sql
GO
ALTER TABLE [dbo].[wsm_link_model_method_tmplate] WITH NOCHECK ADD CONSTRAINT [r_1532] FOREIGN KEY ([model_uuid])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_link_model_method_tmplate] WITH CHECK CHECK CONSTRAINT [r_1532]
GO
--SqlScripter----[dbo].[wsm_link_model_to_template].[r_1477].sql
GO
ALTER TABLE [dbo].[wsm_link_model_to_template] WITH NOCHECK ADD CONSTRAINT [r_1477] FOREIGN KEY ([templateuuid])
REFERENCES [dbo].[wsm_template] ([templateuuid])
GO
ALTER TABLE [dbo].[wsm_link_model_to_template] WITH CHECK CHECK CONSTRAINT [r_1477]
GO
--SqlScripter----[dbo].[wsm_link_model_to_template].[r_1478].sql
GO
ALTER TABLE [dbo].[wsm_link_model_to_template] WITH NOCHECK ADD CONSTRAINT [r_1478] FOREIGN KEY ([model_uuid])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_link_model_to_template] WITH CHECK CHECK CONSTRAINT [r_1478]
GO
--SqlScripter----[dbo].[wsm_link_policy_to_policy].[r_1521].sql
GO
ALTER TABLE [dbo].[wsm_link_policy_to_policy] WITH NOCHECK ADD CONSTRAINT [r_1521] FOREIGN KEY ([policy_uuid])
REFERENCES [dbo].[wsm_policy_detail] ([policy_uuid])
GO
ALTER TABLE [dbo].[wsm_link_policy_to_policy] WITH CHECK CHECK CONSTRAINT [r_1521]
GO
--SqlScripter----[dbo].[wsm_link_policy_to_policy].[r_1522].sql
GO
ALTER TABLE [dbo].[wsm_link_policy_to_policy] WITH NOCHECK ADD CONSTRAINT [r_1522] FOREIGN KEY ([assoc_policy_id])
REFERENCES [dbo].[wsm_policy_detail] ([policy_uuid])
GO
ALTER TABLE [dbo].[wsm_link_policy_to_policy] WITH CHECK CHECK CONSTRAINT [r_1522]
GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_frmware].[r_1536].sql
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_frmware] WITH NOCHECK ADD CONSTRAINT [r_1536] FOREIGN KEY ([bundleid])
REFERENCES [dbo].[wsm_resource_bundle] ([bundleid])
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_frmware] WITH CHECK CHECK CONSTRAINT [r_1536]
GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_frmware].[r_1537].sql
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_frmware] WITH NOCHECK ADD CONSTRAINT [r_1537] FOREIGN KEY ([firmware_uuid])
REFERENCES [dbo].[wsm_firmware_definition] ([firmware_uuid])
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_frmware] WITH CHECK CHECK CONSTRAINT [r_1537]
GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_tmplt].[r_1538].sql
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_tmplt] WITH NOCHECK ADD CONSTRAINT [r_1538] FOREIGN KEY ([bundleid])
REFERENCES [dbo].[wsm_resource_bundle] ([bundleid])
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_tmplt] WITH CHECK CHECK CONSTRAINT [r_1538]
GO
--SqlScripter----[dbo].[wsm_link_rsrc_bundle_tmplt].[r_1539].sql
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_tmplt] WITH NOCHECK ADD CONSTRAINT [r_1539] FOREIGN KEY ([templateuuid])
REFERENCES [dbo].[wsm_template] ([templateuuid])
GO
ALTER TABLE [dbo].[wsm_link_rsrc_bundle_tmplt] WITH CHECK CHECK CONSTRAINT [r_1539]
GO
--SqlScripter----[dbo].[wsm_location].[r_1461].sql
GO
ALTER TABLE [dbo].[wsm_location] WITH NOCHECK ADD CONSTRAINT [r_1461] FOREIGN KEY ([ca_location_uuid])
REFERENCES [dbo].[ca_location] ([location_uuid])
GO
ALTER TABLE [dbo].[wsm_location] WITH CHECK CHECK CONSTRAINT [r_1461]
GO
--SqlScripter----[dbo].[wsm_location].[r_1495].sql
GO
ALTER TABLE [dbo].[wsm_location] WITH NOCHECK ADD CONSTRAINT [r_1495] FOREIGN KEY ([site_id])
REFERENCES [dbo].[ca_site] ([id])
GO
ALTER TABLE [dbo].[wsm_location] WITH CHECK CHECK CONSTRAINT [r_1495]
GO
--SqlScripter----[dbo].[wsm_location].[r_7].sql
GO
ALTER TABLE [dbo].[wsm_location] WITH NOCHECK ADD CONSTRAINT [r_7] FOREIGN KEY ([manager_uuid])
REFERENCES [dbo].[wsm_engine] ([manager_uuid])
GO
ALTER TABLE [dbo].[wsm_location] WITH CHECK CHECK CONSTRAINT [r_7]
GO
--SqlScripter----[dbo].[wsm_model].[r_12].sql
GO
ALTER TABLE [dbo].[wsm_model] WITH NOCHECK ADD CONSTRAINT [r_12] FOREIGN KEY ([device_type_id])
REFERENCES [dbo].[wsm_device_type] ([id])
GO
ALTER TABLE [dbo].[wsm_model] WITH CHECK CHECK CONSTRAINT [r_12]
GO
--SqlScripter----[dbo].[wsm_model].[r_1506].sql
GO
ALTER TABLE [dbo].[wsm_model] WITH NOCHECK ADD CONSTRAINT [r_1506] FOREIGN KEY ([parent_model_uuid])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_model] WITH CHECK CHECK CONSTRAINT [r_1506]
GO
--SqlScripter----[dbo].[wsm_model].[r_1508].sql
GO
ALTER TABLE [dbo].[wsm_model] WITH NOCHECK ADD CONSTRAINT [r_1508] FOREIGN KEY ([manufacturer_uuid])
REFERENCES [dbo].[ca_company] ([company_uuid])
GO
ALTER TABLE [dbo].[wsm_model] WITH CHECK CHECK CONSTRAINT [r_1508]
GO
--SqlScripter----[dbo].[wsm_model_relationship].[r_114].sql
GO
ALTER TABLE [dbo].[wsm_model_relationship] WITH NOCHECK ADD CONSTRAINT [r_114] FOREIGN KEY ([model_uuid_aside])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_model_relationship] WITH CHECK CHECK CONSTRAINT [r_114]
GO
--SqlScripter----[dbo].[wsm_model_relationship].[r_115].sql
GO
ALTER TABLE [dbo].[wsm_model_relationship] WITH NOCHECK ADD CONSTRAINT [r_115] FOREIGN KEY ([model_uuid_bside])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_model_relationship] WITH CHECK CHECK CONSTRAINT [r_115]
GO
--SqlScripter----[dbo].[wsm_model_relationship].[r_127].sql
GO
ALTER TABLE [dbo].[wsm_model_relationship] WITH NOCHECK ADD CONSTRAINT [r_127] FOREIGN KEY ([model_uuid])
REFERENCES [dbo].[wsm_model] ([model_uuid])
GO
ALTER TABLE [dbo].[wsm_model_relationship] WITH CHECK CHECK CONSTRAINT [r_127]
GO
--SqlScripter----[dbo].[wsm_propogation_model_ext].[r_1497].sql
GO
ALTER TABLE [dbo].[wsm_propogation_model_ext] WITH NOCHECK ADD CONSTRAINT [r_1497] FOREIGN KEY ([propogation_model_uuid])
REFERENCES [dbo].[wsm_propogation_model] ([propogation_model_uuid])
GO
ALTER TABLE [dbo].[wsm_propogation_model_ext] WITH CHECK CHECK CONSTRAINT [r_1497]
GO
--SqlScripter----[dbo].[wsm_propogation_model_ext].[r_1498].sql
GO
ALTER TABLE [dbo].[wsm_propogation_model_ext] WITH NOCHECK ADD CONSTRAINT [r_1498] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_propogation_model_ext] WITH CHECK CHECK CONSTRAINT [r_1498]
GO
--SqlScripter----[dbo].[wsm_resource_bundle].[r_1534].sql
GO
ALTER TABLE [dbo].[wsm_resource_bundle] WITH NOCHECK ADD CONSTRAINT [r_1534] FOREIGN KEY ([locale_code])
REFERENCES [dbo].[ca_locale] ([locale_code])
GO
ALTER TABLE [dbo].[wsm_resource_bundle] WITH CHECK CHECK CONSTRAINT [r_1534]
GO
--SqlScripter----[dbo].[wsm_subnets].[r_1].sql
GO
ALTER TABLE [dbo].[wsm_subnets] WITH NOCHECK ADD CONSTRAINT [r_1] FOREIGN KEY ([manager_uuid])
REFERENCES [dbo].[wsm_engine] ([manager_uuid])
GO
ALTER TABLE [dbo].[wsm_subnets] WITH CHECK CHECK CONSTRAINT [r_1]
GO
--SqlScripter----[dbo].[wsm_task_attribute].[r_1489].sql
GO
ALTER TABLE [dbo].[wsm_task_attribute] WITH NOCHECK ADD CONSTRAINT [r_1489] FOREIGN KEY ([manager_uuid], [taskid])
REFERENCES [dbo].[wsm_task_list] ([manager_uuid], [taskid])
GO
ALTER TABLE [dbo].[wsm_task_attribute] WITH CHECK CHECK CONSTRAINT [r_1489]
GO
--SqlScripter----[dbo].[wsm_task_attribute].[r_1491].sql
GO
ALTER TABLE [dbo].[wsm_task_attribute] WITH NOCHECK ADD CONSTRAINT [r_1491] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_task_attribute] WITH CHECK CHECK CONSTRAINT [r_1491]
GO
--SqlScripter----[dbo].[wsm_task_list].[r_1492].sql
GO
ALTER TABLE [dbo].[wsm_task_list] WITH NOCHECK ADD CONSTRAINT [r_1492] FOREIGN KEY ([task_sched_id])
REFERENCES [dbo].[wsm_task_schedule] ([task_sched_id])
GO
ALTER TABLE [dbo].[wsm_task_list] WITH CHECK CHECK CONSTRAINT [r_1492]
GO
--SqlScripter----[dbo].[wsm_task_list].[r_1518].sql
GO
ALTER TABLE [dbo].[wsm_task_list] WITH NOCHECK ADD CONSTRAINT [r_1518] FOREIGN KEY ([status_id])
REFERENCES [dbo].[wsm_status_definition] ([status_id])
GO
ALTER TABLE [dbo].[wsm_task_list] WITH CHECK CHECK CONSTRAINT [r_1518]
GO
--SqlScripter----[dbo].[wsm_task_list].[r_2].sql
GO
ALTER TABLE [dbo].[wsm_task_list] WITH NOCHECK ADD CONSTRAINT [r_2] FOREIGN KEY ([manager_uuid])
REFERENCES [dbo].[wsm_engine] ([manager_uuid])
GO
ALTER TABLE [dbo].[wsm_task_list] WITH CHECK CHECK CONSTRAINT [r_2]
GO
--SqlScripter----[dbo].[wsm_template].[r_1540].sql
GO
ALTER TABLE [dbo].[wsm_template] WITH NOCHECK ADD CONSTRAINT [r_1540] FOREIGN KEY ([template_type_id])
REFERENCES [dbo].[wsm_template_type] ([template_type_id])
GO
ALTER TABLE [dbo].[wsm_template] WITH CHECK CHECK CONSTRAINT [r_1540]
GO
--SqlScripter----[dbo].[wsm_user].[r_1527].sql
GO
ALTER TABLE [dbo].[wsm_user] WITH NOCHECK ADD CONSTRAINT [r_1527] FOREIGN KEY ([userprofile_uuid])
REFERENCES [dbo].[wsm_userprofile_detail] ([userprofile_uuid])
GO
ALTER TABLE [dbo].[wsm_user] WITH CHECK CHECK CONSTRAINT [r_1527]
GO
--SqlScripter----[dbo].[wsm_user_gui_config_item].[r_1513].sql
GO
ALTER TABLE [dbo].[wsm_user_gui_config_item] WITH NOCHECK ADD CONSTRAINT [r_1513] FOREIGN KEY ([config_uuid])
REFERENCES [dbo].[wsm_user_gui_configuration] ([config_uuid])
GO
ALTER TABLE [dbo].[wsm_user_gui_config_item] WITH CHECK CHECK CONSTRAINT [r_1513]
GO
--SqlScripter----[dbo].[wsm_user_gui_config_item].[r_1514].sql
GO
ALTER TABLE [dbo].[wsm_user_gui_config_item] WITH NOCHECK ADD CONSTRAINT [r_1514] FOREIGN KEY ([attribute_type_id])
REFERENCES [dbo].[wsm_attribute_type] ([attribute_type_id])
GO
ALTER TABLE [dbo].[wsm_user_gui_config_item] WITH CHECK CHECK CONSTRAINT [r_1514]
GO
--SqlScripter----[dbo].[wsm_user_gui_configuration].[r_1512].sql
GO
ALTER TABLE [dbo].[wsm_user_gui_configuration] WITH NOCHECK ADD CONSTRAINT [r_1512] FOREIGN KEY ([user_uuid])
REFERENCES [dbo].[wsm_user] ([user_uuid])
GO
ALTER TABLE [dbo].[wsm_user_gui_configuration] WITH CHECK CHECK CONSTRAINT [r_1512]
GO
--SqlScripter----[dbo].[wsm_user_gui_configuration].[r_1517].sql
GO
ALTER TABLE [dbo].[wsm_user_gui_configuration] WITH NOCHECK ADD CONSTRAINT [r_1517] FOREIGN KEY ([manager_uuid])
REFERENCES [dbo].[wsm_engine] ([manager_uuid])
GO
ALTER TABLE [dbo].[wsm_user_gui_configuration] WITH CHECK CHECK CONSTRAINT [r_1517]
GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[r_1523].sql
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] WITH NOCHECK ADD CONSTRAINT [r_1523] FOREIGN KEY ([policy_uuid])
REFERENCES [dbo].[wsm_policy_detail] ([policy_uuid])
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] WITH CHECK CHECK CONSTRAINT [r_1523]
GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[r_1524].sql
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] WITH NOCHECK ADD CONSTRAINT [r_1524] FOREIGN KEY ([userprofile_uuid])
REFERENCES [dbo].[wsm_userprofile_detail] ([userprofile_uuid])
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] WITH CHECK CHECK CONSTRAINT [r_1524]
GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[r_1525].sql
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] WITH NOCHECK ADD CONSTRAINT [r_1525] FOREIGN KEY ([rule_uuid])
REFERENCES [dbo].[wsm_rule] ([rule_uuid])
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] WITH CHECK CHECK CONSTRAINT [r_1525]
GO
--SqlScripter----[dbo].[wsm_userprofile_assoc_detail].[r_1526].sql
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] WITH NOCHECK ADD CONSTRAINT [r_1526] FOREIGN KEY ([sched_uuid])
REFERENCES [dbo].[wsm_profile_schedule] ([sched_uuid])
GO
ALTER TABLE [dbo].[wsm_userprofile_assoc_detail] WITH CHECK CHECK CONSTRAINT [r_1526]
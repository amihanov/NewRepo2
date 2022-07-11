﻿SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('[dbo].[MRI_CR_SAP_CONNECT_INFO]') IS NULL EXEC('CREATE VIEW [dbo].[MRI_CR_SAP_CONNECT_INFO] AS /*TEMPORARY OBJECT, DELETE AFTER ALL OBJECTS ARE CREATED*/ SELECT 0 C1')
GO
ALTER VIEW [dbo].[MRI_CR_SAP_CONNECT_INFO]
( FROM_PID, FROM_NSID, FROM_EID, TO_PID, TO_TYPE, PROP_NAME ) as (select a50.POC_GENERIC_REF_PAR_ENTITY, a51.PSC_NSID, a51.PSC_EXTERNID, a50.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_0 a50 join "dbo".PO_CONNECTINFO a51 on a50.POC_GENERIC_REF_PAR_ENTITY = a51.PSC_OPID  where a51.PSC_PRSID = 0 AND (a51.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a50.POC_GENERIC_REF_PAR_TYPE = 496)  AND a50.POC_PROPERTYNAME = 1204 ) UNION ALL (select a52.POC_GENERIC_REF_PAR_ENTITY, a53.PSC_NSID, a53.PSC_EXTERNID, a52.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_1 a52 join "dbo".PO_CONNECTINFO a53 on a52.POC_GENERIC_REF_PAR_ENTITY = a53.PSC_OPID  where a53.PSC_PRSID = 0 AND (a53.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a52.POC_GENERIC_REF_PAR_TYPE = 496)  AND a52.POC_PROPERTYNAME = 1204 ) UNION ALL (select a54.POC_GENERIC_REF_PAR_ENTITY, a55.PSC_NSID, a55.PSC_EXTERNID, a54.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_2 a54 join "dbo".PO_CONNECTINFO a55 on a54.POC_GENERIC_REF_PAR_ENTITY = a55.PSC_OPID  where a55.PSC_PRSID = 0 AND (a55.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a54.POC_GENERIC_REF_PAR_TYPE = 496)  AND a54.POC_PROPERTYNAME = 1204 ) UNION ALL (select a56.POC_GENERIC_REF_PAR_ENTITY, a57.PSC_NSID, a57.PSC_EXTERNID, a56.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_3 a56 join "dbo".PO_CONNECTINFO a57 on a56.POC_GENERIC_REF_PAR_ENTITY = a57.PSC_OPID  where a57.PSC_PRSID = 0 AND (a57.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a56.POC_GENERIC_REF_PAR_TYPE = 496)  AND a56.POC_PROPERTYNAME = 1204 ) UNION ALL (select a58.POC_GENERIC_REF_PAR_ENTITY, a59.PSC_NSID, a59.PSC_EXTERNID, a58.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_4 a58 join "dbo".PO_CONNECTINFO a59 on a58.POC_GENERIC_REF_PAR_ENTITY = a59.PSC_OPID  where a59.PSC_PRSID = 0 AND (a59.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a58.POC_GENERIC_REF_PAR_TYPE = 496)  AND a58.POC_PROPERTYNAME = 1204 ) UNION ALL (select a60.POC_GENERIC_REF_PAR_ENTITY, a61.PSC_NSID, a61.PSC_EXTERNID, a60.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_5 a60 join "dbo".PO_CONNECTINFO a61 on a60.POC_GENERIC_REF_PAR_ENTITY = a61.PSC_OPID  where a61.PSC_PRSID = 0 AND (a61.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a60.POC_GENERIC_REF_PAR_TYPE = 496)  AND a60.POC_PROPERTYNAME = 1204 ) UNION ALL (select a62.POC_GENERIC_REF_PAR_ENTITY, a63.PSC_NSID, a63.PSC_EXTERNID, a62.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_6 a62 join "dbo".PO_CONNECTINFO a63 on a62.POC_GENERIC_REF_PAR_ENTITY = a63.PSC_OPID  where a63.PSC_PRSID = 0 AND (a63.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a62.POC_GENERIC_REF_PAR_TYPE = 496)  AND a62.POC_PROPERTYNAME = 1204 ) UNION ALL (select a64.POC_GENERIC_REF_PAR_ENTITY, a65.PSC_NSID, a65.PSC_EXTERNID, a64.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_7 a64 join "dbo".PO_CONNECTINFO a65 on a64.POC_GENERIC_REF_PAR_ENTITY = a65.PSC_OPID  where a65.PSC_PRSID = 0 AND (a65.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a64.POC_GENERIC_REF_PAR_TYPE = 496)  AND a64.POC_PROPERTYNAME = 1204 ) UNION ALL (select a66.POC_GENERIC_REF_PAR_ENTITY, a67.PSC_NSID, a67.PSC_EXTERNID, a66.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_8 a66 join "dbo".PO_CONNECTINFO a67 on a66.POC_GENERIC_REF_PAR_ENTITY = a67.PSC_OPID  where a67.PSC_PRSID = 0 AND (a67.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a66.POC_GENERIC_REF_PAR_TYPE = 496)  AND a66.POC_PROPERTYNAME = 1204 ) UNION ALL (select a68.POC_GENERIC_REF_PAR_ENTITY, a69.PSC_NSID, a69.PSC_EXTERNID, a68.POC_GENERIC_REF_ENTITY, '', 'com.informatica.metadata.common.core.NamedElement.annotations' from "dbo".PO_COLLECTIONENTRY_9 a68 join "dbo".PO_CONNECTINFO a69 on a68.POC_GENERIC_REF_PAR_ENTITY = a69.PSC_OPID  where a69.PSC_PRSID = 0 AND (a69.PSC_DISCRIMINATOR = 'SAPCONNECTINF1' AND a68.POC_GENERIC_REF_PAR_TYPE = 496)  AND a68.POC_PROPERTYNAME = 1204 )
GO
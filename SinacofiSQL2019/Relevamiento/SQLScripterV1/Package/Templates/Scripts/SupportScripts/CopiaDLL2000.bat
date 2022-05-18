Echo ************************************************************************* 
Echo **** CopiaDLL2000.bat                                                     
Echo **** Proyecto: Migración SQL 2000 -> SQL 2008                             
Echo **** Objetivo: Copiar DLL's para su correcta instalacion 		       
Echo **** Fecha Creacion: 16-11-2011                                           
Echo ************************************************************************* 
copy C:\"Program Files (x86)"\"Microsoft SQL Server"\80\Tools\Binn\semsfc.dll C:\"Program Files (x86)"\"Microsoft SQL Server"\100\Tools\Binn\VSShell\Common7\IDE\ /Y
copy C:\"Program Files (x86)"\"Microsoft SQL Server"\80\Tools\Binn\sqlgui.dll C:\"Program Files (x86)"\"Microsoft SQL Server"\100\Tools\Binn\VSShell\Common7\IDE\ /Y
copy C:\"Program Files (x86)"\"Microsoft SQL Server"\80\Tools\Binn\sqlsvc.dll C:\"Program Files (x86)"\"Microsoft SQL Server"\100\Tools\Binn\VSShell\Common7\IDE\ /Y
copy C:\"Program Files (x86)"\"Microsoft SQL Server"\80\Tools\Binn\resources\1033\semsfc.rll C:\"Program Files (x86)"\"Microsoft SQL Server"\100\Tools\Binn\VSShell\Common7\IDE\Resources\1033\ /Y
copy C:\"Program Files (x86)"\"Microsoft SQL Server"\80\Tools\Binn\resources\1033\sqlgui.rll C:\"Program Files (x86)"\"Microsoft SQL Server"\100\Tools\Binn\VSShell\Common7\IDE\Resources\1033\ /Y
copy C:\"Program Files (x86)"\"Microsoft SQL Server"\80\Tools\Binn\resources\1033\sqlsvc.rll C:\"Program Files (x86)"\"Microsoft SQL Server"\100\Tools\Binn\VSShell\Common7\IDE\Resources\1033\ /Y
pause
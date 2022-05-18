print '--Mensajes personalizados'
select 
'EXEC sp_addmessage @msgnum='+cast(error as varchar(10))+', @severity= '+ cast(severity as varchar(10))+', @msgtext=N'''+ replace(description,'''','''''')+''', @lang='''+ 
(select top 1 name from syslanguages where msglangid = m.msglangid) +''', @replace=''replace''' + char(13) line
from sysmessages m
where error >=50000
order by error


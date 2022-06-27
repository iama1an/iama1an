



--ESTE CODIGO ES PARA SACAR EL DICCIONARIO DE DATOS--

sys.tables
sys.columns
sys.systypes
sys.objects
sys.extended_properties


select 
	d.object_id,
	a.name [tabla],
	b.name [columna], 
	c.name [tipo], 
	CASE
		WHEN c.name = 'numeric' OR  c.name = 'decimal' OR c.name = 'float'  THEN b.precision
		ELSE null
	END [Precision], 
	b.max_length, 
	CASE 
		WHEN b.is_nullable = 0 THEN 'NO'
		ELSE 'SI'
	END [Permite Nulls],
	CASE 
		WHEN b.is_identity = 0 THEN 'NO'
		ELSE 'SI'
	END [Es Autonumerico],	
	--ep.value [Descripcion],
	f.ForeignKey, 
	f.ReferenceTableName, 
	f.ReferenceColumnName 
from sys.tables a   
	inner join sys.columns b on a.object_id= b.object_id 
	inner join sys.systypes c on b.system_type_id= c.xtype 
	inner join sys.objects d on a.object_id= d.object_id 
	LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND b.column_Id = ep.minor_id
	LEFT JOIN (SELECT 
				f.name AS ForeignKey,
				OBJECT_NAME(f.parent_object_id) AS TableName,
				COL_NAME(fc.parent_object_id,fc.parent_column_id) AS ColumnName,
				OBJECT_NAME (f.referenced_object_id) AS ReferenceTableName,
				COL_NAME(fc.referenced_object_id,fc.referenced_column_id) AS ReferenceColumnName
				FROM sys.foreign_keys AS f
				INNER JOIN sys.foreign_key_columns AS fc ON f.OBJECT_ID = fc.constraint_object_id) 	f ON f.TableName =a.name AND f.ColumnName =b.name
WHERE a.name <> 'sysdiagrams' 
ORDER BY a.name,b.column_Id




----------------------------IMPRIME LOS ELEMENTOS BASICOS QUE SE SOLICITAN

select	a.name [ENTIDAD],
		b.name [CAMPOS],
		c.name + '(' + CAST(c.length AS VARCHAR) + ')' AS [TIPO DE DATO],
		case when b.isnullable=0 then 'NO' else 'SI' end [NULL],
		case when d.name is null then '' else 'X' end [PK],
		case when e.parent_object_id is null then '' else 'X' end [FK],
		case when h.value is null then '' else h.value end [DESCRIPCIÓN]
 
from	sysobjects as a
		join syscolumns as b
			on a.id = b.id
		join systypes as c
			on b.xtype = c.xtype
		left join	(SELECT       so.id,
							sc.colid,
							sc.name
					 FROM	syscolumns sc
							join sysobjects so
								on so.id = sc.id
							join sysindexkeys si
								on so.id = si.id and
									sc.colid = si.colid
					 WHERE si.indid = 1) d
 
			on	a.id = d.id and
				b.colid = d.colid
		left join sys.foreign_key_columns as e
			on	a.id = e.parent_object_id and
				b.colid = e.parent_column_id
		left join sys.extended_properties as h
			on	a.id = h.major_id and
				b.colid = h.minor_id
 
where a.type = 'U'
order by a.name


-----OTRA

select a.name [Table],b.name [Attribute],c.name [DataType],b.isnullable [Allow Nulls?],CASE WHEN
d.name is null THEN 0 ELSE 1 END [PKey?],
CASE WHEN e.parent_object_id is null THEN 0 ELSE 1 END [FKey?],CASE WHEN e.parent_object_id
is null THEN '-' ELSE g.name  END [Ref Table],
CASE WHEN h.value is null THEN '-' ELSE h.value END [Description]
from sysobjects as a
join syscolumns as b on a.id = b.id
join systypes as c on b.xtype = c.xtype
left join (SELECT  so.id,sc.colid,sc.name
      FROM    syscolumns sc
      JOIN sysobjects so ON so.id = sc.id
      JOIN sysindexkeys si ON so.id = si.id
                    and sc.colid = si.colid
      WHERE si.indid = 1) d on a.id = d.id and b.colid = d.colid
left join sys.foreign_key_columns as e on a.id = e.parent_object_id and b.colid = e.parent_column_id
left join sys.objects as g on e.referenced_object_id = g.object_id
left join sys.extended_properties as h on a.id = h.major_id and b.colid = h.minor_id
where a.type = 'U' order by a.name
-- 1. Create the table
create table tbl_paths(path varchar(max))

-- 2. Insert the data
insert into tbl_paths 
values
	 ('folder1/subFolder1/photos/file1.jpg'),
	 ('fold2/dataFiles/documents/sqldocx.pdf'),
	 ('Fold-3/subSys/data/file2.mp4')

select * from tbl_paths

-- 3. Query to seperate file_names from the path
select *,
	reverse(substring(reverse(path), 
			  charindex('/', reverse(path))+ 1,
			  charindex('/', reverse(path),
					 charindex('/',reverse(path))+1 ) - charindex('/',reverse(path))-1
	)) as folderName,

	reverse(substring(reverse(path), 
			  0,
			  charindex('/',reverse(path))
	)) as fileName
from tbl_paths

-- 4. Query to find the no. of times the given letter is repeated in the City table
select City,len(City) - len(replace(City,'e','')) as lengt from tblCity









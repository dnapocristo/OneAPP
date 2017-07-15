select id
from user
where email=?
and
password=md5(?)
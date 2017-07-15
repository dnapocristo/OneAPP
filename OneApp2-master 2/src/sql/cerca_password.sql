select id
from agenda.user
where password = md5(?)
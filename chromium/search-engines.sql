-- Customize/add search engines
-- feed into 'Default/Web Data' database.

begin;

update keywords set keyword='a' where id in (select id from keywords where short_name like 'Amazon%' limit 1);
update keywords set keyword='g' where id in (select id from keywords where short_name like 'Google%' limit 1);
update keywords set keyword='w' where id in (select id from keywords where short_name like 'Wikipedia%' limit 1);
update keywords set keyword='y' where id in (select id from keywords where short_name like 'Yahoo%' limit 1);
update keywords set keyword='yt' where id in (select id from keywords where short_name like 'YouTube%' limit 1);

insert into keywords (short_name, keyword, favicon_url, url)
	values ('wordreference-enit', 'ei', 'http://www.wordreference.com/favicon.ico', 'http://www.wordreference.com/enit/{searchTerms}');
insert into keywords (short_name, keyword, favicon_url, url)
	values ('wordreference-iten', 'ie', 'http://www.wordreference.com/favicon.ico', 'http://www.wordreference.com/iten/{searchTerms}');

commit;


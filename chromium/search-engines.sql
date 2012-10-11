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
insert into keywords (short_name, keyword, favicon_url, url)
	values ('torrentz', 'ie', 'http://torrentz.eu/favicon.ico', 'http://torrentz.eu/search?q={searchTerms}');
insert into keywords (short_name, keyword, favicon_url, url)
	values ('Google Translate', 'tx', 'http://www.google.co.uk/favicon.ico', 'http://translate.google.com/?source=osdd#auto|auto|{searchTerms}');
insert into keywords (short_name, keyword, favicon_url, url)
	values ('LyricWiki', 'ly', 'http://images.wikia.com/lyricwiki/images/6/64/Favicon.ico', 'http://lyrics.wikia.com/Special:Search?search={searchTerms}');
insert into keywords (short_name, keyword, favicon_url, url)
	values ('Urban dictionary', 'u', '', 'http://www.urbandictionary.com/define.php?term={searchTerms}');
insert into keywords (short_name, keyword, favicon_url, url)
	values ('Google Maps', 'm', '', 'https://maps.google.co.uk/maps?q={searchTerms}&ie=UTF-8');
insert into keywords (short_name, keyword, favicon_url, url)
	values ('Yahoo', 'y', '', 'http://search.yahoo.com/search?p={searchTerms}');

commit;


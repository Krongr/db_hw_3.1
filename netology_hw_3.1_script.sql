create table if not exists singer_list (
	id serial primary key,
	singer_name varchar(40) not null unique,
	singer_aliase varchar (40)
);

create table if not exists genre_list (
	id serial primary key,
	genre_name varchar(40) not null unique
);

create table if not exists singer_genre_pair (
	singer_id integer references singer_list(id) not null,
	genre_id integer references genre_list(id) not null,
	constraint singer_genre_pk primary key (singer_id, genre_id)
);

create table if not exists record_album_list (
	id serial primary key,
	album_name varchar(40) not null unique,
	release_year integer not null 
);

create table if not exists singer_album_pair (
	singer_id integer references singer_list(id) not null,
	album_id integer references record_album_list(id) not null,
	constraint singer_album_pk primary key (singer_id, album_id)
);

create table if not exists track_list (
	id serial primary key,
	track_name varchar(40) not null unique,
	track_length integer not null,
	album_id integer references record_album_list(id) not null
);

create table if not exists music_collection_list (
	id serial primary key,
	collection_name varchar(40) not null unique,
	release_year integer  not null
);

create table if not exists track_collection_pair (
	track_id integer references track_list(id) not null,
	collection_id integer references music_collection_list(id) not null,
	constraint track_collection_pk primary key (track_id, collection_id)
);

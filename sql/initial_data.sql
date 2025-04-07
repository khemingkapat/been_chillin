CREATE TABLE MOVIE_SHOW (
    content_id serial PRIMARY KEY,
    title varchar(255),
    description text,
    release_year int,
    duration int,
    content_type varchar(10), -- Use VARCHAR instead of ENUM
    total_seasons int,
    thumbnail_url varchar(255),
    video_url varchar(255),
    rating float
);

INSERT INTO MOVIE_SHOW (title, description, release_year, duration, content_type, total_seasons, thumbnail_url, video_url, rating)
    VALUES ('Movie A', 'A great movie', 2021, 120, 'Movie', NULL, 'movie_a.jpg', '', 4.5),
    ('Show B', 'An exciting show', 2022, 60, 'Show', 3, 'show_b.jpg', '', 4.2),
    ('Movie C', 'A comedy movie', 2023, 100, 'Movie', NULL, 'movie_c.jpg', '', 4.8);

CREATE TABLE CATEGORY (
    category_id serial PRIMARY KEY,
    category_name varchar(255)
);

INSERT INTO CATEGORY (category_id, category_name)
    VALUES (1, 'Action'),
    (2, 'Drama'),
    (3, 'Comedy');

CREATE TABLE CONTENT_CATEGORY (
    content_category_id serial PRIMARY KEY,
    content_id int,
    category_id int,
    FOREIGN KEY (content_id) REFERENCES MOVIE_SHOW (content_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES CATEGORY (category_id) ON DELETE CASCADE
);

INSERT INTO CONTENT_CATEGORY (content_id, category_id)
    VALUES (1, 1), -- Movie A is an Action movie
    (2, 2), -- Show B is a Drama
    (3, 3);

-- Movie C is a Comedy
CREATE TABLE
LANGUAGE (
    language_id serial PRIMARY KEY,
    language_name varchar(255)
);

INSERT INTO
LANGUAGE (language_id, language_name)
    VALUES (1, 'English'),
    (2, 'Spanish'),
    (3, 'French');

CREATE TABLE MOVIE_LANGUAGE (
    id serial PRIMARY KEY,
    content_id int,
    language_id int,
    FOREIGN KEY (content_id) REFERENCES MOVIE_SHOW (content_id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES
    LANGUAGE (language_id) ON DELETE CASCADE
);

INSERT INTO MOVIE_LANGUAGE (content_id, language_id)
    VALUES (1, 1), -- Movie A is in English
    (2, 1), -- Show B is in English
    (2, 2);

-- Show B is also in Spanish
CREATE TABLE MOVIE_SUBTITLE (
    id serial PRIMARY KEY,
    content_id int,
    language_id int,
    FOREIGN KEY (content_id) REFERENCES MOVIE_SHOW (content_id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES
    LANGUAGE (language_id) ON DELETE CASCADE
);

INSERT INTO MOVIE_SUBTITLE (content_id, language_id)
    VALUES (1, 1), -- Movie A has English subtitles
    (2, 1), -- Show B has English subtitles
    (2, 3);

-- Show B has French subtitles

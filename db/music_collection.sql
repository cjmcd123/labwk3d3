DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
);

-- ON DELETE CASCADE
-- can be added to the foriegn key to allow it (albums in
-- this case) to be deleted when the parent (artists in
-- this case) is deleted.

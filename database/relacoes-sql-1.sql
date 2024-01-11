-- Active: 1703111657368@@127.0.0.1@3306
CREATE TABLE licenses (
  id TEXT PRIMARY KEY NOT NULL UNIQUE,
  register_number TEXT UNIQUE NOT NULL,
  category TEXT NOT NULL
);

CREATE TABLE drivers(
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  license_id TEXT UNIQUE NOT NULL,
  FOREIGN KEY (license_id) REFERENCES licenses(id)
);


INSERT INTO licenses (id, register_number, category)
VALUES
  ('1001', '123456', 'A'),
  ('1002', '4654646', 'AB');

SELECT * FROM licenses;


INSERT INTO drivers (id, name, email, password, license_id)
VALUES
  ('d001', 'Fulano', 'fulano@gmail.com', 'fulano123', '1001'),
  ('d002', 'Beltrano', 'beltrano@gmail.com', 'beltrano123', '1002');

  SELECT * FROM drivers;

  SELECT * FROM drivers
  INNER JOIN licenses
  ON drivers.license_id = licenses.id;

  SELECT
    drivers.id AS driverId,
    drivers.name,
    drivers.email,
    drivers.password,
    licenses.id AS licenseId,
    licenses.register_number AS registerNumber,
    licenses.category
  FROM drivers
  INNER JOIN licenses
  ON drivers.license_id = licenses.id;

  CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
  );

  CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
  );

INSERT INTO users (id, name, email, password)
VALUES
    ('u001', 'Fulano', 'fulano@email.com', 'fulano123'),
    ('u002', 'Ciclana', 'ciclana@email.com', 'ciclana99');

INSERT INTO phones (id, phone_number, user_id)
VALUES
    ('p001', '5561911111111', 'u001'),
    ('p002', '5531922222222', 'u001'),
    ('p003', '5512933333333', 'u002');

    SELECT * FROM users;

    SELECT * FROM phones;

    SELECT * FROM users
    INNER JOIN phones
    ON phones.user_id = users.id;

--   CREATE TABLE cursos (
--   id TEXT PRIMARY KEY NOT NULL UNIQUE,
--   register_number TEXT UNIQUE NOT NULL,
--   category TEXT NOT NULL
-- );

-- INSERT INTO cursos (id, register_number, category)
-- VALUES
--   ('1001', '123456', 'Técnologia da Informação'),
--   ('1002', '4654646', 'Administração');


-- SELECT * FROM cursos;

--   CREATE TABLE alunos(
--   id TEXT PRIMARY KEY UNIQUE NOT NULL,
--   name TEXT NOT NULL,
--   email TEXT UNIQUE NOT NULL,
--   password TEXT NOT NULL,
--   curso_id TEXT UNIQUE NOT NULL,
--   FOREIGN KEY (curso_id) REFERENCES cursos(id)
-- );

-- INSERT INTO alunos (id, name, email, password, curso_id)
-- VALUES
--   ('a001', 'Fulano', 'fulano@gmail.com', 'fulano123', '1001'),
--   ('a002', 'Beltrano', 'beltrano@gmail.com', 'beltrano123', '1002');


-- SELECT * FROM alunos;

-- SELECT * FROM drivers
--   INNER JOIN licenses
--   ON drivers.license_id = licenses.id;

 

-- -- Práticas
BEGIN;

DROP TABLE IF EXISTS "book", "label", "book_has_label";

CREATE TABLE IF NOT EXISTS "book" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name" VARCHAR(255) NOT NULL,
    "author" VARCHAR(255) NOT NULL,
    "position" SMALLINT NOT NULL DEFAULT 0,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);



CREATE TABLE IF NOT EXISTS "label" (
  "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "title" VARCHAR(255) NOT NULL,
  "color" VARCHAR(30),
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "book_has_label" (
  "book_id" INTEGER NOT NULL REFERENCES "book"("id") ON DELETE CASCADE,
  "label_id" INTEGER NOT NULL REFERENCES "label"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY ("book_id", "label_id") -- on crée une clé composite, une clé composée de plusieurs colonnes, ça garantit l'unicité de la combinaison
);

INSERT INTO "book" ("name", "author", "position")
VALUES
('Le fléau 1', 'Stephen King','1'),
('Le fléau 2', 'Stephen King','2'),
('Le tour du monde en 80 jours', 'Jules Verne','3'),
('Le signal', 'Maxime Chattam','4'),
('La tour sombre', 'Stephen King','5'),
('un(e)secte', 'Maxime Chattam','6'),
('De la terre à la lune', 'Jules verne','7'),
('Une étude en rouge', 'Sir Arthur Conan Doyle','8'),

INSERT INTO "label" ("title" "color")
VALUES
('Horreur', 'red'),
('Aventure', 'green'),
('Enquête', 'yellow'),

INSERT INTO "book_has_label" ("book_id", "label_id")
VALUES
(1,1),
(1,1),
(3,2),
(4,1),
(5,1),
(6,1),
(7,2),
(8,3),

COMMIT;
CREATE TABLE "appointments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "owner" varchar(255), "patient" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "charge_descriptions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "treatment" varchar(255), "patient" decimal(6,2), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20100624153344');

INSERT INTO schema_migrations (version) VALUES ('20100628104805');
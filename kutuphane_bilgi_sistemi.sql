-- SQL ifadelerinizi buraya yazınız. 

--CREATE DATABASE library; önce database oluşturulur.

-- DATABASE SEÇİLİR
\c library;
-- TABLOLAR OLUŞTURULUR

CREATE TABLE tur(
    id SERIAL PRIMARY KEY,
    ad VARCHAR(255) NOT NULL
);

CREATE TABLE yazar(
    id SERIAL PRIMARY KEY,
    ad VARCHAR(255) NOT NULL,
    soyad VARCHAR(255) NOT NULL
);

CREATE TABLE ogrenci(
    id SERIAL PRIMARY KEY,
    ad VARCHAR(255) NOT NULL,
    soyad VARCHAR(255) NOT NULL,
    dtarih VARCHAR(255) NOT NULL,
    cinsiyet VARCHAR(255) NOT NULL,
    sinif VARCHAR(255) NOT NULL,
    puan BIGINT NOT NULL
);

CREATE TABLE kitap(
    id SERIAL PRIMARY KEY,
    ad VARCHAR(255) NOT NULL,
    sayfasayisi BIGINT NOT NULL,
    puan BIGINT NOT NULL,
    yazar_id BIGINT NOT NULL,
    tur_id BIGINT NOT NULL
);

CREATE TABLE islem(
    id SERIAL PRIMARY KEY,
    ogrenci_id BIGINT NOT NULL,
    kitap_id BIGINT NOT NULL,
    atarih VARCHAR(255) NOT NULL,
    vtarih VARCHAR(255) NOT NULL
);

-- DIŞ ANAHTAR KISITLAMALARI EKLENİR
ALTER TABLE islem ADD CONSTRAINT islem_kitap_id_foreign FOREIGN KEY(kitap_id) REFERENCES kitap(id);
ALTER TABLE islem ADD CONSTRAINT islem_ogrenci_id_foreign FOREIGN KEY(ogrenci_id) REFERENCES ogrenci(id);
ALTER TABLE kitap ADD CONSTRAINT kitap_tur_id_foreign FOREIGN KEY(tur_id) REFERENCES tur(id);
ALTER TABLE kitap ADD CONSTRAINT kitap_yazar_id_foreign FOREIGN KEY(yazar_id) REFERENCES yazar(id);




-- MYSQL İÇİN AŞAĞIDAKİ GİBİ DE OLUŞTURULABİLİR.
CREATE TABLE `tur`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ad` VARCHAR(255) NOT NULL
);
CREATE TABLE `yazar`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ad` VARCHAR(255) NOT NULL,
    `soyad` VARCHAR(255) NOT NULL
);
CREATE TABLE `ogrenci`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ad` VARCHAR(255) NOT NULL,
    `soyad` VARCHAR(255) NOT NULL,
    `dtarih` VARCHAR(255) NOT NULL,
    `cinsiyet` VARCHAR(255) NOT NULL,
    `sinif` VARCHAR(255) NOT NULL,
    `puan` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `kitap`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ad` VARCHAR(255) NOT NULL,
    `sayfasayisi` BIGINT UNSIGNED NOT NULL,
    `puan` BIGINT UNSIGNED NOT NULL,
    `yazar_id` BIGINT UNSIGNED NOT NULL,
    `tur_id` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `islem`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ogrenci_id` BIGINT UNSIGNED NOT NULL,
    `kitap_id` BIGINT UNSIGNED NOT NULL,
    `atarih` VARCHAR(255) NOT NULL,
    `vtarih` VARCHAR(255) NOT NULL
);

-- DIŞ ANAHTAR KISITLAMALARI EKLENİR
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_kitap_id_foreign` FOREIGN KEY(`kitap_id`) REFERENCES `kitap`(`id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_ogrenci_id_foreign` FOREIGN KEY(`ogrenci_id`) REFERENCES `ogrenci`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_tur_id_foreign` FOREIGN KEY(`tur_id`) REFERENCES `tur`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_yazar_id_foreign` FOREIGN KEY(`yazar_id`) REFERENCES `yazar`(`id`);

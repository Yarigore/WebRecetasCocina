
-- Elimina las tablas si ya existen
DROP TABLE IF EXISTS ingrediente;
DROP TABLE IF EXISTS paso;
DROP TABLE IF EXISTS receta;
DROP TABLE IF EXISTS usuario;

-- Crear tabla de usuarios
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL UNIQUE,
    contrasenya VARCHAR(200) NOT NULL
);

-- Crear tabla de receta
CREATE TABLE receta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    descripcion VARCHAR(200),
    personas INT,
    tiempo INT,
    imagen_url VARCHAR(500)
);

-- Crear tabla de ingredientes relacionados con una receta (FK)
CREATE TABLE ingrediente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL, -- Nombre del ingrediente
    cantidad VARCHAR(50), -- Cantidad del ingrediente (e.g. "200 gramos")
    receta_id INT, -- Relación con receta
    CONSTRAINT fk_receta FOREIGN KEY (receta_id) REFERENCES receta(id) ON DELETE CASCADE
);

-- Crear tabla de pasos relacionados con una receta (FK)
CREATE TABLE paso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL, -- Paso a seguir
    receta_id INT, -- Relación con receta
    CONSTRAINT fk_receta_paso  FOREIGN KEY (receta_id) REFERENCES receta(id) ON DELETE CASCADE
);

-- Insertar recetas asociadas a los usuarios
INSERT INTO receta (id, nombre, descripcion, personas, tiempo, imagen_url) VALUES
(1, 'Revuelto de ajos tiernos con champiñones',
'Los champiñones son un alimento muy socorrido que permite preparar un sinfín de recetas. Además, no hace falta que sean frescos, en lata también están buenísimos y te pueden salvar la comida o la cena. En esta receta, los combinamos con ajos tiernos y un revuelto de huevos, ¡a tope de proteínas!',
4 ,
15,
'https://content.elmueble.com/medio/2024/09/12/revuelto-de-ajos-tiernos-con-champinones_00000000_240912130518_720x720.jpg'),

(2, 'Habitas salteadas con jamón ibérico y chipirones',
'¿No te apetece cocinar? Entonces sal del apuro con esta fácil y rápida receta de habitas baby salteadas con chipirones y jamón ibérico. El sabor excelente y su dificultad de preparación, mínima.',
4,
20,
'https://content.elmueble.com/medio/2023/03/30/habitas-salteadas-con-jamon-iberico-y-chipirones_00000000_230821132601_600x800.jpg'),

(3, 'Gazpachuelo de huevo frito con tropezones',
'Este plato típico de málaga es perfecto para cuando hace bien tiempo. Fresco, sabroso y muy sencillo de preparar, lo tendrás en tan solo 20 minutos. ¡Mira cómo se hace paso a paso!',
5,
20,
'https://content.elmueble.com/medio/2023/04/03/gazpachuelo-de-huevo-frito-con-tropezones_00000000_230821131955_450x600.jpg'),

(4, 'Timbal de arroz y lomo caramelizado',
'Esta receta es como el clásico timbal de verduras, pero con arroz y lomo caramelizado. ¡Está delicioso! Lo mejor es que es muy fácil de elaborar y apenas te robará tiempo, menos de 20 minutos. ',
2,
20,
'https://content.elmueble.com/medio/2023/03/30/timbal-de-arroz-y-lomo-caramelizado_00000000_230821132643_415x600.jpg'),

(5, 'Budines de chocolate y canela',
'Para un final dulce... Un postre muy sabroso, pero más ligero y fácil de preparar de lo habitual. Se denomina budín o pudín al postre originario de la cocina inglesa y cocina estadounidense que suele estar compuesto de diferentes ingredientes. Hoy, te proponemos el de chocolate y canela. ¡Delicioso!',
4,
20,
'https://content.elmueble.com/medio/2013/07/05/budines-de-chocolate-y-canela_00000000_230821134400_710x768.jpg');

-- Insertar ingredientes para cada receta
-- Ingredientes para la receta "Revuelto de ajos tiernos con champiñones"
INSERT INTO ingrediente (nombre, cantidad, receta_id) VALUES
('Huevos', '8 unidades', 1),
('Ajos tiernos', '1 manojo', 1),
('Champiñones', '200 gramos', 1),
('Aceite de oliva', '2 cucharadas', 1),
('Sal', 'al gusto', 1),
('Perejil', '2 ramitas', 1);

-- Ingredientes para la receta "Habitas salteadas con jamón ibérico y chipirones"
INSERT INTO ingrediente (nombre, cantidad, receta_id) VALUES
('Habitas en aceite', '520 gramos', 2),
('Chipirones', '8 unidades', 2),
('Jamón ibérico', '100 gramos', 2),
('Cebolleta', '1 unidad', 2),
('Vino blanco', '50 ml', 2),
('Aceite de oliva', '4 cucharadas', 2),
('Pimienta', 'al gusto', 2),
('Sal', 'al gusto', 2),
('Menta', '2 ramitas', 2);

-- Ingredientes para la receta "Gazpachuelo de huevo frito con tropezones"
INSERT INTO ingrediente (nombre, cantidad, receta_id) VALUES
('Huevos', '4 unidades', 3),
('Almendras crudas', '100 gramos', 3),
('Almendras crudas', '100 gramos', 3),
('Miga de pan del dia anterior', '50 gramos', 3),
('Ajo', '1 unidad', 3),
('Vinagre de jerez', '2 cucharadas', 3),
('Aceite', 'al gusto', 3),
('sal', 'al gusto', 3),
('pimienta', 'al gusto', 3),
('sal', 'al gusto', 3),
('Taquitos de jamón', 'al gusto', 3),
('Romero fresco', 'al gusto', 3),
('Picatostes', 'al gusto', 3);

-- Ingredientes para la receta "Timbal de arroz y lomo caramelizado"
INSERT INTO ingrediente (nombre, cantidad, receta_id) VALUES
('Lomo de cerdo', '300 gramos', 4),
('Miel', '50 gramos', 4),
('Salsa de soja suave', '75 mililitros', 4),
('Arroz para microondas', '2 vasitos', 4),
('Cebollino', '2 tallos', 4),
('Aceite de oliva', 'al gusto', 4),
('Semillas de sésamo', 'al gusto', 4),
('Germinados', 'al gusto', 4);

-- Ingredientes para la receta "Budines de chocolate y canela"
INSERT INTO ingrediente (nombre, cantidad, receta_id) VALUES
('Huevos', '3 unidades', 5),
('Chocolate fondant', '20 gramos', 5),
('Harina', '20 gramos', 5),
('Mantequilla', '15 gramos', 5),
('Azucar', '50 gramos', 5),
('Nata liquida', '1/4 de litro', 5),
('canela', '1 cucharadita', 5);

-- Insertar pasos para cada receta
-- Pasos para la receta "Revuelto de ajos tiernos con champiñones"
INSERT INTO paso (nombre, receta_id) VALUES
('Paso 1. Limpia los ajos tiernos retirando las raíces y la parte verde más oscura. Lávalos, sécalos con papel de cocina y córtalos en rodajas no demasiado finas.', 1),
('Paso 2. Limpia los champiñones eliminando la parte terrosa del tallo. Lávalos rápidamente bajo el grifo, sin sumergirlos para que no absorban agua. Sécalos muy bien con papel de cocina y córtalos en láminas.', 1),
('Paso 3. Lava el perejil y sécalo. Reserva unas hojas para decorar el plato al final y pica finas las demás. Casca los huevos en un cuenco, salpimiéntalos y aromatiza con el perejil picado. Bátelos ligeramente con las varillas manuales. ', 1),
('Paso 4. Pon al fuego una sartén con el aceite y cuando esté bien caliente, añade los ajetes y los champiñones. Salpimienta y saltéalos unos 5 minutos, removiendo de vez en cuando con una cuchara de madera.', 1),
('Paso 5. Incorpora la mezcla de huevos y prosigue la cocción, sin dejar de remover, hasta que empiecen a cuajarse; deben quedar melosos. Reparte el revuelto en platos o cazuelitas, decóralo con el perejil reservado y sírvelo en seguida.', 1),
('El truco: si añades un chorrito de jerez mientras cocinas los champiñones, le dan un toque de lo más especial.', 1);

-- Pasos para la receta "Habitas salteadas con jamón ibérico y chipirones"
INSERT INTO paso (nombre, receta_id) VALUES
('Paso 1. Corta el jamón en trozos pequeños. Limpia la cebolleta, lávala y pícala. Lava la menta, escúrrela y separa las hojitas; pica la mitad.', 2),
('Paso 2. Pon al fuego una sartén con 2 cucharadas de aceite de oliva y caliéntalo. Incorpora la cebolleta picada fina previamente y sofríela durante unos 5 minutos, removiendo con una cuchara de madera, hasta que empiece a dorarse y con cuidado de que no se tueste porque podría estropearte el plato.', 2),
('Paso 3. Incorpora el jamón troceadito y prosigue la cocción durante unos minutos más, sin dejar de remover. Agrega las habitas, bien escurridas del aceite de la conserva, y la menta picada, salpimienta y rehoga 2 minutos.', 2),
('Paso 4. Vierte el vino blanco y deja reducir unos instantes, hasta que se evapore el alcohol. Si son habitas frescas solo necesitarás pelar la vaina y escaldarlas apenas unos minutos. Si son tiernas, hasta se pueden comer crudas.', 2),
('Paso 5. Limpia los chipirones, lávalos, sécalos con papel de cocina absorbente para que no te salten luego, y saltéalos en la plancha bien caliente, untada con un poco de aceite de oliva.', 2),
('Paso 6. Retíralos de la sartén y salpimiéntalos al gusto. Reparte las habitas en cuatro platos llanos y coloca por encima de cada uno dos chipirones.', 2),
('Paso 7. Rocía con el resto del aceite, decora con las hojitas de menta que hemos reservado enteras y sirve enseguida.', 2);

-- Pasos para la receta "Gazpachuelo de huevo frito con tropezones"
INSERT INTO paso (nombre, receta_id) VALUES
('Paso 1. En una sartén, calienta abundante aceite en una sartén y fríe los huevos de uno en uno, cuajando la yema un poco más de lo habitual y procurando que queden con puntillas, para que aporten más sabor. Escúrrelos y resérvalos.', 3),
('Paso 2. En un bol amplio, pon la miga de pan troceada y echa por encima el vinagre, dos cucharadas de agua y 3 cucharadas de aceite; procura que quede bien empapada. Echa también las almendras y el ajo pelados y salpimienta.', 3),
('Paso 3. Añade los huevos y tritura añadiendo unos 400 ml de agua, hasta conseguir una crema fina. Paso 4. Rectifica de sal y sirve el gazpacho acompañado de los taquitos de jamón, los picatostes y el romero picado.', 3);

-- Pasos para la receta "Gazpachuelo de huevo frito con tropezones"
INSERT INTO paso (nombre, receta_id) VALUES
('Paso 1. Corta el lomo de cerdo en tiras gruesas. Calienta un fondo de aceite en una sartén, añade las tiras de carne y saltéalas unos 5 minutos, removiendo, hasta que estén doradas.', 4),
('Paso 2. Agrega la miel, mezcla y cuece a fuego suave hasta que caramelicen. Añade la salsa de soja y prosigue la cocción 2 minutos más.', 4),
('Paso 3. Calienta los vasitos de arroz 1 minuto en el microondas. Lava el cebollino, sécalo y pícalo menudo; mézclalo con el arroz.', 4),
('Paso 4. Monta 2 timbales colocando una capa de arroz con cebollino en el fondo de 2 platos, formando un cuadrado, y añade encima el lomo caramelizado.', 4),
('Paso 5. Espolvorea con el sésamo y decora con los germinados lavados. ¡Y listo!', 4);

-- Pasos para la receta "Gazpachuelo de huevo frito con tropezones"
INSERT INTO paso (nombre, receta_id) VALUES
('Paso 1. Monta las claras. Casca los huevos separando las yemas de las claras.', 5),
('Paso 2. Funde la mantequilla, añade la harina y tuéstala, removiendo. ', 5),
('Paso 3. Agrega la nata, el azúcar y la canela, y lleva a ebullición. Retira, añade el chocolate rallado y remueve. Deja templar y agrega las yemas batidas. Monta las claras e incorpóralas.', 5),
('Paso 4. Cuece al vapor. Reparte la crema en flaneras y cuécelas 15 minutos, en el cestillo de cocción al vapor, tapadas, hasta que cuajen. Deja reposar 5 minutos y sírvelos fríos.', 5),
('El truco: sirve estos budines decorados con unas frutas rojas como grosellas, moras, arándanos...', 5);
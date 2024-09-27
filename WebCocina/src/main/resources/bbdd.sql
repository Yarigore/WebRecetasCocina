DROP TABLE IF EXISTS receta;
DROP TABLE IF EXISTS usuario;

CREATE TABLE receta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    descripcion VARCHAR(200),
    tiempo INTEGER,
    receta VARCHAR(3000),
    imagen_url VARCHAR(500)
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    contrasenya VARCHAR(200) NOT NULL
);

INSERT INTO receta (id, nombre, descripcion, tiempo, receta, imagen_url) VALUES
(1, 'Revuelto de ajos tiernos con champiñones',
'Los champiñones son un alimento muy socorrido que permite preparar un sinfín de recetas. Además, no hace falta que sean frescos, en lata también están buenísimos y te pueden salvar la comida o la cena. En esta receta, los combinamos con ajos tiernos y un revuelto de huevos, ¡a tope de proteínas!',
15,
'Ingredientes (para 4 personas) 8 huevos 1 manojo de ajos tiernos 200 gramos de champiñones 2 cucharadas de aceite de oliva Sal Pimienta 2 ramitas de perejil Elaboración Paso 1. Limpia los ajos tiernos retirando las raíces y la parte verde más oscura. Lávalos, sécalos con papel de cocina y córtalos en rodajas no demasiado finas. Paso 2. Limpia los champiñones eliminando la parte terrosa del tallo. Lávalos rápidamente bajo el grifo, sin sumergirlos para que no absorban agua. Sécalos muy bien con papel de cocina y córtalos en láminas. Paso 3. Lava el perejil y sécalo. Reserva unas hojas para decorar el plato al final y pica finas las demás. Casca los huevos en un cuenco, salpimiéntalos y aromatiza con el perejil picado. Bátelos ligeramente con las varillas manuales. Paso 4. Pon al fuego una sartén con el aceite y cuando esté bien caliente, añade los ajetes y los champiñones. Salpimienta y saltéalos unos 5 minutos, removiendo de vez en cuando con una cuchara de madera. Paso 5. Incorpora la mezcla de huevos y prosigue la cocción, sin dejar de remover, hasta que empiecen a cuajarse; deben quedar melosos. Reparte el revuelto en platos o cazuelitas, decóralo con el perejil reservado y sírvelo en seguida. El truco: si añades un chorrito de jerez mientras cocinas los champiñones, le dan un toque de lo más especial.',
'https://content.elmueble.com/medio/2024/09/12/revuelto-de-ajos-tiernos-con-champinones_00000000_240912130518_720x720.jpg'),
(2, 'Habitas salteadas con jamón ibérico y chipirones',
'¿No te apetece cocinar? Entonces sal del apuro con esta fácil y rápida receta de habitas baby salteadas con chipirones y jamón ibérico. El sabor excelente y su dificultad de preparación, mínima.',
20,
'Ingredientes (para 4 personas) 1 tarro de habitas en aceite (520 gramos) 8 chipirones 100 gramos de jamón ibérico 1 cebolleta 50 ml de vino blanco 2 ramitas de menta 4 o 5 cucharadas de aceite de oliva Pimienta y sal Elaboración Paso 1. Corta el jamón en trozos pequeños. Limpia la cebolleta, lávala y pícala. Lava la menta, escúrrela y separa las hojitas; pica la mitad. Paso 2. Pon al fuego una sartén con 2 cucharadas de aceite de oliva y caliéntalo. Incorpora la cebolleta picada fina previamente y sofríela durante unos 5 minutos, removiendo con una cuchara de madera, hasta que empiece a dorarse y con cuidado de que no se tueste porque podría estropearte el plato. Paso 3. Incorpora el jamón troceadito y prosigue la cocción durante unos minutos más, sin dejar de remover. Agrega las habitas, bien escurridas del aceite de la conserva, y la menta picada, salpimienta y rehoga 2 minutos. Paso 4. Vierte el vino blanco y deja reducir unos instantes, hasta que se evapore el alcohol. Si son habitas frescas solo necesitarás pelar la vaina y escaldarlas apenas unos minutos. Si son tiernas, hasta se pueden comer crudas. Paso 5. Limpia los chipirones, lávalos, sécalos con papel de cocina absorbente para que no te salten luego, y saltéalos en la plancha bien caliente, untada con un poco de aceite de oliva. Paso 6. Retíralos de la sartén y salpimiéntalos al gusto. Reparte las habitas en cuatro platos llanos y coloca por encima de cada uno dos chipirones. Paso 7. Rocía con el resto del aceite, decora con las hojitas de menta que hemos reservado enteras y sirve enseguida. ',
'https://content.elmueble.com/medio/2023/03/30/habitas-salteadas-con-jamon-iberico-y-chipirones_00000000_230821132601_600x800.jpg'),
(3, 'Gazpachuelo de huevo frito con tropezones',
'Este plato típico de málaga es perfecto para cuando hace bien tiempo. Fresco, sabroso y muy sencillo de preparar, lo tendrás en tan solo 20 minutos. ¡Mira cómo se hace paso a paso!',
20,
'Ingredientes (4-6 personas) 4 huevos 100 gramos de almendras crudas 50 gramos de miga de pan del día anterior 1 ajo 2 cucharadas vinagre de jerez Aceite, sal y pimienta Para decorar Taquitos de jamón Picatostes Romero fresco Elaboración Paso 1. En una sartén, calienta abundante aceite en una sartén y fríe los huevos de uno en uno, cuajando la yema un poco más de lo habitual y procurando que queden con puntillas, para que aporten más sabor. Escúrrelos y resérvalos. Paso 2. En un bol amplio, pon la miga de pan troceada y echa por encima el vinagre, dos cucharadas de agua y 3 cucharadas de aceite; procura que quede bien empapada. Echa también las almendras y el ajo pelados y salpimienta. Paso 3. Añade los huevos y tritura añadiendo unos 400 ml de agua, hasta conseguir una crema fina. Paso 4. Rectifica de sal y sirve el gazpacho acompañado de los taquitos de jamón, los picatostes y el romero picado.',
'https://content.elmueble.com/medio/2023/04/03/gazpachuelo-de-huevo-frito-con-tropezones_00000000_230821131955_450x600.jpg'),
(4, 'Pad thai',
'Si eres un apasionado de la comida asiática, no te puedes perder esta rápida receta de pad thai muy light, pero deliciosa y apta para principiantes. ¡Te encantará!',
20,
'Ingredientes (para 3 personas) 680 gramos de espaguetis de alga kelp (o kelp noodles) 1 cebolla tierna grande cortada en aritos (solo la parte blanca) 1 tomate cortado a brunoise  ¼ de taza de nueces picadas (opcional para decorar) 1 lima cortada en cuartos (opcional para decorar) Para la salsa: 2 cucharadas de semillas de sésamo 2 cucharadas de aceite de sésamo 3 cucharadas de vinagre de arroz ¼ de cucharadita de copos de pimiento rojo (pimientos desecados) 4 o 5 tomates secos y rehidratados (con un remojo previo de 2 horas) 2 cucharadas de sirope de arce 2 cucharadas de salsa tamari (baja en sodio) 2 cucharadas de zumo de lima 2 cucharadas de manteca de almendras Elaboración Paso 1. Mezcla los ingredientes de la salsa en un procesador de alimentos, añadiendo la manteca de almendras al final. Resérvalo para luego. Paso 2. Enjuaga los noodles de kelp y escúrrelos en un colador. Después, viértelos en un bol grande y mézclalos con la salsa, la cebolla y el tomate. Paso 3. Sirve el pad thai a temperatura ambiente o calentado un poquito en el horno, en boles decorados con trocitos de nuez picada y un trozo de lima.',
'https://content.elmueble.com/medio/2023/03/30/pad-thai_00000000_230821132625_600x800.jpg'),
(5, 'Timbal de arroz y lomo caramelizado',
'Esta receta es como el clásico timbal de verduras, pero con arroz y lomo caramelizado. ¡Está delicioso! Lo mejor es que es muy fácil de elaborar y apenas te robará tiempo, menos de 20 minutos. ',
20,
'Ingredientes (para 2 personas) 300 gramos de lomo de cerdo 50 gramos de miel 75 ml de salsa de soja suave 2 vasitos de arroz para microondas 2 tallos de cebollino Aceite de oliva Para decorar: Unas semillas de sésamo tostado Unos germinados al gusto Elaboración  Paso 1. Corta el lomo de cerdo en tiras gruesas. Calienta un fondo de aceite en una sartén, añade las tiras de carne y saltéalas unos 5 minutos, removiendo, hasta que estén doradas. Paso 2. Agrega la miel, mezcla y cuece a fuego suave hasta que caramelicen. Añade la salsa de soja y prosigue la cocción 2 minutos más. Paso 3. Calienta los vasitos de arroz 1 minuto en el microondas. Lava el cebollino, sécalo y pícalo menudo; mézclalo con el arroz. Paso 4. Monta 2 timbales colocando una capa de arroz con cebollino en el fondo de 2 platos, formando un cuadrado, y añade encima el lomo caramelizado. Paso 5. Espolvorea con el sésamo y decora con los germinados lavados. ¡Y listo!',
'https://content.elmueble.com/medio/2023/03/30/timbal-de-arroz-y-lomo-caramelizado_00000000_230821132643_415x600.jpg'),
(6, 'Budines de chocolate y canela',
'Para un final dulce... Un postre muy sabroso, pero más ligero y fácil de preparar de lo habitual. Se denomina budín o pudín al postre originario de la cocina inglesa y cocina estadounidense que suele estar compuesto de diferentes ingredientes. Hoy, te proponemos el de chocolate y canela. ¡Delicioso!',
20,
'Ingredientes (para 4 personas) 3 huevos 20 gramos de chocolate fondant 20 gramos de harina 15 gramos de mantequilla 50 gramos de azúcar 1/4 de litro de nata líquida 1 cucharadita de canela Elaboración Paso 1. Monta las claras. Casca los huevos separando las yemas de las claras. Funde la mantequilla, añade la harina y tuéstala, removiendo. Paso 3. Agrega la nata, el azúcar y la canela, y lleva a ebullición. Retira, añade el chocolate rallado y remueve. Deja templar y agrega las yemas batidas. Monta las claras e incorpóralas. Paso 4. Cuece al vapor. Reparte la crema en flaneras y cuécelas 15 minutos, en el cestillo de cocción al vapor, tapadas, hasta que cuajen. Deja reposar 5 minutos y sírvelos fríos. El truco: sirve estos budines decorados con unas frutas rojas como grosellas, moras, arándanos...',
'https://content.elmueble.com/medio/2013/07/05/budines-de-chocolate-y-canela_00000000_230821134400_710x768.jpg')
create database Araho
GO
use Araho
GO
create table clientes(
ID integer primary key NOT NULL,
DNI varchar(8) NOT NULL,
NOMBRES varchar(100)  NOT NULL,
APELLIDOS Varchar(100) NOT NULL,
EMAIL varchar(100) NOT NULL ,
REGION varchar(20) NOT NULL
)
GO

create table productos(
ID integer PRIMARY KEY,
NOMBRE VARCHAR(100),
PRECIO MONEY,
STOCK INTEGER
)
GO
CREATE TABLE ingresos(
ID integer PRIMARY KEY IDENTITY(1,1),
AÑO integer,
MES varchar(20),
INGRESOS money)
GO



INSERT INTO ingresos VALUES
('2021','Enero',5000),
('2021','Febrero',7000),
('2021','Enero',9000),
('2021','Marzo',10000),
('2021','Abril',15500),
('2021','Mayo',16800),
('2021','Junio',50000),
('2021','Julio',55000),
('2021','Agosto',5000)
GO


INSERT INTO clientes VALUES 
(1,'89657841','MARIALEGANDRA','CONTRERAS VALVERDE','mcontreras@hot.com','AREQUIPA'),
(2,'45589906','JESUS','GONSALES MARQUES','mcontreras@hot.com','CUZCO'),
(3,'44796434','GLODUALDO ','RAMOS ÑAHUI','jack_123_907@hotmail.com ','PUNO'),
(4,'70410916','LINA ROSALIN','DAVILA PEREZ','rosslyn_160@hotmail.com','TACNA'),
(5,'71832641','ABIGAIL','DAVILA PEREZ','abi9690@hotmail.com','PUNO'),
(6,'73587866','MELIA','FERNADEZ TAIPE','ailem09_95@hotmail.com','AREQUIPA'),
(7,'43733273 ','MÓNICA LIDIA','MENDOZA BELITO ','yandi_tkm.amor@hotmail.com','CUZCO'),
(8,'41839995','VIRGINIA','ENRIQUEZ LAPA','lapa2018@hotmail,com ','AREQUIPA'),
(9,'47516959','YOLANDA','CARRILLO ROJAS',' yola_25@hotmail.com','MOQUEGUA'),
(10,'10604911 ','YURFA','ORÉ HERMOZA','yuyita_2020@hotmail.com ','TACNA'),
(11,'46507897','LOURDES','MALLCCO HUAMÁN','alexlu_204@hotmail.com','LIMA'),
(12,'70300128','MIDA OFELIA','ANQUIPA MARTÍNEZ','diablitarebelde_am@outlook.es','LIMA'),
(13,'42414820','RUSSMERY','DE LA CRUZ GARCÍA','roussdcg@gmail.com ','TACNA'),
(14,'46664643','MARGARITA','MARGARITA','margarita_31_2@hotmail.com ','LIMA'),
(15,'44364909','MARGARITA','PILLPA CCANTO','pillpa_hana@hotmail.com ','TACNA'),
(16,'43203668 ','ENMA','QUISPE CASTILLO','enma_quispe@hotmail.com','MOQUEHUA'),
(18,'46966102','NETSY VIVIANA','CURASMA ROMERO','ysten1@hotmail.com ','CUZCO'),
(19,'71874011','YESSICA ROSMERY','CUAREZ MAQUERA','dulzura_yers29@hotmail.com','LIMA'),
(20,'45013927','LIZBETH','GARZÓN FLORES','garzonfloreslizbeth@gmail.com ','LIMA'),
(21,'45463393','LOURDES','TITO SOTO','lourdestito2017@hotmail.com ','LIMA'),
(22,'44702340 ','LUCINDA MODESTA','CCANTO QUISPE','sinai_30_virgo@hotmail.com ','LIMA'),
(23,'44431190','IDAHINA','ICHPAS OCHOA','trans_ore@hotmail.com ','PUNO'),
(24,'71517609','RAQUEL MÓNICA','CCATAMAYO ORE','moniore87@hotmail.com','PUNO'),
(25,'71346487','DELIA','PAUCAR QUISPE','paucardeq@gmail.com','PUNO'),
(26,'41008315','CARY LUZ','TAIPE CONDORI','luzgirl1995@gmail.com','PUNO'),
(27,'71911995','GEOVAN','DE LA CRUZ ROMERO','Geovanny12_30@hotmail.com ',' CUZCO '),
(28,'71808240','JHONSON','SANCHEZ ESPEZA','sanchezespezajhonson17@gmail.com ',' CUZCO '),
(29,'73319528','KARINA','DE LA CRUZ MONTANO','karinadelacruz@gmail.com ',' CUZCO '),
(30,'76597769','GERARDO LEHI','ARECHE MANSILLA','garciabravog@gmail.com ',' CUZCO '),
(31,'70295864','GARCÍA BRAVO ','FLORES NAVARRO','doncelladyam18@gmail.com',' CUZCO '),
(32,'44632134','DENISS YOSHIRA','PAUCAR MAMANI','nil.fn2017@gmail.com','AREQUIPA'),
(33,'44833360','NILDA','FLORES NAVARRO','marushka211@hotmail.com','AREQUIPA'),
(34,'72793940','MARUSHKA','ANTEZANA SANCHEZ','keitalvarado04@gmail.com ','AREQUIPA'),
(35,'43537884','KEITH ','ALVARADO PACHECO','daicy.inam@gmail.com','AREQUIPA'),
(36,'41625219','ALVARADO PACHECO','TORRE VALLADOLID ','cristian_1986@outlook.com ','AREQUIPA'),
(37,'70303587','CRISTIAN PAU','ARROYO OBREGÓN ','natysanfre@hotmail.com ','AREQUIPA'),
(38,'48987624','NATALIA','SANCHEZ ONOFRE','kelytaccl@gmail.com ','TACNA'),
(39,'46402222','KELY GABY','CCANTO LAURENTE','annyatpanda@gmail.com','TACNA'),
(40,'07548792','ANNY ROCÍO','CARDENAS ALTEZ','clinch_lover88@hotmail.com ','TACNA'),
(41,'45797515','CLIDE ','AVILA HUISA','atorrico@pucp.edu.pe','TACNA'),
(42,'71983728','ALFREDO CHRISTIAN','TORRICO LAPOINT','padilla_ayde@hotmail.com ','TACNA'),
(43,'44904770','ROSA AYDE','PADILLA SANCHEZ','lopez_dlg@hotmail.com','TACNA'),
(44,'41059918','DELCY','BALTAZAR VARGAS','jheny0412@hotmail.com ','LIMA'),
(45,'23248898','JHENY','BALTAZAR VARGAS',' rosagarcia.ing@gmail.com','LIMA'),
(46,'23261399','ROSA BERTHA','GARCÍA ARAUJO','edithcurasma19@gmail.com','LIMA'),
(47,'70974644','CLELIA EDITH','CURASMA ROMERO','oabs61@hotmail.com','MOQUEHUA'),
(48,'42315162','OBDULIA ALICIA','BOZA SILVESTR',' klorys_10@hotmail.com','LIMA'),
(49,'43929090','CLORINA','HUAMAN SOTO','alex_2_d@hotmail.com ','LIMA'),
(50,'45597721','ERIKA ROSSI ','CASTILLO ZAMBRANO','erikarosscastillo2@gmail.com','LIMA'),
(51,'71830310','DANIEL','ROMERO CHANCAS','naikesanchezhuaman@gmail.com','MOQUEHUA'),
(52,'44664621','ROMERO CHANCAS','ROMERO CHANCAS','yack_d55@hotmail.com ','MOQUEHUA'),
(53,'47433113','NAIKE','SANCHEZ HUAMAN',' reyna_love100@hotmail.com ','MOQUEHUA'),
(54,'47471242','REYNA ','JURADO DE LA CRUZ',' reyna_love100@hotmail.com ','MOQUEHUA'),
(55,'45816342','BERTHA','LEÓN QUISPE','leonquispe1092@gmail.com ','PUNO'),
(56,'40377545','GABRIEL','RAMÍREZ HUINCHO','ramirezhuinchogabriel@gmail.com','PUNO'),
(57,'72578538','RONAL','TORRES ARAUJO','rotoar_1989@hotmail.com','PUNO'),
(58,'71207422','MÁXIMO','OBREGÓN SOTO','mos64@hotmail.com','LIMA'),
(59,'71921254','KATHERINNE','AYLAS CHAVEZ','katt_5_5@hotmail.com','PUNO'),
(60,'70120029','GUADALUPE','GARCÍA RIVERA',' ggr3025@gmail.com','PUNO'),
(61,'47039841','MARGOTT ','AGUILAR VELASQUE','71921254m@gmail.com','PUNO'),
(62,'46361596','CATERINE PAMELA','HUAMAN QUISPE ','caterinehq04@gmail.com','PUNO'),
(63,'70280188','SMITH ROLY ','AHUERO MARCAS ','snahueromarcas@gmail.com',' CUZCO '),
(64,'46535910','JAFET','GUEVARA TITO','jguevaratito_94@hotmail.com',' CUZCO '),
(65,'44072684','JUSTO CRISANTO','PAREJAS CCATAMAYO','yeimyrodriguez17@hotmail.com ',' CUZCO '),
(66,'46527816','JEANS','GUEVARA TITO','parejascrisanto5@gmail.com','LIMA'),
(67,'46785170','ISSAC ','HUAMAN ENCISO','jhans.tito@gmail.com ','LIMA'),
(68,'71810465','EDSON ','OCHOA MONTANO','huaman_1200@hotmail.com','LIMA'),
(69,'46449519','SIBILA ','CALLE TAYPE','edochoamon@gmail.com ','LIMA'),
(70,'47965298','SAMUEL','OBREGÓN SOTO ','corrige_28@hotmail.com ','AREQUIPA'),
(71,'43515046','MÓNICA ANGELA','CHOQUE OBREGÓN','saos_28@hotmail.com','AREQUIPA'),
(72,'23276162','KATIA LUZ','DIAZ HUAMAN','1 monica_95012@hotmail.com','AREQUIPA'),
(73,'44729478','ROSARIO','GUZMAN HUAMANCAYO','katiadiaz984@gmail.com','AREQUIPA'),
(74,'70513001','ALFREDO','BUSTAMANTE TAYPE','osarioguzmanhuamancayo@hotmail.com','AREQUIPA'),
(75,'70361012','ROSA','GOMEZ SANCHEZ','alfredo-jhon123@hotmail.com','AREQUIPA'),
(76,'73060034','JAIME','FLORES MUÑOZ','rosagomezk@gmail.com','TACNA'),
(77,'43923139','YEIMY OPHELIE','RODRIGUEZ HUAYHUA','floresgrupo133@gmail.com','TACNA'),
(78,'40972259','MAX UHLE','FLORES MUÑOZ','yeimyrodriguez17@hotmail.com','TACNA'),
(79,'47624407','EDUARDO',' FRANCO ALARCÓN','sebas.edu1@hotmail.com ','TACNA'),
(80,'70317223','RAÚL','QUISPE DIEGO ','raulquispediego18@gmail.com','TACNA')
GO


INSERT INTO productos VALUES
(1,'PC VS1087 CI5/8GB/1TB/W10SL',2.443,300),
(2,'PC VO8340 CI3/8GB/1TB/UBUNTU',1.815, 460),
(3,'AIO 23.8 I3-10100T/4G/1T+128GB',3.356,300),
(4,'AIO 23.8\'' I5/8GB/1TB/256GB/FRE',2.840,400),
(5,'AIO TOUCH 27 I7/16G/1+256/W10H',5.774,5000),
(6,'AIO 23.8 I5-10400T/4G/1T/W10H/',3.508,400),
(7,'NB LEN S300 I5-10 12G 512SSD W',3.377,300),
(8,'NB DELL LAT3420 I7-1 8G 512 WP',5.226,250),
(9,'NB AC A115-32-C28P CEL 4 128 W',1.652,200),
(10,'NB LEN S300 I3-10 4G 1T FREE2',2.121,100),
(11,'NB DELL LAT3420 I7-1 8G 512 WP',5263,150),
(12,'NB LEN S145 ATHL 4 500 W10',1.652,300),
(13,'NB LEN S300 I3-10 4G 256 FREE2',2.142,600),
(14,'NB HYBOOK CEL 4G 128G W10P',1.381,500),
(15,'NB GBT G5 I5-11 16G V4G 512 W1',11.628,200),
(16,'NB GBT G5 I5-11 16G V4G 512 W1',6.040,300),
(17,'NBGBT AORUS I7-1 16 512 V6G',9.552,660),
(18,'IMPRESORA MULTIF EPSON L6270 sistema continuo ADF',2.036,400),
(19,'IMP EPSON MULTIFUNC L3210',1.143,100),
(20,'IMP EPSON MULTIFUNC L3160',1.202,200),
(21,'IMP EPSON MULTIFUN L8160',2.404,150),
(22,'IMP EPSON TERMICA TM-T88V-656',1.832,66),
(23,'IMP DE ETIQUETAS CW-C6500AU',15.663,59),
(24,'IMP EPSON M2170 MULTIFUNCIONAL',1.459,160),
(25,'TV ADV 43\'' UHD SMART DOLBY',1.551,100),
(26,'TV ADV 55\'' UHD SMART DOLBY',2.203,300),
(27,'TB SAM A7 LITE + COVER LTE',929.38,50),
(28,'TB 7\" 1GB 16GB 3G ORANG MONSTR',344,100),
(29,'TB 7\'' IPS SC 1GB 16GB 3G D3',319,160),
(30,'HYPERX CHARGE PLAY QUAD',87.37,200)
GO
SELECT * FROM productos
GO
SELECT * FROM ingresos
GO
select * from clientes
use DB_SC_Screen
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Screen
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `screenBeginnerTechTestMasterQuestions`
--

DROP TABLE IF EXISTS `screenBeginnerTechTestMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeginnerTechTestMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenBeginnerTechTestMasterQuestions`
--

LOCK TABLES `screenBeginnerTechTestMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenBeginnerTechTestMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenBeginnerTechTestMasterQuestions` VALUES (1,NULL,'No','1.  If nothing is showing up on my calendar, what should I do?',NULL,NULL,'Yes','Select box','Reload the page','Click on the Spanner and make sure the appropriate boxes are selected','Quit out of Chrome completely and open it again.','Try clearing the cache','All of the above.',NULL,0,NULL,NULL,1),(2,NULL,'No','2.  What do I type into SC Brain to see the intake summary?',NULL,NULL,'Yes','Select box','\"intake\" or \"i\"','\"show intake\" of \"si\"','\"see intake\" of \"si\"','\"intake summary\" or \"is\"',NULL,NULL,NULL,NULL,1,NULL),(3,NULL,'No','3.  What 3 things do I have to do to lock a note?',NULL,NULL,'Yes','Select box','Review the MSE, Review the ROS and fill out SAP in note','Activate appointment, Start note, Save note','Make sure the appointment is locked, Fill out purpose of visit, Review MSE','I can lock the note at any time',NULL,1,NULL,NULL,NULL,NULL),(4,NULL,'No','4.  Where is the button to open the SAP of the note?',NULL,NULL,'Yes','Select box','In the patient tab under the Notes panel','At the top of the page next to the patient\'s name','In the patient tab, in the appointments panel all the way on the right','I can only open the note using SC Brain',NULL,NULL,NULL,1,NULL,NULL),(5,NULL,'No','5.  How do I add a diagnosis  of Generalized Anxiety Disorder to the patients file using SC Brain with a start date of today?',NULL,NULL,'Yes','Select box','\"dx ocd\"','\"diagnosis ocd\"','dx SPACE generalized anxiety disorder TAB today',NULL,NULL,NULL,NULL,1,NULL,NULL),(6,NULL,'No','6.  What does step 5B mean on the calendar?',NULL,NULL,'Yes','Select box','Appointment is confirmed','Appointment was cancelled','Appointment has not been approved','Appointment request is incomplete',NULL,NULL,1,NULL,NULL,NULL),(7,NULL,'No','7.  On the Knowledge Base for \"contact information\" to find Robert\'s cell phone number.',NULL,NULL,'Yes','Select box','1 650-586-1193','1 650-347-8673','1 650-323-2233','1 650-346-2239',NULL,NULL,NULL,NULL,1,NULL),(8,NULL,'No','8.  To have the patient sign the policies using the ipad I...',NULL,NULL,'Yes','Select box','I use the \"Sign to EMR\" application','Type \"show on ipad\" into SC Brain','type \"show on ipad\" as if it were a patient name','Type \"Sign to EMR\" into SC Brain',NULL,1,NULL,1,NULL,NULL),(9,NULL,'No','9.  I can set up SC email and SC chat on my smart phone!',NULL,NULL,'Yes','Select box','True','False',NULL,NULL,NULL,1,0,NULL,NULL,NULL),(10,NULL,'No','',NULL,NULL,'Yes','Select box','California','Texas','Indiana','New York',NULL,NULL,NULL,1,NULL,NULL),(11,NULL,'No','11.  I can add a task of \"make me a sandwich\" in SC Chat by using \"a t make me a sandwich\"',NULL,NULL,'Yes','Select box','True','False',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(12,NULL,'No','12.  Which of these icons do you click to go to the event panel?',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0ð\0\0\0B\0\0\0iW[\ì\0\0\riCCPICC Profile\0\08U]hU>»sg#$\ÎSl4…t¨?\r%\r“V4¡´º\Ý\Ý6n–I6\Ú\"\èdö\îÎ˜\É\Î83»ý¡OEP|1\ê›Ä¿·€ (õ\Û>´/•\n%\Ú\Ô (>´øƒPè‹¦\ë™;3™iº±\Þe\î|ó\ïž{\î¹g\ïè¹ªX–‘š®-2\âs‡ˆ=+„‡ ¡WQ+]©L6Owµ[\ßC\Â{_\Ù\Õ\ÝþŸ­·F qb³\æ¨ˆð§U\Ëvzú‘?\êZöb\è·1@\Ä/z¸\ác\×\Ãs>~if\ä,\âÓˆUSjˆ—\Ì\ÅøFû1°\Ö_ Mj\ëª\è\å¢b›uÝ ±p\ïaþŸmÁh…ómÃ§Ï™Ÿ>„\ïa\\û+5%\ç\áQ\ÄKª’ŸFü\âkm}¶\àÛ–›‘?\ÜÞš¯¦\ïD\\¬\Ûª¾Ÿ¤­µŠ!~\ç„6ó,\â-ˆ\Ï7\ç\ÊSÁØ«ª“ÅœÁvÄ·5Zòò;À‰º[šñ\ÇrûmSžò\ç\å\ê5š\Ë{yDüú¼yHö}rŸ9\í\é|\èó„–-ü¥—”ƒÄƒˆ¡FAö\ç\âþ±\ÜJj\Z\åI.’£[/\ã]m¦\è\ÏK7\ÔK\ëúR ÿD³‹r€¯Y«QŒO\Ú-¹\ê\ëùQ\Å\Î|Ÿ|…6«¾\r³	(˜0‡½\nMXd(@\ß\Øh©ƒ2­Š_¡f\çÀ<ò:´™\ÍÁ¾Â”þ\È\È_ƒù¸Î´*d‡>‚²\ZüŽ¬\Óeñ«…\\c?~,7?& Ùƒ\Ï^2Iö‘q2\"yŠ<Mö“²d\ïú\ØJlE^<7\Öý¼Œ3R¦›E\Ý9´» `ÿ3*L\\S×¬,¶†#\Ë)û]½ü\Æ_±\\\é,7Q¶\âºW\Îù_ù\ëü2ö+üj¤\à\äWñ·r\ÇZÌ»²L\Ã\ìlXswU\Zm\ãðÑ™Å‰\Åóqñ\äWF~–É™\ç¯ô]<Yo.F¬—újùVND¬ôƒô‡´,½\'}(ýÆ½\Í}\Ê}\Í}\Î}Á]‘;Ë\ã¾\á.ps_\Æöjó\ZZ\ß{y·g\é–k¬J!#lr\Â6\áQa2ò\'cBQØ–­\ëûŸ/ž=c\æ§û\\¾.V‰û±ôMþUUT\ép”)VoM8¾AŒ$CdŒ”6T÷¸Wó¡\"•O\åRiS;S©±\ÔA‡³¦v mûüÕ©n²R\ê\Òc\Þ}Y\Ó:n\ë\r\ÍwKÒ“b\Z¯6*–š\êèˆ¨†\ÈLŽhS‡\ÚmZ\ï\Þôô›2»[.GœûÀ¾?ñ\ìû.âŽ´\0–€\Ç#n\Ï\Ê\Þ8ó„Ú²\ÛÁ‘H|\à\Ô÷\ìö¿ú2x~ý\Ô\é\Ü\Äs¬\ç-€µ7;¿\ß\ït\Ö>@ÿ«\0g Ÿ|UP`þo\0\0\0	pHYs\0\0%\0\0%IR$ð\0\0œiTXtXML:com.adobe.xmp\0\0\0\0\0<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 5.4.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelXDimension>240</exif:PixelXDimension>\n         <exif:PixelYDimension>66</exif:PixelYDimension>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>\n–™«\0\0\0iDOT\0\0\0\0\0\0\0\0\0\0!\0\0\0(\0\0\0!\0\0\0!\0\0\n¾@\0\0	\ÔIDATx\ìœPT\×\Çÿ,‹\ÈK”—¤F|€\ã#\ã+Š¦©´c£M4\à+ŽR‰65Mutll\Òñ‘V\ê£\ÚL‚J‹­Z¦´&ÑŠ¢ñÁ1Aqy\ìB\ÏwÉ½,»\Ë\îÝ½wYÏ™Yö\ì¹\ß9\ç»ÿs{ž¬›Á`hmiiÁó[ó¡uw\Ã\ÉUÀW€+\Ð3p\ã\0÷Œ†\â^r,)À¶¤\nO\ã\nô8À=¤¡¸›\\K\np€-©\ÂÓ¸=Dpi(\î&WÀ’f\0\ïœ`ÉŽ§q¸\ÝPp7l\îW@®f\0[6Fn^n\Ç\à\n¸X°‹€W\ÏP¢\0X‰z</WÀ\Å\np€]\Ü\0¼z®€8ÀJ\Ô\ãy¹.V€\ì\â\à\Õs”(ÀV¢\Ï\Ëp±`7\0¯ž+ D°õx^®€‹\à\0»¸xõ\\%\n\ØpEEjjj,\Ö\ç\ç\ç‡ððp¸¹¹Y¼\Î\Â;÷q\íV5š\rD…aôSÁN—¥òaju›õø{¹#Ä¯—M;¹­Ì°´ºúŠµ‡~\ÞZùz´\'|k6´¢ô^Ø\Â \"\ØKH-®Ò%c`?Oxyh\Ìòð@À\Ù\Ù\ÙØ¼y3ªªª¬j\æ\ï\ïU«V!11Qu›¨«u(bJ¯\ÇM-¬¡{cklzõé­µ\ê›+/>\Ò5aó¡ÿ\âøù¢nL1\ï\ÍûBúzwHWó\Ã\Â}\×A\Û\n3Gb\å\Ú2“}ý£œrd_¹gf?.Kž\r5K¿ó K>¾!€šùúh\áz\Ü\Î+\Ð5· ²¿76\ÅFÀ§—»Y¾\'=Á&À™™™X»v­]:­^½\Z\É\É\Év\å\éÌ¸•}g\äW\â\ãs_³ž«ã·¹qž\ç†÷Å²ia\Ý\ä\ÚúF¤\ì8·\Ífò@€/ö¼ùc„úßŽjñ¤½\×p¿¾\Ùfy\"À¤°\Zc¨5™E((dV¯#\0S!j@\Ü\Ì\"÷\êÕ¸;³Û’4¬ø¿ÎŸS\ÉP¥ˆU€›ššG\Ì\ÂZý\È\Í\ÍEPP53›\×*Ø·ò‡§o\ã\Ú\Ýz›¶d@Ã³7~ŽIƒûÈ²w¶‘%x_ž6¡¾ø0\ã©zgBl/Àÿ»õúL\â/ù\çHDm€\É¥\Óh~ñA-\\t\Îpœ\àÝ›¨\Ç+\ãZ‘Ì¡<V¾zõ*\â\ã\ã*855111\å¥L…\ß<\Æ\ÛE\Â\Ã$¢aó\ëð\0ODyÁ»—\ÅlŽUÂ†\Õ\rl˜eOý\æŽ1N\êòxgð¾=w²\àË§9_\áƒÃŸK~\Ä{\ß|A€[JT!b/À_”\Ôacv)\Ö\Î¤bg\0Lr(…\ØÀ‚ø`¾º¼»ô˜7¾ã³¨BZ-\Â*À999HII‘\n\Ðh4HKK\ÃØ±c¥4Š#..:NJß°a¤\ÏöDh¾»<\í&n\×4J\Ù&Gôas´p¡—•Y\ÄÀ¾V]¨Ä/¿‘L´L\Ím	Ã¤\Åcû®ˆÛ‚WôÁâ‘ƒ‚ñ—·~w¦³ZÁ€\×+i¨b{¶t¿\â\ØôÚšƒ0M™\rñ«\âC*ALð\îzIùº^º»\0F^^žEÝ¨§¦[J\0\Þõ\ï\n\Éo_0£añŒ‘\Ö)„V,\ß\Í*F\Íc½\à\ÂS½±#q¸ð[×¢O]ñ.^\ÑSˆ\×%=‹\Ø)‘\âe\Å\ïŽL+¸;L÷F/: Eú%e_–\ïŸ¼\\\0/\ÝG·˜V˜W(„¸ð\Â\è@,‘·:J\Ã?\ê=Ä°0z\0\'ö?:ý½\îq#’·w\\°¢9¯8l\î\ÌcˆgE\Çz¶2­VP0ù\à(ÄÜ›my\Ë\\M®a‹o\âs`¬‡£=ð¥;n \Ù\Ö\Äð¶R	\â…iZüõ²c¼©sõX8±½\ç\Ýý¹¯Mnÿl\ì·3\â\Ý\àŒ‹UØ“W!\Ükÿ>½š	jt¹\áƒSe8s£m¯z\Ì@_¼7DnV\Åvo\í9ƒ3ù¥R9r\à%\ã[•µ˜¿\å(²\í¦\ç\ÇGà·‹c¤2”F”Lõ;qg\0+½\Ê\ï(ÀŸ»a\Î>d/m\î\0ñña;!¦\ã\ï\"#x·žu\Ç\Æ\Ó\î¨\Þh{\ÛN\r¨3€—½‹ôôt<xð\0uuu(++“\ê\ÒjµˆŠŠ’>GŠŠŠ:ÌCCC\0Ìž=±±±²ö†·œ,C\Î\Í6\0g=„”\ï‡Wc3þei\Þ;\Ú\Öûxº\ãpò(›y\Ô08_xK·—Š2…÷\ëšzü‚þN\âTŒ”\ì\Ê*\ë°dk6ªji¿™ÿ^œ<Lº®4b/ÀõMT<0\0	\âÁA½e»\Ó]ž¾\Óþ\ì6Œ!f‹\îXð©ò:\n‚w\ç=^}¦½§%x\×ü\Ý¾žl«\ÊU\07Õ”£<mµ\ìF²\ÇpÿþýÂ–”­<ÉŸ\ÜD\ÙýÁlõôpLa}\îkZ\Þ=6\ìš\Çö>Å°o\Ñ`=¹³ÃŸO^ÆŽ£„j,Áû\Ú\Ö\ã(¯®CoO¤®œ)Aœþ\Ùu\áeö÷FÆ¯\ã\áç¥ž¿ö¬–N\Ý`ºGK\ÏggÚ€˜\àýc¼‹\'™\ÃK\åº\à»\çCw1üP=$%%aÝºu6Ëõ‡\Ð*4…\ß\ÅÅ¨0›yL\r^deˆ‡>6ÍŽÀ¸\ï:ç„q½Û³\Îcß©\ÐV\×\Î3ðLdûi£Ü‚[øù\î3hùöX¡)Ä¿ÚŸ‹Šºbf‡|\Æ\å;\Z—0£´\ÕÃ®ÿ\é`\Ùn8\np/­\ï°-,kahˆ}ÌcZ\ËC\×hM=°,A<\ï-Ž\\±\Ü¼\Å\é±\ÄhŽ+ö¼b™.¸\â?‡\Ðp)CôE\Õw\ÚR¢•i[aYZ!\Û\ßmÛŽzƒ\í›ÁŽø\Ù\è\Ø Ã®y‘l\ïXþ\ÐO\Ìg\ïû?€k÷\å\n\Ù<=Ü±ýõu€ñ\Ô\Åv=G‚\Ø\ß\Ç9[8‰¥k\Ò\ã,ƒ|\Æõ\ç\ër–s¿\'V>-\ÇL°q`:ó,¥”]™LCS€)›%ˆ“\Ä3˜\à\ÝÁ\à5^ 2…—\Ê{\âþ=;yuúú}\Òö¬@ØŸsEµ\ØÀ\"P Ñ³~6tB\ÞÉ |i\Óa˜LUÉxRT¨\Ð\ë:Óµžp\ê\Ù;\ÒhŒ4¢c˜a}\Ù$\ÓÁ`	`*ŠV¥óV¶7¥#—q\ÖÕ¶ž˜ž£\í±z,n6—Õ¸aô4´\íZJ=ñ\0g]®5:\Z™\ÊzP{þQ¶‘h;‰Â°olO&Äñ\çþC0\ï}÷\å©\Âá‹‚’Ja!«‘ž\0\ä@ü¯÷“\Ð\Ï\×y#„ž°\éAŽ-ñC0:\Ì\×á¦´ð°\àVü3E\Ï\ÖIÚ¦mb\áÔ„¯0ˆ}¥Á6o²¼¢\Í\é›\Z\ÌÙ¯\í\0qWü\0\0\0ÿÿTy`x\0\0§IDAT\íšlE\Çÿ÷\èƒÊ£-´•‚P¨Uy\Ä\ÒBBh‰¤«€€T\Ø\0\Z±1 =ñšMl‚!bhAEŠ\ÚF¢€\Z	¢(BE \åQ°\íAß´wug—\Ù\Û^o¯½\ëw»;“\\vv\ß|û\í\ÌÎ¬\Îb±tY­V\Ì):†K‡K\Ðö\ÇðF\Ê\ÎÎ†\Éd\êUtuC;V\î¨@§µ‹o›:~ò3F÷Ú4(?YÂ²j±mþ£‘\Z?D¼÷d¦£ÓŠœM_\ãTužœ=	y%ó\â«¸„¼\â\ï\Ñ\Þa\á\ïƒØ³a!¢‡\r‡\ßVv›¿<\Â\ß¸z.’\ÆG‹už\Î,\Ùú\ê›;<\"v\Þ\ä>\ËY·»\n\Çkš\Äö‰£\áž\èPñ^.c4è4œ¯~¤ø/´vXÅ¦\ï.ˆ\Ã\Ä;l~+ú˜ù\é¬\é\Åb\ëñ‘](®Qa\Â\ízp®^‡\É1\Â=	ay¥w\Ût 2R\Ç\nõDPY…·\Ñ\Ö)ˆ\Ôm¼)Ž\á\íŒ\Î\ß\0&z¤ÿrE´}\é´(<6u8ô:XfŸ9z¾o\í?\æ›8Qƒ±5\'Ái{®\Ü\ïû[Jñ]ˆZ;\×e!!6œ¿—Büüü$<5\Çö\Çÿ÷ŠË‹JQ\×\ØÊ·\Ý[ð(FFreh—\ÚúÀ\ÏÌˆÁ‚\ÄH—t÷&ÀŽ\à·%\0•\×tØ—Û\äX¤T\é¢\rX÷«gZðN¦ð?#uRˆÀœC¬]]Xû\ÙTÔ¶P\ßá®¨\ä\Í\Z‰±\Ä2’¹\Ñ\Ú\É\Ã^úw]·ò@\îI¾!s¦Œö›v\á\\\íu~L\éL• “\Ù9\'m\"-‚=¼##Â°·`‘X\ï\Ø\æU:\ËÁ{¤Z˜ £\Ä^*Mb£\ÍÀ¼\ÈRú¥]g`\æ\0•¦\Ð \â\" $P³\×\ÚpµQ~¹\â-ˆ­\Üò>9\ï#þA“2!ï­˜-U\Ña\Þ^²š \Ë\ç\ÄqQ\Û{ªló$x\å.ce3™y)¼´µb{xiG/ûÄˆ‹¯\Éÿ\'i_O]ýr	M#³\ëûjp\èŒ0\Ó\ÑrW®Þ‚8c}	®\Ô7ñKtSN*\æM\'«–=¼dÉ½aq\n²¦\Ç\ËöñT…R\0\æ]8z¡–[{\Äþ7¹W¢›\Ü^MË¦G\ã\Îpnz¼•\âG„`hˆ‘\Þöz­úO‡\Ð@t{\çu/D ^2Å‚sÓªL²‡ø ÷H‘¼#\ËtóX±_L­<PÑ€­‡.£Nf3fP°ó\'G -a\Þþö|·¥7‘\á\rˆM;a\Ï\Ï¼Šd6•ƒØ—ð\å”0\Ñõ‡S\r\ØTv\æ\ÞÒ¬„¡x1}\È\ÃÐD6¬œÁ\ëŠL{ˆ]\é\Ûß¶Š\0˜\ZI\0®º\Ö\Êÿ\Z\Û,ˆ\á6ªb†ñ»›Áz¾\Ù\Äze\ÏY¯C|£¥‹\ÞØ«f\á=@üú3179Žª\Û\ã÷vÎ¼T	%Lt\î\Äþ/õ³¯ VÀ\ÔY½]Aü\êƒc@Ž4<‘N_j@\î\æR˜›¸\Ç9—ôz6\æ\ÌD±¯g^jŸ¯\0~™;FúSrŒ\ä\Ê.´3ˆý^\êk_@¬J€‰CAüù³hfl\ê|w¯§/\Öc9ñõ\æv^xU\æ\ì<pB<*ò\Å\ÌK\íñÀeÜ™üö_k\Åóü%\ÓF`\îá˜\ê\æ\ì\êb\ï\é±n\r’³Ú¥Û=6¬œ\é\ájÝšT+\Ì\äj?w\Ûw¸¹\æj¿*pW–\Ó~………\È\Ì\Ìt\Ú\ÆÓ•Ž ~zF4&\n\nxj¼Jb2Sˆ¥r\É\Òzý\â·e\ÃJ:.\Íû\n`:~®Rˆû;óöG\î\Û\r`ò\Ìý\í\å())\ÙlöˆÞ¡¡¡\È\Ê\ÊB~~>l_ÁxDx„H!ö¼Tò.l\Úy‡O\Ô\Ð\"\ÄF†¡\àñT\Ü7B,»Ý™\ÜWm\ç\ê„%~\Æ6¢$÷\Þþˆp«/øXuÖ¦Åº½a\å\ÖÀ\n\é\Ôà½«&)Dõ¾«\Ù\Âml¼\Üâµ:¤šY¸\êr¢†DL¸ûŸýIe²<ó€œ4°œñ¬œy@\é`\0+=‚LM{€¬\éð3\ã•\î°\Ò#\Èô×´Àš?3^\é\èðwk’”nÓŸy@3`\0k&\Ô\ÌP5z€¬Æ¨2›4\ã°fB\ÍU£ÀjŒ*³I3`\0k&\Ô\ÌP5z€¬Æ¨2›4\ã°fB\ÍU£ÀjŒ*³I3`\0k&\Ô\ÌP5z€¬Æ¨2›4\ã°fB\ÍU£ÀjŒ*³I3`\0k&\Ô\ÌP5z€¬Æ¨2›4\ã°fB\ÍU£þ\ã¼:¸\æ\0\0\0\0IEND®B`‚','Screen Shot 2017-03-30 at 12.01.34 PM.png','Yes','Select box','The magnifying glass','The piece of paper','The chain look-ing thing','I can\'t get to the event page from here.',NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `screenBeginnerTechTestMasterQuestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed

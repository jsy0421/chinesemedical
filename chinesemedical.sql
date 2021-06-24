/*
Navicat MySQL Data Transfer

Source Server         : Lab1
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : chinesemedical

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2021-06-24 13:12:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cmtlist
-- ----------------------------
DROP TABLE IF EXISTS `cmtlist`;
CREATE TABLE `cmtlist` (
  `cmtListId` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `fabulous` int(11) DEFAULT NULL,
  `isFabulous` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `reply` int(11) DEFAULT NULL,
  `replayNum` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cmtListId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmtlist
-- ----------------------------
INSERT INTO `cmtlist` VALUES ('1', '../../static/news/1.jpg', '金台资讯', '123', 'false', '“通过这些措施，一方面，中医学生毕业后，可以很快找到职业的成就感，从而建立对职业发展的热情和信心；另一方面，从中医药整体发展来看，可以促进中医与西医、现代科学、世界医疗体系的交叉融合，从而推动中医药的创新发展。”王伟表示。', '1', '3', '6-07 22:12');

-- ----------------------------
-- Table structure for goodslist
-- ----------------------------
DROP TABLE IF EXISTS `goodslist`;
CREATE TABLE `goodslist` (
  `season` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goodslist
-- ----------------------------
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/huoxiang.jpeg', '../../pages/detail/medicalDetail', '藿香', '祛暑湿', '夏季高温高湿的天气容易出现腹胀，严重的可能上吐下泻，医学上称为“肠胃性感冒”。经常下雨的天气，或近来气压低、湿度比较高，就要预防暑湿了。食疗方：藿香露。制作：用电茶壶蒸馏，以20克藿香（药店有售）、500ML水的比例，烧水时在壶嘴上扣个杯子，杯子一端低一点，下面放一个碗。这样水烧开后在等20分钟，就有了一小碗纯天然的藿香露，加点冰糖，加点热水，家里每人分一点。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/wumei.jpeg', null, '乌梅', '止汗', '天气热，汗出如浆。怎么止汗呢？没必要抹止汗露，乌梅就有收敛止汗的效果。关键的，乌梅很好吃，吃着零食就能解决问题，爽翻了。食疗方：酸梅汤。制作：乌梅50克、山楂50克、甘草10克用水浸泡30分钟，然后加入500Ml清水煮沸，改用小火再煮30分钟即可，饮用时在碗里加一小勺糖桂花。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/fuling.jpeg', null, '茯苓', '安神', '仲夏夜在晚上也容易失眠，这都是因为湿热扰动“心神”造成的。漫漫长夜无心睡眠，怎么办呢？晚餐喝一碗茯苓粥吧，茯苓优秀的安身效果可以让心神安置到正常的状态，好眠随即而来。食疗方：茯苓粥。制作：买茯苓时让药店打成粉，装罐，两人份的粥可以加10可茯苓粉，熬粥时用量勺挖一勺调入。如果家里没有量勺，2克的盐勺放5勺即可。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/jinyinhua.jpeg', null, '金银花', '清暑热', '唐代孙思邈有一个清热方流传很广，以金银花为主药，甘草、桔梗为辅药，这个方剂是历代清热解毒药方的基本款。主药金银花天性甘寒，善于清热解毒，最适合夏天。天然经常熬绿豆粥，如果粥里加上一把金银花，不仅解暑，还能镇咳，有咽炎的人尤其感觉舒服。食疗方：金银花绿豆粥。制作：绿豆粥熬好后，用汤勺盛两勺药店买的干金银花加入。如果家里种了鲜金银花更好了，摘一小把即可。再熬3分钟关火，晾凉即可食用。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/huangqi.jpeg', null, '黄芪', '益气', '中医认为夏季的酷热属于“壮火”，会消耗人体大量的气，因此，夏天总感觉疲劳乏力，不爱活动。适当补充黄芪可以补气。食疗方：黄芪黄瓜汤。制作：到了夏天你会经常做黄瓜汤吧？做黄瓜汤之前，先放一小把黄芪煮20分钟，然后捞出，再开始煮黄瓜汤。这次的黄瓜汤就平添了药膳食疗的功效。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/shihu.jpeg', null, '石斛', '滋阴', '夏天天气热，容易口渴咽干，养生时讲究滋阴，可以食用石斛。石斛有滋阴润肺、生津养胃的功效，滋阴润燥的效果最好。食疗方：鲜石斛汁。制作：有的药店能买到鲜石斛，将新鲜石斛洗净、切碎，放入搅拌机中，加入适量蜂蜜和清水，搅拌后饮用。如果没有新鲜石斛，也可以将干品石斛烹煮后饮用，或研成粉末用沸水冲泡。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/lianxin.jpeg', null, '莲心', '去火', '夏季应该养心，但暑热容易心火旺盛，心烦气躁。乾隆皇帝每到避暑山庄避暑总要泡莲心茶，而且要用荷叶上的露珠炮制，以清心火。莲心虽苦，但清火、除烦，有很好的强心作用。食疗方：莲心龙井茶。制作：龙井茶一撮，莲心10枚，沸水沏泡，苦后回甘的感觉过后，我们的心情多少都会有些平复，夏日原来很安逸。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/baidoukou.jpeg', null, '白豆蔻', '开胃', '天热吃不下饭吗？豆蔻非常有用，在香料昂贵的时代，美食家像携带香烟一样随身备着豆蔻，因为它的香味有助消化的功能。你可以买了豆蔻后，用研磨器研磨成粉末，装在密闭瓶子里，像调料一样用。如果能现用现研磨，香味更浓郁。食疗方：白豆蔻茶。制作：沏一杯红茶，用咖啡勺加一小勺豆蔻粉。豆蔻有类似姜的辛凉味道，可以再加点糖调味。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/peilan.jpeg', null, '佩兰', '提神', '夏天容易困倦，提不起精神，佩兰含有挥发油，可抑菌杀菌，能起到开窍提神、祛风止痛、舒筋活络的作用。食疗方：佩兰茶。制作：很简单，不管你喝什么茶，都可以加一点佩兰。中药店买回来的佩兰是切碎的，你可以像茶叶一样装在罐子里，沏茶时加一点，茶叶量的一半即可。水温不要太高，60℃的热水最好，以确保佩兰发挥最大的疗效。');
INSERT INTO `goodslist` VALUES ('2', '../../static/index/recommend/baishu.jpeg', null, '白术', '养胃健脾', '胃不好的人夏天更甚，因此夏天是养胃健脾最合适的季节。白术有健脾益气、燥湿利水的功效，可以除去脾胃中的湿热，尤其适合脾虚的人食用。食疗方：白术鱼汤。制作：夏天不宜吃肉，鱼汤是最好的进补方法。炖鱼汤时，加姜块的同时加两块白术、一块陈皮，这样的鱼汤更养人。');

-- ----------------------------
-- Table structure for medical
-- ----------------------------
DROP TABLE IF EXISTS `medical`;
CREATE TABLE `medical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicalName` varchar(255) DEFAULT NULL,
  `medicalTitle` varchar(255) DEFAULT NULL,
  `medicalDetail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of medical
-- ----------------------------
INSERT INTO `medical` VALUES ('2', '藿香', '别名', '土藿香、大叶薄荷、绿荷荷、川藿香、苏藿香、野藿香、排香草。');
INSERT INTO `medical` VALUES ('3', '藿香', '药用部位', '唇形科植物藿香的全草或地上部分');
INSERT INTO `medical` VALUES ('4', '藿香', '植物形态', '一年生或多年生草本，高40～110厘米。茎直立，四棱形，略带红色，稀被微柔毛及腺体。叶对生，椭圆状卵形或卵形，先端锐尖或短渐尖，基部圆形或略带心形，边缘具不整齐的钝锯齿，齿圆形，上面无毛或近无毛，散生透明腺点，下面被短柔毛。');
INSERT INTO `medical` VALUES ('5', '藿香', '产地分布', '生于山坡或路旁。分布于黑龙江、吉林、辽宁、河北等地。');
INSERT INTO `medical` VALUES ('6', '藿香', '采收加工', '第1次在6～7月开花时采收，第2次在10月采收。采后除去杂质，切段晒干或阴干。单用老茎者，称“藿梗”。');
INSERT INTO `medical` VALUES ('7', '藿香', '药材性状', '茎呈四方柱形，四角有棱脊，直径3～10毫米，表面黄绿色或灰黄色，茸毛稀少，或近于无毛，质轻脆，断面中央有白色髓。老茎坚硬，木质化，断面中空。叶多已脱落，剩余叶灰绿色，皱缩或破碎，两面微具毛，薄而脆。');
INSERT INTO `medical` VALUES ('8', '藿香', '性味归经', '性微温，味辛。归肺经、脾经、胃经。');
INSERT INTO `medical` VALUES ('9', '藿香', '功效与作用', '快气、和中、辟秽、祛湿。属理气药。');
INSERT INTO `medical` VALUES ('10', '藿香', '临床应用', '用量5～9克，内服煎汤，或入丸散。治疗感冒暑湿、寒热、头痛、胸脘痞闷、呕吐泄泻、疟疾、痢疾、口臭。');
INSERT INTO `medical` VALUES ('11', '藿香', '使用禁忌', '阴虚火旺，胃弱欲呕及胃热作呕，中焦火盛热极者禁服。不宜久煎。');
INSERT INTO `medical` VALUES ('12', '藿香', '配伍药方', '①预防伤暑：藿香、佩兰各等 分。煎水饮用。②治急性肠炎：藿香9～30克，水煎(不可久煎)，另用大蒜头4～6瓣，捣烂，和红糖15克拌匀，冲服，每日1～3次。③治胃腹冷痛：藿香6克，肉桂6克，共研细末，每次3克，白酒为饮，每日服2次。④治湿疹，皮肤瘙痒：用(藿香)茎、叶适量，水煎外洗。');
INSERT INTO `medical` VALUES ('13', '银柴胡', '别名', '银胡、银夏柴胡、牛肚根、沙参儿、白根子。');
INSERT INTO `medical` VALUES ('14', '银柴胡', '药用部位', '石竹科植物银柴胡的干燥根。');
INSERT INTO `medical` VALUES ('15', '银柴胡', '植物形态', '多年生草本。株高20～40厘米，密被腺毛或柔毛。主根圆柱形，粗1～3厘米。茎直立，细长，节略膨大，节间长1～2厘米，由基部明显多次二歧分枝，密被短柔毛。叶对生，无柄，披针形或线状披针形，长0.5～3厘米，宽1.5～4厘米，全缘。');
INSERT INTO `medical` VALUES ('16', '银柴胡', '产地分布', '生于干燥草原及山坡悬崖石缝中。分布于甘肃、陕西、内蒙古等地。');
INSERT INTO `medical` VALUES ('17', '银柴胡', '采收加工', '春、夏间植株萌发或秋后茎叶枯萎时采挖，栽培品于种植后第三年9月中旬或第四年4月中旬采挖，除去残茎、须根及泥沙，晒干。');
INSERT INTO `medical` VALUES ('18', '银柴胡', '药材性状', '呈类圆柱形，偶有分枝，长15～40厘米，直径0.5～2.5厘米。表面浅棕黄色至浅棕色，有扭曲的纵皱纹和支根痕，多具孔穴状或盘状凹陷，习称“砂眼”，从砂眼处折断可见棕色裂隙中有细砂散出。根头部略膨大，有密集的呈疣状突起的芽苞、茎或根茎的残基，习称“珍珠盘”。');
INSERT INTO `medical` VALUES ('19', '银柴胡', '性味归经', '性微寒，味甘。归肝经、胃经。');
INSERT INTO `medical` VALUES ('20', '银柴胡', '功效与作用', '清虚热，除疳热。属收涩药下属分类的敛肺涩肠药。');
INSERT INTO `medical` VALUES ('21', '银柴胡', '使用禁忌', '外感风寒及血虚无热者忌服。');
INSERT INTO `medical` VALUES ('22', '银柴胡', '配伍药方', '①治骨蒸劳热：银柴胡4.5克，胡黄连、秦艽、鳖甲(醋炙)、地骨皮、青蒿、知母各3克，甘草1.5克。水二钟，煎八分，食远服。②治男妇虚劳发热，或咳或不咳：银柴胡、沙参各等分，每服6克，水煎服。③治温证潮热，身体枯瘦，皮肤甲错，消瘦而不润者：银柴胡6克，鳖甲9克。水煎服。');

-- ----------------------------
-- Table structure for medicalimg
-- ----------------------------
DROP TABLE IF EXISTS `medicalimg`;
CREATE TABLE `medicalimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicalName` varchar(255) DEFAULT NULL,
  `medicalImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of medicalimg
-- ----------------------------
INSERT INTO `medicalimg` VALUES ('1', '藿香', '/static/medical/huoxiang/1.jpg');
INSERT INTO `medicalimg` VALUES ('2', '藿香', '/static/medical/huoxiang/2.jpg');
INSERT INTO `medicalimg` VALUES ('3', '藿香', '/static/medical/huoxiang/3.jpg');
INSERT INTO `medicalimg` VALUES ('4', '藿香', '/static/medical/huoxiang/4.jpg');
INSERT INTO `medicalimg` VALUES ('5', '藿香', '/static/medical/huoxiang/5.jpg');
INSERT INTO `medicalimg` VALUES ('6', '银柴胡', '/static/medical/yinchaihu/1.jpg');
INSERT INTO `medicalimg` VALUES ('7', '银柴胡', '/static/medical/yinchaihu/2.jpg');
INSERT INTO `medicalimg` VALUES ('8', '银柴胡', '/static/medical/yinchaihu/3.jpg');
INSERT INTO `medicalimg` VALUES ('9', '银柴胡', '/static/medical/yinchaihu/4.jpg');
INSERT INTO `medicalimg` VALUES ('10', '银柴胡', '/static/medical/yinchaihu/5.jpg');

-- ----------------------------
-- Table structure for menulist
-- ----------------------------
DROP TABLE IF EXISTS `menulist`;
CREATE TABLE `menulist` (
  `index` int(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of menulist
-- ----------------------------
INSERT INTO `menulist` VALUES ('1', '../../static/index/menuList/1.jpg', '发展历史', '');
INSERT INTO `menulist` VALUES ('1', '../../static/index/menuList/2.jpg', '医学理论', '');
INSERT INTO `menulist` VALUES ('1', '../../static/index/menuList/3.jpg', '中药分类', '/pages/category/category');
INSERT INTO `menulist` VALUES ('1', '../../static/index/menuList/4.jpg', '中医特点', '');
INSERT INTO `menulist` VALUES ('2', '../../static/index/menuList/5.jpg', '治疗手段', '');
INSERT INTO `menulist` VALUES ('2', '../../static/index/menuList/6.jpg', '医学名医', '');
INSERT INTO `menulist` VALUES ('2', '../../static/index/menuList/7.jpg', '四大经典', '');
INSERT INTO `menulist` VALUES ('2', '../../static/index/menuList/8.jpg', '历史典故', '');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`newId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '王伟:用更加严谨充分的科学依据向世界推广中医药', '“我们要发展中医药，注重用现代科学解读中医药学原理，走中西医结合的道路。”5月12日，习近平总书记在河南省南阳市考察时再次点题中医药，并对进一步发展中医药提出新的明确要求。', '../../pages/detail/newsDetail');
INSERT INTO `news` VALUES ('2', '李宗友主任赴浙江、江西调研中医药信息化建设情况', '2021年6月5-9日,国家中医药管理局监测统计中心主任李宗友率调研组分别前往浙江、江西两地,就中医药信息化建设、中医药综合统计、中医医疗质量监测评估等工作进行调研。', '');
INSERT INTO `news` VALUES ('3', '山丹:传承中医药文化为百姓健康护航', '“中医针灸治疗真的很好，之前我胳膊疼的抬不起来，经过几个疗程的扎针，现在真的是好多了，可以自由活动了，花的钱少，效果还好。”在山丹县清泉镇社区卫生服务中心，家住丹马小区的姜兴业正在接受针灸康复治疗，腿疼', '');
INSERT INTO `news` VALUES ('4', '如何传承创新中医药国粹?她这样做', '如何传承创新中医药国粹?她这样做', '');
INSERT INTO `news` VALUES ('5', '北京中医药大学:今年新设岐黄学院 新增中医骨伤专业', '2021年，北京中医药大学新增中医骨伤科学专业。“5 3一体化”实施大类招生，今年“5 3一体化”原有五个方向合并为中医学(卓越5 3一体化)，采取宽口径入学，入学后再选取专业方向。', '');
INSERT INTO `news` VALUES ('6', '中医资讯中医规培管理培训班举办', '中医资讯中医规培管理培训班举办近日，由中国医师协会主办的中医医师规范化培训管理人员培训班在天津市举办。来自全国17个省级中医药主管部门、234家中医规培基地、协同单位和基层培养基地的规培管理人员等参加培训。', '');

-- ----------------------------
-- Table structure for newsarticle
-- ----------------------------
DROP TABLE IF EXISTS `newsarticle`;
CREATE TABLE `newsarticle` (
  `newsId` int(11) DEFAULT NULL,
  `article` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of newsarticle
-- ----------------------------
INSERT INTO `newsarticle` VALUES ('1', '【编者按】“我们要发展中医药，注重用现代科学解读中医药学原理，走中西医结合的道路。”5月12日，习近平总书记在河南省南阳市考察时再次点题中医药，并对进一步发展中医药提出新的明确要求。');
INSERT INTO `newsarticle` VALUES ('1', '传承精华，中医药发展才能源远流长；守正创新，中医药发展才会清流激荡。结合中医药在新冠肺炎疫情救治中的突出表现和经验成果，多位曾经参与一线抗疫的中医药专家畅谈体会，为中医药事业实现高质量发展，护佑全人类健康建言献策。');
INSERT INTO `newsarticle` VALUES ('1', '“此次新冠肺炎疫情的救治，充分展现了中医药在维护人民生命健康中的独特作用。作为一个中医人，看到国家高度重视中医药的发展，感到非常欣慰，也深感责任重大。”结合疫情救治，广州中医药大学校长王伟谈及体会时表示，只有建立起全社会对于中医药的信心，中医药发展才能真正拥有扎实的社会基础和群众基础');
INSERT INTO `newsarticle` VALUES ('1', '王伟曾是国家中医药管理局新冠肺炎疫情防控医疗救治组成员。“在国家中医药管理局的统一协调下，我们重点推广清肺排毒汤。第一步是在全国的10个省市，一周之内选取了214例患者，进行了观察，发现效果不错。随后，国家中医药管理局、国家卫健委发文，向全国推广使用。”王伟称，包括清肺排毒汤在内的“三药三方”，从进入新冠肺炎诊疗方案开始，中医药全面介入了疫情的防治。');
INSERT INTO `newsarticle` VALUES ('1', '“通过临床应用和观察，我们认为，中医药越早干预效果越好。因为，控制病情的关键在于是否向重症、危重症发展。如果到了重症特别是危重症时，患者死亡率还是比较高的，而中医药恰恰可以在病情早期发挥非常好的阻断病情发展的作用。”王伟表示。');

-- ----------------------------
-- Table structure for newsdetail
-- ----------------------------
DROP TABLE IF EXISTS `newsdetail`;
CREATE TABLE `newsdetail` (
  `newDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `readNum` int(11) DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL,
  `newImgId` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `fabulous` int(11) DEFAULT NULL,
  PRIMARY KEY (`newDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of newsdetail
-- ----------------------------
INSERT INTO `newsdetail` VALUES ('1', '王伟：用更加严谨充分的科学依据向世界推广中医药', '\r\n\r\n金台资讯', '06-07 08:56', '2453', '1', '1', '人民网精选资讯官方帐号', '123');

-- ----------------------------
-- Table structure for newsimg
-- ----------------------------
DROP TABLE IF EXISTS `newsimg`;
CREATE TABLE `newsimg` (
  `newsId` int(11) DEFAULT NULL,
  `newsImg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of newsimg
-- ----------------------------
INSERT INTO `newsimg` VALUES ('1', '../../static/news/newsimg1.jpeg');
INSERT INTO `newsimg` VALUES ('1', '../../static/news/newsimg2.jpeg');

-- ----------------------------
-- Table structure for replylist
-- ----------------------------
DROP TABLE IF EXISTS `replylist`;
CREATE TABLE `replylist` (
  `replyId` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `fabulous` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of replylist
-- ----------------------------
INSERT INTO `replylist` VALUES ('1', '../../static/news/2.jpg', '人民资讯', '2', '中医针灸治疗真的很好，之前我胳膊疼的抬不起来，经过几个疗程的扎针，现在真的是好多了，可以自由活动了，花的钱少，效果还好。', '昨天 21:08');
INSERT INTO `replylist` VALUES ('1', '../../static/news/3.jpg', '九派健康', '5', '中国医师协会副会长齐学进介绍，我国中医规培工作自2014年启动实施以来，取得了阶段性成果。中医规培作为一项重要国家制度，已经实现了2020年基本建成的任务目标。他同时提出四个“认清”：一是认清使命，提高站位；二是认清不足，加强学习；三是认清规律，突出特色；四是认清形势，抓好落实。', '昨天 19:09');
INSERT INTO `replylist` VALUES ('1', '../../static/news/4.jpg', 'Mr数据杨', '0', '习近平总书记指出：“中医药学包含着中华民族几千年的健康养生理念及其实践经验，是中华民族的伟大创造和中国古代科学的瑰宝。”中医药文化包括天人合一、顺应四时、形神兼顾、阴阳平衡等理念，是中华优秀传统文化的重要组成部分。可以说，中医药文化早已融入中国人的血脉，融入百姓的饮食起居，为中华民族的繁衍昌盛作出巨大贡献。', '昨天 17:30');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12345678911', '1');
INSERT INTO `user` VALUES ('3', '14725836901', '123');
INSERT INTO `user` VALUES ('8', '12369854702', '1');
INSERT INTO `user` VALUES ('9', '14523698708', '1');
INSERT INTO `user` VALUES ('10', '12365897412', '2');
INSERT INTO `user` VALUES ('11', '14258796306', '3');
INSERT INTO `user` VALUES ('12', '14725896308', '1');
INSERT INTO `user` VALUES ('13', '14789652300', '1');

<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Forums(TM)
'**  http://www.webwizforums.com
'**                            
'**  Copyright (C)2001-2007 Web Wiz(TM). All Rights Reserved.
'**  
'**  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS UNDER LICENSE FROM 'WEB WIZ'.
'**  
'**  IF YOU DO NOT AGREE TO THE LICENSE AGREEMENT THEN 'WEB WIZ' IS UNWILLING TO LICENSE 
'**  THE SOFTWARE TO YOU, AND YOU SHOULD DESTROY ALL COPIES YOU HOLD OF 'WEB WIZ' SOFTWARE
'**  AND DERIVATIVE WORKS IMMEDIATELY.
'**  
'**  If you have not received a copy of the license with this work then a copy of the latest
'**  license contract can be found at:-
'**
'**  http://www.webwizguide.com/license
'**
'**  For more information about this software and for licensing information please contact
'**  'Web Wiz' at the address and website below:-
'**
'**  Web Wiz, Unit 10E, Dawkins Road Industrial Estate, Poole, Dorset, BH15 4JD, England
'**  http://www.webwizguide.com
'**
'**  Removal or modification of this copyright notice will violate the license contract.
'**
'****************************************************************************************


'Global
'---------------------------------------------------------------------------------
Const strTxtForumHelp = "Forum Yardýmý"
Const strTxtChooseAHelpTopic = "Bir yardým konusu seçin"
Const strTxtLoginAndRegistration = "Forum için Kayýt ve Giriþ"
Const strTxtUserPreferencesAndForumSettings = "Kullanýcý Tanýmlamalarý ve Forum Ayarlarý"
Const strTxtPostingIssues = "Gönderme-Posta sorunlarý"
Const strTxtMessageFormatting = "Mesaj Biçimlendirme"
Const strTxtUsergroups = "Kullanýcý gruplarý"
Const strTxtPrivateMessaging = "Özel Haberleþme"

Const strTxtWhyCantILogin = "Neden giremiyorum?"
Const strTxtDoINeedToRegister = "Kayýt olmalý mýyým?"
Const strTxtLostPasswords = "Parolamý Unuttum"
Const strTxtIRegisteredInThePastButCantLogin = "Önceden kaydolmuþtum, ancak þimdi giremiyorum"

Const strTxtHowDoIChangeMyForumSettings = "Forum ayarlarýmý nasýl deðiþtirebilirim?"
Const strTxtForumTimesAndDates = "Forumun zamaný benim yerel zamanýma uygun deðil"
Const strTxtWhatDoesMyRankIndicate = "Sýrýlamam (rank) neyi gösterir?"
Const strTxtCanIChangeMyRank = "Sýralamamý (rank) deðiþtirebilir miyim?"
Const strTxtWhatWebBrowserCanIUseForThisForum = "Bu forumda hangi web tarayýcýyý kullanmalýyým?"

Const strTxtHowPostMessageInTheForum = "Forum içinde nasýl posta gönderebilirim?"
Const strTxtHowDeletePosts = "Postalarý nasýl silebilirim?"
Const strTxtHowEditPosts = "Postalarý nasýl düzeltebilirim?"
Const strTxtHowSignaturToMyPost = "Postama nasýl imza ekleyebilirim?"
Const strTxtHowCreatePoll = "Nasýl bir anket yaratabilirim?"
Const strTxtWhyNotViewForum = "Neden forumu görüntüleyemiyorum?"
Const strTxtMyPostIsHiddenOrPendingApproval = "Mesajým, ‘Gizli’, veya ‘Onay Bekliyor’ þeklinde görünüyor"
Const strTxtInternetExplorerWYSIWYGPosting = "Zengin Yazý Editörü (WYSIWYG)"

Const strTxtWhatForumCodes = "Forum kodlarý nelerdir?"
Const strTxtCanIUseHTML = "HTML kullanabilir miyim?"
Const strTxtWhatEmoticons = "Emoticons (Smileys) nedir?"
Const strTxtCanPostImages = "Görüntü (images) gönderebilir miyim?"
Const strTxtWhatClosedTopics = "Kapalý (closed) konular nelerdir?"

Const strTxtWhatForumAdministrators = "Forum Yöneticileri (Forum Administrators) nedir?"
Const strTxtWhatForumModerators = "Forum Baþkanlarý (Forum Moderators) nedir?"
Const strTxtWhatUsergroups = "Kullanýcý Gruplarý (Usergroups) nedir?"

Const strTxtWhatIsPrivateMessaging = "Özel Mesaj Sistemi nedir?"
Const strTxtIPrivateMessages = "Özel mesajlarýmý gönderemiyorum"
Const strTxtIPrivateMessagesToSomeUsers = "Özel mesajlarýmý sadece bazý kullanýcýlara gönderemiyorum"
Const strTxtHowCanPreventSendingPrivateMessages = "Bazýlarýnýn bana özel mesaj göndermesini nasýl engelleyebilirim?"

Const strTxtRSSFeeds = "RSS Linkleri"
Const strTxtHowDoISubscribeToRSSFeeds = "Forum RSS Linklerine Nasýl Abone Olabilirim?"

Const strTxtCalendarSystem = "Takvim Sistemi"
Const strTxtWhatIsTheCalendarSystem = "Takvim Sistemi Nedir?"
Const strTxtHowDoICreateCalendarEvent = "Nasýl takvim olayý giriþi yapabilirim?"

Const strTxtAbout = "Hakkýnda"
Const strTxtWhatSoftwareIsUsedForThisForum = "Bu forumda hangi yazýlým kullanýlýyor?"


Const strTxtFAQ1 = "Foruma girebilmek için kayýt yaptýrýrken yazdýðýnýz kullanýcý adý ve parolasýný girmeniz gerekmektedir.Halen kayýtlý üye deðilseniz foruma girebilmek için öncelikle kayýtlý üye olmalýsýnýz. Kayýtlý üye olmanýza ve doðru kullanýcý adý ile parolayý yazmanýza raðmen halen foruma giremiyorsanýz, öncelikle web tarayýcýnýzda çerezlerin (cookies) kullanýlabilir olup olmadýðýný kontrol edin. Halen sorun yaþýyorsanýz web tarayýcýnýza bu siteyi güvenilir site olarak tanýtmanýz gerekebilir. Eðer foruma giriþiniz yasaklanmýþ (banned) ise yine foruma giremeyeceðinizden her halde forum yöneticiniz ile görüþünüz."
Const strTxtFAQ2 = "Foruma gönderme yapabilmek için kayýt olmanýz gerekmeyebilir, çünkü kayýtlý olmasa dahi kullanýcýlarýn foruma gönderme yapma yetkisini verme ya da yasaklama forum yöneticisinin elindedir. Ancak, foruma kayýt olmakla ek özelliklerden ve olanaklardan yararlanabileceðinizi dikkate alýnýzý. Kayýt olmak sadece bir kaç dakikanýzý alacaðýndan, kayýt olmanýzý öneriyoruz."
Const strTxtFAQ3 = "Parolanýzý unuttuðunuzda telaþlanmanýza gerek yok. Önceki parolalar hatýrlanamaz ise de, yerine yenisi verilebilir. Unuttuðunuzun yerine yeni parola almak için giriþ (login) düðmesine basýn ve giriþ sayfasýnýn altýnda göreceðiniz parolamý unuttum (lost password) sayfasý linkini týkladýðýnýzda yönlendirildiðiniz sayfadan, yeni parolanýn e posta ile gönderilmesini isteyebilirsiniz. Eðer belirtilen seçenek kullanýlabilir deðil ya da, yeni parolanýn gönderilebileceði bir e posta adresi önceden profilinizde belirtilmemiþ ise, forum yönetecisi ya da forum baþkaný ile temasa geçerek parolanýzý sizin için deðiþtirmesini isteyebilirsiniz."
Const strTxtFAQ4 = "Bir süre için gönderme yapmamýþ ya da hiç gönderme yapmamýþ olabirsiniz. Forum yöneticilerinin veritabanýndan uzun belirli süre foruma katýlmayan kullanýcýlara, veritabanýný boþaltýp rahatlatmak için silmeleri alýþýlagelmiþ bir uygulamadýr."
Const strTxtFAQ5 = "Forum ayarlarýnýzý, profil bilgilerinizi, kayýt detaylarýnýzý vs., <a href=""member_control_panel.asp"" target=""_self"">Üye Kontrol Paneli</a>, den foruma bir kez girmiþ iseniz deðiþtirebilirsiniz. Bu merkez menüden bir çok görünümü kontrol edebilir ve üye olanaklarýna eriþebilirsiniz."
Const strTxtFAQ6 = "Forumlarda kullanýlan zaman, sunucunun tarih ve saati olduðundan, eðer sunucu baþka bir ülkede bulunuyor ise, tarih ve saat o ülkenin yerel ayarlarýdýr. Tarih ve saati kendi yerel ayarlarýnýza deðiþtirmek için ('Forum Preferences') Forum Tercihlerinizi <a href=""member_control_panel.asp"" target=""_self"">Üye Kontrol Paneli</a> den deðiþtirip, sunucu ile yerel ayarlarýnýz arasýndaki farký yazýp ayarlarýnýzý yapýnýz. Forumlar standart ve gün ýþýðý tasarruf zamanlamasýný ayarlayabilmek için tasarlanmadýðýndan, gün ýþýðý tasarrufu için yapýlan ayarlama zamanlarýnda yeniden zaman ayarlarýný yapmanýz gerekebilir."
Const strTxtFAQ7 = "Forumdaki sýralama (ranks) sizin hangi kullanýcý grubunun üyesi olduðunuzu ve kullanýcýlarý gösterir. Örneðin, forum baþkanlarý ve yöneticilerinin farklý ve özel bir sýralamasý olabilir. Forumun ayarlarýna ve hangi sýralamada olduðunuza baðlý olarak, forumun deðiþik özelliklerini kullanabilirsiniz."
Const strTxtFAQ8 = "Yapamamanýz normaldir. Ancak, forum yöneticisi yükselme sistemini (ladder system) kullanarak sýralamayý yapmýþsa, mesajlarýnýzýn sayýsýna göre bir üst gruba otomatik olarak geçersiniz."
Const strTxtFAQ9 = "Forumlarda mesaj gönderebilmek için, forum ya da konu ekranýnda ilgili düðmeyi týklatýn. Forum yöneticisinin forum ayarlarýna baðlý olarak, bir mesaj göndermeden önce foruma girmeniz gerekebilir. Konu ekranýnýn altýnda kullanabileceðiniz kolaylýklar listelenmiþtir."
Const strTxtFAQ10 = "Forumun göndermelerinizi silebilmeniz için uygun ayarlara sahip olmasý kaydýyla forum baþkaný ya da forum yöneticisi olmadýðýnýz ve sürece, sadece kendi göndermelerinizi silebilirsiniz. Eðer biri sizin göndermenizi cevaplamýþ ise, artýk kendi göndermenizi de silemezsiniz."
Const strTxtFAQ11 = "Forumun göndermelerinizi düzenleyebilmeniz için uygun ayarlara sahip olmasý kaydýyla, forum baþkaný ya da forum yöneticisi olmadýðýnýz sürece göndermelerinizi düzenleyemezsiniz. Forum ayarlarýna baðlý olarak göndermelerinizi düzelttiðinizde, düzelten kullanýcý adý, düzeltmenin tarih ve saati gönderimin altýnda görünecektir."
Const strTxtFAQ12 = "Forum yöneticisi forumda imza kullanýmýna izin vermiþ ise, gönderiminizin altýna imzanýzý ekleyebilirsiniz. Ýmza ekleyebilmek için öncelikle ('Profile Information') Kiþisel Bilgilerinizde <a href=""member_control_panel.asp"" target=""_self"">Üye Kontrol Paneli</a>, ni kullanarak imzanýzý yaratmýþ olmanýz gerekmektedir. Bir kez bunu yaptýktan sonra Gönderme formunun altýndaki ('Show Signature') Ýmzayý Göster kutusunu iþaretleyerek imzanýzý gönderebilirsiniz."
Const strTxtFAQ13 = "Bir forumda anket yaratmak için yeterli haklarýnýz varsa, forum ve konular ekranýnýn tepesinde ('New Poll') Yeni Anket düðmesini göreceksiniz. Anket yaratýrken, anket sorusunu ve en az iki anket seçeneði girmeniz gerekmektedir. Ayrýca, katýlanlarýn sadece bir defa ya da bir defadan fazla oy kullanabileceklerini seçebilirsiniz."
Const strTxtFAQ14 = "Bazý forumlar, sadece belirli kullanýcýlarýn ya da belirli kullanýcalarýn oluþturduðu gruplarýn eriþimi için ayarlanmýþtýr. Bu tür bir forumu görmek, okumak vs. için öncelikle, forum baþkaný ya da yöneticisinin saðlayabileceði izinlere ihtiyacýnýz olacaktýr."
Const strTxtFAQ28 = "Onay gerektiren bir foruma veya konuya mesaj yazmýþsýnýz. Mesajýnýzý herkesin görebilmesi için yönetici veya moderatörler tarafýndan onaylanmasý gerekir."
Const strTxtFAQ15 = "Internet Explorer 5+ (sadece windows), Netscape 7.1, Mozilla 1.3+, Mozilla Firebird 0.6.1+, kullanýyorsanýz ve forum yönetici zengin yazý editörünü açmýþsa zengin yazý editörünü kullanarak mesaj yazabilirsiniz. Zengin yazý editöründe sorun yaþýyorsanýz ayarlar bölümünden kapatabilirsiniz."
Const strTxtFAQ16 = "Forum kodlarý, forumda gönderdiðiniz mesajlarý biçimlendirmenize olanak verir.Forum kodlarý HTML ye çok benzer. Sadece tag'lar köþeli parantez içindedir. Örneðin, &lt; and &gt; yerine [ and ] gibi. Ayrýca, mesaj gönderirken forum kodlarýný çalýþtýrmayabilirsiniz. <a href=""javascript:winOpener('forum_codes.asp','codes',1,1,550,400)"">Burayý týklayarak kullanabileceðiniz forum kodlarýný görebilirsiniz</a>."
Const strTxtFAQ17 = "Mesajlarýnýzda HTML kullanýlamaz. Kötü niyetle gönderilebilecek HTML kodlarýnýn forumun görüntüsünü bozabileceðinden ve hatta mesaj kullanýcý tarafýndan açýldýðýnda web tarayýcýsý çalýþamaz duruma gelebileceðinden güvenlik nedeniyle kullanýlmamaktar."
Const strTxtFAQ18 = "Emoticons or Smileys'ler duygularý ifade etmek ya da göstermek için kullanýlabilecek küçük grafik görüntülerdir. Eðer forum yöneticisi izin vermiþ ise Emoticons'u forumlarda mesaj gönderirken mesaj formunun yanýnda görebilirsiniz. Gönderiminize emoticon eklemek için, göndermek istediðiniz emoticon üzerine týklayýnýz."
Const strTxtFAQ19 = "Eðer forum yöneticiniz yüklemeye izin vermiþse, bilgisayarýnýzdaki bir görüntü postanýza yüklenebilir (upload) ve eklenebilir. Ancak, eðer görüntünün (image) yüklenebilmesi mümkün deðil ise, görüntünün bulunduðu sunucuya link vermeniz gerekecektir. Örneðin, http://www.mysite.com/my-picture.jpg."
Const strTxtFAQ20 = "Kapalý Konular (Closed Topics), forum baþkanlarý ya da yöneticileri tarafýndan bu þekilde ayarlanmýþ olanlardýr. Eðer bir kapatýlmýþ ise, artýk bu konuda gönderme yapamaz, göndermeyi cevaplayamaz ve bir anketi oylayamazsýnýz."
Const strTxtFAQ21 = "Forum Yöneticileri (Forums Administrators) forumlarda en yüksek kontrol yetkisine sahip kiþilerdir. Forumlarda özellikleri kapatýp açma, kullanýcýlarý yasaklama, kullanýcýlarý silme, göndermeleri düzeltme ve silme, kullanýcý gruplarý oluþturma gibi imkanlarý bulunmaktadýr."
Const strTxtFAQ22 = "Forum Baþkanlarý (Moderators) forumun gidiþine günlük olarak bakan tek ya da grup halinde kullanýcýlardýr. Sorumlu olduklarý forumda, konu ve göndermeleri düzeltme, silme, yer deðiþtirme, kapatma, kapatýlmýþý açma haklarýna sahiptirler. Bunlar genellikle kiþilerin saldýrgan ve küfürlü ifadelerini engellemek için bulunurlar."
Const strTxtFAQ23 = "Kullanýcý gruplarý, grup kullanýcýlarýn bir yoludur. Her kullanýcý bir kullanýcý grubunun üyesidir ve her gruba forumda kullanabileceði okuma, görme, gönderme, anket yaratma gibi kendisine özgü haklar tanýnmýþ olabilir."
Const strTxtFAQ24 = "Bunun bir kaç nedeni olabilir. Foruma girmemiþ olabilirsiniz, kayýtlý olmayabilirsiniz veya forum yöneticileri Özel Mesaj Gönderme sistemini (Private Messaging system) iptal etmiþ olabilir."
Const strTxtFAQ25 = "Bu, özel mesaj göndermek istediðiniz kiþininin sizden gelecek özel mesajlarý bloke etmesinden kaynaklanýyon olabilir. Hal böyle ise, özel mesaj gönderdiðinizde bu konuda sizi uyaran bir mesaj almýþ olmanýz gerekir"
Const strTxtFAQ26 = "Eðer bir kullanýcýdan istenmeyen özel mesajlar alýyorsanýz, size özel mesaj gönderilmesini bloke edebilirsiniz. Blokajý yapmak için Özel Mesaj Sisteminde (Private Messaging system) Arkadaþ listenize (buddy list) gidin. Kullanýcýyý Arkadaþ (buddy) olarak yazýn, fakat drop down listeden ('Not to message you') Mesaj göndermesini seçin. Böylece bu kullanýcýnýn size özel mesaj göndermesini engellemiþ olacaksýnýz."
Const strTxtFAQ27 = "Eðer forum yöneticisi özel mesaj sistemini açmýþsa, diðer üyelere mesaj gönderebilir ve alabilirsiniz."
Const strTxtFAQ29 = "RSS, sitelerin güncel içeriklerini paylaþmalarýný saðlayan bir teknolojidir. Eðer forum yöneticisi bu özelliði etkinleþtirmiþ ise foruma eklenen son mesajlardan ve takvimdeki önemli olaylardan anýnda haberdar olabilirsiniz."
Const strTxtFAQ30 = "Forumdaki RSS desteðinden yararlanmanýzýn bir çok yöntemi vardýr, örneðin; RSS Desteði olan bir Web Browser kullanmak (Firefox, IE7, Safari, Opera), RSS Haber Okuyucu kullanmak, veya RSS desteði olan Mozilla Thunderbird gibi bir e-posta programý kullanmak."
Const strTxtFAQ31 = "Takvime girilmiþ olan mesajlarý ve üyelerin doðum günlerini günlük, haftalýk ve aylýk olarak görebilirsiniz."
Const strTxtFAQ32 = "Forum yöneticisi sizin içinde bulunduðunuz gruba veya size özel takvime giriþ yapma yetkisi vermiþ ise takvime olay giriþi yapabilirsiniz. Eðer izniniz varsa mesaj yazarken tarih seçebileceðiniz bir alan gelecektir."
Const strTxtFAQ33 = "Web wiz forum kullanýlmaktadýr. Web Wiz Forums forum Microsoft’s Active Server Pages (ASP) tabanýyla kodlanmýþtýr ve Windows web serverlarda çalýþýr. Kendi web siteniz için web wiz forum indirmek için týklayýn <a href=""http://www.webwizforums.com"">www.webwizforums.com</a>."
Const strTxtFAQ34 = "Windows XP veya Apple MAC OS X platformunda Internet Explorer, Mozilla, Firefox, Safari, Netscape, Opera, ve benzeri tarayýcýlarý kullanabilirsiniz. Ama biz tüm platformlar için <a href=""http://getfirefox.com"" target=""_blank"">Firefox</a> u öneriyoruz."

%>
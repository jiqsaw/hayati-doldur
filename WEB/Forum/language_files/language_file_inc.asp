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
Const strTxtWelcome = "Hoþ Geldiniz"
Const strTxtAllForums = "Bütün Forumlar"
Const strTxtTopics = "Konular"
Const strTxtPosts = "Gönderilenler"
Const strTxtLastPost = "Son Gönderilen"
Const strTxtPostPreview = "Mesaj Ön Ýzleme"
Const strTxtAt = "Saat"
Const strTxtBy = "yazan:"
Const strTxtOn = ""
Const strTxtProfile = "Özellikler"
Const strTxtSearch = "Arama"
Const strTxtQuote = "Alýntý"
Const strTxtVisit = "Ziyaret"
Const strTxtView = "Göster"
Const strTxtHome = "Ana"
Const strTxtHomepage = "Ana Sayfa"
Const strTxtEdit = "Düzenle"
Const strTxtDelete = "Sil"
Const strTxtEditProfile = "Özellikleri Düzenle"
Const strTxtLogOff = "Çýkýþ"
Const strTxtRegister = "Kayýt Ol"
Const strTxtLogin = "Giriþ"
Const strTxtMembersList = "Forum Üyelerini Göster"
Const strTxtForumLocked = "Kilitli Forum"
Const strTxtSearchTheForum = "Forumu Ara"
Const strTxtPostReply = "Yanýt Yaz"
Const strTxtNewTopic = "Yeni Konu"
Const strTxtNoForums = "Gösterilecek Konu Bulunamýyor."
Const strTxtReturnToDiscussionForum = "Foruma Geri Dön"
Const strTxtMustBeRegistered = "Üzgünüm, Bu Bölüme Girmek Ýçin Kayýtlý Kullanýcý Olmanýz Gerekmektedir."
Const strTxtClearForm = "Formu Temizle"
Const strTxtYes = "Evet"
Const strTxtNo = "Hayýr"
Const strTxtForumLockedByAdmim = "Üzgünüm, Buraya giriþ Yapamazsýnýz.<br />Bu Forum Yöneticisi Tarafýndan Kilitlenmiþtir."
Const strTxtRequiredFields = "Yazýlmasý Zorunlu Alanlarý Gösterir"

Const strTxtForumJump = "Forum Atla"
Const strTxtSelectForum = "Forum Seç"

Const strTxtNoMessageError = "Mesaj Kutusu \t\t- Bir mesaj girin"
Const strTxtErrorDisplayLine = "_______________________________________________________________"
Const strTxtErrorDisplayLine1 = "Bu Form kayýt edilmedi, Çünkü Formda Bazý Problem(ler) Var."
Const strTxtErrorDisplayLine2 = "Lütfen Hatalarý Düzeltip Yeniden Deneyin."
Const strTxtErrorDisplayLine3 = "Aþaðýdaki Alan(lar) Düzeltilmelidir: -"



'default.asp
'---------------------------------------------------------------------------------
Const strTxtCookies = "Forumu Kullanabilmeniz Ýçin Tarayýcýnýzýn Çerezleri (Cookies) ve Javascripti Desteklemesi Gerekmektedir."
Const strTxtForum = "Forum"
Const strTxtLatestForumPosts = "Son Gelen Mesajlar"
Const strTxtForumStatistics = "Forum Ýstatistikleri"
Const strTxtNoForumPostMade = "Hiç Mesaj Yok"
Const strTxtThereAre = "Toplam"
Const strTxtPostsIn = "Mesaj,"
Const strTxtTopicsIn = "Konu ve"
Const strTxtLastPostBy = "Son Mesajý Yazan Üye"
Const strTxtForumMembers = "Forum Üyesi"
Const strTxtTheNewestForumMember = "En Yeni Üyemiz"


'forum_topics.asp
'---------------------------------------------------------------------------------
Const strTxtThreadStarter = "Forumu Baþlatan"
Const strTxtReplies = "Cevaplar"
Const strTxtViews = "Okunma"
Const strTxtDeleteTopicAlert = "Bu Konuyu Silmek Ýsteðinizden Eminmisiniz?"
Const strTxtDeleteTopic = "Konuyu Sil"
Const strTxtNextTopic = "Sonraki Konu"
Const strTxtLastTopic = "Önceki Konu"
Const strTxtShowTopics = "Konularý Göster"
Const strTxtNoTopicsToDisplay = "Bu Forumda Yollanan Mesajlarýn Bulunmadýðý Süre"

Const strTxtAll = "Tümünü"
Const strTxtLastWeek = "Bir haftadan Bu Yana"
Const strTxtLastTwoWeeks = "Ýki Haftadan Bu Yana"
Const strTxtLastMonth = "Bir Aydan Bu Yana"
Const strTxtLastTwoMonths = "Ýki Aydan Bu Yana"
Const strTxtLastSixMonths = "Altý Aydan Bu Yana"
Const strTxtLastYear = "Bir Yýldan Bu Yana"


'forum_posts.asp
'---------------------------------------------------------------------------------
Const strTxtLocation = "Þehir"
Const strTxtJoined = "Kayýt Tarihi"
Const strTxtForumAdministrator = "Forum Yöneticisi"
Const strTxtForumModerator = "Forum Yetkilisi"
Const strTxtDeletePostAlert = "Mesajý Silmek Ýstediðinizden Emin misiniz?"
Const strTxtEditPost = "Düzenle"
Const strTxtDeletePost = "Sil"
Const strTxtSearchForPosts = "Diðer Mesajlarýný Ara:"
Const strTxtSubjectFolder = "Konu"
Const strTxtPrintVersion = "Konuyu Yazdýr"
Const strTxtEmailTopic = "Konuyu E-Posta Ýle Yolla"
Const strTxtSorryNoReply = "Üzgünüm, Cevap Yazamazsýnýz."
Const strTxtThisForumIsLocked = "Bu Forum, Forum Yöneticisi Tarafýndan Kilitlenmiþtir."
Const strTxtPostAReplyRegister = "Eðer Bu Konuya Cevap Yazmak Ýstiyorsanýz Ýlk Önce"
Const strTxtNeedToRegister = "Eðer Kayýtlý Bir Kullanýcý Deðilseniz Ýlk Önce"
Const strTxtSmRegister = "Kayýt Olmalýsýnýz"
Const strTxtNoThreads = "Kayýtlarda Bu Konu Ýle Alakalý Baþlýk Yok"
Const strTxtNotGiven = "Girilmedi"


'search_form.asp
'---------------------------------------------------------------------------------
Const strTxtSearchFormError = "Aranacak Kelime\t- Lütfen Aranacak Kelimeyi Yazýn"


'search.asp
'---------------------------------------------------------------------------------
Const strTxtSearchResults = "Arama Sonuçlarý"
Const strTxtHasFound = "Bulunan Sonuç Sayýsý:"
Const strTxtResults = "Sonuç Bulundu"
Const strTxtNoSearchResults = "Üzgünüm, Hiçbir Sonuç Bulunamadý."
Const strTxtClickHereToRefineSearch = "Tekrar Arama Yapmak Ýçin Týklayýn"
Const strTxtSearchFor = "Aranacak Kelime"
Const strTxtSearchIn = "Aranacak Yer"
Const strTxtSearchOn = "Arama Açýk"
Const strTxtAllWords = "Tüm Kelimeler"
Const strTxtAnyWords = "Herhangi bir Kelime"
Const strTxtPhrase = "Ýçeren"
Const strTxtTopicSubject = "Konularda"
Const strTxtMessageBody = "Mesajlarda"
Const strTxtAuthor = "Yazar"
Const strTxtSearchForum = "Forumlarda Ara"
Const strTxtSortResultsBy = "Sonuçlarý Sýrala"
Const strTxtLastPostTime = "Son Mesajlara Göre"
Const strTxtTopicStartDate = "Konu Baþlangýç Tarihine Göre"
Const strTxtSubjectAlphabetically = "Alfabetik Olarak"
Const strTxtNumberViews = "Okunma Sayýsýna Göre"
Const strTxtStartSearch = "Aramaya Baþla"


'printer_friendly_posts.asp
'---------------------------------------------------------------------------------
Const strTxtPrintPage = "Sayfayý Yazdýr"
Const strTxtPrintedFrom = "Nereden Yazdýrýldýðý"
Const strTxtForumName = "Forum Adý"
Const strTxtForumDiscription = "Forum Tanýmlamasý"
Const strTxtURL = "URL"
Const strTxtPrintedDate = "Tarih"
Const strTxtTopic = "Konu"
Const strTxtPostedBy = "Mesajý Yazan"
Const strTxtDatePosted = "Mesaj Tarihi"


'emoticons.asp
'---------------------------------------------------------------------------------
Const strTxtEmoticonSmilies = "Duygu Simgeleri"


'login.asp
'---------------------------------------------------------------------------------
Const strTxtSorryUsernamePasswordIncorrect = "Üzgünüm, Kullanýcý Adý Veya Parolanýz Hatalý."
Const strTxtPleaseTryAgain = "Lütfen Tekrar Deneyin."
Const strTxtUsername = "Kullanýcý Adý"
Const strTxtPassword = "Parola"
Const strTxtLoginUser = "Giriþ Yap"
Const strTxtClickHereForgottenPass = "Parolamý Unuttum"
Const strTxtErrorUsername = "Kullanýcý Adý \t- Kullanýcý Adýnýzý Girin"
Const strTxtErrorPassword = "Parola        \t- Parolanýzý Girin"


'forgotten_password.asp
'---------------------------------------------------------------------------------
Const strTxtForgottenPassword = "Parolamý Unuttum"
Const strTxtNoRecordOfUsername = "Üzgünüm, girilen e-posta adresi kullanýcý adýna kayýtlý olanla uyuþmuyor."
Const strTxtNoEmailAddressInProfile = "Üzgünüm, Kayýt Olurken Geçerli Bir E-posta Adresi Belirtmemiþsiniz.<br>Parolanýz E-posta Adresinize Yollanamadý."
Const strTxtReregisterForForum = "Forumu kullanabilmek için yeniden kayýt olmak zorundasýnýz."
Const strTxtPasswordEmailToYou = "Yeni parolanýz e-posta adresinize yollandý."
Const strTxtPleaseEnterYourUsername = "Lütfen Kullanýcý Adýnýzý Girin.<br>Parolanýz Size Ait E-posta Adresinize Yollanacaktýr."
Const strTxtEmailPassword = "E-posta Ýle Parola Gönder"

Const strTxtEmailPasswordRequest = "Yeni Parolanýz E-posta Adresinize Yollandý."
Const strTxtEmailPasswordRequest2 = "Parolanýz: -"
Const strTxtEmailPasswordRequest3 = "Forumlara Gitmek Ýçin Aþaðýdaki Baðlantýya Týklayýn: -"


'forum_password_form.asp
'---------------------------------------------------------------------------------
Const strTxtForumLogin = "Foruma Giriþ"
Const strTxtErrorEnterPassword = "Parola \t- Lütfen Forum Parolanýzý Girin"
Const strTxtPasswordRequiredForForum = "Bu Foruma Girebilmek Ýçin Forum Parolasýný Yazmalýsýnýz."
Const strTxtForumPasswordIncorrect = "Üzgünüm Parolanýzý Hatalý Girdiniz."
Const strTxtAutoLogin = "Otomatik Giriþ Yap"
Const strTxtLoginToForum = "Forumlara Gir"


'profile.asp
'---------------------------------------------------------------------------------
Const strTxtNoUserProfileFound = "Üzgünüm bu kullanýcýnýn özellikleri bulunmuyor."
Const strTxtRegisteredToViewProfile = "Üzgünüm, kullanýcý özelliklerini görüntüleyebilmek için kayýtlý kullanýcý olmalýsýnýz."
Const strTxtMemberNo = "Kullanýcý No."
Const strTxtEmailAddress = "E-posta Adresi"
Const strTxtPrivate = "Özel"


'new_topic_form.asp
'---------------------------------------------------------------------------------
Const strTxtPostNewTopic = "Yeni Konu"
Const strTxtErrorTopicSubject = "Alt Konu \t- Yeni konunuz için bir alt konu yazýn"
Const strTxtForumMemberSuspended = "Üzgünüm, Bu Ýþlemi Gerçekleþtiremezsiniz Çünkü Üyeliðiniz Aktif Deðil!"

'edit_post_form.asp
'---------------------------------------------------------------------------------
Const strTxtNoPermissionToEditPost = "Üzgünüm, Mesajý Düzenleyebilme Yetkisine Sahip Deðilsiniz!"
Const strTxtReturnForumTopic = "Konuya Geri Dön"


'email_topic.asp
'---------------------------------------------------------------------------------
Const strTxtEmailTopicToFriend = "Konuyu Arkadaþýna E-posta Ýle Yolla"
Const strTxtFriendSentEmail = "Konu Arkadaþýnýzýn E-posta Adresine Gönderildi"
Const strTxtFriendsName = "Arkadaþýnýzýn Adý"
Const strTxtFriendsEmail = "Arkadaþýnýzýn E-posta Adresi"
Const strTxtYourName = "Adýnýz"
Const strTxtYourEmail = "E-posta Adresiniz"
Const strTxtSendEmail = "Yolla"
Const strTxtMessage = "Mesaj"

Const strTxtEmailFriendMessage = "Düþünüyorumda Aþaðýdaki Adreste Ýlgini Çekebilecek Birkaç Þey Bulabilirsin:"
Const strTxtFrom = "Gönderen:"

Const strTxtErrorFrinedsName = "Arkadaþýnýzýn Adý            \t- Lütfen Arkadaþýnýzýn Adýný Yazýn"
Const strTxtErrorFriendsEmail = "Arkadaþýnýzýn E-posta Adresi \t- Lütfen Ardaþýnýzýn E-posta Adresini Yazýn"
Const strTxtErrorYourName = "Adýnýz                          \t- Lütfen Adýnýzý Yazýn"
Const strTxtErrorYourEmail = "E-posta Adresiniz               \t- Lütfen Kendi E-posta Adresinizi Yazýn"
Const strTxtErrorEmailMessage = "Mesaj                       \t- Lütfen Mesajýnýzý Yazýn"


'members.asp
'---------------------------------------------------------------------------------
Const strTxtForumMembersList = "Forum Üye Listesi"
Const strTxtMemberSearch = "Üye Ara"

Const strTxtRegistered = "Kayýt Tarihi"
Const strTxtSend = "Gönderildi"
Const strTxtNext = "Sonraki"
Const strTxtPrevious = "Önceki"
Const strTxtPage = "Sayfa" 

Const strTxtErrorMemberSerach = "Kullanýcý Ara\t- Lütfen Aramak Ýstediðiniz Kullanýcýyý Yazýn"



'register.asp
'---------------------------------------------------------------------------------
Const strTxtRegisterNewUser = "Yeni Üye Kaydet"

Const strTxtProfileUsernameLong = "Forumu Kullanýrken Kullanacaðýnýz Ad"
Const strTxtRetypePassword = "Parola (Onay)"
Const strTxtProfileEmailLong = "Yazmanýz Zorunlu Deðil, Ancak,Boþ Býrakmayýn. Biri Sizi Cevaplamak Ýstediðinde Yada Parolanýzý Unuttuðunuzda Sizin Ýçin Yararlý Olacaktýr."
Const strTxtShowHideEmail = "E-posta Adresimi Göster"
Const strTxtShowHideEmailLong = "Diðer Kullanýcýlarýn E-posta Adresinizi Görmemesini Ýstiyorsanýz Hayýrý Seçin"
Const strTxtSelectCountry = "Þehir Seç"
Const strTxtProfileAutoLogin = "Foruma Geri Döndüðümde Otomatik Olarak Giriþ Yap"
Const strTxtSignature = "Ýmza"
Const strTxtSignatureLong = "Forumdaki Gönderilerinizin Altýnda Görünecek Ýmzanýzý Yazýnýz"

Const strTxtErrorUsernameChar = "Kullanýcý Adý \t- Kullanýcý Adýnýz 4 Karakterden Uzun Olmalý"
Const strTxtErrorPasswordChar = "Parola \t- Parolanýz 4 Karakterden Uzun Olmalý"
Const strTxtErrorPasswordNoMatch = "Parola Hatasý \t- Girilen Parolalar Uyuþmuyor"
Const strTxtErrorValidEmail = "E-posta\t\t- Geçerli Bir E-posta Adresi Yazýn"
Const strTxtErrorValidEmailLong = "Eðer E-posta Adresi Yazmak Ýstemiyorsanýz Bu Bölümü Boþ Býrakabilirsiniz"
Const strTxtErrorNoEmailToShow = "E-posta Adresini Görüntüleyemezsiniz!"
Const strTxtErrorSignatureToLong = "Ýmza \t- Ýmzanýzda Çok Fazla Karakter Mevcut"
Const strTxtUpdateProfile = "Profili Güncelle"


Const strTxtUsrenameGone = "Üzgünüm Bu Kullanýcý Adý Daha Önceden Alýnmýþ. Lütfen Baþka Bir Kullanýcý Adý Seçin."
Const strTxtEmailThankYouForRegistering = "Kayýt Olmaya Zaman Ayýrdýðýnýz Ýçin Teþekkür Ederiz"
Const strTxtEmailYouCanNowUseTheForumAt = "Kayýt Bilgileriniz Aþaðýda Gösterilmektedir. Artýk Foruma Mesaj Gönderebilir Ve Diðer Özelliklerlerden Yararlanabilirsiniz"
Const strTxtEmailForumAt = "Forum"
Const strTxtEmailToThe = "_"


'register_new_user.inc
'---------------------------------------------------------------------------------
Const strTxtEmailAMeesageHasBeenPosted = "Foruma Bir Mesaj Gönderildi"
Const strTxtEmailClickOnLinkBelowToView = "Mesajý görüntülemek ve/veya cevaplamak için aþaðýdaki baðlantýyý týklayýn"
Const strTxtEmailAMeesageHasBeenPostedOnForumNum = "Foruma bir mesaj belirtilen forum numarasýndan gönderildi"


'registration_rules.asp
'---------------------------------------------------------------------------------
Const strTxtForumRulesAndPolicies = "Forum Kurallarý ve Üyelik Poliçesi"
Const srtTxtAccept = "Kabul"




'New from version 6
'---------------------------------------------------------------------------------
Const strTxtHi = "Merhaba"
Const strTxtInterestingForumPostOn = "Ýlginizi Çekebilecek Bir Forum : "
Const strTxtForumLostPasswordRequest = "Forum Kayýp Parola Ýsteði"
Const strTxtLockForum = "Kilitle"
Const strTxtLockedTopic = "Kilitli/Kapalý"
Const strTxtUnLockTopic = "Açýk Konu"
Const strTxtTopicLocked = "Kapalý Konu"
Const strTxtUnForumLocked = "Açýk Forum"
Const strTxtThisTopicIsLocked = "Konu Kapatýlmýþ."
Const strTxtThatYouAskedKeepAnEyeOn = "Bu E-posta bu konuda bilgilendirilmek istediðiniz için gönderilmiþtir."
Const strTxtTheTopicIsNowDeleted = "Konu Silindi."
Const strTxtOf = ""
Const strTxtTheTimeNowIs = "Þu Anki Zaman"
Const strTxtYouLastVisitedOn = "Sizin Son Geliþiniz"
Const strTxtSendMsg = "Mesaj Yolla"
Const strTxtSendPrivateMessage = "Özel Mesaj Yolla"
Const strTxtActiveUsers = "Kullanýcý"
Const strTxtMembers = "Üye"
Const strTxtEnterTextYouWouldLikeIn = "Lütfen Bir Þeyler Yazýn"
Const strTxtEmailAddressAlreadyUsed = "Üzgünüm, Bu E-posta Adresi Ýle Baþka Bir Kullanýcý Kayýt Olmuþ."
Const strTxtIP = "IP"
Const strTxtIPLogged = ""
Const strTxtPages = "Sayfa"
Const strTxtCharacterCount = "Karakter Sayacý"
Const strTxtAdmin = "Yönetici Bölümü"


Const strTxtType = "Grup"
Const strTxtActive = "Aktif"
Const strTxtGuest = "Misafir"
Const strTxtAccountStatus = "Hesap Durumu"
Const strTxtNotActive = "Aktif Deðil"



Const strTxtEmailRequiredForActvation = "Üyeliðinizi Aktif Hale Getirmek Ýçin Bu E-postayý Kabul Etmelisiniz"
Const strTxtToActivateYourMembershipFor = "Üyeliðinizi Etkin Hale Getirmek Ýçin"
Const strTxtForumClickOnTheLinkBelow = "Aþaðýdaki Baðlantýya Týklayýn"
Const strTxtForumAdmin = "Forum Yöneticisi"
Const strTxtViewLastPost = "Son Mesajý Görüntüle"
Const strTxtSelectAvatar = "Simge Seçiniz"
Const strTxtAvatar = "Simge"
Const strTxtSelectAvatarDetails = "Seçeceðiniz Küçük Simge Foruma Gönderilerinizde Kullanýcý Adýnýzýn Altýnda Gözükecektir."
Const strTxtForumCodesInSignature = "Ýmzanýzda Kullanýlabilir"

Const strTxtHighPriorityPost = "Duyuru"
Const strTxtPinnedTopic = "Sabit Konu"

Const strTxtOpenForum = "Açýk Forum"
Const strTxtReadOnly = "Sadece Okuma"
Const strTxtPasswordRequired = "Parola Korumalý"
Const strTxtNoAccess = "Giriþ Yok"

Const strTxtFont = "Font"
Const strTxtSize = "Boyut"
Const strTxtForumCodes = "Forum Kodlarý"

Const strTxtNormal = "Normal Konu"
Const strTxtTopAllForums = "Duyuru (Tüm Forumlar Ýçin)"
Const strTopThisForum = "Duyuru (Bu Forum Ýçin)"


Const strTxtMarkAllPostsAsRead = "Tüm Mesajlarý Okunmuþ Say"
Const strTxtDeleteCookiesSetByThisForum = "Foruma Ait Çerezleri (Cookies) Sil"


'forum_codes
'---------------------------------------------------------------------------------
Const strTxtYouCanUseForumCodesToFormatText = "Yazdýðýnýz Yazýlarýn Formatýný Aþaðýdaki Kodlarla Deðiþtirebilirsiniz"
Const strTxtTypedForumCode = "Kodun Yazýlýþý"
Const strTxtConvetedCode = "Sonuç"
Const strTxtTextFormating = "Yazý Formatlarý"
Const strTxtImagesAndLinks = "Resim ve Baðlantý"
Const strTxtMyLink = "Benim Linkim"
Const strTxtMyEmail = "Benim E-postam"



'insufficient_permission.asp
'---------------------------------------------------------------------------------
Const strTxtAccessDenied = "Giriþ Baþarýsýz"
Const strTxtInsufficientPermison = "Üzgünüm, Bu Sayfayý Sadece Yetkililer Kullanabilir."


'activate.asp
'---------------------------------------------------------------------------------
Const strTxtYourForumMemIsNowActive = "Kayýt Olduðunuz Ýçin Teþekkürler.<br /><br /><span class=""lgText"">Üyeliðiniz Þu An Aktif Durumda</span>"
Const strTxtErrorWithActvation = "Üyeliðinizin Aktif Edilmesinde Bir Problem Var.<br /><br />Lütfen Bize Bildirin "


'register_mail_confirm.asp
'---------------------------------------------------------------------------------
Const strTxtYouShouldReceiveAnEmail = "Kayýt Ýþleminizin Tamamlanmasý Ýçin , E-posta Adresinize Gelen Mesajý 30 Dakika Ýçinde Onaylayýnýz .<br />Forum Üyeliðinizi Aktif Etmek Ýçin Lütfen Linki Týlayýnýz."
Const strTxtThankYouForRegistering = "Kayýt Olduðunuz Ýçin Teþekkür Ederiz--"
Const strTxtIfErrorActvatingMembership = "Kayýt Olurken Problemlerle Karþýlaþýyorsanýz Lütfen Forum Yöneticisine Baþvurunuz."


'active_users.asp
'---------------------------------------------------------------------------------
Const strTxtActiveForumUsers = "Aktif Forum Kullanýcýlarý"
Const strTxtAddMToActiveUsersList = "Aktif Kullanýcýlar Listesine Ekle"
Const strTxtLoggedIn = "Giriþ Zamaný"
Const strTxtLastActive = "Son Giriþ Zamaný"
Const strTxtBrowser = "Tarayýcý"
Const strTxtOS = "Ýþletim Sistemi"
Const strTxtMinutes = "Dakika"
Const strTxtAnnoymous = "Misafir"



'not_posted.asp
'---------------------------------------------------------------------------------
Const strTxtMessageNotPosted = "Mesaj Yollanamadý"
Const strTxtDoublePostingIsNotPermitted = "Herhangi Bir Mesajý Ard Arda Ýki Defa Yollayamazsýnýz."
Const strTxtSpammingIsNotPermitted = "Spam Olayýna Ýzin Verilmiyor!"
Const strTxtYouHaveExceededNumOfPostAllowed = "Çok Fazla Mesaj Yollandý.<br><br>Lütfen Daha Sonra Tekrar Deneyin."
Const strTxtYourMessageNoValidSubjectHeading = "Mesajýnýz Geçerli Bir Konu Baþlýðýna Sahip Deðil."


'active_topics.asp
'---------------------------------------------------------------------------------
Const strTxtActiveTopics = "Yeni Mesajlar"
Const strTxtLastVisitOn = "Son Ziyaretinizden Bu Yana"
Const strTxtLastFifteenMinutes = "Son 15 Dakikada Gelen"
Const strTxtLastThirtyMinutes = "Son 30 Dakikada Gelen"
Const strTxtLastFortyFiveMinutes = "Son 45 Dakikada Gelen"
Const strTxtLastHour = "Son 1 Saatte Gelen"
Const strTxtLastTwoHours = "Son 2 Saatte Gelen"
Const strTxtYesterday = "Dün"
Const strTxtNoActiveTopicsSince = "Aktif Konu Yok"
Const strTxtToDisplay = "Gösterildi"
Const strTxtThereAreCurrently = "Toplamda"



'pm_check.inc
'---------------------------------------------------------------------------------
Const strTxtNewPMsClickToGoNowToPM = "Yeni Özel Mesajýnýz Var.\n\nÖzel Mesaj Bölümüne Gitmek Ýçin Tamamý Týklayýn."


'display_forum_topics.inc
'---------------------------------------------------------------------------------
Const strTxtFewYears = "Birkaç Yýl"
Const strTxtWeek = "1 Hafta"
Const strTxtTwoWeeks = "2 Hafta"
Const strTxtMonth = "1 Ay"
Const strTxtTwoMonths = "2 Ay"
Const strTxtSixMonths = "6 Ay"
Const strTxtYear = "1 Yýl"



Const strTxtHasBeenSentTo = "Mesaj Yollandý"
Const strTxtCharactersInYourSignatureToLong = "Uzunluðunda Mesaj Yazdýnýz. Maalesef 200 Karakteri Geçemezsiniz."
Const strTxtSorryYourSearchFoundNoMembers = "Üzgünüm , Aradýðýnýz Kriterlerde Forum Kullanýcýsý Bulunamadý"
Const strTxtCahngeOfEmailReactivateAccount = "Eðer E-posta Adresinizi Deðiþtirirseniz, E-postanýza Gönderilecek Üyelik Aktifleþtirme Formunu Onaylamanýz Gerekmektedir"
Const strTxtAddToBuddyList = "Arkadaþ Listeme Ekle"


'register_mail_confirm.asp
'---------------------------------------------------------------------------------
Const strTxtYourEmailAddressHasBeenChanged = "E-posta Adresiniz Deðiþti, <br>Forumu Kullanmadan Önce Üyeliðinizi Tekrar Aktifleþtirmeniz Gerekmektedir."
Const strTxtYouShouldReceiveAReactivateEmail = "E-postanýza Gönderdiðimiz Formu 30 Dakika Ýçinde Yanýtlamalýsýnýz.<br>Üyeliðinizi Aktifleþtirmek Ýçin Aþaðýdaki Linke Týklayýn."


'Preview signature window
'---------------------------------------------------------------------------------
Const strTxtSignaturePreview = "Ýmza Önizleme"
Const strTxtPostedMessage = "Gönderilen Mesaj"



'New from version 7
'---------------------------------------------------------------------------------

Const strTxtMemberlist = "Üye Listesi"
Const strTxtForums = "Forum"
Const strTxtOurUserHavePosted = "Toplam"
Const strTxtInTotalThereAre = "Toplam"
Const strTxtOnLine = "Online"
Const strTxtWeHave = "Toplam"
Const strTxtActivateAccount = "Aktif Hesap"
Const strTxtSorryYouDoNotHavePermissionToPostInTisForum = "Forumu kullanabilmek için kayýtlý kullanýcý olmalýsýnýz"
Const strTxtSorryYouDoNotHavePerimssionToReplyToPostsInThisForum = "Üzgünüm, bu iþlemi yapabilmek için izniniz yok."
Const strTxtSorryYouDoNotHavePerimssionToReplyIPBanned = "Üzgünüm, bu iþlemi yapabilmek için izniniz yok.<br />Lütfen Forum Yöneticisi ile görüþünüz."
Const strTxtLoginSm = "Giriþ"
Const strTxtYourProfileHasBeenUpdated = "Özellikleriniz Güncellendi."
Const strTxtPosted = "Gönderim Zamaný:"
Const strTxtBackToTop = "Yukarý Dön"
Const strTxtNewPassword = "Yeni Parola"
Const strTxtRetypeNewPassword = "Tekrar Yeni Parola"
Const strTxtRegards = "Sevgilerle"
Const strTxtClickTheLinkBelowToUnsubscribe = "Üyelikte çýkmak istiyorsanýz aþaðýdaki linke týklayýn "
Const strTxtPostsPerDay = "Mesaj Gün Ortalamasý"
Const strTxtGroup = "Grup"
Const strTxtLastVisit = "Son Ziyaret"
Const strTxtPrivateMessage = " Mesaj"
Const strTxtSorryFunctionNotPermiitedIPBanned = "IP niz yasaklanmýþ.<br />Lütfen Forum Yöneticisi ile görüþünüz."
Const strTxtEmailAddressBlocked = "Üzgünüm, E-posta adresiniz yada domaininiz forum yöneticisi tarafýndan bloke olmuþ."
Const strTxtTopicAdmin = "Konu Yöneticisi"
Const strTxtMovePost = "Konuyu Taþý"
Const strTxtPrevTopic = "Önceki Konu"
Const strTxtTheMemberHasBeenDleted = "Kullanýcý Silindi."
Const strTxtThisPageWasGeneratedIn = "Bu Sayfa"
Const strTxtSeconds = "Saniyede Yüklendi."
Const strTxtEditBy = "Düzenleyen"
Const strTxtWrote = "Yazdý"
Const strTxtEnable = "Açýk"
Const strTxtToFormatPosts = "Mesaj Formatý"
Const strTxtFlashFilesImages = "Flash Dosyasý/Resim"
Const strTxtSessionIDErrorCheckCookiesAreEnabled = "Bir Güvenlik Hatasý.<br>Lütfen Tarayýcýnýzýn Cookie Alma Ayarýnýn Açýk Olduðundan Emin Olunuz, Yada Cach Bölümündeki Eski Dosyalarý Siliniz."
Const strTxtName = "Ýsim"
Const strTxtModerators = "Görevliler"
Const strTxtMore = "daha fazla..."
Const strTxtNewRegSuspendedCheckBackLater = "Üzgünüz, Forumumuza Yeni Kayýt Yapýlmamaktadýr . Sonra Tekrar Deneyiniz."
Const strTxtMoved = "Taþýndý: "
Const strTxtNoNameError = "Ýsim \t\t- Ýsminizi Yazýnýz"
Const strTxtHelp = "Yardým"

'PM system
'---------------------------------------------------------------------------------
Const strTxtPrivateMessenger = "Özel Mesaj"
Const strTxtUnreadMessage = "Okunmamýþ Mesaj"
Const strTxtReadMessage = "Okunmuþ Mesaj"
Const strTxtNew = "Yeni"
Const strTxtYouHave = "Toplam"
Const strTxtNewMsgsInYourInbox = "Gelen Kutusunda Yeni Mesajýnýz Var!"
Const strTxtNoneSelected = "Seçilmedi"
Const strTxtAddBuddy = "Arkadaþ Ekle"


'active_topics.asp
'---------------------------------------------------------------------------------
Const strTxtSelectMember = "Üye Seç"
Const strTxtSelect = "Seç"
Const strTxtNoMatchesFound = "Benzer Bulunamadý"


'active_topics.asp
'---------------------------------------------------------------------------------
Const strTxtLastFourHours = "Son 4 Saat"
Const strTxtLastSixHours = "Son 6 Saat"
Const strTxtLastEightHours = "Son 8 Saat"
Const strTxtLastTwelveHours = "Son 12 Saat"
Const strTxtLastSixteenHours = "Son 16 Saat"


'permissions
'---------------------------------------------------------------------------------
Const strTxtYou = ""
Const strTxtCan = "Açýk"
Const strTxtCannot = "Kapalý"
Const strTxtpostNewTopicsInThisForum = "Foruma Yeni Konu Gönderme"
Const strTxtReplyToTopicsInThisForum = "Forumdaki Konulara Cevap Yazma"
Const strTxtEditYourPostsInThisForum = "Forumdaki Cevaplarý Düzenleme"
Const strTxtDeleteYourPostsInThisForum = "Forumda Cevaplarý Silme"
Const strTxtCreatePollsInThisForum = "Forumda Anket Açma"
Const strTxtVoteInPOllsInThisForum = "Forumda Anketlerde Oy Kullanma"


'register.asp
'---------------------------------------------------------------------------------
Const strTxtRegistrationDetails = "Kayýt Ayrýntýlarý"
Const strTxtProfileInformation = "Özellikler Hakkýnda"
Const strTxtForumPreferences = "Forum Tercihleri"
Const strTxtICQNumber = "ICQ Numarasý"
Const strTxtAIMAddress = "AIM Adresi"
Const strTxtMSNMessenger = "MSN Messenger"
Const strTxtYahooMessenger = "Yahoo Messenger"
Const strTxtOccupation = "Mesleðiniz"
Const strTxtInterests = "Ýlgi Alanýnýz"
Const strTxtDateOfBirth = "Doðum Tarihiniz"
Const strTxtNotifyMeOfReplies = "Cevap Yazdýðým Konulara Cevap Geldiðinde E-posta Adresime Yolla"
Const strTxtSendsAnEmailWhenSomeoneRepliesToATopicYouHavePostedIn = "Yazdýðým Konulara Verilen Cevaplarý E-posta Adresime Gönder."
Const strTxtNotifyMeOfPrivateMessages = "Özel Mesajlarý E-posta Adresime Gönder"
Const strTxtAlwaysAttachMySignature = "Her Zaman Mesajlarýma Ýmzamý Ekle"
Const strTxtEnableTheWindowsIEWYSIWYGPostEditor = "Zengin Yazý Editörü"
Const strTxtTimezone = "Forum Saatini Ayarlayýn"
Const strTxtPresentServerTimeIs = "Þu An Görünen Saat: "
Const strTxtDateFormat = "Tarih Formatý"
Const strTxtDayMonthYear = "Gün/Ay/Yýl"
Const strTxtMonthDayYear = "Ay/Gün/Yýl"
Const strTxtYearMonthDay = "Yýl/Ay/Gün"
Const strTxtYearDayMonth = "Yýl/Gün/Ay"
Const strTxtHours = "Saat"
Const strTxtDay = "Gün"
Const strTxtCMonth = "Ay"
Const strTxtCYear = "Yýl"
Const strTxtRealName = "Gerçek Ýsim"
Const strTxtMemberTitle = "Üye Baþlýðý"


'Polls
'---------------------------------------------------------------------------------
Const strTxtCreateNewPoll = "Yeni Anket Aç"
Const strTxtPollQuestion = "Anket Sorusu"
Const strTxtPollChoice = "Anket Seç"
Const strTxtErrorPollQuestion = "Anket Sorusu \t- Anket Sorusu Giriniz"
Const strTxtErrorPollChoice = "Anket Seç \t- Anket Seçiniz"
Const strTxtSorryYouDoNotHavePermissionToCreatePollsForum = "Üzgünüm, Foruma Anket Eklemeye Yetkiniz Yok"
Const strTxtAllowMultipleVotes = "Çoklu Seçim Yapmaya Ýzin Ver"
Const strTxtMakePollOnlyNoReplies = "Sadece Anket Yap (Cevaba Ýzin Yok)"
Const strTxtYourNoValidPoll = "Formunuz Soru Veya Anket Ýçermiyor"
Const strTxtPoll = "Anket:"
Const strTxtVote = "Oy"
Const strTxtVotes = "Oylar"
Const strTxtCastMyVote = " Oy Ver"
Const strTxtPollStatistics = "Anket Ýstatistikleri"
Const strTxtThisTopicIsClosedNoNewVotesAccepted = "Bu baþlýk kapatýldý, yeni oylama kabul edilmiyor"
Const strTxtYouHaveAlreadyVotedInThisPoll = "Bu ankete daha önce oy kullandýnýz , tekrar kullanamazsýnýz"
Const strTxtThankYouForCastingYourVote = "Ankete ilginiz için teþekkürler."
Const strsTxYouCanNotNotVoteInThisPoll = "Bu ankete oy veremezsiniz"
Const strTxtYouDidNotSelectAChoiceForYourVote = "Üzgünüm oyunuz kabul edilmedi.\n\nHer hangi bir seçim yapmadýnýz."
Const strTxtThisIsAPollOnlyYouCanNotReply = "Sadece ankettir, cevap yazamazsýnýz."


'Email Notify
'---------------------------------------------------------------------------------
Const strTxtWatchThisTopic = "Konuya Gelen Cevaplari E-postama Gonder"
Const strTxtUn = "iptal et - "
Const strTxtWatchThisForum = "Foruma Gelen Cevaplarý E-postama Gönder"
Const strTxtYouAreNowBeNotifiedOfPostsInThisForum = "E-posta bilgilendirme aboneliðiniz yapýlmýþtýr.\n\nSol alttaki \'Ýptal Et - Foruma Gelen Cevaplarý E-postama Gönder\' Linkine týklayarak aboneliðinizi iptal edebilirsiniz."
Const strTxtYouAreNowNOTBeNotifiedOfPostsInThisForum = "E-posta bilgilendirme aboneliðiniz iptal edilmiþtir.\n\nSol alttaki \'Foruma Gelen Cevaplarý E-postama Gönder\' Linkine týklayarak aboneliðinizi yenileyebilirsiniz."
Const strTxtYouWillNowBeNotifiedOfAllReplies = "E-posta bilgilendirme aboneliðiniz yapýlmýþtýr.\n\nSol alttaki \'Ýptal Et - Konuya Gelen Cevaplarý E-postama Gönder\' Linkine týklayarak aboneliðinizi iptal edebilirsiniz."
Const strTxtYouWillNowNOTBeNotifiedOfAllReplies = "E-posta bilgilendirme aboneliðiniz iptal edilmiþtir.\n\nSol alttaki \'Konuya Gelen Cevaplarý E-postama Gönder\' Linkine týklayarak aboneliðinizi yenileyebilirsiniz."


'email_messenger.asp
'---------------------------------------------------------------------------------
Const strTxtEmailMessenger = "E-posta Habercisi"
Const strTxtRecipient = "Alýcý"
Const strTxtNoHTMLorForumCodeInEmailBody = "Lütfen sadece text formatýyla gönderiniz (HTML ve Forum Kodlarýný Kullanmayýnýz).<br /><br />Ayarladýðýnýz E-posta Adresine Dönüþ."
Const strTxtYourEmailHasBeenSentTo = "E-postanýz gönderildi"
Const strTxtYouCanNotEmail = "E-postanýz gitmedi"
Const strTxtYouDontHaveAValidEmailAddr = "özelliklerine uyan bir e-posta adresi gir."
Const strTxtTheyHaveChoosenToHideThierEmailAddr = "Seçilen e-posta adresleri gizli."
Const strTxtTheyDontHaveAValidEmailAddr = "özelliklerinize uyan e-posta adresi bulunamadý."
Const strTxtSendACopyOfThisEmailToMyself = "Kopyasýný kendi e-postama gönder"
Const strTxtTheFollowingEmailHasBeenSentToYouBy = "Belirtilen e-postayý gönder"
Const strTxtFromYourAccountOnThe = "Hesabýz sayfada"
Const strTxtIfThisMessageIsAbusive = "Mesaj spam yada benzeri sakýncalar içeriyorsa Forum Yöneticisi ile görüþünüz"
Const strTxtIncludeThisEmailAndTheFollowing = "E-posta belirtilen yere eklendi"
Const strTxtReplyToEmailSetTo = "Lütfen gönderilmiþ bu e-postaya cevaplayan adresi yazýnýz"
Const strTxtMessageSent = "Gönderilen Mesaj"



'forum_closed.asp
'---------------------------------------------------------------------------------
Const strTxtForumClosed = "Forumlar Kapalý"
Const strTxtSorryTheForumsAreClosedForMaintenance = "Üzgünüz, Forumlar bakým nedeniyle kapalý.<br />Lütfen daha sonra tekrar deneyin."


'report_post.asp
'---------------------------------------------------------------------------------
Const strTxtReportPost = "Bu mesaj kurallara aykýrýysa buradan yöneticileri bilgilendirebilirsiniz."
Const strTxtSendReport = "Rapor Gönder"
Const strTxtProblemWithPost = "Hatayý Yazýnýz"
Const strTxtPleaseStateProblemWithPost = "Mesaj kurallara aykýrýysa buradan yöneticileri bilgilendirebilirsiniz."
Const strTxtTheFollowingReportSubmittedBy = "Raporu Gönderen"
Const strTxtWhoHasTheFollowingIssue = "Önemli Olan Bu Gönderinin Sahibi"
Const strTxtToViewThePostClickTheLink = "Mesajý görmek için týklayýnýz..."
Const strTxtIssueWithPostOn = "Önemli Olan Konu"
Const strTxtYourReportEmailHasBeenSent = "E-posta adresiniz ve mesajýnýz bize ulaþtý. Gerekli iþlem en kýsa zamanda yapýlacaktýr. Teþekkür ederiz..."


'New from version 7.5
'---------------------------------------------------------------------------------
Const strTxtQuickLogin = "Hýzlý Giriþ"
Const strTxtThisTopicWasStarted = "Konunun Açýlma Tarihi: "
Const strTxtResendActivationEmail = "Üyelik Aktifleþtirme E-postasýný Tekrar Gönder."
Const strTxtNoOfStars = "Yýldýz Sayýsý"
Const strTxtOnLine2 = "Aktif"
Const strTxtCode = "Kod"
Const strTxtCodeandFixedWidthData = "Veri Ýle Beraber Deðiþtirilmiþ Kod"
Const strTxtQuoting = "Alýntý Yapýlýyor"
Const strTxtMyCodeData = "Verilerim Ýle Beraber Deðiþtirilmiþ Kod"
Const strTxtQuotedMessage = "Alýntý Mesaj"
Const strTxtWithUsername = "Kullanýcý Adý Ýle"
Const strTxtGo = "Git"
Const strTxtDataBasedOnActiveUsersInTheLastXMinutes = "Bu veri 10 dakikanýn üzerinde baðlý kalanlar ile alakalýdýr"
Const strTxtSoftwareVersion = "Program Versiyonu"
Const strTxtForumMembershipNotAct = "Üyeliðiniz aktif deðil!"
Const strTxtMustBeRegisteredToPost = "Üzgünüz! Foruma mesaj yazabilmek için kayýt olmalýsýnýz."
Const strTxtMemberCPMenu = "Üye Kontrol Panel Menü"
Const strTxtYouCanAccessCP = "Forum özelliklerini ve kullanýcý bilgilerini deðiþtirmek için ayarlar menüsünü kullanabilirsiniz "
Const strTxtEditMembersSettings = "Bu kullanýcýya ait bilgileri deðiþtir"
Const strTxtSecurityCodeConfirmation = "Güvenlik kodunu giriniz (zorunlu)"
Const strTxtUniqueSecurityCode = "Benzersiz Güvenlik Kodunu Gir"
Const strTxtEnterCAPTCHAcode = "Lütfen resimde gördüðünüz kodun aynýsýný girin.<br />Tarayýcýnýzýn Cookie (Çerez) desteðinin aktif olmasý gerekir."
Const strTxtErrorSecurityCode = "Güvenlik kodu \t- Foruma giriþ yapabilmeniz için güvenlik kodunu kutucuða yazmalýsýnýz."
Const strTxtSecurityCodeDidNotMatch = "Üzgünüz! Güvenlik kodu doðrulanamadý.\n\nYeni bir güvenlik kodu oluþturuldu. Lütfen tekrar deneyiniz\n\nYine de giriþ yapamýyorsanýz tarayýcýnýzýn Cookie (Çerez) desteðinin aktif olduðuna emin olun."

'login_user_test.asp
'---------------------------------------------------------------------------------
Const strTxtSuccessfulLogin = "Foruma Baþarýyla Giriþ Yaptýnýz"
Const strTxtSuccessfulLoginReturnToForum = "Þu an foruma yönlendiriliyorsunuz. Lütfen bekleyiniz..."
Const strTxtUnSuccessfulLoginText = "Cookie (çerez) sorunundan dolayý giriþ baþarýsýz. <br /><br />Tarayýcýnýzýn Cookie (Çerez) desteðinin aktif olduðuna emin olun."
Const strTxtUnSuccessfulLoginReTry = "Tekrar denemek için týklayýnýz."
Const strTxtToActivateYourForumMem = "E-Postanýza gönderdiðimiz formu 30 dakika içinde yanýtlamalýsýnýz.<br>Aksi taktirde üyelik iþleminiz iptal edilecektir.."

'email_notify_subscriptions.asp
'---------------------------------------------------------------------------------
Const strTxtEmailNotificationSubscriptions = "E-posta Bilgilendirme Servisi"
Const strTxtSelectForumErrorMsg = "Forum Seçiniz\t- E-posta bilgilendirme servisi kaydý için forum seçiniz"
Const strTxtYouHaveNoSubToEmailNotify = "E-posta bilgilendirme servisi kaydýnýz yok"
Const strTxtThatYouHaveSubscribedTo = "Abone Olduðunuz E-posta Bilgilendirmeler"
Const strTxtUnsusbribe = "Ýptal Et"
Const strTxtAreYouWantToUnsubscribe = "E-posta bilgilendirme servisi kaydýnýzý silmek istediðinize emin misiniz?"



'New from version 7.51
'---------------------------------------------------------------------------------
Const strTxtSubscribeToForum = "Yeni Cevaplarý Görmek Ýçin E-Posta Uyarýcýsýna Üye Ol"
Const strTxtSelectForumToSubscribeTo = "Üye Olunacak Forumu Seçin"


'New from version 7.7
'---------------------------------------------------------------------------------
Const strTxtOnlineStatus = "Aktif Durum"
Const strTxtOffLine = "Aktif Deðil"


'New from version 7.8
'---------------------------------------------------------------------------------
Const strTxtConfirmOldPass = "Eski Parolayý Doðrula"
Const strTxtConformOldPassNotMatching = "Parola Doðrulamasý Kayýtlarýmýzdaki Tanýmýnýz Ýle Eþleþmiyor.\n\nEðer Parolanýzý Deðiþtirmek Ýstiyorsanýz Lütfen Eski Parolanýzý Doðru Girin."



'New from version 8.0
'---------------------------------------------------------------------------------
Const strTxtSub = "Alt"
Const strTxtHidden = "Onaylanmamýþ"
Const strTxtHidePost = "Mesaj Gizle"
Const strTxtAreYouSureYouWantToHidePost = "Bu mesajý gizlemek istediðinizden eminmisiniz?"
Const strTxtModeratedPost = "Mesaj Düzenlendi"
Const strTxtYouArePostingModeratedForum = "Þu anda onay gerektiren bir foruma mesaj yazdýnýz"
Const strTxtBeforePostDisplayedAuthorised = "Mesajýnýzýn Forumda Yayýnlanabilmesi Ýçin Forum Yöneticisi Veya Moderatör Tarafýndan Onaylanmasý Gerekmektedir"
Const strTxtHiddenTopics = "Onaylanmamýþ Konular"
Const strTxtVerifiedBy = "Onaylayan"
Const strTxtYourEmailHasChanged = "E-posta adresiniz"
Const strTxtPleaseUseLinkToReactivate = "olarak deðiþtirildi, lütfen aþaðýdaki linki kullanarak hesabýnýzý aktif duruma getiriniz."
Const strTxtToday = "Bugün"
Const strTxtPreviewPost = "Mesaj Önizleme"
Const strTxtEmailNotify = "Cevap geldiðinde E-posta ile uyar"
Const strTxtAvatarUpload = "Simge Yükle"
Const strTxtClickOnEmoticonToAdd = "Mesajýnýza eklemek istediðiniz duygu simgesini týklayýn."
Const strTxtUpdatePost = "Mesaj Güncelle"
Const strTxtShowSignature = "Ýmza Göster"
Const strTxtQuickReply = "Hýzlý Cevap"
Const strTxtCategory = "Kategori"
Const strTxtReverseSortOrder = "Tersinden sýrala"
Const strTxtSendPM = "Özel Mesaj Gönder"
Const strTxtSearchKeywords = "Anahtar Sözcükler Ara"
Const strTxtSearchbyKeyWord = "Anahtar Sözcükten Ara"
Const strTxtSearchbyUserName = "Kullanýcý Adýndan Ara (Ýsteðe Baðlý)"
Const strTxtMatch = "Benzer"
Const strTxtSearchOptions = "Arama Seçenekleri"
Const strTxtCtrlApple = "(Birden fazla seçenek seçmek için 'control' veya 'apple' tuþlarýna basýlý tutunuz.)"
Const strTxtFindPosts = "Mesajlarý Bul"
Const strTxtAndNewer = "ve Yeniler"
Const strTxtAndOlder = "ve Eskiler"
Const strTxtAnyDate = "Tümü"
Const strTxtNumberReplies = "Cevap Sayýsý"
Const strTxtExactMatch = "Tam Benzer"
Const strTxtSearhExpiredOrNoPermission = "Arama sona erdi veya bu aramayý yapma izniniz yok."
Const strTxtCreateNewSearch = "Yeni Arama Oluþtur"
Const strTxtNoSearchResultsFound = "Hiçbir Sonuç Bulunamadý"
Const strTxtSearchError = "Arama Hatasý"
Const strTxtSearchWordLengthError = "Arama kriteriniz 3 karakterden aþaðý olamaz"
Const strTxtIPSearchError = "IP numaranýz izin verilen arama sýnýrýný aþtý<br /><br />Lütfen aramalarýnýz arasýnda 20 sn geçmesini bekleyin."
Const strTxtResultsIn = "Sonuç"
Const strTxtSecounds = "saniyede oluþturuldu"
Const strTxtFor = "için"
Const strTxtThisSearchWasProcessed = "Aramanýn oluþturulma zamaný:"
Const strTxtError = "Hata"
Const strTxtReply = "Cevapla"
Const strTxtClose = "Kapat"
Const strTxtActiveStats = "Aktiflik Ýstatistikleri"
Const strTxtInformation = "Bilgiler"
Const strTxtCommunicate = "Ýletiþim"
Const strTxtDisplayResultsAs = "Sonuçlarý Göster - Þu þekilde:"
Const strTxtViewPost = "Mesaj Gör"
Const strTxtPasswordRequiredViewPost = "Mesajý Görmek Ýçin Parola Gerekli"
Const strTxtNewestPostFirst = "Yeni Mesaj Baþta"
Const strTxtOldestPostFirst = "Eski Mesaj Baþta"
Const strTxtMessageIcon = "Mesaj icon"
Const strTxtSkypeName = "Skype"
Const strTxtLastPostDetailNotHiddenDetails = ""
Const strTxtOriginallyPostedBy = "Orjinalini yazan:"
Const strTxtViewingTopic = "Görüntülediði Konu:"
Const strTxtViewingIndex = "Giriþi Görüntülüyor"
Const strTxtForumIndex = "Forum Giriþi"
Const strTxtIndex = "Giriþ"
Const strTxtViewing = "Kiþi Görüntülüyor"
Const strTxtSearchingForums = "Forumlarý Arýyor"
Const strTxtSearchingFor = "Bunu Arýyor"
Const strTxtWritingPrivateMessage = "Özel Mesaj Yazýyor"
Const strTxtViewingPrivateMessage = "Özel Mesaj Görüntülüyor"
Const strTxtEditingPost = "Mesaj Düzenliyor"
Const strTxtWritingReply = "Cevap Yazýyor"
Const strTxtWritingNewPost = "Yeni Mesaj Yazýyor"
Const strTxtCreatingNewPost = "Yeni Anket Oluþturuyor"
Const strTxtWhatsGoingOn = "Forumda Neler Oluyor?"
Const strTxtLoadNewCode = "Yeni Kod Yükle"
Const strTxtApprovePost = "Mesajý Onayla"
Const strTxt3LoginAtteptsMade = "Bu kullanýcý için 3 giriþ denemesi yapýlmýþtýr.<br />Lütfen bilgilerinizi girdikten sonra güvenlik kodunuda girin."
Const strTxtSuspendUser = "Üyeliði Askýya Al"
Const strTxtAdminNotes = "Yönetici/Moderatör Notu"
Const strTxtAdminNotesAbout = "Bu bölüme yazacaðýnýz notu sadece yöneticiler ve moderatörler kiþinin profiline baktýklarýnda görebilir. Üye hakkýnda uyarýlar v.b. yazabilirsiniz(max 250 karakter)"
Const strTxtAge = "Yaþ"
Const strTxtUnknown = "Geçersiz"
Const strTxtSuspended = "Askýya Alýndý"
Const strTxtEmailNewUserRegistered = "Aþaðýda yeni kaydolan üyeler listelenmektedir "
Const strTxtToActivateTheNewMembershipFor = "Yeni üyeliði aktifleþtirmek için "
Const strTxtNewMemberActivation = "Yeni Üye Aktivasyonu"
Const strTxtEmailYouCanNowUseOnceYourAccountIsActivatedTheForumAt = "Giriþ bilgileriniz aþaðýdadýr. Üyeliðiniz Forum Yöneticisi tarafýndan onaylandýktan sonra yeni mesaj gönderebilir, mesajlarý cevaplayabilirsiniz"
Const strTxtYouAdminNeedsToActivateYourMembership = "<strong>Üyeliðinizin Forum Yöneticisi tarafýndan onaylanmasý gerekmektedir!</strong>"
Const strTxtEmailYourForumMembershipIsActivatedThe = "Forum üyeliðiniz þu anda aktifleþtirilmiþtir.Yeni mesaj yazabilir, mesajlara cevap verebilirsiniz."
Const strTxtTheAccountIsNowActive = "Hesap aktifleþtirildi!!"
Const strTxtErrorOccuredActivatingTheAccount = "Hesabýn aktifleþtirilmesi sýrasýnda bir sorunla karþýlaþýldý"
Const strTxtMustBeLoggedInAsAdminActivateAccount = "Yeni üyelerin aktivasyonunu yapabilmek için yönetici olarak giriþ yapmýþ olmanýz gerekmektedir. <br /> Yönetici giriþi yaptýktan sonra e-postadaki linki tekrar týklayýn."
Const strTxtTodaysBirthdays = "Bugün Doðum Günü Olan Üyeler"
Const strTxtCalendar = "Takvim"
Const strTxtEventDate = "Olayýn Tarihi"
Const strTxtEvent = "Olay"
Const strTxtCalendarEvent = "Takvim Olayý"
Const strTxtLast = "Son"
Const strTxtRSS = "RSS"
Const strTxtNewPostFeed = "Yeni Mesaj Linki"
Const strTxtLastTwoDays = "Son 2 Gün"
Const strTxtThisRSSFileIntendedToBeSyndicated = "Bu sayfa RSS okuyucular ve web sayfalarýnda eþ zamanlý gösterim için tasarlanmýþtýr."
Const strTxtCurrentFeedContent = "Güncel link içeriði"
Const strTxtSyndicatedForumContent = "Güncel forum içerigi"
Const strTxtSubscribeNow = "RSS Linkini Al!"
Const strTxtSubscribeWithWebBasedRSS = "seçiminizi týklayýn"
Const strTxtWithOtherReaders = "eðer bilgisayarýnýzda RSS okuyucu yüklü ise "
Const strTxtSelectYourReader = "Okuyucunuzu Seçin"
Const strTxtThisIsAnXMLFeedOf = "XML içerik linki"
Const strTxtDirectLinkToThisPost = "Mesajýn Direkt Linki"
Const strTxtWhatIsAnRSSFeed = "RSS Linki Nedir?"


'New from version 8.02
'---------------------------------------------------------------------------------
Const strTxtSecurityCodeDidNotMatch2 = "Girdiðiniz güvenlik kodu ekranda gösterilen ile ayný deðil."




'New from version 8.05
'---------------------------------------------------------------------------------
Const strTxtPleaseDontForgetYourPassword = "Lütfen þifrenizi unutmayýnýz, þifre veritabanýnda kodlanarak saklandýðý için unuttuðunuz þifreyi geri alma olanaðý yoktur. Unutmanýz durumunda Parolamý Unuttum bölümünden Kullanýcý Adýnýzý ve E-posta adresinizi belirterek, yeni bir þifrenin E-posta adresinize gönderilmesini isteyebilirsiniz."
Const strTxtActivationEmail = "Aktivasyon E-postasý" 
Const strTxtTopicReplyNotification = "Konu Cevap Bildirimi"
Const strTxtUserNameOrEmailAddress = "Kullanýcý Adý veya E-posta Adresi"
Const strTxtAnonymousMembers = "Bilinmeyen Üye"
Const strTxtGuests = "Misafir"
Const strTxtNewPosts = "yeni mesajlar"
Const strTxtNoNewPosts = "yeni mesaj yok"
Const strTxtFullReplyEditor = "Tam Editör"

'New from version 9
'---------------------------------------------------------------------------------
Const strTxtForumHome = "Forum Anasayfasý"
Const strTxtNewMessages = "Yeni Mesaj"
Const strTxtFAQ = "Yardým"
Const strTxtUnAnsweredTopics = "Cevaplanmamýþ Konular"
Const strTxtShowPosts = "Mesajlarý Göster"
Const strTxtModeratorTools = "Moderatör Araçlarý"
Const strTxtResyncTopicPostCount = "Forum Ýstatistiklerini Güncelle"
Const strTxtAdminControlPanel = "Yönetici Kontrol Paneli"
Const strTxtAdvancedSearch = "Geliþmiþ Arama"
Const strTxtLockTopic = "Konuyu Kilitle"
Const strTxtHideTopic = "Konuyu Gizle"
Const strTxtShowTopic = "Konuyu Göster"
Const strTxtTopicOptions = "Konu Seçenekleri"
Const strTxtForumOptions = "Forum Seçenekleri"
Const strTxtFindMembersPosts = "Üyenin Mesajlarýný Bul"
Const strTxtMembersProfile = "Üye Profili"
Const strTxtVisitMembersHomepage = "Üyenin Web Sitesine Git"
Const strTxtFirstPage = "Ýlk Sayfa"
Const strTxtLastPage = "Son Sayfa"
Const strTxtPostOptions = "Mesaj Seçenekleri"
Const strTxtBlockUsersIP = "IP Engelle"
Const strTxtCreateNewTopic = "Yeni Konu Oluþtur"
Const strTxtNewPoll = "Anket"
Const strTxtControlPanel = "Kontrol Paneli"
Const strTxtSubscriptions = "Abonelikler"
Const strTxtMessenger = "Haberci"
Const strTxtBuddyList = "Arkadaþ Listesi"
Const strTxtProfile2 = "Profil"
Const strTxtSubscribe = "Abone Ol"
Const strTxtMultiplePages = "Birçok Sayfa"
Const strTxtCurrentPage = "Geçerli Sayfa"
Const strTxtRefreshPage = "Sayfayý Yenile"
Const strTxtAnnouncements = "Duyurular"
Const strTxtHiddenTopic = "Düzenlenmiþ Konu"
Const strTxtHot = "Sýcak"
Const strTxtLocked = "Kilitli"
Const strTxtNewPost = "Yeni Mesaj"
Const strTxtPoll2 = "Anket"
Const strTxtSticky = "Sabit"
Const strTxtForumPermissions = "Forum Ýzinleri"
Const strTxtForumWithSubForums = "Forum ile Alt Forum"
Const strTxtPostNewTopic2 = "Yeni Konu Aç"
Const strTxtViewDropDown = "Açýlýr Kutu Gör"
Const strTxtFull = "dolu"
Const strNotYetRegistered = "Üye ol"
Const strTxtNewsletterSubscription = "Haber Aboneliði"
Const strTxtSignupToRecieveNewsletters = "Haberleri almak için üye ol " 
Const strTxtNewsBulletins = "Haber Bültenleri"
Const strTxtPublished = "Yayýmlandý"
Const strTxtStartDate = "Baþlangýç Tarihi"
Const strTxtEndDate = "Bitiþ Tarihi"
Const strTxtNotRequiredForSingleDateEvents = "not required for single date events"
Const strTxtIn = ""
Const strTxtGender = "Cinsiyet"
Const strTxtMale = "Bay"
Const strTxtFemale = "Bayan"



Const strTxtFileAlreadyUploaded = "Ayný isimde dosyayý daha önceden yüklemiþsiniz!"
Const strTxtSelectOrRenameFile = "Lütfen baþka bir dosya seçiniz veya dosyanýn adýný deðiþtirip tekrar deneyin."
Const strTxtAllotedFileSpaceExceeded = "Size ayrýlan dosya alanýný aþtýnýz: "
Const strTxtDeleteFileOrImagesUingCP = "Lütfen Üye Kontrol Panelinizdeki Dosya Yönetimini kullanarak kullanmadýðýnýz dosya ve resimleri silin."



'File Manager
Const strTxtFileManager = "Dosya Yönetimi"
Const strTxtFileName = "Dosya Adý"
Const strTxtFileSize = "Dosya Boyutu"
Const strTxtFileType = "Dosya Türü"
Const strTxtFileExplorer = "Dosyalar"
Const strTxtFileProperties = "Dosya Özellikleri"
Const strTxtFilePreview = "Dosya Önizleme"
Const strTxtAllocatedFileSpace = "Dosya Alaný Ýstatistikleri"
Const strTxtYouHaveUsed  = "Kullandýðýnýz Alan:"
Const strTxtFromYour = "&nbsp;&nbsp;&nbsp;Ýzin Verilen Alan:"
Const strTxtOfAllocatedFileSpace = ""
Const strTxtYourFileSpaceIs = "Dosya alanýnýz"
Const strTxtDownloadFile = "Yüklenen Dosya"
Const strTxtNewUpload = "Yeni Yükleme Yap"
Const strTxtDeleteFile = "Dosya Sil"
Const strTxtRenameFile = "Yeniden Adlandýr"
Const strTxtAreYouSureDeleteFile = "Bu dosyayý silmek istediðinize emin misiniz?"
Const strTxtNoFileSelected = "Seçili dosya yok"
Const strTxtTheFileNowDeleted = "Dosya silindi"
Const strTxtYourFileHasBeenSuccessfullyUploaded = "Dosyanýz baþarýlý bir þekilde yüklendi."
Const strTxtSelectUploadType = "Yüklem Türü Seç"
Const strTxtYouTube = "YouTube"
Const strTxtUploadFolderEmpty = "Yükleme Klasörü Boþ"




'New from version 9.04
'---------------------------------------------------------------------------------

Const strTxtAutologinOnlyAppliesToSession = ""
Const strTxtViewUnreadPost = "Okunmamýþ Mesajlarý Gör"


'New from version 9.51
'---------------------------------------------------------------------------------

Const strTxtPendingApproval = "Onay bekliyor"
Const strTxtThatRequiresApproval = " onay gerektirir."

Const strTxtMovieProperties = "Video özellikleri"
Const strTxtMovieType = "Video Türü"
Const strTxtYouTubeFileName = "YouTube video adresi"
Const strTxtFlashMovieURL = "Flash dosyasýnýn adresi"



'New from version 9.52
'---------------------------------------------------------------------------------
Const strTxtThroughTheirForumProfileAtLinkBelow = "through their forum profile at the link below."
Const strTxtYouCanNotEmailTisTopicToAFriend = "Bu konuyu mail ile gönderemezsin"
Const strTxtToReplyPleaseEmailContact = "Cevaplamak için emil adresi"
Const strTxtInsertMovie = "Video/Flash Ekle"


'New from version 9.54
'---------------------------------------------------------------------------------
Const strTxtTheEmailFailedToSendPleaseContactAdmin = "Email gönderme baþarýsýz oldu."
Const strTxtFindMember = "Üye bul"
Const strTxtSearchForTopicsThisMemberStarted = "Bu üyenin açtýðý konular"
Const strTxtMemberName2 = "Üye adýna"
Const strTxtSearchTimeoutPleaseNarrowSearchTryAgain = "Zaman aþýmý oldu.Arama kriterlerinizi azaltýp tekrar deneyin."

'New from version 9.55
'---------------------------------------------------------------------------------
Const strTxtTheFileFailedTHeSecurityuScanAndHasBeenDeleted = "The file failed the security scan and has been deleted as it may contain malicous code"


'New from version 9.56
'---------------------------------------------------------------------------------
Const strTxtShareTopic = "Share Topic"
Const strTxtPostThisTopicTo = "Post this Topic to"

'New from version 9.65
'---------------------------------------------------------------------------------
Const strTxtTranslate = "Translate"

%>
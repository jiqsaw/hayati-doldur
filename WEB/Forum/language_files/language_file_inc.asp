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
Const strTxtWelcome = "Ho� Geldiniz"
Const strTxtAllForums = "B�t�n Forumlar"
Const strTxtTopics = "Konular"
Const strTxtPosts = "G�nderilenler"
Const strTxtLastPost = "Son G�nderilen"
Const strTxtPostPreview = "Mesaj �n �zleme"
Const strTxtAt = "Saat"
Const strTxtBy = "yazan:"
Const strTxtOn = ""
Const strTxtProfile = "�zellikler"
Const strTxtSearch = "Arama"
Const strTxtQuote = "Al�nt�"
Const strTxtVisit = "Ziyaret"
Const strTxtView = "G�ster"
Const strTxtHome = "Ana"
Const strTxtHomepage = "Ana Sayfa"
Const strTxtEdit = "D�zenle"
Const strTxtDelete = "Sil"
Const strTxtEditProfile = "�zellikleri D�zenle"
Const strTxtLogOff = "��k��"
Const strTxtRegister = "Kay�t Ol"
Const strTxtLogin = "Giri�"
Const strTxtMembersList = "Forum �yelerini G�ster"
Const strTxtForumLocked = "Kilitli Forum"
Const strTxtSearchTheForum = "Forumu Ara"
Const strTxtPostReply = "Yan�t Yaz"
Const strTxtNewTopic = "Yeni Konu"
Const strTxtNoForums = "G�sterilecek Konu Bulunam�yor."
Const strTxtReturnToDiscussionForum = "Foruma Geri D�n"
Const strTxtMustBeRegistered = "�zg�n�m, Bu B�l�me Girmek ��in Kay�tl� Kullan�c� Olman�z Gerekmektedir."
Const strTxtClearForm = "Formu Temizle"
Const strTxtYes = "Evet"
Const strTxtNo = "Hay�r"
Const strTxtForumLockedByAdmim = "�zg�n�m, Buraya giri� Yapamazs�n�z.<br />Bu Forum Y�neticisi Taraf�ndan Kilitlenmi�tir."
Const strTxtRequiredFields = "Yaz�lmas� Zorunlu Alanlar� G�sterir"

Const strTxtForumJump = "Forum Atla"
Const strTxtSelectForum = "Forum Se�"

Const strTxtNoMessageError = "Mesaj Kutusu \t\t- Bir mesaj girin"
Const strTxtErrorDisplayLine = "_______________________________________________________________"
Const strTxtErrorDisplayLine1 = "Bu Form kay�t edilmedi, ��nk� Formda Baz� Problem(ler) Var."
Const strTxtErrorDisplayLine2 = "L�tfen Hatalar� D�zeltip Yeniden Deneyin."
Const strTxtErrorDisplayLine3 = "A�a��daki Alan(lar) D�zeltilmelidir: -"



'default.asp
'---------------------------------------------------------------------------------
Const strTxtCookies = "Forumu Kullanabilmeniz ��in Taray�c�n�z�n �erezleri (Cookies) ve Javascripti Desteklemesi Gerekmektedir."
Const strTxtForum = "Forum"
Const strTxtLatestForumPosts = "Son Gelen Mesajlar"
Const strTxtForumStatistics = "Forum �statistikleri"
Const strTxtNoForumPostMade = "Hi� Mesaj Yok"
Const strTxtThereAre = "Toplam"
Const strTxtPostsIn = "Mesaj,"
Const strTxtTopicsIn = "Konu ve"
Const strTxtLastPostBy = "Son Mesaj� Yazan �ye"
Const strTxtForumMembers = "Forum �yesi"
Const strTxtTheNewestForumMember = "En Yeni �yemiz"


'forum_topics.asp
'---------------------------------------------------------------------------------
Const strTxtThreadStarter = "Forumu Ba�latan"
Const strTxtReplies = "Cevaplar"
Const strTxtViews = "Okunma"
Const strTxtDeleteTopicAlert = "Bu Konuyu Silmek �ste�inizden Eminmisiniz?"
Const strTxtDeleteTopic = "Konuyu Sil"
Const strTxtNextTopic = "Sonraki Konu"
Const strTxtLastTopic = "�nceki Konu"
Const strTxtShowTopics = "Konular� G�ster"
Const strTxtNoTopicsToDisplay = "Bu Forumda Yollanan Mesajlar�n Bulunmad��� S�re"

Const strTxtAll = "T�m�n�"
Const strTxtLastWeek = "Bir haftadan Bu Yana"
Const strTxtLastTwoWeeks = "�ki Haftadan Bu Yana"
Const strTxtLastMonth = "Bir Aydan Bu Yana"
Const strTxtLastTwoMonths = "�ki Aydan Bu Yana"
Const strTxtLastSixMonths = "Alt� Aydan Bu Yana"
Const strTxtLastYear = "Bir Y�ldan Bu Yana"


'forum_posts.asp
'---------------------------------------------------------------------------------
Const strTxtLocation = "�ehir"
Const strTxtJoined = "Kay�t Tarihi"
Const strTxtForumAdministrator = "Forum Y�neticisi"
Const strTxtForumModerator = "Forum Yetkilisi"
Const strTxtDeletePostAlert = "Mesaj� Silmek �stedi�inizden Emin misiniz?"
Const strTxtEditPost = "D�zenle"
Const strTxtDeletePost = "Sil"
Const strTxtSearchForPosts = "Di�er Mesajlar�n� Ara:"
Const strTxtSubjectFolder = "Konu"
Const strTxtPrintVersion = "Konuyu Yazd�r"
Const strTxtEmailTopic = "Konuyu E-Posta �le Yolla"
Const strTxtSorryNoReply = "�zg�n�m, Cevap Yazamazs�n�z."
Const strTxtThisForumIsLocked = "Bu Forum, Forum Y�neticisi Taraf�ndan Kilitlenmi�tir."
Const strTxtPostAReplyRegister = "E�er Bu Konuya Cevap Yazmak �stiyorsan�z �lk �nce"
Const strTxtNeedToRegister = "E�er Kay�tl� Bir Kullan�c� De�ilseniz �lk �nce"
Const strTxtSmRegister = "Kay�t Olmal�s�n�z"
Const strTxtNoThreads = "Kay�tlarda Bu Konu �le Alakal� Ba�l�k Yok"
Const strTxtNotGiven = "Girilmedi"


'search_form.asp
'---------------------------------------------------------------------------------
Const strTxtSearchFormError = "Aranacak Kelime\t- L�tfen Aranacak Kelimeyi Yaz�n"


'search.asp
'---------------------------------------------------------------------------------
Const strTxtSearchResults = "Arama Sonu�lar�"
Const strTxtHasFound = "Bulunan Sonu� Say�s�:"
Const strTxtResults = "Sonu� Bulundu"
Const strTxtNoSearchResults = "�zg�n�m, Hi�bir Sonu� Bulunamad�."
Const strTxtClickHereToRefineSearch = "Tekrar Arama Yapmak ��in T�klay�n"
Const strTxtSearchFor = "Aranacak Kelime"
Const strTxtSearchIn = "Aranacak Yer"
Const strTxtSearchOn = "Arama A��k"
Const strTxtAllWords = "T�m Kelimeler"
Const strTxtAnyWords = "Herhangi bir Kelime"
Const strTxtPhrase = "��eren"
Const strTxtTopicSubject = "Konularda"
Const strTxtMessageBody = "Mesajlarda"
Const strTxtAuthor = "Yazar"
Const strTxtSearchForum = "Forumlarda Ara"
Const strTxtSortResultsBy = "Sonu�lar� S�rala"
Const strTxtLastPostTime = "Son Mesajlara G�re"
Const strTxtTopicStartDate = "Konu Ba�lang�� Tarihine G�re"
Const strTxtSubjectAlphabetically = "Alfabetik Olarak"
Const strTxtNumberViews = "Okunma Say�s�na G�re"
Const strTxtStartSearch = "Aramaya Ba�la"


'printer_friendly_posts.asp
'---------------------------------------------------------------------------------
Const strTxtPrintPage = "Sayfay� Yazd�r"
Const strTxtPrintedFrom = "Nereden Yazd�r�ld���"
Const strTxtForumName = "Forum Ad�"
Const strTxtForumDiscription = "Forum Tan�mlamas�"
Const strTxtURL = "URL"
Const strTxtPrintedDate = "Tarih"
Const strTxtTopic = "Konu"
Const strTxtPostedBy = "Mesaj� Yazan"
Const strTxtDatePosted = "Mesaj Tarihi"


'emoticons.asp
'---------------------------------------------------------------------------------
Const strTxtEmoticonSmilies = "Duygu Simgeleri"


'login.asp
'---------------------------------------------------------------------------------
Const strTxtSorryUsernamePasswordIncorrect = "�zg�n�m, Kullan�c� Ad� Veya Parolan�z Hatal�."
Const strTxtPleaseTryAgain = "L�tfen Tekrar Deneyin."
Const strTxtUsername = "Kullan�c� Ad�"
Const strTxtPassword = "Parola"
Const strTxtLoginUser = "Giri� Yap"
Const strTxtClickHereForgottenPass = "Parolam� Unuttum"
Const strTxtErrorUsername = "Kullan�c� Ad� \t- Kullan�c� Ad�n�z� Girin"
Const strTxtErrorPassword = "Parola        \t- Parolan�z� Girin"


'forgotten_password.asp
'---------------------------------------------------------------------------------
Const strTxtForgottenPassword = "Parolam� Unuttum"
Const strTxtNoRecordOfUsername = "�zg�n�m, girilen e-posta adresi kullan�c� ad�na kay�tl� olanla uyu�muyor."
Const strTxtNoEmailAddressInProfile = "�zg�n�m, Kay�t Olurken Ge�erli Bir E-posta Adresi Belirtmemi�siniz.<br>Parolan�z E-posta Adresinize Yollanamad�."
Const strTxtReregisterForForum = "Forumu kullanabilmek i�in yeniden kay�t olmak zorundas�n�z."
Const strTxtPasswordEmailToYou = "Yeni parolan�z e-posta adresinize yolland�."
Const strTxtPleaseEnterYourUsername = "L�tfen Kullan�c� Ad�n�z� Girin.<br>Parolan�z Size Ait E-posta Adresinize Yollanacakt�r."
Const strTxtEmailPassword = "E-posta �le Parola G�nder"

Const strTxtEmailPasswordRequest = "Yeni Parolan�z E-posta Adresinize Yolland�."
Const strTxtEmailPasswordRequest2 = "Parolan�z: -"
Const strTxtEmailPasswordRequest3 = "Forumlara Gitmek ��in A�a��daki Ba�lant�ya T�klay�n: -"


'forum_password_form.asp
'---------------------------------------------------------------------------------
Const strTxtForumLogin = "Foruma Giri�"
Const strTxtErrorEnterPassword = "Parola \t- L�tfen Forum Parolan�z� Girin"
Const strTxtPasswordRequiredForForum = "Bu Foruma Girebilmek ��in Forum Parolas�n� Yazmal�s�n�z."
Const strTxtForumPasswordIncorrect = "�zg�n�m Parolan�z� Hatal� Girdiniz."
Const strTxtAutoLogin = "Otomatik Giri� Yap"
Const strTxtLoginToForum = "Forumlara Gir"


'profile.asp
'---------------------------------------------------------------------------------
Const strTxtNoUserProfileFound = "�zg�n�m bu kullan�c�n�n �zellikleri bulunmuyor."
Const strTxtRegisteredToViewProfile = "�zg�n�m, kullan�c� �zelliklerini g�r�nt�leyebilmek i�in kay�tl� kullan�c� olmal�s�n�z."
Const strTxtMemberNo = "Kullan�c� No."
Const strTxtEmailAddress = "E-posta Adresi"
Const strTxtPrivate = "�zel"


'new_topic_form.asp
'---------------------------------------------------------------------------------
Const strTxtPostNewTopic = "Yeni Konu"
Const strTxtErrorTopicSubject = "Alt Konu \t- Yeni konunuz i�in bir alt konu yaz�n"
Const strTxtForumMemberSuspended = "�zg�n�m, Bu ��lemi Ger�ekle�tiremezsiniz ��nk� �yeli�iniz Aktif De�il!"

'edit_post_form.asp
'---------------------------------------------------------------------------------
Const strTxtNoPermissionToEditPost = "�zg�n�m, Mesaj� D�zenleyebilme Yetkisine Sahip De�ilsiniz!"
Const strTxtReturnForumTopic = "Konuya Geri D�n"


'email_topic.asp
'---------------------------------------------------------------------------------
Const strTxtEmailTopicToFriend = "Konuyu Arkada��na E-posta �le Yolla"
Const strTxtFriendSentEmail = "Konu Arkada��n�z�n E-posta Adresine G�nderildi"
Const strTxtFriendsName = "Arkada��n�z�n Ad�"
Const strTxtFriendsEmail = "Arkada��n�z�n E-posta Adresi"
Const strTxtYourName = "Ad�n�z"
Const strTxtYourEmail = "E-posta Adresiniz"
Const strTxtSendEmail = "Yolla"
Const strTxtMessage = "Mesaj"

Const strTxtEmailFriendMessage = "D���n�yorumda A�a��daki Adreste �lgini �ekebilecek Birka� �ey Bulabilirsin:"
Const strTxtFrom = "G�nderen:"

Const strTxtErrorFrinedsName = "Arkada��n�z�n Ad�            \t- L�tfen Arkada��n�z�n Ad�n� Yaz�n"
Const strTxtErrorFriendsEmail = "Arkada��n�z�n E-posta Adresi \t- L�tfen Arda��n�z�n E-posta Adresini Yaz�n"
Const strTxtErrorYourName = "Ad�n�z                          \t- L�tfen Ad�n�z� Yaz�n"
Const strTxtErrorYourEmail = "E-posta Adresiniz               \t- L�tfen Kendi E-posta Adresinizi Yaz�n"
Const strTxtErrorEmailMessage = "Mesaj                       \t- L�tfen Mesaj�n�z� Yaz�n"


'members.asp
'---------------------------------------------------------------------------------
Const strTxtForumMembersList = "Forum �ye Listesi"
Const strTxtMemberSearch = "�ye Ara"

Const strTxtRegistered = "Kay�t Tarihi"
Const strTxtSend = "G�nderildi"
Const strTxtNext = "Sonraki"
Const strTxtPrevious = "�nceki"
Const strTxtPage = "Sayfa" 

Const strTxtErrorMemberSerach = "Kullan�c� Ara\t- L�tfen Aramak �stedi�iniz Kullan�c�y� Yaz�n"



'register.asp
'---------------------------------------------------------------------------------
Const strTxtRegisterNewUser = "Yeni �ye Kaydet"

Const strTxtProfileUsernameLong = "Forumu Kullan�rken Kullanaca��n�z Ad"
Const strTxtRetypePassword = "Parola (Onay)"
Const strTxtProfileEmailLong = "Yazman�z Zorunlu De�il, Ancak,Bo� B�rakmay�n. Biri Sizi Cevaplamak �stedi�inde Yada Parolan�z� Unuttu�unuzda Sizin ��in Yararl� Olacakt�r."
Const strTxtShowHideEmail = "E-posta Adresimi G�ster"
Const strTxtShowHideEmailLong = "Di�er Kullan�c�lar�n E-posta Adresinizi G�rmemesini �stiyorsan�z Hay�r� Se�in"
Const strTxtSelectCountry = "�ehir Se�"
Const strTxtProfileAutoLogin = "Foruma Geri D�nd���mde Otomatik Olarak Giri� Yap"
Const strTxtSignature = "�mza"
Const strTxtSignatureLong = "Forumdaki G�nderilerinizin Alt�nda G�r�necek �mzan�z� Yaz�n�z"

Const strTxtErrorUsernameChar = "Kullan�c� Ad� \t- Kullan�c� Ad�n�z 4 Karakterden Uzun Olmal�"
Const strTxtErrorPasswordChar = "Parola \t- Parolan�z 4 Karakterden Uzun Olmal�"
Const strTxtErrorPasswordNoMatch = "Parola Hatas� \t- Girilen Parolalar Uyu�muyor"
Const strTxtErrorValidEmail = "E-posta\t\t- Ge�erli Bir E-posta Adresi Yaz�n"
Const strTxtErrorValidEmailLong = "E�er E-posta Adresi Yazmak �stemiyorsan�z Bu B�l�m� Bo� B�rakabilirsiniz"
Const strTxtErrorNoEmailToShow = "E-posta Adresini G�r�nt�leyemezsiniz!"
Const strTxtErrorSignatureToLong = "�mza \t- �mzan�zda �ok Fazla Karakter Mevcut"
Const strTxtUpdateProfile = "Profili G�ncelle"


Const strTxtUsrenameGone = "�zg�n�m Bu Kullan�c� Ad� Daha �nceden Al�nm��. L�tfen Ba�ka Bir Kullan�c� Ad� Se�in."
Const strTxtEmailThankYouForRegistering = "Kay�t Olmaya Zaman Ay�rd���n�z ��in Te�ekk�r Ederiz"
Const strTxtEmailYouCanNowUseTheForumAt = "Kay�t Bilgileriniz A�a��da G�sterilmektedir. Art�k Foruma Mesaj G�nderebilir Ve Di�er �zelliklerlerden Yararlanabilirsiniz"
Const strTxtEmailForumAt = "Forum"
Const strTxtEmailToThe = "_"


'register_new_user.inc
'---------------------------------------------------------------------------------
Const strTxtEmailAMeesageHasBeenPosted = "Foruma Bir Mesaj G�nderildi"
Const strTxtEmailClickOnLinkBelowToView = "Mesaj� g�r�nt�lemek ve/veya cevaplamak i�in a�a��daki ba�lant�y� t�klay�n"
Const strTxtEmailAMeesageHasBeenPostedOnForumNum = "Foruma bir mesaj belirtilen forum numaras�ndan g�nderildi"


'registration_rules.asp
'---------------------------------------------------------------------------------
Const strTxtForumRulesAndPolicies = "Forum Kurallar� ve �yelik Poli�esi"
Const srtTxtAccept = "Kabul"




'New from version 6
'---------------------------------------------------------------------------------
Const strTxtHi = "Merhaba"
Const strTxtInterestingForumPostOn = "�lginizi �ekebilecek Bir Forum : "
Const strTxtForumLostPasswordRequest = "Forum Kay�p Parola �ste�i"
Const strTxtLockForum = "Kilitle"
Const strTxtLockedTopic = "Kilitli/Kapal�"
Const strTxtUnLockTopic = "A��k Konu"
Const strTxtTopicLocked = "Kapal� Konu"
Const strTxtUnForumLocked = "A��k Forum"
Const strTxtThisTopicIsLocked = "Konu Kapat�lm��."
Const strTxtThatYouAskedKeepAnEyeOn = "Bu E-posta bu konuda bilgilendirilmek istedi�iniz i�in g�nderilmi�tir."
Const strTxtTheTopicIsNowDeleted = "Konu Silindi."
Const strTxtOf = ""
Const strTxtTheTimeNowIs = "�u Anki Zaman"
Const strTxtYouLastVisitedOn = "Sizin Son Geli�iniz"
Const strTxtSendMsg = "Mesaj Yolla"
Const strTxtSendPrivateMessage = "�zel Mesaj Yolla"
Const strTxtActiveUsers = "Kullan�c�"
Const strTxtMembers = "�ye"
Const strTxtEnterTextYouWouldLikeIn = "L�tfen Bir �eyler Yaz�n"
Const strTxtEmailAddressAlreadyUsed = "�zg�n�m, Bu E-posta Adresi �le Ba�ka Bir Kullan�c� Kay�t Olmu�."
Const strTxtIP = "IP"
Const strTxtIPLogged = ""
Const strTxtPages = "Sayfa"
Const strTxtCharacterCount = "Karakter Sayac�"
Const strTxtAdmin = "Y�netici B�l�m�"


Const strTxtType = "Grup"
Const strTxtActive = "Aktif"
Const strTxtGuest = "Misafir"
Const strTxtAccountStatus = "Hesap Durumu"
Const strTxtNotActive = "Aktif De�il"



Const strTxtEmailRequiredForActvation = "�yeli�inizi Aktif Hale Getirmek ��in Bu E-postay� Kabul Etmelisiniz"
Const strTxtToActivateYourMembershipFor = "�yeli�inizi Etkin Hale Getirmek ��in"
Const strTxtForumClickOnTheLinkBelow = "A�a��daki Ba�lant�ya T�klay�n"
Const strTxtForumAdmin = "Forum Y�neticisi"
Const strTxtViewLastPost = "Son Mesaj� G�r�nt�le"
Const strTxtSelectAvatar = "Simge Se�iniz"
Const strTxtAvatar = "Simge"
Const strTxtSelectAvatarDetails = "Se�ece�iniz K���k Simge Foruma G�nderilerinizde Kullan�c� Ad�n�z�n Alt�nda G�z�kecektir."
Const strTxtForumCodesInSignature = "�mzan�zda Kullan�labilir"

Const strTxtHighPriorityPost = "Duyuru"
Const strTxtPinnedTopic = "Sabit Konu"

Const strTxtOpenForum = "A��k Forum"
Const strTxtReadOnly = "Sadece Okuma"
Const strTxtPasswordRequired = "Parola Korumal�"
Const strTxtNoAccess = "Giri� Yok"

Const strTxtFont = "Font"
Const strTxtSize = "Boyut"
Const strTxtForumCodes = "Forum Kodlar�"

Const strTxtNormal = "Normal Konu"
Const strTxtTopAllForums = "Duyuru (T�m Forumlar ��in)"
Const strTopThisForum = "Duyuru (Bu Forum ��in)"


Const strTxtMarkAllPostsAsRead = "T�m Mesajlar� Okunmu� Say"
Const strTxtDeleteCookiesSetByThisForum = "Foruma Ait �erezleri (Cookies) Sil"


'forum_codes
'---------------------------------------------------------------------------------
Const strTxtYouCanUseForumCodesToFormatText = "Yazd���n�z Yaz�lar�n Format�n� A�a��daki Kodlarla De�i�tirebilirsiniz"
Const strTxtTypedForumCode = "Kodun Yaz�l���"
Const strTxtConvetedCode = "Sonu�"
Const strTxtTextFormating = "Yaz� Formatlar�"
Const strTxtImagesAndLinks = "Resim ve Ba�lant�"
Const strTxtMyLink = "Benim Linkim"
Const strTxtMyEmail = "Benim E-postam"



'insufficient_permission.asp
'---------------------------------------------------------------------------------
Const strTxtAccessDenied = "Giri� Ba�ar�s�z"
Const strTxtInsufficientPermison = "�zg�n�m, Bu Sayfay� Sadece Yetkililer Kullanabilir."


'activate.asp
'---------------------------------------------------------------------------------
Const strTxtYourForumMemIsNowActive = "Kay�t Oldu�unuz ��in Te�ekk�rler.<br /><br /><span class=""lgText"">�yeli�iniz �u An Aktif Durumda</span>"
Const strTxtErrorWithActvation = "�yeli�inizin Aktif Edilmesinde Bir Problem Var.<br /><br />L�tfen Bize Bildirin "


'register_mail_confirm.asp
'---------------------------------------------------------------------------------
Const strTxtYouShouldReceiveAnEmail = "Kay�t ��leminizin Tamamlanmas� ��in , E-posta Adresinize Gelen Mesaj� 30 Dakika ��inde Onaylay�n�z .<br />Forum �yeli�inizi Aktif Etmek ��in L�tfen Linki T�lay�n�z."
Const strTxtThankYouForRegistering = "Kay�t Oldu�unuz ��in Te�ekk�r Ederiz--"
Const strTxtIfErrorActvatingMembership = "Kay�t Olurken Problemlerle Kar��la��yorsan�z L�tfen Forum Y�neticisine Ba�vurunuz."


'active_users.asp
'---------------------------------------------------------------------------------
Const strTxtActiveForumUsers = "Aktif Forum Kullan�c�lar�"
Const strTxtAddMToActiveUsersList = "Aktif Kullan�c�lar Listesine Ekle"
Const strTxtLoggedIn = "Giri� Zaman�"
Const strTxtLastActive = "Son Giri� Zaman�"
Const strTxtBrowser = "Taray�c�"
Const strTxtOS = "��letim Sistemi"
Const strTxtMinutes = "Dakika"
Const strTxtAnnoymous = "Misafir"



'not_posted.asp
'---------------------------------------------------------------------------------
Const strTxtMessageNotPosted = "Mesaj Yollanamad�"
Const strTxtDoublePostingIsNotPermitted = "Herhangi Bir Mesaj� Ard Arda �ki Defa Yollayamazs�n�z."
Const strTxtSpammingIsNotPermitted = "Spam Olay�na �zin Verilmiyor!"
Const strTxtYouHaveExceededNumOfPostAllowed = "�ok Fazla Mesaj Yolland�.<br><br>L�tfen Daha Sonra Tekrar Deneyin."
Const strTxtYourMessageNoValidSubjectHeading = "Mesaj�n�z Ge�erli Bir Konu Ba�l���na Sahip De�il."


'active_topics.asp
'---------------------------------------------------------------------------------
Const strTxtActiveTopics = "Yeni Mesajlar"
Const strTxtLastVisitOn = "Son Ziyaretinizden Bu Yana"
Const strTxtLastFifteenMinutes = "Son 15 Dakikada Gelen"
Const strTxtLastThirtyMinutes = "Son 30 Dakikada Gelen"
Const strTxtLastFortyFiveMinutes = "Son 45 Dakikada Gelen"
Const strTxtLastHour = "Son 1 Saatte Gelen"
Const strTxtLastTwoHours = "Son 2 Saatte Gelen"
Const strTxtYesterday = "D�n"
Const strTxtNoActiveTopicsSince = "Aktif Konu Yok"
Const strTxtToDisplay = "G�sterildi"
Const strTxtThereAreCurrently = "Toplamda"



'pm_check.inc
'---------------------------------------------------------------------------------
Const strTxtNewPMsClickToGoNowToPM = "Yeni �zel Mesaj�n�z Var.\n\n�zel Mesaj B�l�m�ne Gitmek ��in Tamam� T�klay�n."


'display_forum_topics.inc
'---------------------------------------------------------------------------------
Const strTxtFewYears = "Birka� Y�l"
Const strTxtWeek = "1 Hafta"
Const strTxtTwoWeeks = "2 Hafta"
Const strTxtMonth = "1 Ay"
Const strTxtTwoMonths = "2 Ay"
Const strTxtSixMonths = "6 Ay"
Const strTxtYear = "1 Y�l"



Const strTxtHasBeenSentTo = "Mesaj Yolland�"
Const strTxtCharactersInYourSignatureToLong = "Uzunlu�unda Mesaj Yazd�n�z. Maalesef 200 Karakteri Ge�emezsiniz."
Const strTxtSorryYourSearchFoundNoMembers = "�zg�n�m , Arad���n�z Kriterlerde Forum Kullan�c�s� Bulunamad�"
Const strTxtCahngeOfEmailReactivateAccount = "E�er E-posta Adresinizi De�i�tirirseniz, E-postan�za G�nderilecek �yelik Aktifle�tirme Formunu Onaylaman�z Gerekmektedir"
Const strTxtAddToBuddyList = "Arkada� Listeme Ekle"


'register_mail_confirm.asp
'---------------------------------------------------------------------------------
Const strTxtYourEmailAddressHasBeenChanged = "E-posta Adresiniz De�i�ti, <br>Forumu Kullanmadan �nce �yeli�inizi Tekrar Aktifle�tirmeniz Gerekmektedir."
Const strTxtYouShouldReceiveAReactivateEmail = "E-postan�za G�nderdi�imiz Formu 30 Dakika ��inde Yan�tlamal�s�n�z.<br>�yeli�inizi Aktifle�tirmek ��in A�a��daki Linke T�klay�n."


'Preview signature window
'---------------------------------------------------------------------------------
Const strTxtSignaturePreview = "�mza �nizleme"
Const strTxtPostedMessage = "G�nderilen Mesaj"



'New from version 7
'---------------------------------------------------------------------------------

Const strTxtMemberlist = "�ye Listesi"
Const strTxtForums = "Forum"
Const strTxtOurUserHavePosted = "Toplam"
Const strTxtInTotalThereAre = "Toplam"
Const strTxtOnLine = "Online"
Const strTxtWeHave = "Toplam"
Const strTxtActivateAccount = "Aktif Hesap"
Const strTxtSorryYouDoNotHavePermissionToPostInTisForum = "Forumu kullanabilmek i�in kay�tl� kullan�c� olmal�s�n�z"
Const strTxtSorryYouDoNotHavePerimssionToReplyToPostsInThisForum = "�zg�n�m, bu i�lemi yapabilmek i�in izniniz yok."
Const strTxtSorryYouDoNotHavePerimssionToReplyIPBanned = "�zg�n�m, bu i�lemi yapabilmek i�in izniniz yok.<br />L�tfen Forum Y�neticisi ile g�r���n�z."
Const strTxtLoginSm = "Giri�"
Const strTxtYourProfileHasBeenUpdated = "�zellikleriniz G�ncellendi."
Const strTxtPosted = "G�nderim Zaman�:"
Const strTxtBackToTop = "Yukar� D�n"
Const strTxtNewPassword = "Yeni Parola"
Const strTxtRetypeNewPassword = "Tekrar Yeni Parola"
Const strTxtRegards = "Sevgilerle"
Const strTxtClickTheLinkBelowToUnsubscribe = "�yelikte ��kmak istiyorsan�z a�a��daki linke t�klay�n "
Const strTxtPostsPerDay = "Mesaj G�n Ortalamas�"
Const strTxtGroup = "Grup"
Const strTxtLastVisit = "Son Ziyaret"
Const strTxtPrivateMessage = " Mesaj"
Const strTxtSorryFunctionNotPermiitedIPBanned = "IP niz yasaklanm��.<br />L�tfen Forum Y�neticisi ile g�r���n�z."
Const strTxtEmailAddressBlocked = "�zg�n�m, E-posta adresiniz yada domaininiz forum y�neticisi taraf�ndan bloke olmu�."
Const strTxtTopicAdmin = "Konu Y�neticisi"
Const strTxtMovePost = "Konuyu Ta��"
Const strTxtPrevTopic = "�nceki Konu"
Const strTxtTheMemberHasBeenDleted = "Kullan�c� Silindi."
Const strTxtThisPageWasGeneratedIn = "Bu Sayfa"
Const strTxtSeconds = "Saniyede Y�klendi."
Const strTxtEditBy = "D�zenleyen"
Const strTxtWrote = "Yazd�"
Const strTxtEnable = "A��k"
Const strTxtToFormatPosts = "Mesaj Format�"
Const strTxtFlashFilesImages = "Flash Dosyas�/Resim"
Const strTxtSessionIDErrorCheckCookiesAreEnabled = "Bir G�venlik Hatas�.<br>L�tfen Taray�c�n�z�n Cookie Alma Ayar�n�n A��k Oldu�undan Emin Olunuz, Yada Cach B�l�m�ndeki Eski Dosyalar� Siliniz."
Const strTxtName = "�sim"
Const strTxtModerators = "G�revliler"
Const strTxtMore = "daha fazla..."
Const strTxtNewRegSuspendedCheckBackLater = "�zg�n�z, Forumumuza Yeni Kay�t Yap�lmamaktad�r . Sonra Tekrar Deneyiniz."
Const strTxtMoved = "Ta��nd�: "
Const strTxtNoNameError = "�sim \t\t- �sminizi Yaz�n�z"
Const strTxtHelp = "Yard�m"

'PM system
'---------------------------------------------------------------------------------
Const strTxtPrivateMessenger = "�zel Mesaj"
Const strTxtUnreadMessage = "Okunmam�� Mesaj"
Const strTxtReadMessage = "Okunmu� Mesaj"
Const strTxtNew = "Yeni"
Const strTxtYouHave = "Toplam"
Const strTxtNewMsgsInYourInbox = "Gelen Kutusunda Yeni Mesaj�n�z Var!"
Const strTxtNoneSelected = "Se�ilmedi"
Const strTxtAddBuddy = "Arkada� Ekle"


'active_topics.asp
'---------------------------------------------------------------------------------
Const strTxtSelectMember = "�ye Se�"
Const strTxtSelect = "Se�"
Const strTxtNoMatchesFound = "Benzer Bulunamad�"


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
Const strTxtCan = "A��k"
Const strTxtCannot = "Kapal�"
Const strTxtpostNewTopicsInThisForum = "Foruma Yeni Konu G�nderme"
Const strTxtReplyToTopicsInThisForum = "Forumdaki Konulara Cevap Yazma"
Const strTxtEditYourPostsInThisForum = "Forumdaki Cevaplar� D�zenleme"
Const strTxtDeleteYourPostsInThisForum = "Forumda Cevaplar� Silme"
Const strTxtCreatePollsInThisForum = "Forumda Anket A�ma"
Const strTxtVoteInPOllsInThisForum = "Forumda Anketlerde Oy Kullanma"


'register.asp
'---------------------------------------------------------------------------------
Const strTxtRegistrationDetails = "Kay�t Ayr�nt�lar�"
Const strTxtProfileInformation = "�zellikler Hakk�nda"
Const strTxtForumPreferences = "Forum Tercihleri"
Const strTxtICQNumber = "ICQ Numaras�"
Const strTxtAIMAddress = "AIM Adresi"
Const strTxtMSNMessenger = "MSN Messenger"
Const strTxtYahooMessenger = "Yahoo Messenger"
Const strTxtOccupation = "Mesle�iniz"
Const strTxtInterests = "�lgi Alan�n�z"
Const strTxtDateOfBirth = "Do�um Tarihiniz"
Const strTxtNotifyMeOfReplies = "Cevap Yazd���m Konulara Cevap Geldi�inde E-posta Adresime Yolla"
Const strTxtSendsAnEmailWhenSomeoneRepliesToATopicYouHavePostedIn = "Yazd���m Konulara Verilen Cevaplar� E-posta Adresime G�nder."
Const strTxtNotifyMeOfPrivateMessages = "�zel Mesajlar� E-posta Adresime G�nder"
Const strTxtAlwaysAttachMySignature = "Her Zaman Mesajlar�ma �mzam� Ekle"
Const strTxtEnableTheWindowsIEWYSIWYGPostEditor = "Zengin Yaz� Edit�r�"
Const strTxtTimezone = "Forum Saatini Ayarlay�n"
Const strTxtPresentServerTimeIs = "�u An G�r�nen Saat: "
Const strTxtDateFormat = "Tarih Format�"
Const strTxtDayMonthYear = "G�n/Ay/Y�l"
Const strTxtMonthDayYear = "Ay/G�n/Y�l"
Const strTxtYearMonthDay = "Y�l/Ay/G�n"
Const strTxtYearDayMonth = "Y�l/G�n/Ay"
Const strTxtHours = "Saat"
Const strTxtDay = "G�n"
Const strTxtCMonth = "Ay"
Const strTxtCYear = "Y�l"
Const strTxtRealName = "Ger�ek �sim"
Const strTxtMemberTitle = "�ye Ba�l���"


'Polls
'---------------------------------------------------------------------------------
Const strTxtCreateNewPoll = "Yeni Anket A�"
Const strTxtPollQuestion = "Anket Sorusu"
Const strTxtPollChoice = "Anket Se�"
Const strTxtErrorPollQuestion = "Anket Sorusu \t- Anket Sorusu Giriniz"
Const strTxtErrorPollChoice = "Anket Se� \t- Anket Se�iniz"
Const strTxtSorryYouDoNotHavePermissionToCreatePollsForum = "�zg�n�m, Foruma Anket Eklemeye Yetkiniz Yok"
Const strTxtAllowMultipleVotes = "�oklu Se�im Yapmaya �zin Ver"
Const strTxtMakePollOnlyNoReplies = "Sadece Anket Yap (Cevaba �zin Yok)"
Const strTxtYourNoValidPoll = "Formunuz Soru Veya Anket ��ermiyor"
Const strTxtPoll = "Anket:"
Const strTxtVote = "Oy"
Const strTxtVotes = "Oylar"
Const strTxtCastMyVote = " Oy Ver"
Const strTxtPollStatistics = "Anket �statistikleri"
Const strTxtThisTopicIsClosedNoNewVotesAccepted = "Bu ba�l�k kapat�ld�, yeni oylama kabul edilmiyor"
Const strTxtYouHaveAlreadyVotedInThisPoll = "Bu ankete daha �nce oy kulland�n�z , tekrar kullanamazs�n�z"
Const strTxtThankYouForCastingYourVote = "Ankete ilginiz i�in te�ekk�rler."
Const strsTxYouCanNotNotVoteInThisPoll = "Bu ankete oy veremezsiniz"
Const strTxtYouDidNotSelectAChoiceForYourVote = "�zg�n�m oyunuz kabul edilmedi.\n\nHer hangi bir se�im yapmad�n�z."
Const strTxtThisIsAPollOnlyYouCanNotReply = "Sadece ankettir, cevap yazamazs�n�z."


'Email Notify
'---------------------------------------------------------------------------------
Const strTxtWatchThisTopic = "Konuya Gelen Cevaplari E-postama Gonder"
Const strTxtUn = "iptal et - "
Const strTxtWatchThisForum = "Foruma Gelen Cevaplar� E-postama G�nder"
Const strTxtYouAreNowBeNotifiedOfPostsInThisForum = "E-posta bilgilendirme aboneli�iniz yap�lm��t�r.\n\nSol alttaki \'�ptal Et - Foruma Gelen Cevaplar� E-postama G�nder\' Linkine t�klayarak aboneli�inizi iptal edebilirsiniz."
Const strTxtYouAreNowNOTBeNotifiedOfPostsInThisForum = "E-posta bilgilendirme aboneli�iniz iptal edilmi�tir.\n\nSol alttaki \'Foruma Gelen Cevaplar� E-postama G�nder\' Linkine t�klayarak aboneli�inizi yenileyebilirsiniz."
Const strTxtYouWillNowBeNotifiedOfAllReplies = "E-posta bilgilendirme aboneli�iniz yap�lm��t�r.\n\nSol alttaki \'�ptal Et - Konuya Gelen Cevaplar� E-postama G�nder\' Linkine t�klayarak aboneli�inizi iptal edebilirsiniz."
Const strTxtYouWillNowNOTBeNotifiedOfAllReplies = "E-posta bilgilendirme aboneli�iniz iptal edilmi�tir.\n\nSol alttaki \'Konuya Gelen Cevaplar� E-postama G�nder\' Linkine t�klayarak aboneli�inizi yenileyebilirsiniz."


'email_messenger.asp
'---------------------------------------------------------------------------------
Const strTxtEmailMessenger = "E-posta Habercisi"
Const strTxtRecipient = "Al�c�"
Const strTxtNoHTMLorForumCodeInEmailBody = "L�tfen sadece text format�yla g�nderiniz (HTML ve Forum Kodlar�n� Kullanmay�n�z).<br /><br />Ayarlad���n�z E-posta Adresine D�n��."
Const strTxtYourEmailHasBeenSentTo = "E-postan�z g�nderildi"
Const strTxtYouCanNotEmail = "E-postan�z gitmedi"
Const strTxtYouDontHaveAValidEmailAddr = "�zelliklerine uyan bir e-posta adresi gir."
Const strTxtTheyHaveChoosenToHideThierEmailAddr = "Se�ilen e-posta adresleri gizli."
Const strTxtTheyDontHaveAValidEmailAddr = "�zelliklerinize uyan e-posta adresi bulunamad�."
Const strTxtSendACopyOfThisEmailToMyself = "Kopyas�n� kendi e-postama g�nder"
Const strTxtTheFollowingEmailHasBeenSentToYouBy = "Belirtilen e-postay� g�nder"
Const strTxtFromYourAccountOnThe = "Hesab�z sayfada"
Const strTxtIfThisMessageIsAbusive = "Mesaj spam yada benzeri sak�ncalar i�eriyorsa Forum Y�neticisi ile g�r���n�z"
Const strTxtIncludeThisEmailAndTheFollowing = "E-posta belirtilen yere eklendi"
Const strTxtReplyToEmailSetTo = "L�tfen g�nderilmi� bu e-postaya cevaplayan adresi yaz�n�z"
Const strTxtMessageSent = "G�nderilen Mesaj"



'forum_closed.asp
'---------------------------------------------------------------------------------
Const strTxtForumClosed = "Forumlar Kapal�"
Const strTxtSorryTheForumsAreClosedForMaintenance = "�zg�n�z, Forumlar bak�m nedeniyle kapal�.<br />L�tfen daha sonra tekrar deneyin."


'report_post.asp
'---------------------------------------------------------------------------------
Const strTxtReportPost = "Bu mesaj kurallara ayk�r�ysa buradan y�neticileri bilgilendirebilirsiniz."
Const strTxtSendReport = "Rapor G�nder"
Const strTxtProblemWithPost = "Hatay� Yaz�n�z"
Const strTxtPleaseStateProblemWithPost = "Mesaj kurallara ayk�r�ysa buradan y�neticileri bilgilendirebilirsiniz."
Const strTxtTheFollowingReportSubmittedBy = "Raporu G�nderen"
Const strTxtWhoHasTheFollowingIssue = "�nemli Olan Bu G�nderinin Sahibi"
Const strTxtToViewThePostClickTheLink = "Mesaj� g�rmek i�in t�klay�n�z..."
Const strTxtIssueWithPostOn = "�nemli Olan Konu"
Const strTxtYourReportEmailHasBeenSent = "E-posta adresiniz ve mesaj�n�z bize ula�t�. Gerekli i�lem en k�sa zamanda yap�lacakt�r. Te�ekk�r ederiz..."


'New from version 7.5
'---------------------------------------------------------------------------------
Const strTxtQuickLogin = "H�zl� Giri�"
Const strTxtThisTopicWasStarted = "Konunun A��lma Tarihi: "
Const strTxtResendActivationEmail = "�yelik Aktifle�tirme E-postas�n� Tekrar G�nder."
Const strTxtNoOfStars = "Y�ld�z Say�s�"
Const strTxtOnLine2 = "Aktif"
Const strTxtCode = "Kod"
Const strTxtCodeandFixedWidthData = "Veri �le Beraber De�i�tirilmi� Kod"
Const strTxtQuoting = "Al�nt� Yap�l�yor"
Const strTxtMyCodeData = "Verilerim �le Beraber De�i�tirilmi� Kod"
Const strTxtQuotedMessage = "Al�nt� Mesaj"
Const strTxtWithUsername = "Kullan�c� Ad� �le"
Const strTxtGo = "Git"
Const strTxtDataBasedOnActiveUsersInTheLastXMinutes = "Bu veri 10 dakikan�n �zerinde ba�l� kalanlar ile alakal�d�r"
Const strTxtSoftwareVersion = "Program Versiyonu"
Const strTxtForumMembershipNotAct = "�yeli�iniz aktif de�il!"
Const strTxtMustBeRegisteredToPost = "�zg�n�z! Foruma mesaj yazabilmek i�in kay�t olmal�s�n�z."
Const strTxtMemberCPMenu = "�ye Kontrol Panel Men�"
Const strTxtYouCanAccessCP = "Forum �zelliklerini ve kullan�c� bilgilerini de�i�tirmek i�in ayarlar men�s�n� kullanabilirsiniz "
Const strTxtEditMembersSettings = "Bu kullan�c�ya ait bilgileri de�i�tir"
Const strTxtSecurityCodeConfirmation = "G�venlik kodunu giriniz (zorunlu)"
Const strTxtUniqueSecurityCode = "Benzersiz G�venlik Kodunu Gir"
Const strTxtEnterCAPTCHAcode = "L�tfen resimde g�rd���n�z kodun ayn�s�n� girin.<br />Taray�c�n�z�n Cookie (�erez) deste�inin aktif olmas� gerekir."
Const strTxtErrorSecurityCode = "G�venlik kodu \t- Foruma giri� yapabilmeniz i�in g�venlik kodunu kutucu�a yazmal�s�n�z."
Const strTxtSecurityCodeDidNotMatch = "�zg�n�z! G�venlik kodu do�rulanamad�.\n\nYeni bir g�venlik kodu olu�turuldu. L�tfen tekrar deneyiniz\n\nYine de giri� yapam�yorsan�z taray�c�n�z�n Cookie (�erez) deste�inin aktif oldu�una emin olun."

'login_user_test.asp
'---------------------------------------------------------------------------------
Const strTxtSuccessfulLogin = "Foruma Ba�ar�yla Giri� Yapt�n�z"
Const strTxtSuccessfulLoginReturnToForum = "�u an foruma y�nlendiriliyorsunuz. L�tfen bekleyiniz..."
Const strTxtUnSuccessfulLoginText = "Cookie (�erez) sorunundan dolay� giri� ba�ar�s�z. <br /><br />Taray�c�n�z�n Cookie (�erez) deste�inin aktif oldu�una emin olun."
Const strTxtUnSuccessfulLoginReTry = "Tekrar denemek i�in t�klay�n�z."
Const strTxtToActivateYourForumMem = "E-Postan�za g�nderdi�imiz formu 30 dakika i�inde yan�tlamal�s�n�z.<br>Aksi taktirde �yelik i�leminiz iptal edilecektir.."

'email_notify_subscriptions.asp
'---------------------------------------------------------------------------------
Const strTxtEmailNotificationSubscriptions = "E-posta Bilgilendirme Servisi"
Const strTxtSelectForumErrorMsg = "Forum Se�iniz\t- E-posta bilgilendirme servisi kayd� i�in forum se�iniz"
Const strTxtYouHaveNoSubToEmailNotify = "E-posta bilgilendirme servisi kayd�n�z yok"
Const strTxtThatYouHaveSubscribedTo = "Abone Oldu�unuz E-posta Bilgilendirmeler"
Const strTxtUnsusbribe = "�ptal Et"
Const strTxtAreYouWantToUnsubscribe = "E-posta bilgilendirme servisi kayd�n�z� silmek istedi�inize emin misiniz?"



'New from version 7.51
'---------------------------------------------------------------------------------
Const strTxtSubscribeToForum = "Yeni Cevaplar� G�rmek ��in E-Posta Uyar�c�s�na �ye Ol"
Const strTxtSelectForumToSubscribeTo = "�ye Olunacak Forumu Se�in"


'New from version 7.7
'---------------------------------------------------------------------------------
Const strTxtOnlineStatus = "Aktif Durum"
Const strTxtOffLine = "Aktif De�il"


'New from version 7.8
'---------------------------------------------------------------------------------
Const strTxtConfirmOldPass = "Eski Parolay� Do�rula"
Const strTxtConformOldPassNotMatching = "Parola Do�rulamas� Kay�tlar�m�zdaki Tan�m�n�z �le E�le�miyor.\n\nE�er Parolan�z� De�i�tirmek �stiyorsan�z L�tfen Eski Parolan�z� Do�ru Girin."



'New from version 8.0
'---------------------------------------------------------------------------------
Const strTxtSub = "Alt"
Const strTxtHidden = "Onaylanmam��"
Const strTxtHidePost = "Mesaj Gizle"
Const strTxtAreYouSureYouWantToHidePost = "Bu mesaj� gizlemek istedi�inizden eminmisiniz?"
Const strTxtModeratedPost = "Mesaj D�zenlendi"
Const strTxtYouArePostingModeratedForum = "�u anda onay gerektiren bir foruma mesaj yazd�n�z"
Const strTxtBeforePostDisplayedAuthorised = "Mesaj�n�z�n Forumda Yay�nlanabilmesi ��in Forum Y�neticisi Veya Moderat�r Taraf�ndan Onaylanmas� Gerekmektedir"
Const strTxtHiddenTopics = "Onaylanmam�� Konular"
Const strTxtVerifiedBy = "Onaylayan"
Const strTxtYourEmailHasChanged = "E-posta adresiniz"
Const strTxtPleaseUseLinkToReactivate = "olarak de�i�tirildi, l�tfen a�a��daki linki kullanarak hesab�n�z� aktif duruma getiriniz."
Const strTxtToday = "Bug�n"
Const strTxtPreviewPost = "Mesaj �nizleme"
Const strTxtEmailNotify = "Cevap geldi�inde E-posta ile uyar"
Const strTxtAvatarUpload = "Simge Y�kle"
Const strTxtClickOnEmoticonToAdd = "Mesaj�n�za eklemek istedi�iniz duygu simgesini t�klay�n."
Const strTxtUpdatePost = "Mesaj G�ncelle"
Const strTxtShowSignature = "�mza G�ster"
Const strTxtQuickReply = "H�zl� Cevap"
Const strTxtCategory = "Kategori"
Const strTxtReverseSortOrder = "Tersinden s�rala"
Const strTxtSendPM = "�zel Mesaj G�nder"
Const strTxtSearchKeywords = "Anahtar S�zc�kler Ara"
Const strTxtSearchbyKeyWord = "Anahtar S�zc�kten Ara"
Const strTxtSearchbyUserName = "Kullan�c� Ad�ndan Ara (�ste�e Ba�l�)"
Const strTxtMatch = "Benzer"
Const strTxtSearchOptions = "Arama Se�enekleri"
Const strTxtCtrlApple = "(Birden fazla se�enek se�mek i�in 'control' veya 'apple' tu�lar�na bas�l� tutunuz.)"
Const strTxtFindPosts = "Mesajlar� Bul"
Const strTxtAndNewer = "ve Yeniler"
Const strTxtAndOlder = "ve Eskiler"
Const strTxtAnyDate = "T�m�"
Const strTxtNumberReplies = "Cevap Say�s�"
Const strTxtExactMatch = "Tam Benzer"
Const strTxtSearhExpiredOrNoPermission = "Arama sona erdi veya bu aramay� yapma izniniz yok."
Const strTxtCreateNewSearch = "Yeni Arama Olu�tur"
Const strTxtNoSearchResultsFound = "Hi�bir Sonu� Bulunamad�"
Const strTxtSearchError = "Arama Hatas�"
Const strTxtSearchWordLengthError = "Arama kriteriniz 3 karakterden a�a�� olamaz"
Const strTxtIPSearchError = "IP numaran�z izin verilen arama s�n�r�n� a�t�<br /><br />L�tfen aramalar�n�z aras�nda 20 sn ge�mesini bekleyin."
Const strTxtResultsIn = "Sonu�"
Const strTxtSecounds = "saniyede olu�turuldu"
Const strTxtFor = "i�in"
Const strTxtThisSearchWasProcessed = "Araman�n olu�turulma zaman�:"
Const strTxtError = "Hata"
Const strTxtReply = "Cevapla"
Const strTxtClose = "Kapat"
Const strTxtActiveStats = "Aktiflik �statistikleri"
Const strTxtInformation = "Bilgiler"
Const strTxtCommunicate = "�leti�im"
Const strTxtDisplayResultsAs = "Sonu�lar� G�ster - �u �ekilde:"
Const strTxtViewPost = "Mesaj G�r"
Const strTxtPasswordRequiredViewPost = "Mesaj� G�rmek ��in Parola Gerekli"
Const strTxtNewestPostFirst = "Yeni Mesaj Ba�ta"
Const strTxtOldestPostFirst = "Eski Mesaj Ba�ta"
Const strTxtMessageIcon = "Mesaj icon"
Const strTxtSkypeName = "Skype"
Const strTxtLastPostDetailNotHiddenDetails = ""
Const strTxtOriginallyPostedBy = "Orjinalini yazan:"
Const strTxtViewingTopic = "G�r�nt�ledi�i Konu:"
Const strTxtViewingIndex = "Giri�i G�r�nt�l�yor"
Const strTxtForumIndex = "Forum Giri�i"
Const strTxtIndex = "Giri�"
Const strTxtViewing = "Ki�i G�r�nt�l�yor"
Const strTxtSearchingForums = "Forumlar� Ar�yor"
Const strTxtSearchingFor = "Bunu Ar�yor"
Const strTxtWritingPrivateMessage = "�zel Mesaj Yaz�yor"
Const strTxtViewingPrivateMessage = "�zel Mesaj G�r�nt�l�yor"
Const strTxtEditingPost = "Mesaj D�zenliyor"
Const strTxtWritingReply = "Cevap Yaz�yor"
Const strTxtWritingNewPost = "Yeni Mesaj Yaz�yor"
Const strTxtCreatingNewPost = "Yeni Anket Olu�turuyor"
Const strTxtWhatsGoingOn = "Forumda Neler Oluyor?"
Const strTxtLoadNewCode = "Yeni Kod Y�kle"
Const strTxtApprovePost = "Mesaj� Onayla"
Const strTxt3LoginAtteptsMade = "Bu kullan�c� i�in 3 giri� denemesi yap�lm��t�r.<br />L�tfen bilgilerinizi girdikten sonra g�venlik kodunuda girin."
Const strTxtSuspendUser = "�yeli�i Ask�ya Al"
Const strTxtAdminNotes = "Y�netici/Moderat�r Notu"
Const strTxtAdminNotesAbout = "Bu b�l�me yazaca��n�z notu sadece y�neticiler ve moderat�rler ki�inin profiline bakt�klar�nda g�rebilir. �ye hakk�nda uyar�lar v.b. yazabilirsiniz(max 250 karakter)"
Const strTxtAge = "Ya�"
Const strTxtUnknown = "Ge�ersiz"
Const strTxtSuspended = "Ask�ya Al�nd�"
Const strTxtEmailNewUserRegistered = "A�a��da yeni kaydolan �yeler listelenmektedir "
Const strTxtToActivateTheNewMembershipFor = "Yeni �yeli�i aktifle�tirmek i�in "
Const strTxtNewMemberActivation = "Yeni �ye Aktivasyonu"
Const strTxtEmailYouCanNowUseOnceYourAccountIsActivatedTheForumAt = "Giri� bilgileriniz a�a��dad�r. �yeli�iniz Forum Y�neticisi taraf�ndan onayland�ktan sonra yeni mesaj g�nderebilir, mesajlar� cevaplayabilirsiniz"
Const strTxtYouAdminNeedsToActivateYourMembership = "<strong>�yeli�inizin Forum Y�neticisi taraf�ndan onaylanmas� gerekmektedir!</strong>"
Const strTxtEmailYourForumMembershipIsActivatedThe = "Forum �yeli�iniz �u anda aktifle�tirilmi�tir.Yeni mesaj yazabilir, mesajlara cevap verebilirsiniz."
Const strTxtTheAccountIsNowActive = "Hesap aktifle�tirildi!!"
Const strTxtErrorOccuredActivatingTheAccount = "Hesab�n aktifle�tirilmesi s�ras�nda bir sorunla kar��la��ld�"
Const strTxtMustBeLoggedInAsAdminActivateAccount = "Yeni �yelerin aktivasyonunu yapabilmek i�in y�netici olarak giri� yapm�� olman�z gerekmektedir. <br /> Y�netici giri�i yapt�ktan sonra e-postadaki linki tekrar t�klay�n."
Const strTxtTodaysBirthdays = "Bug�n Do�um G�n� Olan �yeler"
Const strTxtCalendar = "Takvim"
Const strTxtEventDate = "Olay�n Tarihi"
Const strTxtEvent = "Olay"
Const strTxtCalendarEvent = "Takvim Olay�"
Const strTxtLast = "Son"
Const strTxtRSS = "RSS"
Const strTxtNewPostFeed = "Yeni Mesaj Linki"
Const strTxtLastTwoDays = "Son 2 G�n"
Const strTxtThisRSSFileIntendedToBeSyndicated = "Bu sayfa RSS okuyucular ve web sayfalar�nda e� zamanl� g�sterim i�in tasarlanm��t�r."
Const strTxtCurrentFeedContent = "G�ncel link i�eri�i"
Const strTxtSyndicatedForumContent = "G�ncel forum i�erigi"
Const strTxtSubscribeNow = "RSS Linkini Al!"
Const strTxtSubscribeWithWebBasedRSS = "se�iminizi t�klay�n"
Const strTxtWithOtherReaders = "e�er bilgisayar�n�zda RSS okuyucu y�kl� ise "
Const strTxtSelectYourReader = "Okuyucunuzu Se�in"
Const strTxtThisIsAnXMLFeedOf = "XML i�erik linki"
Const strTxtDirectLinkToThisPost = "Mesaj�n Direkt Linki"
Const strTxtWhatIsAnRSSFeed = "RSS Linki Nedir?"


'New from version 8.02
'---------------------------------------------------------------------------------
Const strTxtSecurityCodeDidNotMatch2 = "Girdi�iniz g�venlik kodu ekranda g�sterilen ile ayn� de�il."




'New from version 8.05
'---------------------------------------------------------------------------------
Const strTxtPleaseDontForgetYourPassword = "L�tfen �ifrenizi unutmay�n�z, �ifre veritaban�nda kodlanarak sakland��� i�in unuttu�unuz �ifreyi geri alma olana�� yoktur. Unutman�z durumunda Parolam� Unuttum b�l�m�nden Kullan�c� Ad�n�z� ve E-posta adresinizi belirterek, yeni bir �ifrenin E-posta adresinize g�nderilmesini isteyebilirsiniz."
Const strTxtActivationEmail = "Aktivasyon E-postas�" 
Const strTxtTopicReplyNotification = "Konu Cevap Bildirimi"
Const strTxtUserNameOrEmailAddress = "Kullan�c� Ad� veya E-posta Adresi"
Const strTxtAnonymousMembers = "Bilinmeyen �ye"
Const strTxtGuests = "Misafir"
Const strTxtNewPosts = "yeni mesajlar"
Const strTxtNoNewPosts = "yeni mesaj yok"
Const strTxtFullReplyEditor = "Tam Edit�r"

'New from version 9
'---------------------------------------------------------------------------------
Const strTxtForumHome = "Forum Anasayfas�"
Const strTxtNewMessages = "Yeni Mesaj"
Const strTxtFAQ = "Yard�m"
Const strTxtUnAnsweredTopics = "Cevaplanmam�� Konular"
Const strTxtShowPosts = "Mesajlar� G�ster"
Const strTxtModeratorTools = "Moderat�r Ara�lar�"
Const strTxtResyncTopicPostCount = "Forum �statistiklerini G�ncelle"
Const strTxtAdminControlPanel = "Y�netici Kontrol Paneli"
Const strTxtAdvancedSearch = "Geli�mi� Arama"
Const strTxtLockTopic = "Konuyu Kilitle"
Const strTxtHideTopic = "Konuyu Gizle"
Const strTxtShowTopic = "Konuyu G�ster"
Const strTxtTopicOptions = "Konu Se�enekleri"
Const strTxtForumOptions = "Forum Se�enekleri"
Const strTxtFindMembersPosts = "�yenin Mesajlar�n� Bul"
Const strTxtMembersProfile = "�ye Profili"
Const strTxtVisitMembersHomepage = "�yenin Web Sitesine Git"
Const strTxtFirstPage = "�lk Sayfa"
Const strTxtLastPage = "Son Sayfa"
Const strTxtPostOptions = "Mesaj Se�enekleri"
Const strTxtBlockUsersIP = "IP Engelle"
Const strTxtCreateNewTopic = "Yeni Konu Olu�tur"
Const strTxtNewPoll = "Anket"
Const strTxtControlPanel = "Kontrol Paneli"
Const strTxtSubscriptions = "Abonelikler"
Const strTxtMessenger = "Haberci"
Const strTxtBuddyList = "Arkada� Listesi"
Const strTxtProfile2 = "Profil"
Const strTxtSubscribe = "Abone Ol"
Const strTxtMultiplePages = "Bir�ok Sayfa"
Const strTxtCurrentPage = "Ge�erli Sayfa"
Const strTxtRefreshPage = "Sayfay� Yenile"
Const strTxtAnnouncements = "Duyurular"
Const strTxtHiddenTopic = "D�zenlenmi� Konu"
Const strTxtHot = "S�cak"
Const strTxtLocked = "Kilitli"
Const strTxtNewPost = "Yeni Mesaj"
Const strTxtPoll2 = "Anket"
Const strTxtSticky = "Sabit"
Const strTxtForumPermissions = "Forum �zinleri"
Const strTxtForumWithSubForums = "Forum ile Alt Forum"
Const strTxtPostNewTopic2 = "Yeni Konu A�"
Const strTxtViewDropDown = "A��l�r Kutu G�r"
Const strTxtFull = "dolu"
Const strNotYetRegistered = "�ye ol"
Const strTxtNewsletterSubscription = "Haber Aboneli�i"
Const strTxtSignupToRecieveNewsletters = "Haberleri almak i�in �ye ol " 
Const strTxtNewsBulletins = "Haber B�ltenleri"
Const strTxtPublished = "Yay�mland�"
Const strTxtStartDate = "Ba�lang�� Tarihi"
Const strTxtEndDate = "Biti� Tarihi"
Const strTxtNotRequiredForSingleDateEvents = "not required for single date events"
Const strTxtIn = ""
Const strTxtGender = "Cinsiyet"
Const strTxtMale = "Bay"
Const strTxtFemale = "Bayan"



Const strTxtFileAlreadyUploaded = "Ayn� isimde dosyay� daha �nceden y�klemi�siniz!"
Const strTxtSelectOrRenameFile = "L�tfen ba�ka bir dosya se�iniz veya dosyan�n ad�n� de�i�tirip tekrar deneyin."
Const strTxtAllotedFileSpaceExceeded = "Size ayr�lan dosya alan�n� a�t�n�z: "
Const strTxtDeleteFileOrImagesUingCP = "L�tfen �ye Kontrol Panelinizdeki Dosya Y�netimini kullanarak kullanmad���n�z dosya ve resimleri silin."



'File Manager
Const strTxtFileManager = "Dosya Y�netimi"
Const strTxtFileName = "Dosya Ad�"
Const strTxtFileSize = "Dosya Boyutu"
Const strTxtFileType = "Dosya T�r�"
Const strTxtFileExplorer = "Dosyalar"
Const strTxtFileProperties = "Dosya �zellikleri"
Const strTxtFilePreview = "Dosya �nizleme"
Const strTxtAllocatedFileSpace = "Dosya Alan� �statistikleri"
Const strTxtYouHaveUsed  = "Kulland���n�z Alan:"
Const strTxtFromYour = "&nbsp;&nbsp;&nbsp;�zin Verilen Alan:"
Const strTxtOfAllocatedFileSpace = ""
Const strTxtYourFileSpaceIs = "Dosya alan�n�z"
Const strTxtDownloadFile = "Y�klenen Dosya"
Const strTxtNewUpload = "Yeni Y�kleme Yap"
Const strTxtDeleteFile = "Dosya Sil"
Const strTxtRenameFile = "Yeniden Adland�r"
Const strTxtAreYouSureDeleteFile = "Bu dosyay� silmek istedi�inize emin misiniz?"
Const strTxtNoFileSelected = "Se�ili dosya yok"
Const strTxtTheFileNowDeleted = "Dosya silindi"
Const strTxtYourFileHasBeenSuccessfullyUploaded = "Dosyan�z ba�ar�l� bir �ekilde y�klendi."
Const strTxtSelectUploadType = "Y�klem T�r� Se�"
Const strTxtYouTube = "YouTube"
Const strTxtUploadFolderEmpty = "Y�kleme Klas�r� Bo�"




'New from version 9.04
'---------------------------------------------------------------------------------

Const strTxtAutologinOnlyAppliesToSession = ""
Const strTxtViewUnreadPost = "Okunmam�� Mesajlar� G�r"


'New from version 9.51
'---------------------------------------------------------------------------------

Const strTxtPendingApproval = "Onay bekliyor"
Const strTxtThatRequiresApproval = " onay gerektirir."

Const strTxtMovieProperties = "Video �zellikleri"
Const strTxtMovieType = "Video T�r�"
Const strTxtYouTubeFileName = "YouTube video adresi"
Const strTxtFlashMovieURL = "Flash dosyas�n�n adresi"



'New from version 9.52
'---------------------------------------------------------------------------------
Const strTxtThroughTheirForumProfileAtLinkBelow = "through their forum profile at the link below."
Const strTxtYouCanNotEmailTisTopicToAFriend = "Bu konuyu mail ile g�nderemezsin"
Const strTxtToReplyPleaseEmailContact = "Cevaplamak i�in emil adresi"
Const strTxtInsertMovie = "Video/Flash Ekle"


'New from version 9.54
'---------------------------------------------------------------------------------
Const strTxtTheEmailFailedToSendPleaseContactAdmin = "Email g�nderme ba�ar�s�z oldu."
Const strTxtFindMember = "�ye bul"
Const strTxtSearchForTopicsThisMemberStarted = "Bu �yenin a�t��� konular"
Const strTxtMemberName2 = "�ye ad�na"
Const strTxtSearchTimeoutPleaseNarrowSearchTryAgain = "Zaman a��m� oldu.Arama kriterlerinizi azalt�p tekrar deneyin."

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
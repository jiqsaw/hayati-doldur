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


'pm_welcome.asp
'---------------------------------------------------------------------------------
Const strTxtToYourPrivateMessenger = "Özel Mesajlara"
Const strTxtPmIntroduction = "Özel Mesaj Sistemi Ýle Diðer Forum Üyeleri Ýle Mesajlaþabilirsiniz."
Const strTxtInboxStatus = "Gelen Kutusu Özellikler"
Const strTxtGoToYourInbox = "Gelen Kutusuna Git"
Const strTxtNoNewMsgsInYourInbox = "Gelen Kutunuzda Yeni Mesaj Yok."
Const strTxtYourLatestPrivateMessageIsFrom = "Mesajýnýz Var Gönderen:"
Const strTxtSentOn = "Gönderim Zamaný:"
Const strTxtPrivateMessengerOverview = "Özel Mesaj Sistem Özellikleri"
Const strTxtInboxOverview = "Gelen Mesajlar"
Const strTxtOutboxOverview = "Gönderilmiþ Mesajlar."
Const strTxtBuddyListOverview = "Kýsaca Adres Defteriniz."
Const strTxtNewMsgOverview = "Yeni Bir Mesaj Göndermek Ýçin."

'pm_inbox.asp
'---------------------------------------------------------------------------------

Const strTxtInbox = "Gelen Kutusu"
Const strTxtNewPrivateMessage = "Yeni Özel Mesaj"
Const strTxtNoPrivateMessages = "Yeni Mesaj Yok"
Const strTxtRead = "Oku"
Const strTxtMessageTitle = "Mesaj Baþlýðý"
Const strTxtMessageFrom = "Gönderen"
Const strTxtDate = "Alýnma Tarihi"
Const strTxtBlock = "Engelle"
Const strTxtSentBy = "Gönderen"
Const strTxtDeletePrivateMessageAlert = "Özel Mesajý Silmek Ýstiyormusunuz ?"
Const strTxtPrivateMessagesYouCanReceiveAnother = "Özel Mesaj, Kalan Mesaj"
Const strTxtOutOf = ">"
Const strTxtPreviousPrivateMessage = "Önceki Mesaj"
Const strTxtMeassageDeleted = "Özel Mesaj Silindi !"

'pm_message.asp
'---------------------------------------------------------------------------------
Const strTxtSorryYouDontHavePermissionsPM = "Üzgünüm, Özel Mesajlarý Görüntülemek Ýçin Yetkili Deðilsiniz."
Const strTxtYouDoNotHavePermissionViewPM = "Özel Mesajlarý Görüntülemek Ýçin Yetkili Deðilsiniz.."
Const strTxtNotificationReadPM = "Özel Mesaj Uyacýsýný Oku"
Const strTxtReplyToPrivateMessage = "Bu Özel Mesaja Cevap Yaz"
Const strTxtAddToBuddy = "Arkadaþ Listesine Ekle"
Const strTxtThisIsToNotifyYouThat = ""
Const strTxtHasReadPM = "Adlý Üyemizin Mesajýnýzý Okuduðunu"
Const strTxtYouSentToThemOn = "Belirtmektedir"


'pm_new_message_form.asp
'---------------------------------------------------------------------------------
Const strTxtSendNewMessage = "Yeni Mesaj Gönder"
Const strTxtPostMessage = "Mesajý Gönder"
Const strTxtEmailNotifyWhenPMIsRead = "Mesaj Okunduðu Zaman E-posta Ýle Beni Uyar"
Const strTxtToUsername = "Kullanýcý&nbsp;Ýsmi"
Const strSelectFormBuddyList = "Arkadaþ Listesinden Seç"
Const strTxtNoPMSubjectErrorMsg = "Konu \t\t- Özel Mesajýn Konusunu Giriniz."
Const strTxtNoToUsernameErrorMsg = "Kullanýcý Ýsmi \t- Kullanýcý Ýsmini Girdikten Sonra Mesajý Yollayýnýz."
Const strTxtNoPMErrorMsg = "Mesaj \t\t- Özel Mesajýnýzý Girip Yollayýnýz."
Const strTxtSent = "Gönderen"

'pm_new_message.asp
'---------------------------------------------------------------------------------
Const strTxtAPrivateMessageHasBeenPosted = "Özel Mesajýnýz Ýsteðinize Baðlý Olarak Yollandý."
Const strTxtClickOnLinkBelowForPM = "Özel mesajý Okumak Ýçin Linke Týklayýn"
Const strTxtNotificationPM = "Özel Mesaj Uyarýcýsý"
Const strTxtTheUsernameCannotBeFound = "Girdiðiniz Kullanýcý Adý Bulunamadý.."
Const strTxtYourPrivateMessage = "Konusu Bu Olan:"
Const strTxtHasNotBeenSent = "Gönderilemedi!"
Const strTxtAmendYourPrivateMessage = "Mesajýnýza Geri Dönün"
Const strTxtReturnToYourPrivateMessenger = "Özel Mesajlara Geri Dön"
Const strTxtYouAreBlockedFromSendingPMsTo = "Mesajlarýnýz Ýletilemedi Çünkü Ýsmi Yazýlý Kiþi Sizi Engellenenler Listesine Aldý:"
Const strTxtHasExceededMaxNumPPMs = "Sýnýrlandýrýlmýþ Mesaj Sayýsýný Aþtýðý Ýçin Yollanmadý."
Const strTxtHasSentYouPM = "Size Aþaðýdaki Baþlýk Ýle Mesaj Yolladý."
Const strTxtToViewThePrivateMessage = "Mesajý Görmek Ýçin"


'pm_buddy_list.asp
'---------------------------------------------------------------------------------
Const strTxtNoBuddysInList = "Arkadaþ Listesinde Hiç Dostunuz Yok"
Const strTxtDeleteBuddyAlert = "Bu Arkadaþýnýzý listeden silmek istediðinizden eminmisiniz?"
Const strTxtNoBuddyErrorMsg = "Üye Adý \t- Bir Forum Üyesini Arkadaþ Listeme Ekle"
Const strTxtBuddy = "Arkadaþ"
Const strTxtDescription = "Taným"
Const strTxtContactStatus = "Haber Durumu"
Const strTxtThisPersonCanNotMessageYou = "Bu Kiþi Size Mesaj Atamaz."
Const strTxtThisPersonCanMessageYou = "Bu Kiþi Size Mesaj Atabilir."
Const strTxtAddNewBuddyToList = "Listeye Yeni Arkadaþ Ekle"
Const strTxtMemberName = "Üye Adý:"
Const strTxtAllowThisMemberTo = "Bu Üyenin"
Const strTxtMessageMe = "Bana Mesaj Atmasýna Ýzin Ver"
Const strTxtNotMessageMe = "Bana Mesaj Atmasýna Ýzin Verme."
Const strTxtHasNowBeenAddedToYourBuddyList = "Arkadaþ Listenize Eklendi."
Const strTxtIsAlreadyInYourBuddyList = "Zaten Arkadaþ Listenizde."
Const strTxtUserCanNotBeFoundInDatabase = "Veritabanýmýzda Kayýdý Bulunamadý.\n\nÜye Adýný Doðru Yazdýðýnýzdan Emin Olunuz"



Const strTxtOutbox = "Giden Kutusu"
Const strTxtMessageTo = "Mesajý Alacak Kiþi"
Const strTxtMessagesInOutBox = "Mesajlar Karþi Taraf Okuyup Silene Kadar Giden Kutusunda Saklý Tutulacaktýr.."

'New from version 7.02
'---------------------------------------------------------------------------------
Const strTxtYourInboxIs = "Gelen Kutunuz"
Const strTxtEmailThisPMToMe = "Bu Özel Mesajý Kendi E-posta Adresime Yolla"
Const strTxtEmailBelowPrivateEmailThatYouRequested = "Gönderilen Özel Mesajlarýn Bir Kopyasýný E-posta Adresime Yolla"
Const strTxtAnEmailWithPM = "Özel Mesaj Ýçeren E-posta,"
Const strTxtBeenSent = "E-posta Adresinize Yollandý."
Const strTxtNotBeenSent = "E-posta Adresinize Yollanamadý Lütfen Daha Sonra Tekrarlayýnýz."
Const strTxtSelected = "Seçili"


'New from version 8
'-----------------------------------------------------------------
Const strTxtYouAreOnlyPerToSend = "Saat baþýna izin verilen mesaj sayýsý:"
Const strTxtYouHaveExceededLimit = "Saat baþýna mesaj limitini doldurdunuz"


'New from version 9
'-----------------------------------------------------------------
Const strTxtNewMessage = "Yeni Mesaj"



%>
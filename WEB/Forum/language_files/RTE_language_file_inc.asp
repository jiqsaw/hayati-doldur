<%
'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Rich Text Editor(TM)
'**  http://www.richtexteditor.org
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



Const strTxtTextFormat = "Yazý Biçimi"
Const strTxtMode = "Kip (Mode)"
Const strTxtPrompt = "Hýzlý"
Const strTxtBasic = "Basit"
Const strTxtAddEmailLink = "E-posta Ekle"
Const strTxtList = "Listele"
Const strTxtCentre = "Ortala"

Const strTxtEnterBoldText = "Koyu Olarak Yazýlmasýný Ýstediðiniz Yazýyý Yazýn"
Const strTxtEnterItalicText = "Eðik Olarak Yazýlmasýný Ýstediðiniz Yazýyý Yazýn"
Const strTxtEnterUnderlineText = "Altý Çizili Olarak Yazýlmasýný Ýstediðiniz Yazýyý Yazýn"
Const strTxtEnterCentredText = "Ortalanmasýný Yazýlmasýný Ýstediðiniz Yazýyý Yazýn"
Const strTxtEnterHyperlinkText = "Baðlantý olarak görüntülenmesini istediðiniziyazýn"
Const strTxtEnterHeperlinkURL = "Baðlantý yapýlmasýný istediðiniz URL yi yazýn"
Const strTxtEnterEmailText = "E-mail baðlantýsý olarak görüntülenmesini istediðinizi yazýn"
Const strTxtEnterEmailMailto = "Baðlantý yapýlacak E-mail adresini yazýn"
Const strTxtEnterImageURL = "Eklemek Ýstediðiniz Resmin Web Adresini Yazýn"
Const strTxtEnterTypeOfList = "Liste Tipi"
Const strTxtEnterEnter = "Gir"
Const strTxtEnterNumOrBlankList = "Sýralý Olmasýný Ýstiyorsanýz Boþ Býrakýn"
Const strTxtEnterListError = "HATA! Lütfen Girin"
Const strEnterLeaveBlankForEndList = "Yazý Listeye Eklendi, Listeyi Sonlandýrmak Ýçin Boþ Býrakýn"
Const strTxtErrorInsertingObject = "Hata Þimdiki Konumda Nesne Ekleme."


Const strTxtFontStyle = "Karakter Tipi"
Const strTxtFontTypes = "Font"
Const strTxtFontSizes ="Boyut"
Const strTxtEmoticons = "Duygu Simgeleri"
Const strTxtFontSize = "Font Boyutu"


Const strTxtFontColours ="Font Renkleri"
Const strTxtBlack = "Siyah"
Const strTxtWhite = "Beyaz"
Const strTxtBlue = "Mavi"
Const strTxtRed = "Kýrmýzý"
Const strTxtGreen = "Yeþil"
Const strTxtYellow = "Sarý"
Const strTxtOrange = "Turuncu"
Const strTxtBrown = "Kahverengi"
Const strTxtMagenta = "Pembe"
Const strTxtCyan = "Açýk Mavi"
Const strTxtLimeGreen = "Açýk Yeþil"



Const strTxtCut = "Kes"
Const strTxtCopy = "Kopyala"
Const strTxtPaste = "Yapýþtýr"
Const strTxtBold = "Koyu"
Const strTxtItalic = "Eðik"
Const strTxtUnderline = "Altý Çizili"
Const strTxtLeftJustify = "Sola Hizalý"
Const strTxtCentrejustify = "Ortaya Hizalý"
Const strTxtRightJustify = "Saða Hizalý"
Const strTxtJustify = "Hizala"
Const strTxtUnorderedList = "Düzensiz Liste"
Const strTxtOutdent = "Dýþa Doðru"
Const strTxtIndent = "Ýçe Doðru"
Const strTxtAddHyperlink = "Baðlantý Ekle"
Const strTxtAddImage = "Resim Ekle"
Const strTxtJavaScriptEnabled = "Foruma Mesaj Yollayabilmeniz Ýçin Javascript Etkin Olmalý!"
Const strTxtFontColour = "Renk"
Const strTxtstrTxtOrderedList = "Düzenli Liste"
Const strTxtTextColour = "Yazý Rengi"
Const strTxtBackgroundColour = "Arkaplan rengi"
Const strTxtUndo = "Geri Al"
Const strTxtRedo = "Ýleri Al"
Const strTxtstrSpellCheck = "Yazým Denetimi"
Const strTxtToggleHTMLView = "Html Görüntüsü"
Const strTxtAboutRichTextEditor = "Zengin Metin Editörü Hakkýnda"
Const strTxtInsertTable = "Tablo Ekle"
Const strTxtSpecialCharacters = "Özel Karakterler"
Const strTxtPrint = "Yazdýr"
Const strTxtImage = "Resim"
Const strTxtStrikeThrough = "Strike Through"
Const strTxtSubscript = "Subscript"
Const strTxtSuperscript = "Superscript"
Const strTxtHorizontalRule = "Yatay Ölçü"


Const strTxtIeSpellNotDetected = "ie Kontrol yapamadý. Ýndirmek için tamam tuþuna týklayýnýz."
Const strTxtSpellBoundNotDetected = "You need \'SpellBound 0.7.0+\' spelling checker installed to use this feature. \nClick OK to go to the \'SpellBound\' download page."




Const strTxtOK = "OK"
Const strTxtCancel = "Ýptal"


Const strTxtImageUpload = "Resim Yükle"
Const strTxtFileUpload = "Dosya Yükle"
Const strTxtUpload = "Yükle"
Const strTxtPath = "Uzantý"
Const strTxtFileURL = "Dosya URL"

Const strTxtParentDirectory = "Ana Klasör"

Const strTxtImagesMustBeOfTheType = "Bu tür resim eklenmeli"
Const strTxtAndHaveMaximumFileSizeOf = "ve boyutu"
Const strTxtImageOfTheWrongFileType = "Dosya türü yanlýþ"
Const strTxtImageFileSizeToLarge = "Bu resmin dosya boyutu kadar olmalý"
Const strTxtMaximumFileSizeMustBe = "Maksimum dosya boyutu þu kadar olmalý"
Const strTxtErrorUploadingImage = "Resim Yükleme Hatasý!!"
Const strTxtNoImageToUpload = "Lütfen bunu kullanýn \'Gözat...\' sonra yüklemek istediðiniz resimi seçin."

Const strTxtFile = "Dosya"
Const strTxtFilesMustBeOfTheType = "Dosya uzantýsý þu þekilde olmalý"
Const strTxtFileOfTheWrongFileType = "Upload edilen dosya türü yanlýþ"
Const strTxtFileSizeToLarge = "Bu kadardan büyük dosya"
Const strTxtErrorUploadingFile = "Dosya Yükleme Hatasý!!"
Const strTxtNoFileToUpload = "Lütfen bunu kullanýn \'Gözat...\' sonra yüklemek istediðiniz dosyayý seçin."


Const strTxtPleaseWaitWhileFileIsUploaded = "Lütfen dosya servere gönderilirken bekleyin."
Const strTxtPleaseWaitWhileImageIsUploaded = "Lütfen resim servere gönderilirken bekleyin."


Const strTxtCloseWindow = "Pencereyi Kapat"


Const strTxtPreview = "Önizleme"
Const strTxtThereIsNothingToPreview = "Önizleme Yapýlamadý"

Const strResetFormConfirm = "Formu Temizlemek Ýstediðinizden Eminmisiniz?"
Const strResetWarningFormConfirm = "UYARI: Formdaki tüm bilgiler kaybolacak!!"
Const strResetWarningEditorConfirm = "UYARI: Düzenlenen tüm bilgiler kaybolacak!!"


Const strTxtSubmitForm = "Formu Sun"
Const strTxtResetForm = "Formu Yenile"

Const strTxtDisplayMessage = "Mesaj Göster"
Const strTxtThereIsNothingToShow = "Gösterilebilecek Mesaj Yok"


Const strTxtTableProperties = "Tablo Özellikleri"

Const strTxtImageProperties = "Resim Özellikleri"

Const strTxtImageURL = "Resim&nbsp;URL"
Const strTxtAlternativeText = "Alternatif Yazý"
Const strTxtLayout = "Taslak"
Const strTxtAlignment = "Hizalama"
Const strTxtBorder = "Çerçeve"
Const strTxtSpacing = "Boþluklar"
Const strTxtHorizontal = "Yatay"
Const strTxtVertical = "Dikey"

Const strTxtRows = "Sýra"
Const strTxtColumns = "Sütunlar"
Const strTxtWidth = "Geniþlik"
Const strTxtpixels = "pixel"
Const strTxtCellPad = "Çerçeve"
Const strTxtCellSpace = "Boþ Olan Hücre"

Const strTxtHeight = "Yükseklik"


Const strTxtSelectTextToTurnIntoHyperlink = "Lütfen baðlantýya çevrilecek birkaç yazý seçin."

Const strTxtYourBrowserSettingsDoNotPermit = "Tarayýcýnýz editörün isteklerine izin vermiyor"
Const strTxtPleaseUseKeybordsShortcut = "operations. \nLütfen klavye kýsayollarýný kullanýn "
Const strTxtWindowsUsers = "Windows kullanýcýlarý: "
Const strTxtMacUsers = "Mac kullanýcýlarý: "


Const strTxtHyperlinkProperties = "Baðlantý Özellikleri"
Const strTxtNoPreviewAvailableForLink = "Önizleme mevcut deðil"
Const strTxtAddress = "Adres"
Const strTxtLinkType = "Link Türü"
Const strTxtTitle = "Baþlýk"
Const strTxtWindow = "Pencere"
Const strTxtEmail = "Eposta"
Const strTxtSubject = "Konu"
Const strTxtPleaseWaitWhilePreviewLoaded = "Lütfen bekleyin, önizleme yükleniyor...."
Const strTxtErrorLoadingPreview = "Önizleme Yükleme Hatasý.\nLütfen uzantýyý ve ismi kontrol edin."


Const strTxAttachFileProperties = "Dosya Özellikleri"

Const strTxtNewBlankDoc = "Yeni Boþ Döküman"
Const strTxtOpen = "Aç"
Const strTxtSave = "Kaydet"

Const strTxtFileAlreadyExistsRenamedAs = "Ayný isme sahip iki dosya var veya girmiþ olduðunuz dosyanýn isminde bir problem var.\nDosya þu þekilde kaydedildi:"
Const strTxtTheFile = "Dosya:"
Const strTxtHasBeenSaved = "kaydedildi"


Const strTxtPasteFromWord = "Word dan yapýþtýr"
Const strTxtPasteFromWordDialog = "This will clean up documents pasted from Word. Please paste inside the following box using the keyboard (Windows users: Ctrl + 'v', MAC users: Apple + 'v') and hit 'OK'."
%>
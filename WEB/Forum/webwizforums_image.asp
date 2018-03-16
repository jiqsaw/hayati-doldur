<% @ Language=VBScript %>
<%
'***** WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******


'****************************************************************************************
'**  Copyright Notice    
'**
'**  Web Wiz Forums(TM)
'**  http://www.webwizforums.com
'**                            
'**  Copyright (C)2001-2010 Web Wiz(TM). All Rights Reserved.
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



'*************************** SOFTWARE AND CODE MODIFICATIONS **************************** 
'**
'** MODIFICATION OF THE FREE EDITIONS OF THIS SOFTWARE IS A VIOLATION OF THE LICENSE  
'** AGREEMENT AND IS STRICTLY PROHIBITED
'**
'** If you wish to modify any part of this software a license must be purchased
'**
'****************************************************************************************





'***** START WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******



'Function to send convert hex to binary output for browser
Private Function displayImage(strHexImage)

	'Dimension variables
	Dim sarryHex		'Holds each hex value in the image
	Dim lngHexArrayPosition	'Holds the array position

	'Place the Hex image into an array
	sarryHex = split(strHexImage, " ")

	'Loop through the array to convert to binary
	For lngHexArrayPosition = 0 to CLng(UBound(sarryHex))

		'Write the binary output
 		Response.BinaryWrite ChrB(CLng("&H" & sarryHex(lngHexArrayPosition)))
	Next

End Function





Dim strHexImage

'Set so the CAPTCHA image is not cached
Response.CacheControl = "Store"
Response.AddHeader "pragma","cache"
Response.AddHeader "cache-control","public"


'Set the content type for the CAPTCHA image
Response.ContentType = "image/gif"


'***** WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******


strHexImage = "" & _
"47 49 46 38 39 61 a3 00 27 00 f7 00 00 33 33 33 00 00 f6 0d 0e da cc 00 00 59 59 59 99 99 99 ff eb e6 00 99 00 e6 ca 22 e6 e6 e6 a7 a7 ef e8 8c 00 c3 c3 c3 73 73 73 a5 a5 a5 85 85 e9 e2 51 51 " & _
"a5 d0 8f 8d cf 7b 33 99 33 ff 99 99 b9 e9 b1 ff 79 79 b5 b5 b5 d5 d5 d5 41 41 41 5b 5b ec c8 2c 39 00 e6 00 f2 bd b7 e4 e0 29 85 85 85 ff ff 99 41 44 f6 9a 97 df ff ec 52 e6 e4 c8 22 ff 22 00 " & _
"d6 00 ae ae ae ff ff 00 c1 c2 f7 bc 26 27 f2 a8 2e 5a ff 59 75 74 db e0 fe ee 00 c4 00 cc 66 66 a8 ff a7 ff cc 00 ed 2c 37 0c e5 15 34 35 f7 da e0 be 68 69 dd ff f6 8f 87 c4 75 9f ff ac 99 99 " & _
"ff ff f7 00 c6 f8 c7 a6 de 92 66 66 66 ff 99 00 ff ff b6 8c 8c 8c 80 ff 7f ff 00 00 00 b5 00 f9 dd 65 5d 5f dc 6d 6d e9 4c 4c 4c ff ff 33 ff de 00 ff 66 66 ff 19 19 de de f5 b6 b6 ff 21 21 e5 " & _
"b6 b3 c7 ff ff 66 ff ff ff 7f 7f 7f ff 4b 4b ea fa f6 35 ff 41 00 f7 00 f2 cc c7 2f b9 2f ff a4 a4 ff ff df 0d a1 0d e7 c3 24 ff d6 d7 bc bc bc ed 00 00 e8 af 06 e8 8b 8b d6 d6 f9 ff ff 1a 1c " & _
"e1 25 8c 8c ff 51 51 ed ff 42 42 17 17 e5 e1 31 31 0d c7 0d ff c0 00 ff ff 47 0f ff 1a df f6 df 0a 8a 0a 0d b7 0d ff 66 66 b1 d9 aa cc ff cc ff ff cc 66 66 ff a4 a4 ff 5b 5b ff 66 ff 66 33 ff " & _
"33 d6 f6 d6 ff e5 00 ff 0f 0f ff 21 21 ff f6 71 7a 7a ff ff e2 4e 43 d0 49 ff c4 c4 f1 ae a7 4c 9f 4c ff 58 58 3f 3f ff e5 e5 f9 24 24 ff ff ff 54 f8 f8 f8 fe f6 f4 08 ff 08 cc cc ff 0f 0f e5 " & _
"f5 e5 e1 ba b7 ca 18 ff 26 cc cc cc ff b4 00 ac ac e2 ff 33 33 ff ff 0f f1 db d6 be bb cc ee ee ee ff 8d 8d ff f6 ae be df a1 bc bc ff d0 df b4 96 dc 77 e7 9a 43 ef ae 2b 33 33 ff 7a 79 da fc " & _
"dd dd 00 de 00 cc 33 33 ff 84 84 e8 a3 06 e7 2d 3c fe 08 08 ec bf 10 83 83 ff e1 70 70 70 fc 70 ff cc cc 66 66 ff ad ad ff ff ee 00 e6 00 00 ff d6 00 7d ff 8b f5 aa a1 1a 1a fe ff 99 99 99 99 " & _
"ff d8 db ed ab dd 8f e2 5e 5e b2 b2 e2 25 28 f6 67 69 f4 ff b5 b5 ff 52 51 00 ef 00 00 ac 00 36 a8 36 0a 0d f8 5a ff 68 ac ac f6 db 00 00 53 53 ff 49 4c f6 ff 29 29 99 99 99 00 ff 00 df df fe " & _
"4a 4a ff ff 3b 3b d8 2f 3c e6 d8 22 42 ff 42 ff 72 72 0e f5 18 c5 c3 d3 ff fe 86 a8 a7 e1 ee ee fe c8 df ab ff ff e8 3c 3c ff 00 cc 00 f7 00 00 90 d0 7e e6 e0 36 ff f5 55 b5 df 98 ff ab 00 00 " & _
"bd 00 ff ff 3a 0d ac 0d 17 1b f7 dd 2f 3c 17 ff 17 8d fc 8d ff fe be ff ff 73 07 d2 07 73 73 ff ec e6 c8 af af e3 64 64 ea ff ff 99 d5 d5 ff ff ff d8 ff ff a7 ff b1 ab e5 e5 ff 82 7d d5 c2 c2 " & _
"fc e7 b3 02 36 b5 36 f5 a1 30 ff ff ff 21 f9 04 01 07 00 ff 00 2c 00 00 00 00 a3 00 27 00 00 08 ff 00 ff 09 1c 48 b0 a0 c1 83 08 13 2a 5c c8 b0 a1 c3 87 10 23 4a 9c 48 b1 a2 c5 8b 18 33 6a dc " & _
"c8 b1 a3 47 8f 09 18 5c 18 49 b2 a4 c9 93 28 53 aa 5c c9 b2 a5 cb 97 30 63 b2 64 90 40 21 25 2a 1f 1c c8 dc c9 b3 a7 cf 9f 40 51 9e 10 52 00 c3 c1 13 45 a7 28 5d ca b4 a9 d3 a7 50 a3 4a 9d 4a " & _
"b5 aa d5 ab 58 ad 32 c2 50 e0 44 c1 13 0e 18 65 1d 4b b6 ac d9 b3 68 ab 32 2a 70 61 20 06 21 4b 19 6d 4b 44 37 91 13 32 78 c9 3c da 9b 02 5a 23 03 a6 02 7f 19 1c eb cb d2 4d 94 12 27 78 ba 09 " & _
"c3 14 4a 51 13 2c 86 8a 21 31 64 b2 8d 9b 56 de 14 95 d2 e4 b4 99 b5 16 15 98 54 69 a2 6d db a0 e9 dd f7 69 16 9e 1d 3b ce 04 0a 26 22 12 e0 58 84 84 6d a1 c0 69 cc 52 4a 19 7e fc 48 02 b7 29 " & _
"a5 1f 53 00 3c 45 3e 32 ea 0f 02 c2 33 7c be 7a 9c e9 f0 1f 19 2e 3c a5 d2 e0 02 95 b4 8f 91 53 ff 2f f0 6f 53 01 a6 4e b6 e5 ab f7 68 df 13 d7 3b 5c b9 82 77 87 99 be 4c 06 be e4 de cd c9 da " & _
"ab df e2 6d a2 1c 06 9c 49 56 9d 72 53 20 c6 19 06 00 78 96 40 63 09 5c b6 d4 0f 97 11 a5 14 06 8e 29 15 e1 62 8d 61 c0 61 62 e2 3d 46 c0 85 19 28 a5 e0 14 09 10 e0 80 03 04 50 92 61 86 90 21 " & _
"06 63 02 33 32 75 1c 8d 09 66 28 d9 53 6b 21 e6 00 53 64 40 c3 de 27 4f e0 81 c7 19 b2 d1 97 47 08 f7 e9 a7 1b 05 a9 58 c0 c4 7f 4a 51 d2 22 25 0e 20 47 e1 14 05 14 70 e0 14 18 10 50 00 01 18 " & _
"5c 00 40 97 5e 66 c0 5d 88 53 fc e0 40 62 2d 4e c1 5d 03 df 5d 20 66 12 60 00 27 04 86 49 14 90 44 88 9b 24 e1 40 86 60 f6 99 44 65 49 50 41 85 a1 60 96 98 c0 a1 7d fe 00 17 00 54 80 b1 89 a4 " & _
"3f 68 57 65 06 0d d0 39 85 74 53 34 00 06 54 6f 32 30 ea 52 78 3d d2 da 6b 67 b8 12 88 92 d1 d4 ff 50 4a 16 fb 71 12 25 13 c3 f8 f2 5b 70 c3 c1 b5 65 97 5f 52 e1 65 01 0d 24 c7 a5 97 23 1a 3b " & _
"21 74 c3 f1 a9 d4 a1 1e 1e 87 ac 52 54 68 77 01 9b 9b 38 d0 40 9f a1 5a 5b 2c 85 d5 91 29 84 a8 0e 08 61 a0 10 c8 01 c0 d9 05 0d 50 02 46 89 55 26 f1 2c 06 c2 6e 02 ef 53 17 80 b1 22 53 29 a4 " & _
"b0 6a 6c ae de 71 c7 32 d1 20 02 4c 0b 1d e0 c3 5b 2a d6 30 71 48 1a 10 00 b8 14 99 bf 7a 99 6e 9b c2 b2 65 2c b0 e2 21 a8 d4 96 53 80 d1 ae 78 14 5e d0 67 03 16 7f 0c 59 75 55 5e 16 28 06 5b " & _
"56 07 2e 72 0e 8c 49 2f 99 18 10 87 ae b2 05 fc 80 a6 c4 6d ba 98 84 77 51 81 01 46 73 4b a5 f0 1e ab f3 09 4c 30 22 a4 a4 73 43 07 bc 59 d0 f0 30 69 34 13 71 95 e2 3d 0a f3 a8 c2 06 7b 1e 06 " & _
"a3 2a c7 b1 52 1e 07 ad 14 b1 09 64 b0 89 bd 09 6c 89 32 cb 16 f6 fc 5b 12 90 b5 9d 80 b0 5c 7e ff 37 33 8a 04 f8 2d 6f 97 53 64 a9 ec b5 09 fe 18 ef db 6e 4f 41 00 9e 45 1f ad a9 52 4b c7 f6 " & _
"ea 1d 79 10 ec 0d 29 8a 1c 73 43 21 9c 58 7d 08 d6 97 34 a1 ce 6f 00 a4 9e c1 79 60 fc 39 f7 c5 97 3e e7 18 01 62 a6 ac ec c7 a9 03 f0 83 63 76 12 60 2d 01 9d 0a c1 72 ec c2 31 e5 40 12 00 0c " & _
"9d a0 70 3f 70 46 61 db 70 f9 2e 27 5c 61 d2 39 a2 c7 42 d0 3e 39 25 7f 4a 5f f8 bd 4f 19 8d b4 52 c9 00 ac a4 e6 9c e7 72 4c 00 47 14 22 e5 21 55 a4 71 c9 1f ac ac 01 de fd f8 e7 3f 15 d1 91 " & _
"8f 3f 85 02 0f 40 02 12 e6 a1 01 34 a0 21 04 35 80 02 14 d4 00 09 01 b4 00 17 0e ab 82 34 9a f1 07 3f 10 c1 7e fa cb a0 06 c1 63 b2 e9 38 45 7c 93 9b 82 13 b0 a1 89 12 4a 42 12 51 48 e1 2f 7e " & _
"61 09 6d 68 83 17 5b 18 86 04 9b d1 04 56 10 01 1c 18 84 d9 ee 26 54 bc 0b 09 c7 83 4a b9 56 71 ff a0 42 05 37 2d 25 4b 99 5a 0a ba d0 b5 c3 a9 30 91 79 c2 09 e1 06 ad 02 42 a6 70 a1 1b f6 b0 " & _
"43 10 ee 01 82 6c 48 01 10 5c 68 0a 05 a4 71 09 1a da 10 1c 61 40 85 86 52 c7 80 2a e5 ee 32 0e 48 1d 54 0a a0 3b a9 fc a0 8e 4a 21 40 ea be 83 36 00 08 21 75 12 72 4e ee 06 79 9e 29 62 a5 8a " & _
"4b b1 03 17 b4 d8 45 29 2c 42 09 e2 88 47 53 38 41 c1 1a de 30 0c 69 5c 4a 06 ce b4 b6 dc 29 ee 8f c9 72 0a 1d d9 24 4a 00 dc 2b 77 c9 62 10 00 4e 20 1c 42 09 d2 67 68 f2 92 21 0f 29 39 a6 b4 " & _
"a3 1d 5c 74 87 23 cf 51 06 0f 48 92 29 a9 68 82 1f ce 88 49 65 a8 11 77 c5 0a 55 ee f8 78 47 3e 96 92 94 4d 61 40 ea 16 43 09 53 ca 71 0a d2 4c 1b 55 ee 58 c8 59 92 05 91 4a e9 c4 3d b2 a1 4b " & _
"37 28 a1 0c 28 a0 c6 2f 97 62 0d 22 b8 13 8d 61 50 c6 00 54 a0 c4 e4 3d 4b 77 00 48 d6 26 7f 14 ff a6 3d 72 66 94 ad 4b 9e 2b 51 04 48 2e e1 b3 41 06 a5 d8 ee 9e c8 bc 10 72 73 8e 9b 5c 9d 0f " & _
"29 94 81 0c b0 32 44 42 6c 13 85 a8 60 4a ed fc d1 8f 26 e2 68 ea 1a c0 99 a5 80 73 0a 8d 5c 84 39 31 81 09 1e a8 53 8c 33 98 c1 2a 56 a1 8e 9a 6e 00 06 4b 31 93 72 12 00 48 39 f2 b4 41 6d 1b " & _
"24 72 e8 88 bc dc 81 8a 29 9b 3c 4f 03 ce f4 d0 a5 52 a1 9a 0d ba e3 20 39 39 21 aa 36 65 a9 83 fc 0e 54 8b 7a 82 6b 1a 34 5d d6 cc 9d 54 53 a7 9d b1 a6 2e 94 21 ab e5 52 70 20 05 37 f0 12 13 " & _
"28 e0 01 2d 10 40 02 2b c0 81 0f 7c e8 41 05 22 10 8e 70 48 e0 af 12 c8 01 1d 96 a2 4a 4a 48 53 5e 80 84 aa 32 c9 c4 80 4d 32 80 8e ba 4b 40 1c 41 6a 1d 00 14 0b 79 94 f8 e3 65 01 f0 26 40 5e " & _
"00 4d 45 0d a4 59 53 77 1e 9d b6 0b ab 89 51 5d 01 9e ea d5 51 26 c7 94 2e da 24 67 1f 65 59 01 ff 01 c0 31 d5 3c 6a 5a fd 97 0d 73 96 a1 a5 72 ed 03 02 6c e0 82 3a c4 80 1d b0 60 c1 15 26 f1 " & _
"86 e6 5e e3 1a 34 18 04 53 c8 fa 47 bf 71 96 8e d7 03 c0 a9 aa 0b d9 92 72 14 ad 09 fd 29 23 0e fb da d4 22 54 29 60 48 dd 10 71 37 55 a5 e2 d1 71 96 85 6a 21 15 db 49 b0 16 e7 8e c9 fa e3 ee " & _
"48 bb 98 81 9e 14 10 4a 60 29 0f 78 d0 87 3e d8 c2 0b a0 30 ee 10 f4 50 8d 12 38 e2 19 58 20 06 31 4e 71 8a 6f 68 a1 b2 e8 e2 ec 14 aa eb 54 55 66 ec 8e 3e b3 67 10 bd 3a 62 00 90 f7 a7 d9 7c " & _
"4c 41 51 b4 49 02 88 a5 b2 b0 04 d6 a7 ac 4a c7 0c 40 f5 32 f4 fd ea 6b 0b 79 c7 e2 b8 56 b6 f9 74 40 49 d1 ab 56 a5 48 01 9d 72 a5 c5 12 96 20 03 2f 70 43 07 0b 6e b0 23 b0 10 61 0e 9c c2 04 " & _
"26 78 41 3f 98 a2 df 82 4a 93 76 9c 85 ea 54 43 1c a2 1c 5f 28 75 cd 54 ca 26 97 2a af 1b b3 77 ff a0 6d b2 ea 52 48 bb 14 c8 ba 59 c5 1e 5b 2a 58 2f f3 50 1d e7 6c 90 49 18 f2 49 c7 d1 52 5a " & _
"14 d8 16 b6 90 c1 28 3c 71 0b e5 3a 98 ca 1c b0 72 85 bf 61 8e 2d 1f 31 ac 6b 7c a3 2a df 64 19 ae 78 75 b2 4e 19 a4 e2 b0 6a 59 3c 43 06 b2 8a 6b 4a 9f 91 4a e3 e4 dd 39 c7 20 2e 2f ee 0a e9 " & _
"da 20 36 40 b6 a9 36 da 09 4e c0 94 11 d0 c2 d0 06 96 81 0c da 30 0a 72 20 63 0f eb 98 32 16 22 7d e5 2c bf a0 08 c6 b0 91 58 97 52 54 04 b1 11 bd 17 f0 34 00 26 c3 51 68 8e 35 43 90 e5 e4 8d " & _
"55 99 4c a7 ac 7a 29 7a 9e 58 7c 57 7c 67 3d ee 79 d6 f5 95 6c 21 19 a1 c7 6e 5e 80 01 8f ed f5 a1 13 3d ec 4a ac a0 17 57 78 70 84 27 7c e5 6f 50 da 1c c5 88 f6 74 d5 8b ee b3 2a 65 a9 57 4a " & _
"2a 64 5b 34 d9 6e d6 d3 ab 62 5e 19 20 8b ca 2c 49 55 d6 e2 25 3e 6d 62 57 cc 88 3d 52 02 b2 ef ff 8e 33 ad 75 07 d5 1f d1 36 d5 45 d9 c4 07 5e 3c 85 11 2c 01 d1 c3 6e 43 25 ca e1 8f 5e 4c 02 " & _
"c2 c4 88 34 96 0d 6e 0e 84 27 bc 29 7a 34 71 9d f7 48 a2 41 66 60 2d c9 03 f2 d3 9d a2 53 36 e5 4e 2c 37 9e 2a 9a 3f fe 14 52 33 fd ce 71 46 65 1d 57 dc 67 d7 8e 76 ea d4 22 0d a1 04 81 f3 36 " & _
"e8 bc 1c 3c 0f c5 1b 06 4e 61 13 7c e3 05 cf 2e 42 31 0e 30 81 a6 f4 ec 07 9f d1 e1 e4 60 36 52 de 49 ea cf 4d d4 8c 70 52 2d a7 1f 24 53 87 3a 84 a2 c7 95 98 c4 a7 f8 29 79 85 84 7c 5c ee 98 " & _
"04 91 78 bc 95 4a 41 97 a6 32 ba 96 a2 36 e0 33 27 17 08 57 4a 6a 84 56 f0 43 0c 62 50 85 ec 17 20 0a 1f 98 e1 1d 6c c8 bd 1c 76 8f 8e 2e f8 be 0b 71 30 84 37 87 4f 7c ac 6c e2 f4 03 f9 2c cd " & _
"8b cf fc e6 67 30 5b 60 f8 8a 97 96 ef fc ea 5b 3f 2b 94 f8 40 f4 0d c2 95 ae 18 ed fb e0 0f bf 38 f8 c7 4f fe f2 9b ff fc e8 4f bf fa d7 cf fe f3 5f e0 04 1f 18 4d 42 22 d4 fe fa db ff fe f8 " & _
"cf bf fe c5 cf 00 4a 6c e2 23 00 18 80 02 38 80 04 58 80 06 78 80 11 11 10 00 3b"                                                                                                                                                                                                                                                                            


'Call the function to convert hex for a binary write to clients browser
Call displayImage(strHexImage)


'***** END WARNING - REMOVAL OR MODIFICATION OF THIS CODE WILL VIOLATE THE LICENSE AGREEMENT ******
%>
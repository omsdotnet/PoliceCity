/****** Script for SelectTopNRows command from SSMS  ******/
SELECT cast(F1 as varchar(10)) + char(9) + 'alert( ''Участок № ' + cast(F1 as varchar(10)) 
		+ case when F2  is not null then '\r\nВсего зарегистрированно обращений:' + cast(F2 as varchar(10)) else '' end
		+ case when F3  is not null then '\r\nЗаведено уголовных дел:' + cast(F3 as varchar(10)) else '' end
		+ case when F5  is not null then '\r\n   из них в сост. алк. опьянения:' + cast(F5 as varchar(10)) else '' end
		+ case when F6  is not null then '\r\n   из них рецедивы:' + cast(F6 as varchar(10)) else '' end
		+ case when F7  is not null then '\r\n   из них раскрыто:' + cast(F7 as varchar(10)) else '' end
		+ case when F8  is not null then '\r\n   из них кражи (158):' + cast(F8 as varchar(10)) else '' end
		+ case when F9  is not null then '\r\n   из них телесные повреждения (116, 111):' + cast(F9 as varchar(10)) else '' end
		+ case when F10 is not null then '\r\n   из них наркотики:' + cast(F10 as varchar(10)) else '' end
		+ case when F11 is not null then '\r\n   из них грабеж (161):' + cast(F11 as varchar(10)) else '' end
		+ case when F12 is not null then '\r\n   из них мошенничество (159):' + cast(F12 as varchar(10)) else '' end
		+ case when F13 is not null then '\r\nОсуждено с лишением свободы:' + cast(F13 as varchar(10)) else '' end
		+ case when F14 is not null then '\r\nОсужденно без лишения свободы:' + cast(F14 as varchar(10)) else '' end
		+ case when F15 is not null then '\r\nОтправленно в нарк. диспансер:' + cast(F15 as varchar(10)) else '' end
		+ case when F16 is not null then '\r\nЗарегистрированно административных правонарушений:' + cast(F16 as varchar(10)) else '' end
		+ case when F17 is not null then '\r\n   из них сотс. опьянения и общественная нравственность (ст.20.21):' + cast(F17 as varchar(10)) else '' end
		+ case when F18 is not null then '\r\n   из них мелкое хулиганство (ст. 20.1 ч.1 ):' + cast(F18 as varchar(10)) else '' end
		+ case when F19 is not null then '\r\n   из них омский кодекс (нарушение тишины и покоя):' + cast(F19 as varchar(10)) else '' end
		+ case when F20 is not null then '\r\n   из них родительские обязанности:' + cast(F20 as varchar(10)) else '' end
		+ case when F21 is not null then '\r\n   из них ГИБДД:' + cast(F21 as varchar(10)) else '' end
		+ case when F22 is not null then '\r\n   из них мелкие хищения:' + cast(F22 as varchar(10)) else '' end
		+ case when F23 is not null then '\r\n   из них неуплата административных штрафов:' + cast(F23 as varchar(10)) else '' end
		+ case when F24 is not null then '\r\n   из них нарушение правил хранения оружия:' + cast(F24 as varchar(10)) else '' end
		+ case when F25 is not null then '\r\n   из них выработка и продажа самогона:' + cast(F25 as varchar(10)) else '' end
		+ case when F26 is not null then '\r\n   из них употребление наркотических средств:' + cast(F26 as varchar(10)) else '' end
		+ case when F27 is not null then '\r\n   из них нарушение административного надзора (ст. 19.24):' + cast(F27 as varchar(10)) else '' end
		+ case when F28 is not null then '\r\n   из них миграция (ст. 18.8):' + cast(F28 as varchar(10)) else '' end
		+ case when F29 is not null then '\r\nНа учете под административным надзором:' + cast(F29 as varchar(10)) else '' end
		+ case when F30 is not null then '\r\nНа учете ранее судимых и осужденных к наказанию не связанному с лишением свободы:' + cast(F30 as varchar(10)) else '' end
		+ case when F30 is not null then '\r\nНа учете правонарушители в сфере семейно-бытовых отношений:' + cast(F30 as varchar(10)) else '' end
		+ case when F31 is not null then '\r\nНа учете злоупотребляющих спиртными напитками:' + cast(F31 as varchar(10)) else '' end
		+ case when F32 is not null then '\r\nНа учете несовершеннолетних:' + cast(F32 as varchar(10)) else '' end
		+ case when F33 is not null then '\r\nНа учете употребляющих наркотики:' + cast(F33 as varchar(10)) else '' end
		+ case when F34 is not null then '\r\nПлощадь участка (кв.м.):' + cast(F34 as varchar(10)) else '' end
		+ case when F35 is not null then '\r\nПроживает граждан:' + cast(F35 as varchar(10)) else '' end
		+ case when F36 is not null then '\r\n   из них несовершеннолетних:' + cast(F36 as varchar(10)) else '' end
		+ case when F37 is not null then '\r\nЖилых домов:' + cast(F37 as varchar(10)) else '' end



		+ ''');'

  FROM [MDW].[dbo].[DATA]
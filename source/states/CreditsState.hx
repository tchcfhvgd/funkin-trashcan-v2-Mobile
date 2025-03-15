package states;

import objects.*;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var descText:FlxText;
	var messageText:FlxText;

	var intendedColor:FlxColor;

	var offsetThing:Float = -50;

	//brijido socio
	var bg:FlxSprite;
	var chavorrucos:FlxSprite;
	var messageImg:FlxSprite;

	var chavoX:Int = 500;
	var chavoY:Int = 25;

	override function create()
	{
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menu/creditos/bg'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();

		var patron = new FlxBackdrop(Paths.image('menu/patron_zozer'));
		patron.scrollFactor.set();
        patron.setGraphicSize(Std.int(patron.width * 0.5));
		patron.velocity.set(-80, -80);
		add(patron);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		var defaultList:Array<Array<String>> = [ //Name - Icon name - Description - Link - Message - Is Image
			[''],
			['Zozerkul','zozer','Director, Composer and Artist.','https://twitter.com/_ZozerKul_', 'A mod about whaaaaaat??'], //El mod es MIO no crean nada de lo que dice COCONUTMALL
			['Iseta', 'Iseata','Artist','https://x.com/Isetaaaaa',	'Mas buena yo'],
			['Champ', 'champ','Artist','https://twitter.com/RaId3n_01',	'El café con leche es como el café pero con leche'],
			['Cabox', 'cabox','Coder','https://twitter.com/MJejejojo',	'8:29 una cacaca'],
			['Rush', 'rush','Artist','https://www.youtube.com/watch?v=ywlKn36RfOQ&t=17s',	'hola soy rush, este es mi mensaje, mira mi hamster. No viste a mi hamster, este fue mi mensaje, te amo'],
			['Missy', 'missy','Artist','https://linktr.ee/momazosm',	'2 perros + refresco por 1$'],
			['Joy', 'joy','Artist','https://x.com/H4UNTEDH0USE_',	'https://youtu.be/8p63FV29mcA?si=KOxvvEx06SZqEIAs'],
			['CoconutMall','coco',' Voice Actor','https://www.youtube.com/@CocoMall',	'presiona enter y mira mis malvados videos'],
			['Zinkk99', 'zinkk99','Composer','https://x.com/zinkk_99',	'+56 9 3187 9364 el nuevo numero de trash maurice llamen ya'],
			['Memi', 'memi','Composer','https://melodymizuki.carrd.co/',	'zinkk es un mentiroso no llamen a ese numero les respondera el Doctor Fajardo Pediatra'], //TBS
			['Kande', 'kande','Artist','https://twitter.com/Kande_lier',	'Zozer eres un idiota la próxima vez los sprites los haces tú cómo me vas a decir que los separe cuando ya los ter...'],
			['Alex N.', 'neitor','Artist','https://bsky.app/profile/alexnyay.bsky.social',	'Un saludo a todos los curifeos, en especial al Cavifax'],
			['Teeth', 'teeth','Artist','https://x.com/teethlust','', "true"],
			['Faro', 'faro','Artist','https://x.com/__far0__',	'Hola adictos del sexo\n nomas alcance para arte de bio :)'],
			['Kuku', 'kuku','Artist','https://x.com/Kukuu031',	'', "true"], //ese we 
			['JustDemianAgain', 'demian','Composer','https://x.com/justdemianagain','i have autism'],
			['Jotacast', 'infinity','Composer','https://x.com/castingjota',	''], //TBS
			['Farsy', 'farsy','Charter','https://x.com/Farsyyyyy',	'que misfits es not like us diddy ahh blud? * piano sounds start * MUSTARDD! ayo SU- :DanceSus: boiiii shut the heck up and dap me up! 😂🫱'], //no tengo idea
			['Andree1x', 'Andree1x','Charter and coder','https://twitter.com/Andree1x',	'Codigo ANDREE1X en la tienda de fortnite'],

			['              SUPPORT'],
			['MeloXD', 'melo','funkintrashcan/trasquad funny moments','https://twitter.com/MelocXD',	'Pasame ese arbol\nGracias'],
			['Grey', 'dani',' ','',	' '],
			['Pil4s_', 'pipas','Paradise Heaven Studio Chart','https://pil4sng.newgrounds.com/','Fan # 2 de Funkin’ Trashcan'],

			['              SP. THANKS'],
			['Sock.clip', 'sock','Whitty Creator','https://gamebanana.com/members/2115605',	''],
			['Nate anim8', 'nateanim8','Whitty 2','https://gamebanana.com/members/1778429',	''],
			['BBPanzu', 'bebepanson','Whitty Chromatic Creator','https://www.youtube.com/@bbpanzu213',	''],
		];
		
		for(i in defaultList)
			creditsStuff.push(i);

		chavorrucos = new FlxSprite(500,25);
		chavorrucos.loadGraphic(Paths.image('menu/creditos/maurice-dibujos/nothing'));
		chavorrucos.setGraphicSize(Std.int(chavorrucos.width * 0.7));
		chavorrucos.antialiasing = ClientPrefs.data.antialiasing;
		add(chavorrucos);

		for (i => credit in creditsStuff)
			{
				var isSelectable:Bool = !unselectableCheck(i);
				var optionText:Alphabet = new Alphabet(60, 300, credit[0], !isSelectable);
				optionText.isMenuItem = true;
				optionText.targetY = i;
				optionText.changeX = false;
				optionText.snapToPosition();
				grpOptions.add(optionText);
	
				if(isSelectable)
				{
					if(credit[5] != null)
						Mods.currentModDirectory = credit[5];
	
					var str:String = 'credits/missing_icon';
					if(credit[1] != null && credit[1].length > 0)
					{
						var fileName = 'menu/creditos/icons/' + credit[1];
						if (Paths.fileExists('images/$fileName.png', IMAGE)) str = fileName;
						else if (Paths.fileExists('images/$fileName-pixel.png', IMAGE)) str = fileName + '-pixel';
					}
					trace(str);
	
					var icon:AttachedSprite = new AttachedSprite(str);
					if(str.endsWith('-pixel')) icon.antialiasing = false;
					icon.xAdd = optionText.width + 10;
					icon.sprTracker = optionText;
		
					// using a FlxGroup is too much fuss!
					iconArray.push(icon);
					add(icon);
					Mods.currentModDirectory = '';
	
					if(curSelected == -1) curSelected = i;
				}
				else optionText.alignment = CENTERED;
			}

		for (num in 1...3) {
			var barra = new FlxSprite(0, 0).loadGraphic(Paths.image('menu/title/bar$num'));
			barra.antialiasing = ClientPrefs.data.antialiasing;
			barra.screenCenter();
			add(barra);
		}

		#if MODS_ALLOWED
		for (mod in Mods.parseList().enabled) pushModCreditsToList(mod);
		#end

		messageImg = new FlxSprite(250, -200);
		messageImg.loadGraphic(Paths.image('menu/creditos/special-stuff/${creditsStuff[curSelected][1]} image'));
		messageImg.screenCenter(X);
		messageImg.antialiasing = ClientPrefs.data.antialiasing;
		add(messageImg);

		messageText = new FlxText(50, FlxG.height + offsetThing, 1180, "", 32);
		messageText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		messageText.scrollFactor.set();
		add(messageText);

		descText = new FlxText(50, FlxG.height + offsetThing, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		add(descText);

		//bg.color = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		//intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = Math.exp(-elapsed * 12);
				/*if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					//item.screenCenter(X);
					item.x = FlxMath.lerp(item.x - 70, lastX, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(200 + -40 * Math.abs(item.targetY), item.x, lerpVal);
				}*/
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;  //desc text
	var move2Tween:FlxTween = null; //message text
	var move3Tween:FlxTween = null; //message image
	var roblox:FlxTween;			//los pana'

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do
		{
			curSelected = FlxMath.wrap(curSelected + change, 0, creditsStuff.length - 1);
		}
		while(unselectableCheck(curSelected));

		for (num => item in grpOptions.members)
		{
			item.targetY = num - curSelected;
			if(!unselectableCheck(num)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		trace(curSelected);
		switch (curSelected) 
		{
			case 1 | 2 | 12 | 13 | 22: 	//zozer, iseta, teeth, alex neitor y grey
				chavoX = 450;
				chavoY = 0;
			case 16 | 5:    	  	//demian y rush
				chavoX = 450;
				chavoY = 0;
			case 18:				//farsy
				chavoX = 525;
				chavoY = -5;
			case 19: 				//andree
				chavoX = 475;
				chavoY = 25;
			case 21:    			//meloXD
				chavoX = 400;
				chavoY = -25;
			default:				//offset normal
				chavoX = 500;
				chavoY = 25;
		}

		if(roblox != null) roblox.cancel();

		chavorrucos.setPosition(chavoX, chavoY);

		new FlxTimer().start(0.05, function (tmr:FlxTimer) {
			if (!Paths.fileExists('images/menu/creditos/maurice-dibujos/${creditsStuff[curSelected][1]}' + '.png', IMAGE, true))  chavorrucos.loadGraphic(Paths.image('menu/creditos/maurice-dibujos/nothing'));
			else	chavorrucos.loadGraphic(Paths.image('menu/creditos/maurice-dibujos/${creditsStuff[curSelected][1]}'));
		});

		roblox = FlxTween.tween(chavorrucos,{x: chavoX + 50},0.15,{ease:FlxEase.cubeIn,onComplete: function(twn:FlxTween)
			{
				roblox = FlxTween.tween(chavorrucos, {x : chavoX, y: chavoY}, 0.25, {ease: FlxEase.cubeOut});
			}
		});

		if (!Paths.fileExists('images/menu/creditos/maurice-dibujos/${creditsStuff[curSelected][1]}' + '.png', IMAGE, true))  chavorrucos.loadGraphic(Paths.image('menu/creditos/maurice-dibujos/nothing'));
		else	chavorrucos.loadGraphic(Paths.image('menu/creditos/maurice-dibujos/${creditsStuff[curSelected][1]}'));

		descText.text = creditsStuff[curSelected][2];
		messageText.text = creditsStuff[curSelected][4];
		if(descText.text.trim().length > 0)
		{
			descText.visible = true;
			descText.y = FlxG.height - descText.height + offsetThing - 20;
	
			if(moveTween != null) moveTween.cancel();
			moveTween = FlxTween.tween(descText, {y : descText.y + 35}, 0.25, {ease: FlxEase.sineOut});
		}
		else descText.visible = false;
		if(messageText.text.trim().length > 0)
			{
				messageText.visible = true;
				messageText.y = 0;
		
				if(move2Tween != null) move2Tween.cancel();
				switch (curSelected) {
					case 5 | 10 | 11 | 14 | 21: //los pendejos que tienen 2 lineas de mensajes (no encontre una mejor solucion)
						move2Tween = FlxTween.tween(messageText, {y : messageText.y + 15}, 0.25, {ease: FlxEase.sineOut});
					case 18:	//farsy
						move2Tween = FlxTween.tween(messageText, {y : messageText.y}, 0.25, {ease: FlxEase.sineOut});
					default:
						move2Tween = FlxTween.tween(messageText, {y : messageText.y + 25}, 0.25, {ease: FlxEase.sineOut});
				}
			}
		else messageText.visible = false;
		if (creditsStuff[curSelected][5] == "true")
		{
			messageImg.loadGraphic(Paths.image('menu/creditos/special-stuff/${creditsStuff[curSelected][1]} image'));

			messageImg.visible = true;
			switch (curSelected) {
				case 13: //teeth
					messageImg.screenCenter();
					messageImg.y = -80;
					messageImg.scale.set(0.7, 0.35);
				case 15: //kuku
					messageImg.x = 300;
					messageImg.y = -225;
					messageImg.scale.set(0.7, 0.1);
			}
		
			if(move3Tween != null) move3Tween.cancel();
			move3Tween = FlxTween.tween(messageImg, {y : messageImg.y + 25}, 0.25, {ease: FlxEase.sineOut});
		}
		else messageImg.visible = false;
	}

	#if MODS_ALLOWED
	function pushModCreditsToList(folder:String)
	{
		var creditsFile:String = Paths.mods(folder + '/data/credits.txt');
		
		#if TRANSLATIONS_ALLOWED
		//trace('/data/credits-${ClientPrefs.data.language}.txt');
		var translatedCredits:String = Paths.mods(folder + '/data/credits-${ClientPrefs.data.language}.txt');
		#end

		if (#if TRANSLATIONS_ALLOWED (FileSystem.exists(translatedCredits) && (creditsFile = translatedCredits) == translatedCredits) || #end FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
	}
	#end

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}

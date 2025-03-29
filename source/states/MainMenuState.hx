package states;

import flixel.FlxObject;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;
import backend.Song;

enum MainMenuColumn {
	LEFT;
	CENTER;
	RIGHT;
}

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '1.0.2h'; // This is also used for Discord RPC
	public static var curSelected:Int = 0;
	public static var curColumn:MainMenuColumn = CENTER;
	var allowMouse:Bool = true; //Turn this off to block mouse movement in menus

	var menuItems:FlxTypedGroup<FlxSprite>;

	//used stuff
	var bg:FlxSprite;
	var maurice:FlxSprite;
	var logo:FlxSprite;

	var optionShit:Array<String> = [
		'trash', 	//freeplay
		'gallery',  //now gallery, soon gallery
		'credits',  //guess
		'options',  //creditos
	];
	
	public static var comingFromTitle:Bool = false;
	var menuX:Int;

	static var showOutdatedWarning:Bool = true;
	override function create()
	{
		super.create();

		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = persistentDraw = true;

		bg = new FlxSprite().loadGraphic(Paths.image('menu/bg'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.screenCenter();
		add(bg);

		var patron = new FlxBackdrop(Paths.image('menu/patron_zozer'));
		patron.setGraphicSize(Std.int(patron.width * 0.5));
		patron.scrollFactor.set();
		patron.velocity.set(-80, -80);
		add(patron);

		maurice = new FlxSprite(50, 675); //125
		maurice.frames = Paths.getSparrowAtlas('menu/mainmenu/menuidle' + FlxG.random.int(1, 5));
		maurice.antialiasing = ClientPrefs.data.antialiasing;
		maurice.animation.addByPrefix('idle', 'maurice', 24, true); //nothing
		maurice.animation.play('idle');
		add(maurice);	

		for (num in 1...4) {
			var barra = new FlxSprite(0, 0).loadGraphic(Paths.image('menu/title/bar$num'));
			barra.antialiasing = ClientPrefs.data.antialiasing;
			barra.screenCenter();
			add(barra);
			switch (num) {
				case 1: barra.y = 50; 	//barra de abajo
				case 2:	barra.y = 9999;  //barra de arriba
				case 3: barra.y = -50;  //barra del medio
			}
		}

		logo = new FlxSprite(-280, -125);
		logo.frames = Paths.getSparrowAtlas('menu/logo');
		logo.antialiasing = ClientPrefs.data.antialiasing;
		logo.animation.addByPrefix('idle', 'logo bumpin', 24, true); //nothing
		logo.animation.play('idle');
		logo.scale.set(0.3, 0.3);
		add(logo);	

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		if (comingFromTitle) {
			menuX = 1950;
			FlxTween.tween(maurice, {y: 190}, 1.5, {ease: FlxEase.expoIn});
		}
		else {
			menuX = 550;
			maurice.y = 190;
		}

		for (num => option in optionShit)
		{
			var item:FlxSprite = createMenuItem(option, menuX, (num * 140) + 10, comingFromTitle);
			item.y += (4 - optionShit.length) * 70; // Offsets for when you have anything other than 4 items
			switch (num) {
				case 1: item.y += 25;
			}
		}
		changeItem();

		addTouchPad('UP_DOWN', 'A_B');

		#if ACHIEVEMENTS_ALLOWED
		// Unlocks "Freaky on a Friday Night" achievement if it's a Friday and between 18:00 PM and 23:59 PM
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18)
			Achievements.unlock('friday_night_play');

		#if MODS_ALLOWED
		Achievements.reloadList();
		#end
		#end

		#if CHECK_FOR_UPDATES
		if (showOutdatedWarning && ClientPrefs.data.checkForUpdates && substates.OutdatedSubState.updateVersion != psychEngineVersion) {
			persistentUpdate = false;
			showOutdatedWarning = false;
			openSubState(new substates.OutdatedSubState());
		}
		#end
	}

	function createMenuItem(name:String, x:Float, y:Float, doIntroTween:Bool):FlxSprite
	{
		var menuItem:FlxSprite = new FlxSprite(x, y);
		menuItem.frames = Paths.getSparrowAtlas('menu/mainmenu/menu_$name');
		menuItem.animation.addByPrefix('idle', '$name Unselect', 24, true);
		menuItem.animation.addByPrefix('selected', '$name Select', 24, true);
		menuItem.animation.play('idle');
		menuItem.updateHitbox();
		
		menuItem.antialiasing = ClientPrefs.data.antialiasing;
		menuItem.scrollFactor.set();
		if (doIntroTween) {
			menuItem.x = 1993;
			FlxTween.tween(menuItem, {x: 550}, 1.5, {ease: FlxEase.bounceIn});
		}
		menuItems.add(menuItem);
		menuItem.setGraphicSize(Std.int(menuItem.width * 0.7));
		return menuItem;

		
	}

	var selectedSomethin:Bool = false;

	var timeNotMoving:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.F1)	MusicBeatState.switchState(new FreeplayState());
		else if (FlxG.keys.justPressed.F2)	MusicBeatState.switchState(new CreditsState());
		else if (FlxG.keys.justPressed.F3)	{
			MusicBeatState.switchState(new OptionsState());
			OptionsState.onPlayState = false;
			if (PlayState.SONG != null)
			{
				PlayState.SONG.arrowSkin = null;
				PlayState.SONG.splashSkin = null;
				PlayState.stageUI = 'normal';
			}
		}

		if (FlxG.sound.music.volume < 0.8)
			FlxG.sound.music.volume = Math.min(FlxG.sound.music.volume + 0.5 * elapsed, 0.8);

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
				changeItem(-1);

			if (controls.UI_DOWN_P)
				changeItem(1);

			var allowMouse:Bool = allowMouse;
			if (allowMouse && ((FlxG.mouse.deltaScreenX != 0 && FlxG.mouse.deltaScreenY != 0) || FlxG.mouse.justPressed)) //FlxG.mouse.deltaScreenX/Y checks is more accurate than FlxG.mouse.justMoved
			{
				allowMouse = false;
				FlxG.mouse.visible = true;
				timeNotMoving = 0;

				var selectedItem:FlxSprite;
				switch(curColumn)
				{
					case CENTER:
						selectedItem = menuItems.members[curSelected];
					case LEFT:
						selectedItem = menuItems.members[curSelected];
					case RIGHT:
						selectedItem = menuItems.members[curSelected];
				}
				var dist:Float = -1;
				var distItem:Int = -1;
				for (i in 0...optionShit.length)
				{
					var memb:FlxSprite = menuItems.members[i];
					if(FlxG.mouse.overlaps(memb))
					{
						var distance:Float = Math.sqrt(Math.pow(memb.getGraphicMidpoint().x - FlxG.mouse.screenX, 2) + Math.pow(memb.getGraphicMidpoint().y - FlxG.mouse.screenY, 2));
						if (dist < 0 || distance < dist)
						{
							dist = distance;
							distItem = i;
							allowMouse = true;
						}
					}
				}

				if(distItem != -1 && selectedItem != menuItems.members[distItem])
				{
					curColumn = CENTER;
					curSelected = distItem;
					changeItem();
				}
			
			}
			else
			{
				timeNotMoving += elapsed;
				if(timeNotMoving > 2) FlxG.mouse.visible = false;
			}

			switch(curColumn)
			{
				case CENTER:
					if(controls.UI_LEFT_P)
					{
						curColumn = CENTER;
						changeItem(0, false);
					}
					else if(controls.UI_RIGHT_P)
					{
						curColumn = CENTER;
						changeItem(0, false);
					}
				default:
					if(controls.UI_LEFT_P)
					{
						curColumn = CENTER;
						changeItem();
					}
					else if(controls.UI_RIGHT_P)
					{
						curColumn = CENTER;
						changeItem();
					}
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.mouse.visible = false;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT || (FlxG.mouse.justPressed && allowMouse))
			{
				if (comingFromTitle) comingFromTitle = false;
				FlxG.sound.play(Paths.sound('confirmMenu'));
				selectedSomethin = true;
				FlxG.mouse.visible = false;

				var item:FlxSprite;
				var option:String;
				option = optionShit[curSelected];
				item = menuItems.members[curSelected];

				switch (option)
				{
					case 'trash':
						MusicBeatState.switchState(new FreeplayState());
					case 'gallery':
						trace(Mods.currentModDirectory);
						Mods.currentModDirectory = "Trashgallery";

						Song.loadFromJson("gallery", "gallery");
						PlayState.isStoryMode = false;
						PlayState.storyDifficulty = 1;

						MusicBeatState.switchState(new PlayState());
					case 'credits':
						MusicBeatState.switchState(new CreditsState());
					case 'options':
						MusicBeatState.switchState(new OptionsState());
						OptionsState.onPlayState = false;
						if (PlayState.SONG != null)
						{
							PlayState.SONG.arrowSkin = null;
							PlayState.SONG.splashSkin = null;
							PlayState.stageUI = 'normal';
						}
					default:
						FlxTransitionableState.skipNextTransIn = true;
						FlxTransitionableState.skipNextTransOut = true;
						FlxG.switchState(new Screamer());
				};
				
				for (memb in menuItems)
				{
					if(memb == item)
						continue;

					FlxTween.tween(memb, {alpha: 0}, 0.4, {ease: FlxEase.quadOut});
				}
			}
			/*#if desktop
			if (controls.justPressed('debug_1'))
			{
				selectedSomethin = true;
				FlxG.mouse.visible = false;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end*/
		}

		super.update(elapsed);
	}

	function changeItem(change:Int = 0, playSound:Bool = true)
	{
		if(change != 0) curColumn = CENTER;
		curSelected = FlxMath.wrap(curSelected + change, 0, optionShit.length - 1);
		if (playSound) FlxG.sound.play(Paths.sound('scrollMenu'));

		menuItems.members[curSelected].animation.play('idle');
		for (item in menuItems)
		{
			item.animation.play('idle');
			item.centerOffsets();
		}

		var selectedItem:FlxSprite;
		switch(curColumn)
		{
			case CENTER:
				selectedItem = menuItems.members[curSelected];
			case LEFT:
				selectedItem = menuItems.members[curSelected];
			case RIGHT:
				selectedItem = menuItems.members[curSelected];
		}
		menuItems.members[curSelected].animation.play('selected');
		selectedItem.animation.play('selected');
		selectedItem.centerOffsets();
	}

	override function beatHit()
	{
		super.beatHit();
		if(logo != null)	logo.animation.play('bump', true);
	}
}


package states;

class Screamer extends MusicBeatState
{
    var volume:Float = FlxG.sound.volume;
    override public function create():Void
    {
        var funkintrashcan = new FlxSprite().loadGraphic(Paths.image('menu/FUNKINTRASHCAN'));
        funkintrashcan.antialiasing = ClientPrefs.data.antialiasing;
        funkintrashcan.screenCenter();
        add(funkintrashcan);

        FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

        FlxG.sound.volume = 100;
        FlxG.sound.play(Paths.sound('youtube_cOE8wOT6KUA_audio'), 10);

        new FlxTimer().start(1.25, function(tmr:FlxTimer)
            {
                FlxTransitionableState.skipNextTransIn = true;
                FlxTransitionableState.skipNextTransOut = true;
                FlxG.switchState(new MainMenuState());

                FlxG.sound.volume = volume;
            });
    }
}


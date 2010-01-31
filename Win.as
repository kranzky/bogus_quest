package  
{
	import punk.core.World;

	public class Win extends World
	{
		[Embed(source = 'data/win.png')] private var ImgWin:Class;
		[Embed(source = 'data/chord.mp3')] private const SndCrash:Class;
		[Embed(source = 'data/crash.png')] private var ImgCrash:Class;

		internal var _count:int = 0;

		public function Win() 
		{
		}	
		
		override public function init():void
		{
		}

		override public function update():void
		{
			_count += 1;
			if ( _count > 400 )
			{
				Main.reset();
				FP.goto = new Rocket();
			}
			if ( _count == 280 )
			{
				FP.musicStop();
			}
			if ( _count == 300 )
			{
				FP.play( SndCrash );
			}
		}

		override public function render():void
		{
			drawSprite( FP.getSprite( ImgWin, 320, 240 ) );
			if ( _count > 300 )
			{
				drawSprite( FP.getSprite( ImgCrash, 285, 146 ), 0, 17, 47 );
			}
		}
	}
}
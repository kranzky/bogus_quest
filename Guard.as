package  
{
	import punk.core.SpriteMap;
	public class Guard extends BaseWall
	{
		[Embed(source = 'data/guard.png')] private var ImgGuard:Class;
		[Embed(source = 'data/bubble10.png')] private var ImgBubble1:Class;
		[Embed(source = 'data/bubble11.png')] private var ImgBubble2:Class;
		[Embed(source = 'data/speech.mp3')] private const SndSpeech:Class;
		
		internal var _bitmap:Class;
		internal var _counter:int = 0;
		internal var _dx:Number = 0.0;
		internal var _dy:Number = 0.0;

		public function Guard() 
		{
			super( "Guard", ImgGuard, 32, 32 );
			active = true;
			delay = 7;
		}

		override public function render():void
		{
			super.render();
			var sprite:SpriteMap = FP.getSprite( _bitmap, 200, 60, false, false, 100, 30 );
			drawSprite( sprite, 0, 220, 30 );
		}
		
		override public function update():void
		{
			super.update();
			if ( Main.paused )
			{
				return;
			}
			if ( Main.player.x > 144  )
			{
				if ( _bitmap != ImgBubble2 )
				{
					FP.play( SndSpeech );
				}
				_bitmap = ImgBubble2;
			}
			else
			{
				if ( _bitmap != ImgBubble1 )
				{
					FP.play( SndSpeech );
				}
				_bitmap = ImgBubble1;
			}
			if ( collideWith( Main.player.shadow, x, y ) && Main.player.hasGrog )
			{
				Main.player.hasGrog = false;
				FP.goto = new Death();
			}
		}
	}
}
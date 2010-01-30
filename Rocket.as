package  
{
	import punk.core.World;

	public class Rocket extends World
	{
		[Embed(source = 'data/music.mp3')] private const SndMusic:Class;
		[Embed(source = 'data/rocket.png')] private var ImgRocket:Class;
		[Embed(source = 'data/kranzky.png')] private var ImgKranzky:Class;

		internal var _name:String = "Rocket";
		internal var _count:int = 0;
		
		public function Rocket() 
		{
			trace( "Construct: " + _name );			
		}	
		
		override public function init():void
		{
			trace( "Init: " + _name );	
		}

		override public function update():void
		{
			if ( _count == 200 )
			{
				FP.goto = new Room1();
				FP.musicVolume = 0.3;
				FP.musicPlay( SndMusic );
			}
			_count += 1;
		}

		override public function render():void
		{
			if ( _count > 180 )
			{
				return;
			}
			if ( _count <= 90 )
			{
				drawSprite( FP.getSprite( ImgRocket, 320, 240 ) );
			}
			else
			{
				drawSprite( FP.getSprite( ImgKranzky, 320, 240 ) );
			}
			if ( _count < 30 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (30 - _count ) / 30 );
			}
			if ( _count > 60 && _count <= 90 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (_count - 60) / 30 );
			}
			if ( _count > 90 && _count < 120 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (120 - _count) / 30 );
			}
			if ( _count > 150 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (_count - 150) / 30 );
			}
		}
	}
}
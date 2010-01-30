package  
{
	import punk.core.World;

	public class Rocket extends World
	{
				// music by Little Scale
		[Embed(source = 'data/music1.mp3')] private const SndMusic:Class;
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
			if ( _count == 550 )
			{
				FP.goto = new Room1();
			}
			if ( _count == 500 )
			{
				FP.musicPlay( SndMusic );
			}
			if ( _count == 200 )
			{
				var credits:CreditText = new CreditText();
				credits.delay = 60;
				credits.y = 110;
				credits.text.push( "RocketHands Presents" );
				credits.text.push( "a Kranzky Brothers Production" );
				credits.text.push( "made for Global Game Jam 2010" );
				add( credits );
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
				FP.screen.drawClear( 0xFF000000, (30 - _count ) / 30 );
			}
			if ( _count > 60 && _count <= 90 )
			{
				FP.screen.drawClear( 0xFF000000, (_count - 60) / 30 );
			}
			if ( _count > 90 && _count < 120 )
			{
				FP.screen.drawClear( 0xFF000000, (120 - _count) / 30 );
			}
			if ( _count > 150 )
			{
				FP.screen.drawClear( 0xFF000000, (_count - 150) / 30 );
			}
		}
	}
}
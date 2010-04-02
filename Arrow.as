package  
{
	import punk.Acrobat;

	public class Arrow extends Acrobat
	{		
		[Embed(source = 'data/arrow.png')] private var ImgArrow:Class;
		[Embed(source = 'data/red_key.png')] private var ImgKey:Class;
		[Embed(source = 'data/key.mp3')] private const SndKey:Class;
		
		public function Arrow() 
		{
			sprite = FP.getSprite( ImgArrow, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "arrow" );
		}
		
		override public function update():void
		{
			if ( Main.paused )
			{
				return;
			}
			var room:BaseRoom = FP.world as BaseRoom;
			
			x += 7;
			
			if ( Main.state >= 13 )
			{
				sprite = FP.getSprite( ImgKey, 32, 32, false, false, 16, 16 );
				if ( collideWith( Main.player, x, y ) )
				{
					FP.play( SndKey, 0.7 );
					FP.world.remove( this );
					Main.player.hasRedKey = true;
				}
			}
			else
			{
				sprite = FP.getSprite( ImgArrow, 32, 32, false, false, 16, 16 );
				if ( collideWith( Main.player, x, y ) )
				{
					FP.world.remove( this );
					FP.goto = new Death( "The arrow hit your face." );
				}
			}

			if ( x > 300 )
			{
				FP.world.remove( this );
			}
		}
	}
}
package  
{
	import punk.Acrobat;

	public class Grog extends Acrobat
	{		
		[Embed(source = 'data/grog.png')] private var ImgGrog:Class;
		
		public function Grog() 
		{
			sprite = FP.getSprite( ImgGrog, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "grog" );
		}
		
		override public function update():void
		{
			if ( Main.paused )
			{
				return;
			}
			var room:BaseRoom = FP.world as BaseRoom;
			
			if ( collideWith( Main.player, x, y ) && ! Main.player.hasGrog && Main.player.y > y )
			{
				FP.world.remove( this );
				Main.player.hasGrog = true;
			}
		}
	}
}
package  
{
	import punk.Acrobat;

	public class GoldKey extends Acrobat
	{		
		[Embed(source = 'data/key.png')] private var ImgKey:Class;
		
		public function GoldKey() 
		{
			sprite = FP.getSprite( ImgKey, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "key" );
		}
		
		override public function update():void
		{
			if ( collideWith( Main.player, x, y ) && ! Main.player.hasKey )
			{
				FP.world.remove( this );
				Main.player.hasKey = true;
				var room:BaseRoom = FP.world as BaseRoom;
				if ( room is Room4 )
				{
					Main.player.usedKey1 = true;
				}
			}
		}
	}
}
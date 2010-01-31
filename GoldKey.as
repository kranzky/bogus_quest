package  
{
	import punk.Acrobat;

	public class GoldKey extends Acrobat
	{		
		[Embed(source = 'data/key.png')] private var ImgKey:Class;
		
		internal var _dx:Number = 0.0;
		internal var _dy:Number = 0.0;

		public function GoldKey() 
		{
			sprite = FP.getSprite( ImgKey, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "key" );
		}
		
		override public function update():void
		{
			var room:BaseRoom = FP.world as BaseRoom;

			if ( collideWith( Main.player, x, y ) && ! Main.player.hasKey )
			{
				FP.world.remove( this );
				Main.player.hasKey = true;
				if ( room is Room4 )
				{
					Main.player.usedKey1 = true;
				}
				if ( room is Room9 )
				{
					Main.player.usedKey2 = true;
				}
			}
			
			if ( room is Room4 )
			{
				return;
			}
			
			var tx:int = 0;
			if ( Main.player.x < 160 )
			{
				tx = 320;
			}
			var ty:int = 0;
			if ( Main.player.y < 120 )
			{
				ty = 240;
			}
			_dx += ( tx - x ) / Math.max( 30, Math.abs( x - Main.player.x ) );
			_dy += ( ty - y ) / Math.max( 30, Math.abs( y - Main.player.y ) );
			
			// bounce of walls
			if ( collide( "wall", x + _dx, y ) ||
				 collide( "door", x + _dx, y ) ||
				 collide( "gem", x + _dx, y ) ||
				 collide( "portal", x + _dx, y )  )
			{
				_dx *= -1
			}
			if ( collide( "wall", x, y + _dy ) ||
			     collide( "door", x, y + _dy ) ||
				 collide( "gem", x, y + _dy ) ||
				 collide( "portal", x, y + _dy ) )
			{
				_dy *= -1;
			}
			// move
			x += _dx;
			y += _dy;
			if ( Math.abs( _dx ) > Math.abs( _dy ) )
			{
				_dy = 0;
			}
			else
			{
				_dx = 0;
			}			
			// slow down over time
			_dx *= 0.4;
			_dy *= 0.4;
		}
	}
}
package  
{
	import Math;
	import punk.Actor;
	import punk.util.Input;
	import punk.util.Key;
	
	public class Player extends Actor
	{		
		[Embed(source = 'data/player.png')] private var ImgPlayer:Class;

		internal var _dx:Number = 0.0;
		internal var _dy:Number = 0.0;
		internal var _accel:Number = 0.5;
		
		public function Player() 
		{
			sprite = FP.getSprite( ImgPlayer, 32, 32, true, false, 16, 16 );
			setCollisionMask( sprite.getImage() );

			x = 160;
			y = 120;
			delay = 0;
			
			Input.define( "right", Key.RIGHT, Key.D );
			Input.define( "left", Key.LEFT, Key.A );
			Input.define( "up", Key.UP, Key.W );
			Input.define( "down", Key.DOWN, Key.S );
		}
		
		override public function update():void
		{
			if ( collide("wall", x + _dx, y ) )
			{
				_dx *= -1;
				x += _dx;
				return;
			}
			if ( collide("wall", x, y + _dy ) )
			{
				_dy *= -1;
				y += _dy;
				return;
			}
			if ( x + _dx < sprite.imageW * 0.5 )
			{
				_dx *= -1;
				x += _dx;
				return;
			}
			if ( x + _dx > 320 - sprite.imageW * 0.5 )
			{
				_dx *= -1;
				x += _dx;
				return;
			}
			if ( y + _dy < sprite.imageH * 0.5 )
			{
				_dy *= -1;
				y += _dy;
				return;
			}
			if ( y + _dy > 240 - sprite.imageH * 0.5 )
			{
				_dy *= -1;
				y += _dy;
				return;
			}
			x += _dx;
			y += _dy;
			if (Input.check("right"))
			{
				_dx += _accel;
				flipX = true;
			}
			if (Input.check("left"))
			{
				_dx -= _accel;
				flipX = false;
			}
			if (Input.check("up")) _dy -= _accel;
			if (Input.check("down")) _dy += _accel;
			_dx *= 0.8;
			_dy *= 0.8;
			loop = Math.abs( _dx ) > 0.5;
			delay = Math.abs( _dx ) * 4;
		}
	}
}
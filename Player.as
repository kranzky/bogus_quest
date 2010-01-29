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
		
		public function Player() 
		{
			sprite = FP.getSprite(ImgPlayer, 32, 32, true, false, 16, 16);
			x = 160;
			y = 120;
			delay = 0;
			setCollisionRect(32, 32);
			
			Input.define("right", Key.RIGHT);
			Input.define("left", Key.LEFT);
			Input.define("up", Key.UP);
			Input.define("down", Key.DOWN);
		}
		
		override public function update():void
		{
			if ( collide("coin", x + _dx, y ) )
			{
				_dx *= -1;
				x += _dx;
				return;
			}
			if ( collide("coin", x, y + _dy ) )
			{
				_dy *= -1;
				y += _dy;
				return;
			}
			x += _dx;
			y += _dy;
			if (Input.check("right"))
			{
				_dx += 1.0;
				flipX = true;
			}
			if (Input.check("left"))
			{
				_dx -= 1.0;
				flipX = false;
			}
			if (Input.check("up")) _dy -= 1.0;
			if (Input.check("down")) _dy += 1.0;
			_dx *= 0.8;
			_dy *= 0.8;
			loop = Math.abs( _dx ) > 0.5;
			delay = int( Math.abs( _dx ) * 2 );
		}
	}
}
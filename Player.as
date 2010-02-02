package  
{
	import Math;
	import punk.Acrobat;
	import punk.util.Input;
	import punk.util.Key;
	import punk.core.World;
	import punk.core.Entity;
	
	public class Player extends Acrobat
	{		
		[Embed(source = 'data/player_left.png')] private var ImgPlayerLeft:Class;
		[Embed(source = 'data/player_up.png')] private var ImgPlayerUp:Class;
		[Embed(source = 'data/player_down.png')] private var ImgPlayerDown:Class;
		[Embed(source = 'data/player_tumble.png')] private var ImgPlayerTumble:Class;

		internal var _dx:Number = 0.0;
		internal var _dy:Number = 0.0;
		internal var _da:Number = 0.0;
		internal var _accel:Number = 0.5;
		
		public var teleporting:Boolean = false;
		public var tumbling:Boolean = false;
		public var falling:Boolean = false;
		public var hasKey:Boolean = false;
		public var usedKey1:Boolean = false;
		public var usedKey2:Boolean = false;
		public var shadow:Shadow;
		
		public function Player() 
		{
			sprite = FP.getSprite( ImgPlayerLeft, 32, 32, true, false, 16, 16 );
			setCollisionMask( sprite.getImage() );

			Input.define( "right", Key.RIGHT, Key.D );
			Input.define( "left", Key.LEFT, Key.A );
			Input.define( "up", Key.UP, Key.W );
			Input.define( "down", Key.DOWN, Key.S );
			
			reset();
		}
		
		override public function collide(type:String, x:int, y:int):Entity
		{
			return shadow.collide( type, x, y );
		}
		
		public function teleport( room1:Class, room2:Class ):void
		{
			_dx = 0;
			_dy = 0;
			if ( room1 == Room3 && room2 == Death )
			{
				if ( Main.state < 2 )
				{
					Main.state = 2;
				}
			}
		}
		
		public function reset():void
		{
			x = 140;
			y = 112;
			delay = 0;
			falling = false;
			if ( tumbling )
			{
				y = -250;
				falling = true;
			}
			tumbling = false;
			depth = 2;
			_dx = 0;
			_dy = 0;
		}
		override public function update():void
		{
			var room:BaseRoom = FP.world as BaseRoom;
			
			// bounce of walls
			var portal:Portal = shadow.collide( "portal", x + _dx, y ) as Portal;
			if ( ! falling && ( shadow.collide( "wall", x + _dx, y ) || portal && portal.locked ) )
			{
				_dx *= -1;
			}
			portal = shadow.collide( "portal", x, y + _dy ) as Portal;
			if ( ! falling && ( shadow.collide( "wall", x, y + _dy ) || portal && portal.locked ) )
			{
				_dy *= -1;
			}
			if ( falling && y > 114 )
			{
				_dy *= -1;
			}
			// collide or pass through screen bounds
			if ( ! falling && ! room.wrapLeft && x + _dx < sprite.imageW * 0.5 )
			{
				x = sprite.imageW * 0.5;
				_dx *= -1;
			}
			else if ( ! falling && room.wrapLeft && x + _dx < -sprite.imageW * 0.5 )
			{
				x = 320 + sprite.imageW * 0.5;
			}
			if ( ! falling && ! room.wrapRight && x + _dx > 320 - sprite.imageW * 0.5 )
			{
				x = 320 - sprite.imageW * 0.5;
				_dx *= -1;
			}
			else if ( ! falling && room.wrapRight && x + _dx > 320 + sprite.imageW * 0.5 )
			{
				x = - sprite.imageW * 0.5;
			}
			if ( ! falling && ! room.wrapTop && y + _dy < sprite.imageH * 0.5 )
			{
				y = sprite.imageH * 0.5;
				_dy *= -1;
			}
			else if ( ! falling && room.wrapTop && y + _dy < - sprite.imageH * 0.5 )
			{
				y = 224 + sprite.imageW * 0.5;
			}
			if ( ! falling && ! room.wrapBottom && y + _dy > 224 - sprite.imageH * 0.5 )
			{
				y = 224 - sprite.imageH * 0.5;
				_dy *= -1;
			}
			else if ( ! falling && room.wrapBottom && y + _dy > 224 + sprite.imageH * 0.5 )
			{
				y = - sprite.imageW * 0.5;
			}
			// move
			x += _dx;
			y += _dy;
			angle += _da;
			shadow.visible = ! tumbling;
			shadow.x = x;
			shadow.y = falling ? 110 : y + 4;
			
			if ( Main.lock && x > 80 && x < 240 && y > 80 && y < 160 )
			{
				Main.lock.locked = true;
				Main.lock = null;
			}

			if ( tumbling )
			{
				_dx += Math.random() * 0.5 - Math.random() * 0.5;
				_dy += Math.random() * 0.5 - Math.random() * 0.5;
				_da += Math.random() * 3 - Math.random() * 3;
				sprite = FP.getSprite( ImgPlayerTumble, 32, 32, true, true, 16, 16 );
				return;
			}
			else if ( falling )
			{
				sprite = FP.getSprite( ImgPlayerTumble, 32, 32, true, true, 16, 16 );
				_dy += 0.6;
				_dx *= 0.93;
				_dy *= 0.93;
				angle = 0;
				_da = 0;
				falling = Math.abs( _dy ) > 0.1;
				if ( ! falling )
				{
					sprite = FP.getSprite( ImgPlayerLeft, 32, 32, true, false, 16, 16 );
					flipY = false;
				}
			}
			else
			{
				angle = 0;
				_da = 0;
			}
			// slow down over time
			if ( ! falling )
			{
				_dx *= 0.8;
				_dy *= 0.8;
			}
			// player input
			if ( ! falling && Input.check("right"))
			{
				sprite = FP.getSprite( ImgPlayerLeft, 32, 32, true, false, 16, 16 );
				if ( teleporting && x > 160 + 80 )
				{
					teleporting = false;
				}
				_dx += _accel;
				flipX = true;
			}
			if ( ! falling && Input.check("left"))
			{
				sprite = FP.getSprite( ImgPlayerLeft, 32, 32, true, false, 16, 16 );
				if ( teleporting && x < 160 - 80 )
				{
					teleporting = false;
				}
				_dx -= _accel;
				flipX = false;
			}
			if ( ! falling && Input.check("up"))
			{
				sprite = FP.getSprite( ImgPlayerUp, 32, 32, false, false, 16, 16 );
				if ( teleporting && y < 120 - 60 )
				{
					teleporting = false;
				}
				_dy -= _accel;
				flipX = false;
			}
			if ( ! falling && Input.check("down"))
			{
				sprite = FP.getSprite( ImgPlayerDown, 32, 32, false, false, 16, 16 );
				if ( teleporting && y > 120 + 60 )
				{
					teleporting = false;
				}
				_dy += _accel;
				flipX = false;
			}
			if ( Main.state > 9 && Main.state < 13 )
			{
				_dy = 0;
				_dx = 0;
			}
			// animate based on speed
			var speed:Number = Math.abs( _dx ) + Math.abs( _dy );
			delay = 10 - speed;
			if ( delay < 0 || speed < 1.0 )
			{
				delay = 0;
				image = 1;
			}
		}
	}
}

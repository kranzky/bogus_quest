package  
{
	import punk.core.SpriteMap;
	public class Boy extends BaseWall
	{
		[Embed(source = 'data/boy.png')] private var ImgBoy:Class;
		[Embed(source = 'data/louis.png')] private var ImgLouis:Class;
		[Embed(source = 'data/bubble1.png')] private var ImgBubble1:Class;
		[Embed(source = 'data/bubble2.png')] private var ImgBubble2:Class;
		[Embed(source = 'data/bubble3.png')] private var ImgBubble3:Class;
		[Embed(source = 'data/bubble4.png')] private var ImgBubble4:Class;
		[Embed(source = 'data/bubble5.png')] private var ImgBubble5:Class;
		[Embed(source = 'data/bubble6.png')] private var ImgBubble6:Class;
		[Embed(source = 'data/bubble7.png')] private var ImgBubble7:Class;
		
		internal var _bitmap:Class;
		internal var _counter:int = 0;
		internal var _dx:Number = 0.0;
		internal var _dy:Number = 0.0;

		public function Boy() 
		{
			super( "Boy", ImgBoy, 25, 34 );
			reset();
			active = true;
			setCollisionRect( 20, 16, 6, 16 );
		}

		override public function update():void
		{
			super.update();
			if ( Main.state < 9 )
			{
				return;
			}
			_counter += 1;	
			if ( Main.state == 10 && _counter > 300 )
			{
				Main.state = 11;
			}
			if ( Main.state == 11 && _counter > 500 )
			{
				Main.state = 12;
				sprite = FP.getSprite( ImgLouis, 25, 34, true, true, 12.5, 17 );
			}
			if ( Main.state == 11 )
			{
				sprite = FP.getSprite( ( Math.random() > ( _counter - 300 )/ 200.0 ) ? ImgBoy : ImgLouis, 25, 34, true, true, 12.5, 17 );
			}
			if ( Main.state == 12 && _counter > 800 )
			{
				Main.state = 13;
				Main.boss = true;
				Main.player.usedKey1 = false;
				Main.player.usedKey2 = false;
				Main.door1.locked = true;
				Main.door2.locked = true;
				Main.door3.locked = false;
				Main.player.hasKey = false;
			}
			reset();
			if ( Main.state < 13 )
			{
				return;
			}
			if ( collideWith( Main.player.shadow, x, y ) )
			{
				Main.state = 9;
				Main.player.usedKey1 = true;
				Main.player.usedKey2 = true;
				Main.door1.locked = false;
				Main.door2.locked = false;
				Main.player.hasKey = false;
				FP.goto = new Death();
				return;
			}
			_dx += ( Main.player.x - x ) * 0.015;
			_dy += ( Main.player.y - y ) * 0.015;
			
			// move
			x += _dx;
			y += _dy;
			// slow down over time
			_dx *= 0.6;
			_dy *= 0.6;
		}
		
		public function reset():void
		{
			if ( Main.state % 2 == 0 )
			{
				delay = 6;
				switch ( Main.state / 2 )
				{
					case 0: _bitmap = ImgBubble1; break;
					case 1: _bitmap = ImgBubble2; break;
					case 2: _bitmap = ImgBubble3; break;
					case 3: _bitmap = ImgBubble4; break;
					case 4: _bitmap = ImgBubble5; break;
					case 5: _bitmap = ImgBubble6; break;
					case 6: _bitmap = ImgBubble7; break;
				}
			}
			else
			{
				delay = 0;
				image = 0;
			}
			if ( Main.state == 13 )
			{
				sprite = FP.getSprite( ImgLouis, 25, 34, true, true, 12.5, 17 );
			}
		}
	
		override public function render():void
		{
			super.render();
			if ( delay == 0 )
			{
				return;
			}
			var sprite:SpriteMap = FP.getSprite( _bitmap, 200, 60, false, false, 100, 30 );
			if ( Main.state > 9 )
			{
				drawSprite( sprite, 0, 160, 60 );
			}
			else
			{
				drawSprite( sprite, 0, 260, 40 );
			}
		}
	}
}

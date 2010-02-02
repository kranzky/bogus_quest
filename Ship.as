package  
{
	import punk.core.SpriteMap;
	import flash.display.GraphicsPathWinding;
	public class Ship extends BaseWall
	{	
		[Embed(source = 'data/ship.png')] private var ImgShip:Class;
		[Embed(source = 'data/bubble8.png')] private var ImgBubble:Class;
				
		internal var _dy:Number = 0.0;
		internal var _x:int = 0;
		internal var _y:int = 0;
		
		public function Ship()
		{
			super( "Ship", ImgShip );
			scaleX = 3;
			scaleY = 3;
			depth = 3;
			setCollisionRect( 80, 32, -28, 32 );
			active = true;
		}
		
		override public function render():void
		{
			super.render();
			if ( Main.state == 15 )
			{
				var sprite:SpriteMap = FP.getSprite( ImgBubble, 200, 60, false, false, 100, 30 );
				this.depth = -1;
				drawSprite( sprite, 0, _x + 90, _y - 40 );
			}
		}
		override public function update():void
		{
			if ( ! Main.boss )
			{
				super.update();
			}
			if ( Main.state == 15 )
			{
				_dy -= 0.01;
				y += _dy;
				if ( y < -300 )
				{
					FP.goto = new Win();
				}
			}
			if ( Main.state != 13 )
			{
				return;
			}
			if ( Math.abs( Main.player.x - x ) < 50 &&
				 Math.abs( Main.player.y - y ) < 50 )
			{
				Main.player.visible = false;
				Main.player.active = false;
				Main.player.x = x;
				function kill( boy:Boy ):void
				{
					boy.active = false;
					boy.image = 1;
					_x = boy.x;
					_y = boy.y;
				}
				FP.world.withClass( Boy, kill );
				Main.state = 15;
			}
		}
	}
}
package  
{
	import punk.core.SpriteMap;
	public class Girl extends BaseWall
	{
		[Embed(source = 'data/girl.png')] private var ImgGirl:Class;
		[Embed(source = 'data/bubble9.png')] private var ImgBubble1:Class;
		[Embed(source = 'data/bubble0.png')] private var ImgBubble2:Class;
		
		internal var _bitmap:Class;
		internal var _counter:int = 0;
		internal var _dx:Number = 0.0;
		internal var _dy:Number = 0.0;

		public function Girl() 
		{
			super( "Girl", ImgGirl, 54, 86 );
			reset();
			active = true
			setCollisionRect( 50, 28, -10, 30 );
			depth = 1;
		}

		public function reset():void
		{
			if ( Main.player.hasKey )
			{
				_bitmap = ImgBubble2;
				delay = 5;
			}
			else
			{
				_bitmap = ImgBubble1;
				delay = 9;
			}
		}
	
		override public function render():void
		{
			super.render();
			var sprite:SpriteMap = FP.getSprite( _bitmap, 200, 60, false, false, 100, 30 );
			drawSprite( sprite, 0, 250, 40 );
		}
		
		override public function update():void
		{
			super.update();
			if ( Main.paused )
			{
				return;
			}
			if ( collideWith( Main.player.shadow, x, y ) && ( Main.player.hasKey || Main.player.hasRedKey ) )
			{
				if ( Main.player.hasRedKey )
				{
					Main.player.hasRedKey = false;
				}
				else
				{
					Main.player.usedKey1 = false;
					Main.player.hasKey = false;
				}
				FP.goto = new Death();
			}
		}
	}
}

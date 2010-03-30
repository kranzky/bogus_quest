package  
{
	import flash.display.GraphicsSolidFill;
	import punk.core.SpriteMap;
	public class Death extends BaseRoom
	{
		[Embed(source = 'data/deceived.png')] private var ImgDeceived:Class;
		[Embed(source = 'data/deceived.mp3')] private const SndDeceived:Class;

		internal var _count:int = 0;

		public function Death() 
		{
			super( "Death", 32599 );
		}
		
		override public function init():void
		{
			super.init();
			FP.play( SndDeceived );
		}
		
		override public function update():void
		{
			if ( Main.paused )
			{
				return;
			}
			_count += 1;
			if ( _count == 200 )
			{
				Main.player.reset();
				if ( Main.boss )
				{
					Main.state = 9;
					Main.player.usedKey1 = true;
					Main.player.usedKey2 = true;
					Main.unlockAll();
					Main.door1.locked = false;
					Main.door2.locked = false;
					Main.player.hasKey = false;
					Main.player.falling = false;
					FP.goto = new Boss();
				}
				else
				{
					FP.goto = new Room1();
				}
			}
		}
		
		override public function render():void
		{
			super.render();
			var sprite:SpriteMap = FP.getSprite( ImgDeceived, 200, 40, false, false, 100, 20 );
			drawSprite( sprite, 0, 160, 114 );
			if ( _count > 150 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (_count - 150 ) / 50 );
			}
		}
	}
}
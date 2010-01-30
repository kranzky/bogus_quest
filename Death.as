package  
{
	import flash.display.GraphicsSolidFill;
	import punk.core.SpriteMap;
	public class Death extends BaseRoom
	{
		[Embed(source = 'data/deceived.png')] private var ImgDeceived:Class;

		internal var _count:int = 0;

		public function Death() 
		{
			super( "Death", 32599 );
		}
		
		override public function init():void
		{
			super.init();
		}
		
		override public function update():void
		{
			_count += 1;
			if ( _count == 200 )
			{
				FP.goto = new Room1();
				Main.player.reset();
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
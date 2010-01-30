package  
{
	import punk.core.SpriteMap;
	public class Boy extends BaseWall
	{
		[Embed(source = 'data/boy.png')] private var ImgBoy:Class;
		[Embed(source = 'data/bubble1.png')] private var ImgBubble1:Class;
		[Embed(source = 'data/bubble2.png')] private var ImgBubble2:Class;
		
		internal var _bitmap:Class;

		public function Boy() 
		{
			super( "Boy", ImgBoy, 25, 34 );
			if ( Main.state % 2 == 0 )
			{
				delay = 6;
				switch ( Main.state / 2 )
				{
					case 0: _bitmap = ImgBubble1; break;
					case 1: _bitmap = ImgBubble2; break;
				}
			}
			else
			{
				delay = 0;
				image = 0;
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
			this.depth = -1;
			drawSprite( sprite, 0, 260, 40 );
		}
	}
}
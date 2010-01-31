package  
{
	import punk.core.World;

	public class Win extends World
	{
		[Embed(source = 'data/win.png')] private var ImgWin:Class;

		public function Win() 
		{
		}	
		
		override public function init():void
		{
		}

		override public function update():void
		{
		}

		override public function render():void
		{
			drawSprite( FP.getSprite( ImgWin, 320, 240 ) );
		}
	}
}
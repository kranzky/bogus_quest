package  
{
	import punk.TextPlus;
	
	public class DebugText extends TextPlus
	{
		public function DebugText() 
		{
			active = true;
			alpha = 0.2;
			x = 270;
			y = 226;
		}
		override public function update():void
		{
			var best:int = Main.best > 0 ? Main.best : Main.time;
			setString( int( best / 60 ) + " | " + int( Main.time / 60 ) );
		}
	}
}

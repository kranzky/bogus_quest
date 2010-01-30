package  
{
	import punk.TextPlus;
	
	public class DebugText extends TextPlus
	{
		public function DebugText() 
		{
			active = true;
			alpha = 0.2;
			x = 308;
			y = 226;
		}
		override public function update():void
		{
			setString( String( FP.engine.FPS ) );
		}
	}
}

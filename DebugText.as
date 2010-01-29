package  
{
	import punk.TextPlus;
	
	public class DebugText extends TextPlus
	{
		public function DebugText() 
		{
			active = true;
			alpha = 0.5;
			x = 310;
			y = 230;
		}
		override public function update():void
		{
			setString( String( FP.engine.FPS ) );
		}
	}
}
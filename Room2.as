package  
{
	public class Room2 extends BaseRoom
	{
		public function Room2() 
		{
			super( "Room2", 32598 );
			
			bushTop = true;
			bushLeft = true;
			bushRight = true;
			bushBottom = true;
		}
		
		override public function init():void
		{
			super.init();
			
			var sign:Sign;
			
			add( sign = new Sign( 2, true ) );
			sign.x = 90;
			sign.y = 112;
		}
	}
}
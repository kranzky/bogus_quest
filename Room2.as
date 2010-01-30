package  
{
	public class Room2 extends BaseRoom
	{
		public function Room2() 
		{
			super( "Room2", 32598 );
		}
		
		override public function init():void
		{
			super.init();
			
			var sign:Sign;
			
			add( sign = new Sign( 2, true ) );
			sign.x = 80;
			sign.y = 112;
		}
	}
}
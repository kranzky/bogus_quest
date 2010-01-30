package  
{
	public class Room5 extends BaseRoom
	{
		public function Room5() 
		{
			super( "Room5", 9213 );
		}
		
		override public function init():void
		{
			super.init();
			
			var sign:Sign;

			add( sign = new Sign( 1, true ) );
			sign.x = 110;
			sign.y = 50;
		}
	}
}
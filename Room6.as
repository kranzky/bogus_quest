package  
{
	public class Room6 extends BaseRoom
	{
		public function Room6() 
		{
			super( "Room6", 412492 );
		}
		
		override public function init():void
		{
			super.init();

			var sign:Sign;

			add( sign = new Sign( 4, true ) );
			sign.x = 50;
			sign.y = 80;

			add( sign = new Sign( 2, true ) );
			sign.x = 270;
			sign.y = 80;
		}
	}
}
package  
{
	public class Room3 extends BaseRoom
	{
		public function Room3() 
		{
			super( "Room3", 43823 );
			
			bushLeft = true;
			bushRight = true;
			bushBottom = true;
		}
		
		override public function init():void
		{
			super.init();

			var sign:Sign;
			
			add( sign = new Sign( 1 ) );
			sign.x = 115;
			sign.y = 50;

			add( sign = new Sign( 2 ) );
			sign.x = 270;
			sign.y = 80;

			add( sign = new Sign( 3, true ) );
			sign.x = 150;
			sign.y = 175;
		}
	}
}
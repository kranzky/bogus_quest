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
			
			var obstacle:Obstacle;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 270;
			obstacle.y = 40;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 200;
			obstacle.y = 120;
		}
	}
}
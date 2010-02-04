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
			
			add( sign = new Sign( 3, true ) );
			sign.x = 100;
			sign.y = 112;

			var obstacle:Obstacle;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 60;
			obstacle.y = 80;

			add( obstacle = new Obstacle() );
			obstacle.x = 60;
			obstacle.y = 180;

			add( obstacle = new Obstacle() );
			obstacle.x = 240;
			obstacle.y = 150;

			add( obstacle = new Obstacle() );
			obstacle.x = 240;
			obstacle.y = 70;
		}
	}
}
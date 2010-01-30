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

			var obstacle:Obstacle;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 60;
			obstacle.y = 80;

			add( obstacle = new Obstacle() );
			obstacle.x = 60;
			obstacle.y = 180;

			add( obstacle = new Obstacle() );
			obstacle.x = 140;
			obstacle.y = 160;

			add( obstacle = new Obstacle() );
			obstacle.x = 220;
			obstacle.y = 90;
		}
	}
}
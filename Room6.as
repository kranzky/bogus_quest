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
			sign.y = 70;

			add( sign = new Sign( 2, true ) );
			sign.x = 270;
			sign.y = 70;
			
			var obstacle:Obstacle;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 120;
			obstacle.y = 40;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 50;
			obstacle.y = 175;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 160;
			obstacle.y = 45;

			add( obstacle = new Obstacle() );
			obstacle.x = 130;
			obstacle.y = 70;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 200;
			obstacle.y = 40;
		}
	}
}
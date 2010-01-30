package  
{
	public class Room9 extends BaseRoom
	{
		public function Room9() 
		{
			super( "Room9", 23345 );
		}
		
		override public function init():void
		{
			super.init();
			
			var obstacle:Obstacle;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 130;
			obstacle.y = 130;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 210;
			obstacle.y = 175;			
			
			add( obstacle = new Obstacle() );
			obstacle.x = 250;
			obstacle.y = 90;				
		}
	}
}
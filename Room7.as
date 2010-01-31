package  
{
	public class Room7 extends BaseRoom
	{
		public function Room7() 
		{
			super( "Room7", 13128 );
		}
		
		override public function init():void
		{
			super.init();
			
			if ( Main.state < 8 )
			{
				Main.state = 9;
			}
			
			var obstacle:Obstacle;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 80;
			obstacle.y = 155;

			add( obstacle = new Obstacle() );
			obstacle.x = 190;
			obstacle.y = 90;	
		}
	}
}
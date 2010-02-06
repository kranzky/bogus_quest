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
			
			var wall:Wall;
			
			add( wall = new Wall() );
			wall.setCollisionMask( wall.sprite.getImage() );
			wall.x = 144;
			wall.y = 48;
			wall.depth = 4;

			add( wall = new Wall() );
			wall.setCollisionMask( wall.sprite.getImage() );
			wall.x = 144;
			wall.y = 112;
			wall.depth = 4;

			add( wall = new Wall() );
			wall.setCollisionMask( wall.sprite.getImage() );
			wall.x = 144;
			wall.y = 144;
			wall.depth = 4;

			add( wall = new Wall() );
			wall.setCollisionMask( wall.sprite.getImage() );
			wall.x = 144;
			wall.y = 176;
			wall.depth = 4;
			
			if ( Main.passed )
			{
				return;
			}
			
			var guard:Guard;
			
			add( guard = new Guard() );
			guard.x = 128;
			guard.y = 80;

		}
	}
}
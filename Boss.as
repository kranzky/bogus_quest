package  
{
	import punk.core.SpriteMap;

	public class Boss extends BaseRoom
	{
		[Embed(source = 'data/rug.png')] private var ImgRug:Class;
		[Embed(source = 'data/throne.png')] private var ImgThrone:Class;

		public function Boss() 
		{
			super( "Boss", 1382 );
		}
		
		override public function init():void
		{
			super.init();
			
			trace( Main.state );

			var obstacle:Obstacle;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 80;
			obstacle.y = 175;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 120;
			obstacle.y = 170;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 160;
			obstacle.y = 170;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 200;
			obstacle.y = 170;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 270;
			obstacle.y = 175;
						
			add( obstacle = new Obstacle() );
			obstacle.x = 70;
			obstacle.y = 50;
						
			add( obstacle = new Obstacle() );
			obstacle.x = 110;
			obstacle.y = 55;
						
			add( obstacle = new Obstacle() );
			obstacle.x = 150;
			obstacle.y = 50;
						
			add( obstacle = new Obstacle() );
			obstacle.x = 190;
			obstacle.y = 60;
						
			add( obstacle = new Obstacle() );
			obstacle.x = 230;
			obstacle.y = 50;
						
			add( obstacle = new Obstacle() );
			obstacle.x = 270;
			obstacle.y = 70;
			
			var scenery:Scenery;

			add( scenery = new Scenery( "Rug", ImgRug, 85, 57 ) );
			scenery.x = 180;
			scenery.y = 114;

			var wall:BaseWall;
			
			add( wall = new BaseWall( "Throne", ImgThrone, 59, 62 ) );
			wall.x = 70;
			wall.y = 114;
			wall.depth = 10;
			
			Main.player.x = 180
			Main.player.y = 100
			Main.player.flipX = false
			
			if ( Main.state <= 9 )
			{
				Main.state = 10;
			}
			
			trace( Main.state );

			if ( Main.state < 13 )
			{
			var boy:Boy;
			add( boy = new Boy() );
			boy.x = 80;
			boy.y = 110;
			}
		}
	}
}
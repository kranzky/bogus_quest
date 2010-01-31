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
			obstacle.x = 90;
			obstacle.y = 82;
			add( obstacle = new Obstacle() );
			obstacle.x = 320 - 90 + 8;
			obstacle.y = 82;
			add( obstacle = new Obstacle() );
			obstacle.x = 90;
			obstacle.y = 240 - 90 - 8;
			add( obstacle = new Obstacle() );
			obstacle.x = 320 - 90 + 8;
			obstacle.y = 240 - 90 - 8;
			var gem:Gem;
			add( gem = new Gem() );
			gem.x = 160 - 30;
			gem.y = 112;
			gem.bomb = true;
			add( gem = new Gem() );
			gem.x = 160 + 30 + 8;
			gem.y = 112;
			gem.bomb = true;
			
			if ( Main.player.hasKey || Main.player.usedKey2 )
			{
				return;
			}
			
			var key:GoldKey;
			
			add( key = new GoldKey() )
			key.x = 80;
			key.y = 180;
		}
	}
}

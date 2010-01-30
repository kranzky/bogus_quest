package  
{
	public class Room4 extends BaseRoom
	{
		public function Room4() 
		{
			super( "Room4", 2354 );
		}
		
		override public function init():void
		{
			super.init();
			
			var sign:Sign;
			
			add( sign = new Sign( 2, true ) );
			sign.x = 270;
			sign.y = 70;
			
			var bomb:Gem;
			
			add( bomb = new Gem() );
			bomb.x = 80;
			bomb.y = 80;
			bomb.bomb = true;
			
			if ( Main.player.hasKey || Main.player.usedKey1 )
			{
				return;
			}
			
			var key:GoldKey;
			
			add( key = new GoldKey() )
			key.x = 50;
			key.y = 50;
		}
	}
}
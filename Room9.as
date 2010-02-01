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
			
			if ( Main.player.hasKey || Main.player.usedKey2 )
			{
				return;
			}
			
			var key:GoldKey;
			
			add( key = new GoldKey() )
			key.x = 160;
			key.y = 112;
		}
	}
}

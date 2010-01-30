package  
{
	public class Bonus2 extends BaseRoom
	{
		public function Bonus2() 
		{
			super( "Bonus2", 4968 );
		}
		
		override public function init():void
		{
			super.init();
			
			var gem:Gem;
			for ( var i:int = 0; i < 8; i++)
			{
				for ( var j:int = 0; j < 5; j++ )
				{
					if ( j > 0 && j < 4 && i > 2 && i < 5 )
					{
						continue;
					}
					if ( j == 2 && i > 4 )
					{
						continue;
					}
					add( gem = new Gem() );
					gem.x = i * 32 + 48;
					gem.y = j * 32 + 48;
					gem.bomb = true;
					gem.fake = true;
				}
			}
		}
	}
}
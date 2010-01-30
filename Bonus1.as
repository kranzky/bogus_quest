package  
{
	public class Bonus1 extends BaseRoom
	{
		internal var _remaining:int = 0;

		public function Bonus1() 
		{
			super( "Bonus1", 357 );

			bushTop = true;
			bushLeft = true;
			bushRight = true;
			bushBottom = true;
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
					if ( j == 2 && i < 3 )
					{
						continue;
					}
					_remaining += 1;
					add( gem = new Gem() );
					gem.x = i * 32 + 48;
					gem.y = j * 32 + 48;
				}
			}
		}
		
		override public function collect():void
		{
			_remaining -= 1;
			if ( _remaining == 0 )
			{
				Main.door1.locked = false;
			}
		}
	}
}
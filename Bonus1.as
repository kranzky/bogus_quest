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
			
			if ( ! Main.door1.locked )
			{
				return;
			}
			
			var gem:Gem;
			for ( var i:int = 0; i < 8; i++)
			{
				for ( var j:int = 0; j < 5; j++ )
				{
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
				if ( Main.state < 4 )
				{
					Main.state = 4;
				}
			}
		}
	}
}
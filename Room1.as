package  
{
	import punk.core.Entity;
	
	public class Room1 extends BaseRoom
	{		
		internal var _count:int = 0;

		public function Room1() 
		{
			super( "Room1", 73902 );
		}
		
		override public function init():void
		{
			super.init();
			
			var ship:Ship;
			
			add( ship = new Ship() );
			ship.x = 230;
			ship.y = 50;
			
			var sign:Sign;
			
			add( sign = new Sign( 1 ) );
			sign.x = 100;
			sign.y = 112;
			
			//Main.player.falling = true;
			//Main.player.y = -10; 
		}
		
		override public function update():void
		{
			_count += 1;
		}
		
		override public function render():void
		{
			if ( _count < 60 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (60 - _count ) / 60 );
			}
		}
	}
}

package  
{
	import punk.core.Entity;
	
	public class Room1 extends BaseRoom
	{
		[Embed(source = 'data/room1.png')] private var ImgFloor:Class;
		
		internal var _count:int = 0;

		public function Room1() 
		{
			super( "Room1", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
			
			var ship:Ship;
			add( ship = new Ship() );
			ship.x = 270;
			ship.y = 160;
			
			var sign:Sign;
			add( sign = new Sign( true ) );
			sign.x = 100;
			sign.y = 100;
			
			wrapLeft = true;
			wrapRight = true;
			
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
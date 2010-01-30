package  
{
	import punk.core.Entity;
	
	public class Room1 extends BaseRoom
	{
		public function Room1() 
		{
			super( "Room1" );
		}
		
		override public function init():void
		{
			super.init();
			var e:Entity;
			add( e = new Coin() ); e.x = 10; e.y = 10;
			add( e = new Coin() ); e.x = 50; e.y = 100;
		}
		
		override public function update():void {
			if ( Main.player.y < 0 )
			{
				FP.goto = new Room2();
				Main.player.y = 240;
			}
		}
	}
}
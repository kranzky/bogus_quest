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
			add( e = new Door() ); e.x = 30; e.y = 30;
			add( e = new Wall() ); e.x = 50; e.y = 100;
			add( e = new Wall() ); e.x = 200; e.y = 120;
			add( e = new Wall() ); e.x = 150; e.y = 160;
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
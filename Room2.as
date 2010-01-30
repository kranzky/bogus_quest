package  
{
	import punk.core.Entity;
	
	public class Room2 extends BaseRoom
	{	
		public function Room2() 
		{
			super( "Room2" );
		}
		
		override public function init():void
		{
			super.init();
			
			var e:Entity;
			add( e = new Door() ); e.x = 120; e.y = 70;
		}
		
		override public function update():void {
			if ( Main.player.y > 240 )
			{
				FP.goto = new Room1();
				Main.player.y = 0;
			}
		}
	}
}
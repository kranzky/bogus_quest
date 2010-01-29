package  
{
	import punk.Actor;
	import punk.core.Entity;
	import punk.core.World;
	
	public class Room1 extends World
	{
		internal var _player:Actor = Main.player;
		public function Room1() 
		{
			trace( "Room1 Construct" );
		}
		
		override public function init():void
		{
			trace( "Room1 Init" );
			add( _player );
			add( Main.debug );
			var e:Entity;
			add( e = new Coin() ); e.x = 10; e.y = 10;
			add( e = new Coin() ); e.x = 50; e.y = 100;
		}
		
		override public function update():void {
			if ( _player.y < 0 )
			{
				FP.goto = new Room2();
				_player.y = 240;
			}
		}
	}
}
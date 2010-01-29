package  
{
	import punk.core.Entity;
	import punk.core.World;
	
	public class Room1 extends World
	{	
		public function Room1() 
		{
		}
		
		override public function init():void
		{
			add( Main.player );
			add( Main.debug );
			var e:Entity;
			add( e = new Coin() ); e.x = 10; e.y = 10;
			add( e = new Coin() ); e.x = 50; e.y = 100;
		}
	}
}
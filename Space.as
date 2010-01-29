package  
{
	import punk.core.Entity;
	import punk.core.World;
	
	public class Space extends World
	{	
		// music by Little Scale
		[Embed(source = 'data/music2.mp3')] private const SndMusic:Class;
		
		public function Space() 
		{
			trace("Space has been created!");
		}
		
		override public function init():void
		{
			var e:Entity;
			add( new Player() );
			add( new DebugText() );
			add( e = new Coin() ); e.x = 10; e.y = 10;
			add( e = new Coin() ); e.x = 50; e.y = 100;
			FP.musicPlay( SndMusic );
		}
	}
}
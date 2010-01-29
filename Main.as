package
{
	import punk.core.*;
	import punk.Actor;
	import punk.TextPlus;
	
	[SWF(width = "640", height = "480")]
	[Frame(factoryClass = "punk.core.Factory")]
	
	public class Main extends Engine
	{
		// music by Little Scale
		[Embed(source = 'data/music2.mp3')] private const SndMusic:Class;
		
		public static var player:Actor = new Player();
		public static var debug:TextPlus = new DebugText();
		
		public function Main()
		{
			super(320, 240, 60, 2, Room1, false, false);
			FP.musicPlay( SndMusic );
		}
	}
}
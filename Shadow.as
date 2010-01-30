package  
{
	public class Shadow extends Scenery
	{	
		[Embed(source = 'data/shadow.png')] private var ImgShadow:Class;

		public function Shadow()
		{
			super( "Shadow", ImgShadow, 32, 32 );
		}
		
		override public function update():void
		{
			visible = ! Main.player.tumbling;
			x = Main.player.x;
			y = Main.player.falling ? 110 : Main.player.y + 4;
		}
	}
}
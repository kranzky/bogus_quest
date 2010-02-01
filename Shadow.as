package  
{
	public class Shadow extends Scenery
	{	
		[Embed(source = 'data/shadow.png')] private var ImgShadow:Class;

		public function Shadow()
		{
			super( "Shadow", ImgShadow, 32, 32 );
			setCollisionRect( 20, 8, 6, 26 );
			setCollisionType( "feet" );
			Main.player.shadow = this;
		}
	}
}
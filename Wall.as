package  
{
	public class Wall extends BaseWall
	{	
		[Embed(source = 'data/wall.png')] private var ImgWall:Class;
		
		public function Wall()
		{
			super( "Wall", ImgWall );
			
		}	
	}
}
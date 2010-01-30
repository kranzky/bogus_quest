package  
{
	public class Boy extends BaseWall
	{
		[Embed(source = 'data/boy.png')] private var ImgBoy:Class;
		
		public function Boy() 
		{
			super( "Boy", ImgBoy, 25, 34 );
			delay = 6;
		}
	}
}
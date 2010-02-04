package  
{
	public class Bush extends BaseWall
	{	
		[Embed(source = 'data/bush.png')] private var ImgBush:Class;
		
		public function Bush()
		{
			super( "Bush", ImgBush );
		}	
	}
}
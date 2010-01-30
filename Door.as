package  
{
	public class Door extends Portal
	{		
		[Embed(source = 'data/door.png')] private var ImgDoor:Class;
		
		public function Door() 
		{
			super( "Door", ImgDoor );
		}
	}
}
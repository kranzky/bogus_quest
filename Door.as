package  
{
	public class Door extends Portal
	{		
		[Embed(source = 'data/door.png')] private var ImgDoor:Class;
		[Embed(source = 'data/forest_door.png')] private var ImgForestDoor:Class;
		
		public function Door( type:int ) 
		{
			super( "Door", ( type == 0 ) ? ImgDoor : ImgForestDoor );
		}
	}
}
package  
{
	public class Door extends Portal
	{		
		[Embed(source = 'data/door.png')] private var ImgDoor:Class;
		[Embed(source = 'data/closed_door.png')] private var ImgClosedDoor:Class;
		[Embed(source = 'data/forest_door.png')] private var ImgForestDoor:Class;
		[Embed(source = 'data/bush.png')] private var ImgBush:Class;
		
		public function Door( type:int ) 
		{
			super( "Door", ( type == 0 ) ? ImgDoor : ImgForestDoor, ( type == 0 ) ? ImgClosedDoor : ImgBush );
		}
	}
}
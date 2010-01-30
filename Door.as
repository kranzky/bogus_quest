package  
{
	public class Door extends Portal
	{		
		[Embed(source = 'data/door.png')] private var ImgDoor:Class;
		
		public function Door() 
		{
			super( "Door" );
			
			sprite = FP.getSprite( ImgDoor, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType("door");
		}
	}
}
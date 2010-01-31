package  
{
	public class Ship extends BaseWall
	{	
		[Embed(source = 'data/ship.png')] private var ImgShip:Class;
		
		public function Ship()
		{
			super( "Ship", ImgShip );
			scaleX = 3;
			scaleY = 3;
		}	
	}
}
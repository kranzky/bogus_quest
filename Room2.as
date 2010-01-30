package  
{
	public class Room2 extends BaseRoom
	{
		[Embed(source = 'data/room2.png')] private var ImgFloor:Class;

		public function Room2() 
		{
			super( "Room2", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
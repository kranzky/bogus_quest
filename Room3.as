package  
{
	public class Room3 extends BaseRoom
	{
		[Embed(source = 'data/room3.png')] private var ImgFloor:Class;

		public function Room3() 
		{
			super( "Room3", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
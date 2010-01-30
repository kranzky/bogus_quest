package  
{
	public class Room6 extends BaseRoom
	{
		[Embed(source = 'data/room6.png')] private var ImgFloor:Class;

		public function Room6() 
		{
			super( "Room6", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
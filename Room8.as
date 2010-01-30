package  
{
	public class Room8 extends BaseRoom
	{
		[Embed(source = 'data/room8.png')] private var ImgFloor:Class;

		public function Room8() 
		{
			super( "Room8", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
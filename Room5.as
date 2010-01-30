package  
{
	public class Room5 extends BaseRoom
	{
		[Embed(source = 'data/room5.png')] private var ImgFloor:Class;

		public function Room5() 
		{
			super( "Room5", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
package  
{
	public class Room4 extends BaseRoom
	{
		[Embed(source = 'data/room4.png')] private var ImgFloor:Class;

		public function Room4() 
		{
			super( "Room4", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
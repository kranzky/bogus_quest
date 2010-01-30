package  
{
	public class Room7 extends BaseRoom
	{
		[Embed(source = 'data/room7.png')] private var ImgFloor:Class;

		public function Room7() 
		{
			super( "Room7", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
package  
{
	public class Room9 extends BaseRoom
	{
		[Embed(source = 'data/room9.png')] private var ImgFloor:Class;

		public function Room9() 
		{
			super( "Room9", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
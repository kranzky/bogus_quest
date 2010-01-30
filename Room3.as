package  
{
	public class Room3 extends BaseRoom
	{
		[Embed(source = 'data/metal.png')] private var ImgMetal:Class;

		public function Room3() 
		{
			super( "Room3", ImgMetal );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
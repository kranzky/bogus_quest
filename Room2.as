package  
{
	public class Room2 extends BaseRoom
	{
		[Embed(source = 'data/rock.png')] private var ImgRock:Class;

		public function Room2() 
		{
			super( "Room2", ImgRock );
		}
		
		override public function init():void
		{
			super.init();
			
			wrapTop = true;
			wrapBottom = true;
		}
	}
}
package  
{
	public class Bonus1 extends BaseRoom
	{
		[Embed(source = 'data/bonus1.png')] private var ImgFloor:Class;

		public function Bonus1() 
		{
			super( "Bonus1", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
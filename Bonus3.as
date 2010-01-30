package  
{
	public class Bonus3 extends BaseRoom
	{
		[Embed(source = 'data/bonus3.png')] private var ImgFloor:Class;

		public function Bonus3() 
		{
			super( "Bonus3", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
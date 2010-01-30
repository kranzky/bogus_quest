package  
{
	public class Bonus2 extends BaseRoom
	{
		[Embed(source = 'data/bonus2.png')] private var ImgFloor:Class;

		public function Bonus2() 
		{
			super( "Bonus2", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
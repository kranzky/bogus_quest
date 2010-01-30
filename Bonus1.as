package  
{
	public class Bonus1 extends BaseRoom
	{
		public function Bonus1() 
		{
			super( "Bonus1", 357 );

			bushTop = true;
			bushLeft = true;
			bushRight = true;
			bushBottom = true;
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
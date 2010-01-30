package  
{
	public class Death extends BaseRoom
	{
		public function Death() 
		{
			super( "Death", 32599 );
		}
		
		override public function init():void
		{
			super.init();
			
			wrapTop = true;
			wrapBottom = true;
			wrapLeft = true;
			wrapRight = true;
		}
	}
}
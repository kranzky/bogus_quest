package  
{
	public class Death extends BaseRoom
	{
		public function Death() 
		{
			super( "Death" );
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
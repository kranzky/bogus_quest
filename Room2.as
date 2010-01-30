package  
{
	import punk.core.Entity;
	
	public class Room2 extends BaseRoom
	{	
		public function Room2() 
		{
			super( "Room2" );
		}
		
		override public function init():void
		{
			super.init();
			
			wrapTop = true;
			wrapBottom = true;
		}
	}
}
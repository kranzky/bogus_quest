package  
{
	public class Room7 extends BaseRoom
	{
		public function Room7() 
		{
			super( "Room7", 13128 );
		}
		
		override public function init():void
		{
			super.init();
			
			if ( Main.state < 8 )
			{
				Main.state = 9;
			}
		}
	}
}
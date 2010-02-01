package  
{
	public class Room3 extends BaseRoom
	{
		public function Room3() 
		{
			super( "Room3", 43823 );
			
			bushLeft = true;
			bushRight = true;
			bushBottom = true;
		}
		
		override public function leave():void
		{
			trace( "Leave " + Main.state );
			if ( Main.state % 2 == 0 )
			{
				Main.state += 1;
			}
		}
		
		override public function init():void
		{
			super.init();

			var sign:Sign;
			
			add( sign = new Sign( 1 ) );
			sign.x = 110;
			sign.y = 50;

			add( sign = new Sign( 2 ) );
			sign.x = 270;
			sign.y = 70;

			add( sign = new Sign( 3, true ) );
			sign.x = 140;
			sign.y = 175;
			
			if ( Main.state > 8 )
			{
				return;
			}
			
			var boy:Boy;
			add( boy = new Boy() );
			boy.x = 190;
			boy.y = 95;
		}
	}
}
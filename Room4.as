﻿package  
{
	public class Room4 extends BaseRoom
	{
		public function Room4() 
		{
			super( "Room4", 2354 );
		}
		
		override public function init():void
		{
			super.init();
			
			var sign:Sign;
			
			add( sign = new Sign( 2, true ) );
			sign.x = 270;
			sign.y = 80;
		}
	}
}
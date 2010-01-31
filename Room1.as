package  
{
	import punk.core.Entity;
	
	public class Room1 extends BaseRoom
	{		
		internal var _count:int = 0;

		public function Room1() 
		{
			super( "Room1", 73902 );

			bushTop = true;
			bushLeft = true;
			bushRight = true;
			bushBottom = true;
		}
		
		override public function init():void
		{
			super.init();
			
			var ship:Ship;
			
			add( ship = new Ship() );
			ship.x = 240;
			ship.y = 50;
			
			var sign:Sign;
			
			add( sign = new Sign( 1 ) );
			sign.x = 100;
			sign.y = 112;
			
			var obstacle:Obstacle;
			
			add( obstacle = new Obstacle() );
			obstacle.x = 60;
			obstacle.y = 80;
						
			add( obstacle = new Obstacle() );
			obstacle.x = 240;
			obstacle.y = 150;
		}
		
		override public function update():void
		{
			_count += 1;
			super.update();
		}
		
		override public function render():void
		{
			super.render();
			if ( _count < 60 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (60 - _count ) / 60 );
			}
		}
	}
}

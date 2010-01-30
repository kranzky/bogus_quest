package  
{
	import punk.core.Entity;
	
	public class Room1 extends BaseRoom
	{
		[Embed(source = 'data/grass.png')] private var ImgGrass:Class;
		
		internal var _count:int = 0;

		public function Room1() 
		{
			super( "Room1", ImgGrass );
		}
		
		override public function init():void
		{
			super.init();
			
			var e:Entity;
			add( e = new Wall() ); e.x = 50; e.y = 100;
			add( e = new Wall() ); e.x = 200; e.y = 120;
			add( e = new Wall() ); e.x = 150; e.y = 160;
			
			wrapLeft = true;
			wrapRight = true;			
		}
		
		override public function update():void
		{
			_count += 1;
		}
		
		override public function render():void
		{
			if ( _count < 60 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (60 - _count ) / 60 );
			}
		}
	}
}
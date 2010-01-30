package  
{
	import adobe.utils.CustomActions;
	import punk.Actor;
	import flash.utils.getDefinitionByName;

	public class Portal extends Actor
	{
		internal var _name:String = "Portal";
		internal var _open:Boolean = true;
		
		public var room1:Class;
		public var x1:int;
		public var y1:int;
		public var room2:Class;
		public var x2:int;
		public var y2:int;
		
		public function Portal( name:String, bitmap:Class ) 
		{
			_name = name;
			trace( "Construct: " + name );
									
			sprite = FP.getSprite( bitmap, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "portal" );
			
			active = true;
		}
		
		override public function update():void
		{
			// teleport through portals
			if ( ! collideWith( Main.player, x, y ) )
			{
				_open = true;
				return;
			}
			if ( ! _open )
			{
				return;
			}
			trace( "Teleporting..." );
			_open = false;
			if ( FP.world is room1 && FP.world is room2 )
			{
				if ( x == x1 && y == y1 )
				{
					x = x2;
					y = y2;
				}
				else if ( x == x2 && y == y2 )
				{
					x = x1;
					y = y1;
				}
				Main.player.x = x;
				Main.player.y = y;
			}
			else if ( FP.world is room1 )
			{
				Main.player.x = x2;
				Main.player.y = y2;
				FP.goto = new room2();
			}
			else if ( FP.world is room2 )
			{
				Main.player.x = x1;
				Main.player.y = y1;
				FP.goto = new room1();
			}
		}
	}
}
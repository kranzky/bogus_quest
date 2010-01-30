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
			trace( FP.world );
			trace( FP.world is Room1 );
			if ( FP.world )
			{
				FP.goto = new room2();
			}
			else
			{
				FP.goto = new room1();
			}
		}
	}
}
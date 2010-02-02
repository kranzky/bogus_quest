package  
{
	import adobe.utils.CustomActions;
	import punk.Acrobat;
	import flash.utils.getDefinitionByName;

	public class Portal extends Acrobat
	{
		internal var _name:String = "Portal";
		internal var _bitmapOpen:Class;
		internal var _bitmapClosed:Class;
		
		public var room1:Class;
		public var wall:int;
		public var room2:Class;
		public var locked:Boolean;
		public var fake:Boolean;
		
		public function Portal( name:String, bitmap_open:Class, bitmap_closed:Class = null ) 
		{
			_name = name;
			trace( "Construct: " + name );
									
			_bitmapOpen = bitmap_open;
			_bitmapClosed = bitmap_closed;
			
			sprite = FP.getSprite( _bitmapOpen, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "portal" );
			
			active = true;
			locked = false;
			fake = false;
			
			depth = 3;
		}
		
		public function addToWorld():void
		{
			if ( FP.world is room1 || FP.world is room2 )
			{
				trace( "Adding Portal" );
				if ( FP.world is room1 )
				{
					switch ( wall )
					{
						case 1: x = 144; y = sprite.height * 0.5; angle = 0;  break;
						case 2: x = 320 - sprite.width * 0.5; y = 112; angle = 270; break;
						case 3: x = 176; y = 224 - sprite.height * 0.5; angle = 180; break;
						case 4: x = sprite.width * 0.5; y = 112; angle = 90; break;
					}
				}
				else
				{
					switch ( wall )
					{
						case 3: x = 144; y = sprite.height * 0.5; angle = 0;  break;
						case 4: x = 320 - sprite.width * 0.5; y = 112; angle = 270; break;
						case 1: x = 176; y = 224 - sprite.height * 0.5; angle = 180; break;
						case 2: x = sprite.width * 0.5; y = 112; angle = 90;  break;
					}
				}
				FP.world.add( this );
			}
		}
			
		override public function update():void
		{
			if ( fake && Main.boss )
			{
				fake = false;
			}
			sprite = FP.getSprite( ( locked || fake )? _bitmapClosed : _bitmapOpen, 32, 32, false, false, 16, 16 );
			if ( Main.player.teleporting || Main.player.falling )
			{
				return;
			}
			// teleport through portals			
			if ( ! locked && ! collideWith( Main.player.shadow, x, y )  )
			{
				return;
			}
			if ( locked && ! collideWith( Main.player, x, y ) && ! collideWith( Main.player.shadow, x, y ) )
			{
				return;
			}
			if ( locked && Main.player.hasKey )
			{
				Main.player.hasKey = false;
				var room:BaseRoom = FP.world as BaseRoom;
				if ( room is Bonus3 )
				{
					room.activateGems();
				}
				else
				{
					locked = false;
				}
			}
			if ( locked )
			{
				return;
			}
			if ( fake )
			{
				fake = false;
			}
			trace( "Teleporting..." );
			if ( Main.boss )
			{
				Main.lock = this;
			}
			Main.player.teleport( room1, room2 );
			if ( FP.world is room1 && FP.world is room2 )
			{
				trace( "Bad, Bad Portal" );
				return;
			}
			else if ( FP.world is room1 )
			{
				Main.player.teleporting = true;
				switch ( wall )
				{
					case 3: Main.player.x = 144; Main.player.y = 16; break;
					case 4: Main.player.x = 320 - 16; Main.player.y = 112 - 16; break;
					case 1: Main.player.x = 176; Main.player.y = 200; break;
					case 2: Main.player.x = 16; Main.player.y = 112 - 16; break;
				}
				trace( "Room2" );
				if ( FP.world is BaseRoom )
				{
					(FP.world as BaseRoom).leave();
				}
				FP.goto = new room2();
			}
			else if ( FP.world is room2 )
			{
				Main.player.teleporting = true;
				switch ( wall )
				{
					case 1: Main.player.x = 144; Main.player.y = 16; break;
					case 2: Main.player.x = 320 - 16; Main.player.y = 112 - 16; break;
					case 3: Main.player.x = 176; Main.player.y = 200; break;
					case 4: Main.player.x = 16; Main.player.y = 112 - 16; break;
				}
				trace( "Room1" );
				if ( FP.world is BaseRoom )
				{
					( FP.world as BaseRoom ).leave();
				}
				FP.goto = new room1();
			}
		}
	}
}

package  
{
	import adobe.utils.CustomActions;
	import punk.Acrobat;
	import flash.utils.getDefinitionByName;

	public class Portal extends Acrobat
	{
		internal var _name:String = "Portal";
		internal var _open:Boolean = true;
		
		public var room1:Class;
		public var wall:int;
		public var room2:Class;
		
		public function Portal( name:String, bitmap:Class ) 
		{
			_name = name;
			trace( "Construct: " + name );
									
			sprite = FP.getSprite( bitmap, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "portal" );
			
			active = true;
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
						case 1: x = 160; y = sprite.height; break;
						case 2: x = 320 - sprite.width; y = 120; break;
						case 3: x = 160; y = 240 - sprite.height; break;
						case 4: x = sprite.width; y = 120; break;
					}
				}
				else
				{
					switch ( wall )
					{
						case 3: x = 160; y = sprite.height; break;
						case 4: x = 320 - sprite.width; y = 120; break;
						case 1: x = 160; y = 240 - sprite.height; break;
						case 2: x = sprite.width; y = 120; break;
					}
				}
				FP.world.add( this );
			}
		}
			
		override public function update():void
		{
			if ( Main.player.teleporting )
			{
				return;
			}
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
				trace( "Bad, Bad Portal" );
				return;
			}
			else if ( FP.world is room1 )
			{
				Main.player.teleporting = true;
				switch ( wall )
				{
					case 3: Main.player.x = 160; Main.player.y = sprite.height; break;
					case 4: Main.player.x = 320 - sprite.width; Main.player.y = 120; break;
					case 1: Main.player.x = 160; Main.player.y = 240 - sprite.height; break;
					case 2: Main.player.x = sprite.width; Main.player.y = 120; break;
				}
				FP.goto = new room2();
			}
			else if ( FP.world is room2 )
			{
				Main.player.teleporting = true;
				switch ( wall )
				{
					case 1: Main.player.x = 160; Main.player.y = sprite.height; break;
					case 2: Main.player.x = 320 - sprite.width; Main.player.y = 120; break;
					case 3: Main.player.x = 160; Main.player.y = 240 - sprite.height; break;
					case 4: Main.player.x = sprite.width; Main.player.y = 120; break;
				}
				FP.goto = new room1();
			}
		}
	}
}
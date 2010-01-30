package  
{
	import punk.Actor;
	import punk.core.Entity;
	import punk.core.SpriteMap;
	import punk.core.World;
	import punk.TileMap;
	import flash.geom.Rectangle;
	import de.polygonal.math.PM_PRNG;

	// TODO: rooms are created and destroyed by the engine when the player enters / leaves. To maintain state, each room
	//       should have a state entity that is owned by the engine, which it can read/right. Well, maybe.
		
	public class BaseRoom extends World
	{
		[Embed(source = 'data/grass.png')] private var ImgGrass:Class;
		[Embed(source = 'data/flower1.png')] private var ImgFlower1:Class;
		[Embed(source = 'data/flower2.png')] private var ImgFlower2:Class;
		[Embed(source = 'data/pebble1.png')] private var ImgPebble1:Class;
		[Embed(source = 'data/pebble2.png')] private var ImgPebble2:Class;
		[Embed(source = 'data/status.png')] private var ImgStatus:Class;
		[Embed(source = 'data/tile.png')] private var ImgTile:Class;
		[Embed(source = 'data/death.png')] private var ImgDeath:Class;
		
		internal var _name:String = "BaseRoom";
		
		public var wrapLeft:Boolean;
		public var wrapRight:Boolean;
		public var wrapTop:Boolean;
		public var wrapBottom:Boolean;
		public var bushLeft:Boolean;
		public var bushRight:Boolean;
		public var bushTop:Boolean;
		public var bushBottom:Boolean;
		public var pr:PM_PRNG;
		
		public function BaseRoom( name:String, seed:int ) 
		{
			_name = name;
			trace( "Construct: " + _name );
			
			wrapLeft = false;
			wrapRight = false;
			wrapTop = false;
			wrapBottom = false;
			
			bushLeft = false;
			bushRight = false;
			bushTop = false;
			bushBottom = false;

			pr = new PM_PRNG();
			pr.seed = seed;
		}	
		
		override public function init():void
		{
			trace( "Init: " + _name );
			
			add( Main.player );
			add( Main.debug );
			add( Main.credits );						
			Main.player.teleporting = false;
						
			var tileMap:TileMap = new TileMap( 320, 224 );
			var rect:Rectangle = new Rectangle(0, 0, 32, 32 );
			rect.width = 32;
			rect.height = 32;			
			
			if ( _name == "Death" )
			{
				rect.width = 320;
				rect.height = 240;
				tileMap.add( ImgDeath, rect, 0, 0 );
				tileMap.depth = 999; // render before everything else
				add( tileMap );			
				var tileMap3:TileMap = new TileMap( 320, 240 );
				rect.width = 320;
				rect.height = 16;
				tileMap3.add( ImgStatus, rect, 0, 224 );
				add( tileMap3 );
				Main.player.tumbling = true;
				Main.player.x = 160;
				Main.player.y = 112;
				return;
			}

			Main.addPortals();			

			var bush:BaseWall; 
			for ( var i:int = 0; i < 10; i++)
			{
				for ( var j:int = 0; j < 7; j++ )
				{
					if ( j == 0 || j == 6 || i == 0 || i == 9 )
					{
						var skip:Boolean = false;
						for ( var p:int = 0; p <  countClass( Portal ); p++ )
						{
							if ( getClass( Portal )[p].x == 16 + i * 32 &&
							     getClass( Portal )[p].y == 16 + j * 32 )
							{
								skip = true;
								break;
							}
						}
						if ( ! skip )
						{
							if ( j == 0 && bushTop || j == 6 && bushBottom ||
							     i == 0 && bushLeft || i == 9 && bushRight )
							{
								bush = new Bush();
							}
							else
							{
								bush = new Wall();
							}
							bush.depth = 999;
							bush.x = 16 + i * 32;
							bush.y = 16 + j * 32;
							add( bush );
						}
					}
					if ( ! bushRight && ! bushLeft && ! bushTop && ! bushBottom )
					{
						tileMap.add( ImgTile, rect, i * 32, j * 32 );
						continue;
					}
					switch ( pr.nextIntRange( 0, 20 ) )
					{
						case 0: tileMap.add( ImgFlower1, rect, i * 32, j * 32 ); break;
						case 1: tileMap.add( ImgFlower2, rect, i * 32, j * 32 ); break;
						case 2: case 4: tileMap.add( ImgPebble1, rect, i * 32, j * 32 ); break;
						case 3: case 5: tileMap.add( ImgPebble2, rect, i * 32, j * 32 ); break;
						default: tileMap.add( ImgGrass, rect, i * 32, j * 32 ); break;
					}
				}
			}
			
			tileMap.depth = 999; // render before everything else
			add( tileMap );
			
			var tileMap2:TileMap = new TileMap( 320, 240 );
			rect.width = 320;
			rect.height = 16;
			tileMap2.add( ImgStatus, rect, 0, 224 );
			add( tileMap2 );			
		}
	}
}

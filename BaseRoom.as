package  
{
	import punk.Actor;
	import punk.core.Entity;
	import punk.core.SpriteMap;
	import punk.core.World;
	import punk.TileMap;
	import flash.geom.Rectangle;

	// TODO: rooms are created and destroyed by the engine when the player enters / leaves. To maintain state, each room
	//       should have a state entity that is owned by the engine, which it can read/right. Well, maybe.
		
	public class BaseRoom extends World
	{
		internal var _name:String = "BaseRoom";
		internal var _bitmap:Class = null;
		
		public var wrapLeft:Boolean;
		public var wrapRight:Boolean;
		public var wrapTop:Boolean;
		public var wrapBottom:Boolean;
		
		public function BaseRoom( name:String, bitmap:Class ) 
		{
			_name = name;
			trace( "Construct: " + _name );
			
			wrapLeft = false;
			wrapRight = false;
			wrapTop = false;
			wrapBottom = false;
			
			_bitmap = bitmap;
		}	
		
		override public function init():void
		{
			trace( "Init: " + _name );
			
			var tileMap:TileMap = new TileMap( 320, 240 );
			var rect:Rectangle = new Rectangle(0, 0, 320, 240 );
			tileMap.add( _bitmap, rect, 0, 0 );
			tileMap.depth = 999; // render before everything else
			add( tileMap );
			
			add( Main.player );
			add( Main.debug );
			add( Main.credits );
			
			Main.addPortals();			
		}
	}
}
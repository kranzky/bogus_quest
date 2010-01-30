package  
{
	import punk.Actor;
	import punk.core.Entity;
	import punk.core.World;

	// TODO: rooms are created and destroyed by the engine when the player enters / leaves. To maintain state, each room
	//       should have a state entity that is owned by the engine, which it can read/right. Well, maybe.
	
	// TODO: Figure out some kind of tiling system. Or at least allow each room to have a bg image
	
	// TODO: On init(), retrieve and display all of my portals
	
	public class BaseRoom extends World
	{
		internal var _name:String = "BaseRoom";
		
		public var wrapLeft:Boolean;
		public var wrapRight:Boolean;
		public var wrapTop:Boolean;
		public var wrapBottom:Boolean;
		
		public function BaseRoom( name:String ) 
		{
			_name = name;
			trace( "Construct: " + _name );
			
			wrapLeft = false;
			wrapRight = false;
			wrapTop = false;
			wrapBottom = false;
		}	
		
		override public function init():void
		{
			trace( "Init: " + _name );
			add( Main.player );
			add( Main.debug );
		}
		
		override public function update():void {
		}
	}

}
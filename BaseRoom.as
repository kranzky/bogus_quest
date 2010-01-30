package  
{
	import punk.Actor;
	import punk.core.Entity;
	import punk.core.World;

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
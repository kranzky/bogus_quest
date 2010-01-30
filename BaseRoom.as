package  
{
	import punk.Actor;
	import punk.core.Entity;
	import punk.core.World;

	public class BaseRoom extends World
	{		
		internal var _name:String = "BaseRoom";
		
		public function BaseRoom( name:String ) 
		{
			_name = name;
			trace( "Construct: " + _name );
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
package  
{
	import adobe.utils.CustomActions;
	import punk.Actor;

	public class Portal extends Actor
	{
		internal var _name:String = "BaseRoom";

		public var room1:BaseRoom;
		public var x1:int;
		public var y1:int;
		public var room2:BaseRoom;
		public var x2:int;
		public var y2:int;
		
		public function Portal( name:String ) 
		{
			_name = name;
			trace( "Construct: " + name );
		}
	}
}
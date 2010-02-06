package
{
	import punk.core.*;
	import punk.Actor;
	import punk.TextPlus;
	
	[SWF(width = "640", height = "480")]
	[Frame(factoryClass = "punk.core.Factory")]
	
	public class Main extends Engine
	{
		private static var _portals:Array = [];
		
		public static var player:Player = new Player();
		public static var debug:TextPlus = new DebugText();
		public static var credits:CreditText = new CreditText();
		public static var state:int = 0;
		public static var door1:Portal;
		public static var door2:Portal;
		public static var door3:Portal;
		public static var door4:Portal;
		public static var door5:Portal;
		public static var lock:Portal;
		public static var boss:Boolean = false;
		public static var splash:Boolean = false;
		public static var paused:Boolean = true;
		
		public function Main()
		{
			// TODO: change to Rocket and true for ship
			super( 320, 240, 60, 2, Rocket, true, false, 0xFFFFFFFF, 0xFFAA5555 );

			var portal:Portal;
			
			// Room 1
			portal = _addPortal( Door, 1 );
			portal.room1 = Room1;
			portal.wall = 1;
			portal.room2 = Death;
			
			portal = _addPortal( Door, 1 );
			portal.room1 = Room1;
			portal.wall = 3;
			portal.room2 = Room2;

			// Room 2
			portal = _addPortal( Door, 1 );
			portal.room1 = Room2;
			portal.wall = 3;
			portal.room2 = Death;
			
			portal = _addPortal( Door, 1 );
			portal.room1 = Room2;
			portal.wall = 2;
			portal.room2 = Room3;
			
			// Room 3
			portal = _addPortal( Door, 1 );
			portal.room1 = Room3;
			portal.wall = 3;
			portal.room2 = Death;
			
			portal = _addPortal( Door );
			portal.room1 = Room3;
			portal.wall = 1;
			portal.room2 = Room4;
			portal.locked = true;
			door1 = portal;

			portal = _addPortal( Door, 1 );
			portal.room1 = Room3;
			portal.wall = 2;
			portal.room2 = Bonus1;

			// Room 4
			portal = _addPortal( Door );
			portal.room1 = Room4;
			portal.wall = 2;
			portal.room2 = Room5;
			
			// Room 5
			portal = _addPortal( Door );
			portal.room1 = Room5;
			portal.wall = 1;
			portal.room2 = Room6;
			
			// Room 6
			portal = _addPortal( Door );
			portal.room1 = Room6;
			portal.wall = 4;
			portal.room2 = Bonus2;

			portal = _addPortal( Door );
			portal.room1 = Room6;
			portal.wall = 2;
			portal.room2 = Room7;
			portal.locked = true;
			door2 = portal;
			
			// Room 7
			portal = _addPortal( Door );
			portal.room1 = Room7;
			portal.wall = 3;
			portal.room2 = Room8;
			portal.fake = true;
			door4 = portal;
			
			// Room 8
			portal = _addPortal( Door );
			portal.room1 = Room8;
			portal.wall = 3;
			portal.room2 = Room9;
			portal.fake = true;
			door5 = portal;

			// Room 9
			portal = _addPortal( Door );
			portal.room1 = Room9;
			portal.wall = 3;
			portal.room2 = Bonus3;

			// Bonus 3
			portal = _addPortal( Door );
			portal.room1 = Bonus3;
			portal.wall = 4;
			portal.room2 = Boss;
			portal.locked = true;
			door3 = portal;
			
			credits.initial = 200;
			credits.delay = 120;
			credits.y = 226;
			credits.text.push( "RocketHands Presents" );
			credits.text.push( "a Kranzky Brothers Production" );
			credits.text.push( "Made for Global Game Jam 2010" );
			credits.text.push( "B O G U S   Q U E S T  (tm)" );
			credits.text.push( "Hacked Solo by Lloyd Kranzky" );
			credits.text.push( "Tiles by J. M. Silveira Neto" );
			credits.text.push( "Pixel Font by Xpaider" );
			credits.text.push( "Cap'n Onion by Pazu" );
			credits.text.push( "Pixel Pushing by Sizzle" );
			credits.text.push( "Coopetition by Beetlefeet" );
			credits.text.push( "Moneybags by Dodgy" );
			credits.text.push( "Insanity by Maxxor" );
			credits.text.push( "Inspiration by Dadams" );
			credits.text.push( "Thanks to EllenJ and SimonW" );
			credits.text.push( "For Jack & Eliza" );
			credits.text.push( "Copyright (c) 2010 RocketHands" );
			credits.depth = -1; // render on top of everything
		}
		
		public static function addPortals():void
		{
			var addToRoom:Function = function( portal:Portal, index:Number, arr:Array ):void
			{
				portal.addToWorld();
			};
			_portals.forEach( addToRoom );
		}
		
		private static function _addPortal( portalClass:Class, type:int = 0 ):Portal
		{
			var portal:Portal = new portalClass( type );
			_portals.push( portal );
			return portal;
		}
		
		public static function reset():void
		{
			player = new Player();
			credits.reset();
			unlockAll();
			door1.locked = true;
			door2.locked = true;
			door3.locked = true;
			door4.fake = true;
			door5.fake = true;
			state = 0;
			boss = false;
			splash = false;
			lock = null;
			paused = true;
		}
		
		public static function unlockAll():void
		{
			var unlock:Function = function( portal:Portal, index:Number, arr:Array ):void
			{
				portal.locked = false;
				portal.fake = false;
			};
			_portals.forEach( unlock );
		}
	}
}

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
		
		public static var player:Actor = new Player();
		public static var debug:TextPlus = new DebugText();
		public static var credits:CreditText = new CreditText();
		
		// TODO: RocketHands splash screen with text (GGJ specific stuff)
		
		// TODO: Fade in to first room
		
		// TODO: Overlay game title on first room
		
		// TODO: Overlay text on game with credits
		
		// TODO: Collection of portals. BaseRoom calls getPortals on instantiation.
		
		public function Main()
		{
			super( 320, 240, 60, 2, Rocket, false, true );
			
			var portal:Portal;
			portal = _addPortal( Door );
			portal.x1 = 30;
			portal.y1 = 30;
			portal.x2 = 280;
			portal.x2 = 200;
			portal.room1 = Room1;
			portal.room2 = Room2;
			
			portal = _addPortal( Door );
			portal.x1 = 130;
			portal.y1 = 130;
			portal.x2 = 130;
			portal.y2 = 220;
			portal.room1 = Room3;
			portal.room2 = Room2;
			
			portal = _addPortal( Door );
			portal.x1 = 80;
			portal.y1 = 200;
			portal.x2 = 200;
			portal.y2 = 80;
			portal.room1 = Room3;
			portal.room2 = Room3;
			
			credits.initial = 300;
			credits.delay = 100;
			credits.y = 210;
			credits.text.push( "Hacked by Lloyd Kranzky" );
			credits.text.push( "Pixel Placement by Pazu" );
			credits.text.push( "Extra Coding by Beetlefeet" );
			credits.text.push( "Moneybags by Dodgy" );
			credits.text.push( "Insanity by Maxxor" );
			credits.text.push( "Inspiration by Dadams" );
			credits.text.push( "Special Thanks to Ellen" );
			credits.text.push( "Special Thanks to Simon" );
		}
		
		public static function addPortals():void
		{
			var addToRoom:Function = function( portal:Portal, index:Number, arr:Array ):void
			{
				if ( FP.world is portal.room1 || FP.world is portal.room2 )
				{
					trace( "Adding Portal" );
					if ( FP.world is portal.room1 )
					{
						portal.x = portal.x1;
						portal.y = portal.y1;
					}
					else
					{
						portal.x = portal.x2;
						portal.y = portal.y2;
					}
					FP.world.add( portal );
				}
			};
			_portals.forEach( addToRoom );
		}
		
		private static function _addPortal( portalClass:Class ):Portal
		{
			var portal:Portal = new portalClass();
			_portals.push( portal );
			return portal;
		}
	}
}
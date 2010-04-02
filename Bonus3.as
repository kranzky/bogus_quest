package  
{
	import punk.core.Entity;
	
	public class Bonus3 extends BaseRoom
	{
		[Embed(source = 'data/secret.mp3')] private const SndSecret:Class;

		internal var _remaining:int = 0;

		public function Bonus3() 
		{
			super( "Bonus3", 2348 );
		}

		override public function activateGems():void
		{
			FP.play( SndSecret, 0.5 );
			_remaining = countClass( Gem );
			var activate:Function = function( gem:Gem ):void
			{
				gem.bomb = false;
				gem.fake = true;
			};
			withClass( Gem, activate );
		}

		override public function init():void
		{
			super.init();
			
			if ( Main.state < 8 )
			{
				Main.state = 10;
			}
			
			var gem:Gem;
			for ( var i:int = 0; i < 8; i++)
			{
				for ( var j:int = 0; j < 5; j++ )
				{
					if ( j > 0 && j < 4 && i > 2 && i < 5 )
					{
						continue;
					}
					if ( j == 2 && i < 3 || j == 0 && i > 1 && i < 5 || j ==1 && i == 2)
					{
						continue;
					}
					add( gem = new Gem() );
					gem.x = i * 32 + 48;
					gem.y = j * 32 + 48;
					gem.bomb = true;
				}
			}
		}
		
		override public function collect():void
		{
			_remaining -= 1;
			if ( _remaining == 0 )
			{
				Main.door3.locked = false;
			}
		}
	}
}
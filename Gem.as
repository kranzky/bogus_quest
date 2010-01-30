package  
{
	import punk.Acrobat;
	import de.polygonal.math.PM_PRNG;

	public class Gem extends Acrobat
	{	
		[Embed(source = 'data/gem1.png')] private var ImgGem1:Class;
		[Embed(source = 'data/gem2.png')] private var ImgGem2:Class;
		[Embed(source = 'data/gem3.png')] private var ImgGem3:Class;
		[Embed(source = 'data/gem4.png')] private var ImgGem4:Class;
		[Embed(source = 'data/gem5.png')] private var ImgGem5:Class;
		[Embed(source = 'data/gem6.png')] private var ImgGem6:Class;
		
		public function Gem()
		{
			var room:BaseRoom = FP.world as BaseRoom;
			var bitmap:Class;
			switch ( room.pr.nextIntRange( 0, 5 ) )
			{
				case 0: bitmap = ImgGem1; break;
				case 1: bitmap = ImgGem2; break;
				case 2: bitmap = ImgGem3; break;
				case 3: bitmap = ImgGem4; break;
				case 4: bitmap = ImgGem5; break;
				case 5: bitmap = ImgGem6; break;
			}
			sprite = FP.getSprite( bitmap, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "gem" );
		}
		
		override public function update():void
		{
			if ( collideWith( Main.player, x, y ) )
			{
				FP.world.remove( this );
				var room:BaseRoom = FP.world as BaseRoom;
				room.collect();
			}
		}
	}
}
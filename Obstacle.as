package  
{
	import de.polygonal.math.PM_PRNG;

	public class Obstacle extends BaseWall
	{	
		[Embed(source = 'data/rock1.png')] private var ImgRock1:Class;
		[Embed(source = 'data/rock2.png')] private var ImgRock2:Class;
		[Embed(source = 'data/stump.png')] private var ImgStump:Class;
		[Embed(source = 'data/barrel.png')] private var ImgBarrel:Class;
		[Embed(source = 'data/crate.png')] private var ImgCrate:Class;
		[Embed(source = 'data/column.png')] private var ImgColumn:Class;
		[Embed(source = 'data/table.png')] private var ImgTable :Class;
		[Embed(source = 'data/chest.png')] private var ImgChest:Class;
		
		public function Obstacle()
		{
			var room:BaseRoom = FP.world as BaseRoom;
			var outside:Boolean = room.bushTop || room.bushRight || room.bushLeft || room.bushBottom;
			var bitmap:Class;
			switch ( room.pr.nextIntRange( 0, 3 ) )
			{
				case 0: bitmap = outside ? ImgRock1 : ImgCrate; break;
				case 1: bitmap = outside ? ImgRock2 : ImgColumn; break;
				case 2: bitmap = outside ? ImgStump : ImgTable; break;
				case 3: bitmap = outside ? ImgBarrel : ImgChest; break;
			}
			super( "Object", bitmap );
		}	
	}
}
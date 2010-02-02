package  
{
	import punk.Acrobat;
	import punk.core.SpriteMap;
		
	public class BaseWall extends Acrobat
	{	
		internal var _name:String = "BaseWall";

		public function BaseWall( name:String, bitmap:Class, width:int = 32, height:int = 32 ) 
		{
			sprite = FP.getSprite( bitmap, width, height, true, true, width * 0.5, height * 0.5 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "wall" );
			depth = 3;
		}
		
		override public function update():void
		{
			if ( depth < 4 )
			{
				depth = ( y > Main.player.y ) ? 1 : 3;
			}
		}
	}
}
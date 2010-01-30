package  
{
	import punk.Actor;
	import punk.core.SpriteMap;
		
	public class BaseWall extends Actor
	{	
		public function BaseWall( bitmap:Class ) 
		{
			sprite = FP.getSprite( bitmap, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "wall" );
		}
	}
}
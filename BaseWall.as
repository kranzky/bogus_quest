package  
{
	import punk.Actor;
	import punk.core.SpriteMap;
		
	public class BaseWall extends Actor
	{	
		internal var _name:String = "BaseWall";

		public function BaseWall( name:String, bitmap:Class ) 
		{
			trace( "Construct: " + name );
			
			sprite = FP.getSprite( bitmap, 32, 32, false, false, 16, 16 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "wall" );
		}
	}
}
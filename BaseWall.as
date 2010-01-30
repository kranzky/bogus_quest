package  
{
	import punk.Acrobat;
	import punk.core.SpriteMap;
		
	public class BaseWall extends Acrobat
	{	
		internal var _name:String = "BaseWall";

		public function BaseWall( name:String, bitmap:Class, width:int = 32, height:int = 32 ) 
		{
			trace( "Construct: " + name );
			
			sprite = FP.getSprite( bitmap, width, height, true, true, width * 0.5, height * 0.5 );
			setCollisionMask( sprite.getImage() );
			setCollisionType( "wall" );
		}
	}
}
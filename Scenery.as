package  
{
	import punk.Acrobat;
	import punk.core.SpriteMap;
		
	public class Scenery extends Acrobat
	{	
		internal var _name:String = "Scenery";

		public function Scenery( name:String, bitmap:Class, width:int = 32, height:int = 32 ) 
		{
			sprite = FP.getSprite( bitmap, width, height, true, true, width * 0.5, height * 0.5 );
		}
	}
}
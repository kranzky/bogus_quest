package  
{
	import punk.Acrobat;
	
	public class Lever extends Acrobat
	{

		[Embed(source = 'data/lever.png')] private var ImgLever:Class;

		public function Lever() 
		{
			sprite = FP.getSprite( ImgLever, 48, 25, false, false, 24, 12.5 );
			x = 294;
			y = 95;
			setCollisionMask( sprite.getImage() );
			setCollisionType( "lever" );
			active = true;
		}
		
		override public function update():void
		{
			if ( collideWith( Main.player, x, y ) )
			{
				FP.goto = new Death();
			}
		}
		
	}

}

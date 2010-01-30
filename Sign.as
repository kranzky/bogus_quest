package  
{
	public class Sign extends BaseWall
	{	
		[Embed(source = 'data/sign.png')] private var ImgSign:Class;
		[Embed(source = 'data/sign_chipped.png')] private var ImgSignChipped:Class;
		
		public function Sign( wall:int, chipped:Boolean = false )
		{
			super( "Sign", ( chipped ) ? ImgSignChipped : ImgSign, 32, 32 );
			switch ( wall )
			{
				case 1: flipY = true;  angle = 270; break;
				case 2: flipX = true;  break;
				case 3: angle = 90;  break;
				case 4: break;
			}
		}
	}
}
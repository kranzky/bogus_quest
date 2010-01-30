package  
{
	public class Sign extends BaseWall
	{	
		[Embed(source = 'data/sign.png')] private var ImgSign:Class;
		[Embed(source = 'data/sign_chipped.png')] private var ImgSignChipped:Class;
		
		public function Sign( chipped:Boolean = false )
		{
			super( "Sign", ( chipped ) ? ImgSignChipped : ImgSign, 32, 32 );
		}
	}
}
package  
{
	import punk.Actor;

	public class Coin extends Actor
	{		
		[Embed(source = 'data/coin.png')] private var ImgCoin:Class;
		
		public function Coin() 
		{
			sprite = FP.getSprite(ImgCoin, 32, 32, false, false, 16, 16);
			setCollisionRect(32, 32);
			setCollisionType("coin");
		}
	}
}
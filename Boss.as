package  
{
	public class Boss extends BaseRoom
	{
		[Embed(source = 'data/boss.png')] private var ImgFloor:Class;

		public function Boss() 
		{
			super( "Boss", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
		}
	}
}
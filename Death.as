package  
{
	public class Death extends BaseRoom
	{
		[Embed(source = 'data/death.png')] private var ImgFloor:Class;

		public function Death() 
		{
			super( "Death", ImgFloor );
		}
		
		override public function init():void
		{
			super.init();
			
			wrapTop = true;
			wrapBottom = true;
			wrapLeft = true;
			wrapRight = true;
		}
	}
}
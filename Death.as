package  
{
	import flash.display.GraphicsSolidFill;
	import flash.geom.ColorTransform;
	import punk.core.SpriteMap;
	import punk.TextPlus;
	import punk.Text;
	public class Death extends BaseRoom
	{
		[Embed(source = 'data/deceived.mp3')] private const SndDeceived:Class;

		internal var _count:int = 0;
		internal var _caption:TextPlus;
		internal var _reason:TextPlus;
		internal var _message:String;

		public function Death( message:String = "You fell for that one." ) 
		{
			super( "Death", 32599 );
			_message = message;
		}
		
		override public function init():void
		{
			super.init();
			FP.play( SndDeceived );
			_caption = new TextPlus();
			_caption.depth = -1;
			_caption.setString( "Deceived!" );
			_caption.alpha = 0.9;
			_caption.setColour( 1, 0, 0 );
			_caption.scaleX = 4;
			_caption.scaleY = 5;
			_caption.setAlign( 1, 1 );
			_caption.x = 160;
			_caption.y = 70;
			_reason = new TextPlus();
			_reason.depth = -1;
			_reason.setString( _message );
			_reason.alpha = 0.9;
			_reason.setColour( 0, 0, 0 );
			_reason.scaleX = 2;
			_reason.scaleY = 2;
			_reason.setAlign( 1, 1 );
			_reason.x = 160;
			_reason.y = 170;
			add( _caption );
			add( _reason );
		}
		
		override public function update():void
		{
			if ( Main.paused )
			{
				return;
			}
			_count += 1;
			if ( _count == 200 )
			{
				Main.player.reset();
				if ( Main.boss )
				{
					Main.state = 9;
					Main.player.usedKey1 = true;
					Main.player.usedKey2 = true;
					Main.unlockAll();
					Main.door1.locked = false;
					Main.door2.locked = false;
					Main.player.hasKey = false;
					Main.player.falling = false;
					FP.goto = new Boss();
				}
				else
				{
					FP.goto = new Room1();
				}
			}
		}
		
		override public function render():void
		{
			super.render();
			if ( _count > 150 )
			{
				FP.screen.drawClear( 0xFFFFFFFF, (_count - 150 ) / 50 );
			}
		}
	}
}
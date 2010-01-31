package  
{
	import punk.TextPlus;
	
	public class CreditText extends TextPlus
	{
		public var text:Array = [];
		public var delay:int = 30;
		public var initial:int = 0;
		
		internal var _count:int = 0;
		internal var _index:int = 0;
		internal var _show:Boolean = false;
		internal var _keep:Boolean = false;
		
		public function CreditText() 
		{
			active = true;
		}
		public function reset():void
		{
			_count = 0;
			_index = 0;
			_show = true;
			_keep = false;			
		}
		override public function update():void
		{
			if ( _index >= text.length )
			{
				return;
			}
			if ( initial > 0 )
			{
				initial -= 1;
				return;
			}
			_count += 1;
			if ( _count % delay == 0 )
			{
				if ( _show && _index < text.length - 1 )
				{
					_show = false;
				}
				else
				{
					if ( _index < text.length - 1 )
					{
						_index += 1;
					}
					_show = true;
				}
				if ( _index < text.length - 1 )
				{
					_count = 1;
				}
			}
			visible = _show;
			if ( ! _show )
			{
				return;
			}
			if ( _index >= text.length )
			{
				return;
			}
			setString( text[_index] );
			x = 160 - width * 0.5;
			alpha = 1;
			if ( _keep )
			{
				return;
			}
			if ( _index == text.length - 1 && _count > delay / 2 )
			{
				_keep = true;
				return;
			}
			if ( _count % delay < delay / 3 )
			{
				alpha = ( _count % delay ) / ( delay / 3 );
			}
			if ( _index == text.length - 1 )
			{
				return;
			}
			if ( _count % delay > delay - delay / 3 )
			{
				alpha = ( delay - _count % delay ) / ( delay / 3 );
			}
		}
	}
}
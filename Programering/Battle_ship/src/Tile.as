package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jag
	 */
	public class Tile extends Sprite
	{
		public static const tileSide:int = 45;
		public var clicked:Boolean = false;
		
		public function Tile() 
		{
			
		}
		
		public function draw():void
		{
			this.graphics.clear();
			
			if (clicked)
			{
				this.graphics.beginFill(0xFF8080);
				this.graphics.drawRect(0, 0, tileSide, tileSide);
				this.graphics.endFill();
			}
			else
			{
				this.graphics.beginFill(0x0080C0);
				this.graphics.drawRect(0, 0, tileSide, tileSide);
				this.graphics.endFill();
			}
		}
	}

}
package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jag
	 */
	public class Tile extends Sprite
	{
		private static const tileSide:int = 35;
		private var tileType:int = 0;
		public static const WATER:int = 1;
		public static const SHIP:int = 2;
		
		
		
		public function Tile(type:int) 
		{
			setType(type);
			this.graphics.clear();
			this.graphics.beginFill(0x0080FF);
			this.graphics.drawRect(0, 0, tileSide, tileSide);
			this.graphics.endFill();
		}
		public function setType(type:int):void
		{
			this.tileType = type;
		}
		
		public function clicked():void
		{
			if (tileType == WATER)
			{
				this.graphics.clear();
				this.graphics.beginFill(0x0000A0)	
				this.graphics.drawRect(0, 0, tileSide, tileSide)
				this.graphics.endFill();
			}
			
			else if (tileType == SHIP)
			{
				this.graphics.clear();
				this.graphics.beginFill(0x00FF00)	
				this.graphics.drawRect(0, 0, tileSide, tileSide)
				this.graphics.endFill();
			}
		}
			
		public function reset():void
		{
			tileType = WATER;
			this.graphics.clear();
			this.graphics.beginFill(0x0080FF)	
			this.graphics.drawRect(0, 0, tileSide, tileSide)
			this.graphics.endFill();
			
			
		}
	}
	

}
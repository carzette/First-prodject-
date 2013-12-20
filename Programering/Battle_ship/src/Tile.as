package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jag
	 */
	public class Tile extends Sprite
	{
		//gör variabler som jag kommer att använda i denna classen och i Main
		private static const tileSide:int = 35;
		private var tileType:int = 0;
		public static const WATER:int = 1;
		public static const SHIP:int = 2;
		public static var miss:int = 0;
		public static var hits:int = 0;
		public var isClicked:Boolean = false;
		
		//ritar en tile som är WATER
		public function Tile(type:int) 
		{
			setType(type);
			this.graphics.clear();
			this.graphics.beginFill(0x0080FF);
			this.graphics.drawRect(0, 0, tileSide, tileSide);
			this.graphics.endFill();
		}
		//sätter tileTypen till type.
		public function setType(type:int):void
		{
			this.tileType = type;
		}
		
		// functionen clicked gör så att man antligen ritar en miss ruta annars så ritar man ett skäpp.
		public function clicked():void
		{
			if (tileType == WATER)
			{
				miss ++;
				this.graphics.clear();
				this.graphics.beginFill(0x400080)	
				this.graphics.drawRect(0, 0, tileSide, tileSide)
				this.graphics.endFill();
			}
			
			else if (tileType == SHIP)
			{
				hits ++;
				this.graphics.clear();
				this.graphics.beginFill(0x808080)	
				this.graphics.drawRect(0, 0, tileSide, tileSide)
				this.graphics.endFill();
			}
		}
		// gör att du ritar om tilsen till en water tile och sätter tileType till WATER
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
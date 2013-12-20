package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.geom.ColorTransform;
	
	/**
	 * ...
	 * @author Carl Zetterberg
	 */
	public class Main extends Sprite 
	{
		// här initsierar jag alla variablar; vectorer,Textfield och ints mm.
		private var battleboard:Vector.<Vector.<Tile>> = new Vector.<Vector.<Tile>>();
		private var tileX:int;
		private var tileY:int;
		private var scoreboard:TextField = new TextField();
		private var amountOfTiles:int = 0;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			// här ger jag textfieldet scoreboards sina värden.
			scoreboard.text = "Miss:" + " " + Tile.miss.toString() + "\n" + "\n" + "\n" + "Hit:" + " " + Tile.hits.toString(); 
			scoreboard.x = stage.stageWidth * 0.75;
			scoreboard.selectable = false; 
			scoreboard.y = stage.stageHeight * 0.25;
			addChild(scoreboard);
			
			//här addar jag en eventlistener som lysnar om knappen space är nere
			stage.addEventListener(KeyboardEvent.KEY_DOWN , space);
			
			// här gör jag ett 10x10 Tiles fält som pushas in i vectorerna
			for (var i:int = 0; i < 10; i++) 
			{
				var line:Vector.<Tile> = new Vector.<Tile>();
				
				for (var j:int = 0; j < 10; j++) 
				{
					var type:int = 0;
					
					type = Tile.WATER;
						
					
					var tile:Tile = new Tile(type)
					
					tile.x = 0 + j * (tile.width + 5);
					tile.y = 0 + i * (tile.height + 5);
					addChild(tile);
					line.push(tile);
					
					// här addar jag en listener som lysnar på om mus knappen är nere
					tile.addEventListener(MouseEvent.CLICK, clickOn)
					
				}
				
				battleboard.push(line);
				
			}
			// här ger jag funktionen setShip värdet 3 som gör att battleShipLength blir 3/ gör ett skepp som är 3 tiles långt
			setShip(3);
			
		}
		/* här gör jag funktionen clickOn som gör att just den Tilen man trycker på ska bli clicked( antligen blir det ett ship som ritas på den 
		Tilen som man tryckt på eller så ritar man en miss ruta. Den skriver också ut värderna som variablerna miss och hits har. */
		
		private function clickOn(m:MouseEvent):void 
		{
			Tile(m.target).clicked();
			scoreboard.text = "Miss:" + " " + Tile.miss.toString() + "\n" + "\n" + "\n" + "Hit:" + " " + Tile.hits.toString();
			
		}
		// Bestämer vilka Tiles som blir skepp och om skeppet blir horisotelt eller verticalt.
		private function setShip(battleShipLength:int):void 
		{
			var horizontal:int = Math.round(Math.random());
			
			var o:int = 0;
			
			if (horizontal == 1) 
			{
				var shipPoint:Point = new Point(Math.round(Math.random() * (10-battleShipLength)),Math.round(Math.random() * 9));
				
				for (o = 0; o < battleShipLength; o++)
				{
					battleboard[shipPoint.y][shipPoint.x + o].setType(Tile.SHIP);
				}	
					
				
			}
			else 
			{
				var shipPoint:Point = new Point(Math.round(Math.random() * 9),Math.round(Math.random() * (10-battleShipLength)));
				
				for (o = 0; o < battleShipLength; o++)
				{
					battleboard[shipPoint.y + o][shipPoint.x].setType(Tile.SHIP);	
				}
				
				
				
			}
			// skriver i outputen vilka värden den första tilen i skeppet har (först x sedan y). skirver också ut om den är horisental eller vertical, om den skriver 1 så är den horisental om den kriver 0 så är den vertical
			trace(shipPoint.x + ", " + shipPoint.y);	
			trace(horizontal);
			
		}
		// denna functionen bestämer vad som händer som man klickar på space tangenten. i detta fallet så gör man functionen reset 100 gånger och get setShip värderna 3 och 3 alltså så kommer det 2 skepp som är 3 Tiles långa
		private function space(t:KeyboardEvent):void 
		{
			switch (t.keyCode) 
			{
				case Keyboard.SPACE :
					
					for each(var line:Vector.<Tile> in battleboard)
					{
						for each(var tile:Tile in line)
						{
							tile.reset();
							
						}
					}
				setShip(3);	
				setShip(3);
					
				break;
				default:
			}
		
		}
		
	}
	
}
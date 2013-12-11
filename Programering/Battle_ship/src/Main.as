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
		private var battleboard:Vector.<Vector.<Tile>> = new Vector.<Vector.<Tile>>();
		private var tileX:int;
		private var tileY:int;
		private var color:ColorTransform = new ColorTransform();
		private var scoreboard:TextField = new TextField();
		private var score:int = 0;
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
			
			scoreboard.text = score.toString();
			scoreboard.x = stage.stageWidth - scoreboard.width;
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN , space);
			
			//creates a Board with 10x10 tiles
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
					
					tile.addEventListener(MouseEvent.CLICK, clickOn)
					
					amountOfTiles++;
					
				}
				

				battleboard.push(line);
				
			}
			
			setShip();
			
		}
			
		private function clickOn(m:MouseEvent):void 
		{
				Tile(m.target).clicked();
			
		}
		private function setShip():void 
		{
			var horizontal:int = Math.round(Math.random());
			var shipPoint:Point = new Point(Math.round(Math.random() * 7), Math.round(Math.random() * 7));
			trace(shipPoint.x + ", " + shipPoint.y);
			trace(randomPosision);
			
			for (var o:int = 0; o < 3; o++)
			{
				
				if (horizontal == 1) 
				{
					battleboard[shipPoint.y][shipPoint.x + o].setType(Tile.SHIP);
				}
				else 
				{
					battleboard[shipPoint.y+o][shipPoint.x].setType(Tile.SHIP);
				}
				
				
			}
		}
		
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
					
				setShip();
					
				break;
				default:
			}
		
		}
		
	}
	
}
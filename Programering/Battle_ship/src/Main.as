package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
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
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN , space)
			
			//creates a Board with 10x10 tiles
			for (var i:int = 0; i < 10; i++) 
			{
				var line:Vector.<Tile> = new Vector.<Tile>();
				
				for (var j:int = 0; j < 10; j++) 
				{
					var tile:Tile = new Tile()
					tile.draw();
					
					tile.x = 0 + j * (tile.width + 5);
					tile.y = 0 + i * (tile.height + 5);
					addChild(tile);
					line.push(tile);
					
					tile.addEventListener(MouseEvent.CLICK, clickOn)
					
					amountOfTiles++;
					
					
					
				}
				
				battleboard.push(line);
				
			}
			
			
			 function clickOn(m:MouseEvent):void 
			{
				for (var k:int = 0; k < 10; k++) 
				{
					for (var l:int = 0; l <10 ; l++) 
					{
						if (m.target == battleboard[k][l]) 
						{
							score ++;
							scoreboard.text = score.toString();
							addChild (scoreboard);
							m.target.clicked = true;
							m.target.draw();
						}	
					}
					
				}
				
				
				
			}
			
			function space(t:KeyboardEvent):void 
			{
				switch (t.keyCode) 
				{
					case Keyboard.SPACE :
						

						for (var m:int = 0; m < 10; m++) 
						{
							
							for (var n:int = 9; n >= 0; n--) 
							{
								
								battleboard[m][n].clicked = false;
								battleboard[m][n].draw();
								
							}
							
							
							
						}
						
						

						
					score = 0;	
					scoreboard.text = score.toString();
					
					break;
					default:
				}
			
				
			}
			
		}
		
		
		
		
		
		
	}
	
}
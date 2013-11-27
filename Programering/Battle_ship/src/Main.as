package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	/**
	 * ...
	 * @author Carl Zetterberg
	 */
	public class Main extends Sprite 
	{
		private var battleboard:Vector.<Vector.<Sprite>> = new Vector.<Vector.<Sprite>>();
		private var tileX:int;
		private var tileY:int;
		private var tileSide:int = 45;
		private var color:ColorTransform = new ColorTransform();
		
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//stage.addEventListener(KeyboardEvent.KEY_DOWN,space)
			
			//creates a Board with 10x10 tiles
			for (var i:int = 0; i < 10; i++) 
			{
				var line:Vector.<Sprite> = new Vector.<Sprite>();
				for (var j:int = 0; j < 10; j++) 
				{
					var tile:Sprite = new Sprite();
					tile.graphics.beginFill(0x0080C0);
					tile.graphics.drawRect(0, 0, tileSide, tileSide);
					tile.graphics.endFill();
					tile.x = 0 + j * (tile.width + 5);
					tile.y = 0 + i * (tile.height + 5);
					addChild(tile);
					line.push(tile);
					
					tile.addEventListener(MouseEvent.CLICK,clickOn)
					
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
							color.color = 0xFF0000;
							Sprite(battleboard[k][l]).transform.colorTransform = color;
							
						}	
					}
					
				}
				
				
				
			}
			
			
			
		}
		
		
		
		
		
		
	}
	
}
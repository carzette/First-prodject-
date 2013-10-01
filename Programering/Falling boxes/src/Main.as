package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author nicke
	 */
	public class Main extends Sprite 
	{
		private const BOX_SIDE:int = 50;
		private var BOX_SPEED:int = 15;
		private const BOXE_SPEED:int = 10;
		
		private var purpleBox:Sprite = new Sprite();
		private var greenbox: Sprite = new Sprite();
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			purpleBox.graphics.beginFill(0x8000FF);
			purpleBox.graphics.drawEllipse(0, 0, BOX_SIDE, BOX_SIDE);
			purpleBox.graphics.endFill();
			greenbox.graphics.beginFill(0x008000);
			greenbox.graphics.drawEllipse(0, 0, BOX_SIDE, BOX_SIDE);
			addChild(purpleBox);
			addChild(greenbox);
			purpleBox.y = 0;
			randomX(purpleBox);
			
			
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
			stage.addEventListener(Event.ENTER_FRAME, gameoop);
			purpleBox.addEventListener(MouseEvent.CLICK, clickBox);
			greenbox.addEventListener(MouseEvent.CLICK, clickBox);
			
		}
		
		private function gameLoop(e:Event):void 
		{
			purpleBox.y += BOX_SPEED;
		}
		private function gameoop(e:Event):void 
		{
			greenbox.y += BOXE_SPEED;
		}
		
		private function clickBox(m:MouseEvent):void 
		{
			purpleBox.y = 0;
			greenbox.y = 0;
			randomX(purpleBox);
			randomX(greenbox);
		}
		private function randomX(s:Sprite):void
		{
			s.x = Math.random() * (stage.stageWidth - BOX_SIDE);
		}
	}
	
}
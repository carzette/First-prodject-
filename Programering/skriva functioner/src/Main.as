package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Carl Zetterberg 
	 * @version 1 miljon
	 */
	public class Main extends Sprite 
	{
		var t:TextField = new TextField(); 
		
		var antal:int = 12;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point 	
			first();
			addChild(t);
			var tmp:int = second(1, 6);
			t.text = tmp.toString();
			t.y = getRandomYPos();
			t.x = getRandomXPos();
			private const MAX_WIDTH = 200;
			private const MAX_HEIGHT = 100;
			max();
			t.border = true;
			
		
			
			
			
		}
		
		private function max():void		
		
		{
			
			 t.width = MAX_WIDTH;
			 t.height = MAX_HEIGHT;
			 
			
		}
		
		
		private function third():void
		{
			t.text = "du har " + antal + "stycken grisar";
			
			
		}
		private function first():void
		{
			t.text = "hejsan"
		
		}	
		
		private function second(a:int, b:int):int 
		{
			return a + b; 
			
			
		}
		private function getRandomYPos():int
		{
			return Math.random() * stage.stageHeight;
			
		}
		
		
		
		private function getRandomXPos():int
		{
			return Math.random() * stage.stageWidth;
		
			
		}
		
	}
	
}
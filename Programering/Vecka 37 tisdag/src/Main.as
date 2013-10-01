package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author Jag
	 */
	public class Main extends Sprite 
	{
		private var text:TextField = new TextField();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			text.type = TextFieldType.INPUT;
			text.border = true;
			text.text = "hej"
			addChild(text)
			
			
			
		}
		
		
	}
	
}
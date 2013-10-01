package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jag
	 */
	public class Main extends Sprite 
	{
		private var bak: Bok = new Bok()
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			bak.setFarfattare("Carl");
			bak.setSidor(19); 
			bak.setTitel("hej");
			
		}
		
	}
	
}
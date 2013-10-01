package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Jag
	 */
	public class Main extends Sprite 
	{
		private var humanName:String = "Carl Zetterberg";
		private var monsterName:String = "Anton Pettersoon"
		
		private var humanLife:int = 100;
		private var humanAttack:int = 10;
		private var monsterLife:int = 100;
		private var monsterAttack:int = 10;
		
		private const MIN_HUMAN_ATK:int = 10;
		private const MIN_MONSTER_ATK:int = 7;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			 var t:TextField = new TextField();
			
			 for (var i:int = 1; i <= 10; i++)
			 {
				var humanDamage:int = humanAttack * Math.random() + MIN_HUMAN_ATK;
				var monsterDamage:int = monsterAttack * Math.random() + MIN_MONSTER_ATK;
				monsterLife -= humanDamage;
				humanLife -= monsterDamage;
				 
				t.appendText(" Round:" + i +"\n" + humanName + " attack Anton with" + humanDamage + " and" + monsterName + " got" 
					  + monsterLife + " left \n"+ monsterName + " attack Carl with" + monsterDamage + " and" + humanName + " got" 
					  + humanLife + " left \n" + "\n");
					  
				 
				 if (humanLife <= 0)
				 {
					t.appendText ("Carl Zetterberg died and Anot won");
					break;
				 }
			 if (monsterLife <= 0)
			 {
				t.appendText("Anton died and everyone is happy");
				break;
			 }
			 
			 }
			t.width = stage.stageWidth;
			t.height = 700;
			 addChild(t);
		}
		
	}
		
		
	
	
}
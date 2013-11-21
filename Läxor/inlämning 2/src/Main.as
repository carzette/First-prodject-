package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	
	/**
	 * ...
	 * @author Carl Zetterberg
	 */
	public class Main extends Sprite 
	{
		private var Points:String = "ett";
		private var CircleX:int = 0;
		private var CircleY:int = 0;
		private var antal_cirklar:int = 0;
		private var remove:int = 0;
		private var scoreboard:TextField = new TextField();
		private var score:int = 0;
		private var newcirc:Vector.<Sprite> = new Vector.<Sprite>();
		public var Circle:Sprite = new Sprite(); 
		private var mycir:Array = new Array();
		private var endscreen:Sprite = new Sprite();
		private var youlose:TextField = new TextField();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, space)
			
			endscreen.graphics.beginFill(0x400000);
			endscreen.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			endscreen.graphics.endFill();
			
			youlose.background = false;
			youlose.selectable = false;
			youlose.wordWrap = true;
			youlose.x = stage.stageWidth / 2 - 30;
			youlose.y = stage.stageHeight / 2 - 30;
			
		}
			private function space (u:KeyboardEvent):void
			{
				switch (u.keyCode) 
				{
					case Keyboard.SPACE: 
						
						while ( antal_cirklar > 0)
						{
							removeChild(newcirc[0]);
							newcirc.shift();
							antal_cirklar --;
						}
						
							scoreboard.text = score.toString() + " " + "Ponits";
							scoreboard.x = stage.stageWidth - scoreboard.width;
							addChild(scoreboard);
						
						for (var i:int = 0; i < 20; i++)	
						{
							
							
							Circle = new Sprite();
							
							CircleX = Math.random() * stage.stageWidth;
							CircleY = Math.random() * stage.stageHeight;
							Circle.graphics.beginFill(0x400080);
							Circle.graphics.drawCircle(CircleX, CircleY, 20);
							Circle.graphics.lineStyle(2, 0x8080FF);
							Circle.graphics.endFill();
							
							newcirc.push(Circle);
							addChild (newcirc [i]);
							
							remove = Math.random () * 20;
							
							antal_cirklar++; 
							
							Circle.addEventListener(MouseEvent.CLICK, clickon)
							
							score = 0;
						}
						
					scoreboard.selectable = false;
					youlose.visible = false;
					endscreen.visible = false;
					
					break;
					default:
				}
				
			}
			
			
			private function clickon(c:MouseEvent):void
			{
				for ( var i:int=0; i < 20 ; i++)
				{
					if (c.target == newcirc [i])
					{
						if ( i == remove )
				
						{
							youlose.text =  "you got" + " " + score.toString() + " " + "ponits" + " " + "but" + " " + "you lose. \n" + "Press SPACE to restart";
							addChild(endscreen);
							addChild(youlose);
							endscreen.visible = true;
							score = 0;
							youlose.visible = true;
						}
						
						else 
						{ 
							score++;
							scoreboard.text = score.toString() + " " + "Ponits";
							newcirc[i].visible = false;
						}
					}
				}
			}
	}
}
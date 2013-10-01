package 
{
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.*;
	import flash.ui.Keyboard;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Carl Zetterberg
	 */
	public class Main extends Sprite 
	{
		private const restart:Sprite = new Sprite();
		private const Win:Sprite = new Sprite();
		
		private var lodaSide:int = 50;
		private var lodaFall:int = 5;
		private var lodastart:int = 40;
		private var speed:int = 10;
		private var pong:String = "Score";
		private var triHeight:uint = 80;
		private var esc:Boolean = false;
		private var star:Sprite = new Sprite();
		//private var Star2:Sprite = new Sprite();
		
		
		private const restartText:TextField = new TextField();
		private var lvlText:TextField = new TextField();
		private var format:TextFormat = new TextFormat();
		private var  score:TextField = new TextField();
		private var youwin:TextField = new TextField();
		private var points:int = 0;
		private var lvl:int = 1;
		private var format2:TextFormat = new TextFormat();
		private var debug:TextField = new TextField();
		private var starscale:Number = 0.35;
		
		
	
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			this.graphics.endFill();
			
			restart.graphics.beginFill (0xFF0000);
			restart.graphics.drawRect (0, 0, lodaSide + lodaSide, lodaSide);
			restart.graphics.endFill();
			addChild(restart);
		
			restart.addEventListener (MouseEvent.CLICK, restarting)
			restartText.text = "RESTART";
			restartText.y = 15;
			restartText.x = 20;
			restartText.selectable = false;
			addChild(restartText);
			restartText.addEventListener(MouseEvent.CLICK, restarting)
			
			format.size = 32;
			format.display = TextFormatDisplay.BLOCK;
			format.color = 0xFFFFFF;
			format.align = TextFormatAlign.RIGHT;
			score.setTextFormat(format);
			
			score.text = points.toString();
			score.y = 0;
			score.x = stage.stageWidth -100;
			score.background = false;
			score.selectable = false;
			addChild(score);
			
			debug.width = stage.stageWidth;
			debug.height = stage.stageHeight;
			debug.selectable = false;
			
			star.graphics.beginFill(0xFFFF00);
			star.graphics.moveTo(150,25);
			star.graphics.lineTo (179,111);
			star.graphics.lineTo (269,111);
			star.graphics.lineTo (197, 165);
			star.graphics.lineTo(223,251);
			star.graphics.lineTo(150,200);
			star.graphics.lineTo(77,251);
			star.graphics.lineTo(103,165);
			star.graphics.lineTo(31,111);
			star.graphics.lineTo(121,111);
			star.graphics.endFill();
			star.scaleX = starscale;
			star.scaleY = starscale;
			star.buttonMode = true;
			randomX(star);
		    addChild(star);
			
			/*Star2.graphics.beginFill(0xFFFF00);
			Star2.graphics.moveTo(150,25);
			Star2.graphics.lineTo (179,111);
			Star2.graphics.lineTo (269,111);
			Star2.graphics.lineTo (197, 165);
			Star2.graphics.lineTo(223,251);
			Star2.graphics.lineTo(150,200);
			Star2.graphics.lineTo(77,251);
			Star2.graphics.lineTo(103,165);
			Star2.graphics.lineTo(31,111);
			Star2.graphics.lineTo(121,111);
			Star2.graphics.endFill();
			Star2.scaleX = starscale;
			Star2.scaleY = starscale;
			Star2.buttonMode = true
			Star2.x = lodastart + 10;
			randomX(Star2);
		    addChild(Star2);*/
		  
			
			this.addEventListener(KeyboardEvent.KEY_DOWN, escdown);
			this.addEventListener(KeyboardEvent.KEY_UP, escup);
			stage.addEventListener (Event.ENTER_FRAME, ner);
			star.addEventListener (MouseEvent.CLICK, klick);
			//Star2.addEventListener (MouseEvent.CLICK, klick);
			
			Win.graphics.beginFill(0xFF8000);
			Win.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			Win.graphics.endFill();
			
			youwin.text = " lvl Done";
			youwin.background = false;
			youwin.selectable = false;
			youwin.wordWrap = true;
			youwin.x = stage.stageWidth / 2 - 30;
			youwin.y = stage.stageHeight / 2 - 30;
		   
			format2.size = 32;
			format2.display = TextFormatDisplay.BLOCK;
			format2.color = 0x400080;
			format2.align = TextFormatAlign.CENTER;
			youwin.setTextFormat(format2);
			
			debug.width = stage.stageWidth;
			debug.height = stage.stageHeight;
			debug.selectable = false;
		
			lvlText.text = lvl.toString();
			lvlText.setTextFormat(format);
			lvlText.x = stage.stageWidth / 2;
			lvlText.y = 5;
			addChild(lvlText);
			
			
			
			
			
		}
		
		private function escdown(y:KeyboardEvent):void
		{
			switch(y.keyCode)
			{
				case Keyboard.ESCAPE:
					esc = true 
					break;
			}
		}
		
		private function escup(u:KeyboardEvent):void	
		{
			switch (u.keyCode)
			{
				case Keyboard.ESCAPE:
					esc = false
					break;
			}
			
		}
		
		private function restarting(r:MouseEvent):void 
		{
			star.y = lodastart;
			//Star2.y = lodastart -30;
			randomX(star);
			//randomX(Star2);
			lodaFall = 5;
			points = 0;
			score.text = points.toString();
			score.setTextFormat(format);
		}
		
		private function ner(ne:Event):void 
		{
			star.y += lodaFall;
			star.x = star.x + speed;
			
			/*Star2.y += lodaFall - 2;
			Star2.x = Star2.x + speed;*/
			
			
			if (star.y >= stage.stageHeight - lodaSide - 25)
			{
				lodaFall = -lodaFall;
			}
			if (star.y <= 0)
			{
				lodaFall = -lodaFall;
			}
			if (star.x >= stage.stageWidth - lodaSide - 25)
			{
				speed = -speed;
			}
			if (star.x  <= 0)
			{	
				speed = -speed;
			
			}
			
			if (points == 3)
			{
				addChild(Win);
				addChild(youwin);
				Win.visible = true;
				debug.visible = true;
				youwin.visible = true;
				score.visible = false;
				star.visible = false;
				restart.visible = false;
				restartText.visible = false;
				points = 0;
				lvl ++;
				addChild(debug);
			}
			if (esc)
			{
				score.visible = true;
				star.visible = true;
				restart.visible = true;
				restartText.visible = true;
				Win.visible = false;
				youwin.visible = false;
				debug.visible = false;
				score.text = points.toString();
				score.setTextFormat(format);
				esc = false;
				lodaFall += 5;
			}
			
		}
		
		private function klick(u:MouseEvent):void 
		{
			star.y = lodastart;
			//Star2.y = lodastart;
			//randomX(Star2);
			randomX(star);
			lodaFall += 5;
			points ++;
			score.text = points.toString();
			score.setTextFormat(format);
			
		}
		
		
		private function randomX(s:Sprite):void 
		{
			s.x = Math.random()  * (stage.stageWidth - lodaSide) + 3;
			
		}
		
		
	}
	
}
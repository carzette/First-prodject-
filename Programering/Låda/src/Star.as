package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Jag
	 */
	public class Star extends Sprite 
	{
		
		public var starSpeedX:int = 5;
		public var starSpeedY:int = 10;
		private var active:Boolean;
		
		public function Star(scale:Number) 
		{
			draw(scale);
			starSpeedX *= 2 * Math.random();
			starSpeedY *= 2 * Math.random();
			active = true;
		}
		
		public function update():void
		{
			x += starSpeedX;
			y += starSpeedY;
		}
		
		public function enable():void
		{
			this.visible = true;
			active = true;
		}
		
		public function disable():void
		{
			this.visible = false;
			active = false;
		}
		
		private function draw(scale:Number):void
		{
			this.graphics.beginFill(0xFFFF00);
			this.graphics.moveTo(150,25);
			this.graphics.lineTo (179,111);
			this.graphics.lineTo (269,111);
			this.graphics.lineTo (197, 165);
			this.graphics.lineTo(223,251);
			this.graphics.lineTo(150,200);
			this.graphics.lineTo(77,251);
			this.graphics.lineTo(103,165);
			this.graphics.lineTo(31,111);
			this.graphics.lineTo(121,111);
			this.graphics.endFill();
			this.scaleX = scale;
			this.scaleY = scale;
			this.buttonMode = true;
		}
		
	}

}
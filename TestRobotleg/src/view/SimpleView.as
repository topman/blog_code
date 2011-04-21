package view 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * 
	 * @author Tower Joo
	 */
	public class SimpleView extends Sprite
	{
		private var greetingDisplay:TextField;
		
		public function SimpleView() 
		{
			greetingDisplay = new TextField();
			//greetingDisplay.text = "hello";
			addChild(greetingDisplay);
		}
		
		public function updateGreeting(msg : String):void 
		{
			greetingDisplay.text = msg;
		}
		
	}

}
package view.components 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class InGameScore extends Sprite
	{
		private var scoreField : TextField = new TextField();
		public function InGameScore() 
		{
			addChild(scoreField);
		}
		
		public function init(score: int):void 
		{
			scoreField.text = "" + score;
			this.x = 100;
		}
		
	}

}
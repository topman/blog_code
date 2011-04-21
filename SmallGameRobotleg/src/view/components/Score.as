package view.components 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class Score extends Sprite
	{
		private var scoreField : TextField = new TextField();
		
		public function Score() 
		{
			addChild(scoreField);
		}
		
		public function init():void 
		{
			scoreField.text = "0";
			visible = false;	//只有当结束时可见
		}
		
	}

}
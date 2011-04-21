package view.components 
{
	import controller.GameEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import org.robotlegs.base.ContextEvent;
	/**
	 * ...
	 * @author Tower Joo
	 */
	public class SettingsBoard extends Sprite
	{
		private var startBtn : TextField = new TextField();
		private var stopBtn : TextField = new TextField();
		private var settingsBtn : TextField = new TextField();
		private var countSecond : TextField = new TextField();	// 显示倒计时
		
		private var timer : Timer;
		private var currentSecond : int = 0;
		
		public function SettingsBoard() 
		{
			addChild(startBtn);
			addChild(stopBtn);
			addChild(settingsBtn);
			addChild(countSecond);
			
			
			startBtn.addEventListener(MouseEvent.CLICK, onStart);
			startBtn.addEventListener(MouseEvent.CLICK, onStop);
			startBtn.addEventListener(MouseEvent.CLICK, onSettings);
		}
		
		private function onStart(e:MouseEvent):void 
		{
			this.dispatchEvent(new GameEvent(GameEvent.START));
		}
		
		private function onStop(e:MouseEvent):void 
		{
			
		}
		
		private function onSettings(e:MouseEvent):void 
		{
			
		}
		
		public function init():void 
		{
			startBtn.text = "start";
			startBtn.x = 20;
			startBtn.y = 20;
			
			stopBtn.visible = false;
			stopBtn.x = 50;
			stopBtn.y = 20;
			
			settingsBtn.text = "settings";
			settingsBtn.x = 80;
			settingsBtn.y = 20;
			
			countSecond.text = "0";
			countSecond.x = 130;
			countSecond.y = 20;
			countSecond.visible = false;
		}
		
		public function startGame(shotTime : int):void 
		{
			startBtn.text = "Pause";
			
			stopBtn.visible = true;
			countSecond.visible = true;
			countSecond.text = "" + shotTime;
			currentSecond = shotTime;
			
			timer = new Timer(1000, shotTime);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onCountDown);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimeOut);
			
		}
		
		private function onTimeOut(e:TimerEvent):void 
		{
			timer.stop();
		}
		
		private function onCountDown(e:TimerEvent):void 
		{
			currentSecond --;
			countSecond.text = "" + currentSecond;
		}
		
	}

}
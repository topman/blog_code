package 
{
	import flash.display.Sprite;
	
	/**
	 * 游戏说明：
	 *  1. M x N的格子
	 *  2. 游戏开始时，会根据当前的游戏等级，在其中的n个方格会有字母显示，以代表这个格子是被占过的
	 *  3. 第2步显示时间为2秒
	 *  4. 结束后，玩家有5秒时间，根据记忆，选择之前被占过的方格
	 *  5. 5秒到了后，如果与第2步的方格匹配，则为用户加分，并进入下一关,回到第2步
	 *  6. 如果不匹配，则游戏结束，显示用户的等分
	 * 
	 * 主程序入口
	 * @author Tower Joo
	 */
	public class Main extends Sprite
	{
		private var context:MainContext;
		
		public function Main()
		{
			context = new MainContext(this);
			
		}
	}
	
}
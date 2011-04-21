package model 
{
	import controller.MapSizeVO;
	import org.robotlegs.mvcs.Actor;
	/**
	 * 提供游戏相关的数据
	 * @author Tower Joo
	 */
	public class GameModel extends Actor
	{
		private var level : int = 1; // 游戏当前的级别
		public var shotTime : int = 3; // 可供玩家查看的时间， 秒
		public var fillTime : int = 10; // 可供玩家记忆并填充的时间， 秒
		public var map : MapSizeVO = new MapSizeVO();
		public var filledTiles : Array = [];
		public var score : int = 0;	// 用户的得分
		public var tileColor: int = 0x0055FF; //  格子的颜色
		
		public function GameModel() 
		{
			
		}
		
		/**
		 * 初始化游戏
		 */
		public function initGame():void 
		{
			level = 1;
			setCurrentLevelData();
		}
		
		/**
		 * 设置当前级别的相关数据
		 */
		public function setCurrentLevelData() : void {
			map = getMapSize();
			filledTiles = getFilledTiles(map);
		}
		
		/**
		 * 得到当前级别占用的格子
		 * @param	map: MapSizeVO
		 * @return: 地图格子的索引，地图会是一个一维数组
		 */
		private function getFilledTiles(map : MapSizeVO): Array
		{
			var all : int = map.col * map.row;
			var out : Array = [];
			var i : int = 0;
			while( i < map.tilesNum){
				var tile : int = Math.floor(Math.random() * all);
				if (tile == 0) {
					continue;
				}
				if (tile in out) {
					continue;
				}
				out.push(tile);
				i += 1;
			}
			return out;
		}
		
		/**
		 * 得到当前级别的地图信息
		 * @return
		 */
		private function getMapSize(): MapSizeVO
		{
			if (level < 5) {
				map.row = 4;
				map.col = 4;
			}
			else if (level < 10) {
				map.row = level;
				map.col = level;
			}
			else {
				map.row = 10;
				map.col = 10;
			}
			map.tilesNum = Math.max(level, 3);
			return map;
		}
		
	}

}
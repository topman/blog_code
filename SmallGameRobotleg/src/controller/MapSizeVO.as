package controller 
{
	/**
	 * 地图大小的VO
	 * @author Tower Joo
	 */
	public class MapSizeVO 
	{
		public var row: int;
		public var col: int;
		public var tilesNum : int;
		public function MapSizeVO() 
		{
			row = 4;
			col = 4;
			tilesNum = 1;
		}
		
	}

}
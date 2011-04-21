package view.components 
{
	import controller.MapSizeVO;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	/**
	 * 
	 * @author Tower Joo
	 */
	public class GameBoard extends Sprite
	{
		private var scoreField : TextField = new TextField();
		private var tiles : Array = [];
		private var usersInput: Array = [];
		
		
		public function GameBoard() 
		{
			addChild(scoreField);
		}
		
		public function init(map:MapSizeVO, filledTiles:Array, tileColor: int):void 
		{
			var padding : int = 50;
			
			var x : int = 0;
			var y : int = 0;
			var width : int = 40;
			var row : int = 0;
			var col : int = 0;
			
			for (var i:int = 0; i < map.row * map.col; i++) {
				if (i > 0 && i % map.col == 0) {
					row += 1;
					col = 0;
				}
				x = col * width + padding;
				y = row * width + padding;
				tiles.push(createTile(x, y, width - 5, width - 5, tileColor));
				col += 1;
			}
			for (i = 0; i < map.row * map.col; i++) {
				addChild(tiles[i]);
			}
		}
		
		public function createTile(x : int, y : int, width : int, height: int, color:int = 0): Sprite {
			var tile : Sprite = new Sprite();
			tile.graphics.beginFill(color);
			tile.x = x;
			tile.y = y;
			tile.graphics.drawRect(0,0, width, height);
			tile.graphics.endFill();
			return tile;
		}
		
		public function startGame(filledTiles : Array):void 
		{
			fillTilesWithLetters(filledTiles);
			addListener();
		}
		
		private function addListener():void 
		{
			for (var i:int = 0; i < tiles.length; i++) {
				var tile : Sprite = tiles[i];
				tile.mouseEnabled = true;
				tile.addEventListener(MouseEvent.CLICK, onLetterClicked);
			}
		}
		
		private function onLetterClicked(e:MouseEvent):void 
		{
			if (e.target is TextField) {
				usersInput.push(getIndexofTile(e.currentTarget as Sprite));
			}
			else {
				// TODO:游戏结束
			}
		}
		
		private function getIndexofTile(tile:Sprite):int 
		{
			return tiles.indexOf(tile);
		}
		
		private function createRandomLetter(): TextField {
			var txt : TextField = new TextField();
			txt.text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".charAt(Math.ceil(Math.random() * 25));
			txt.x = 5;
			txt.y = 5;
			return txt;
		}
		
		private function fillTilesWithLetters(filledTiles: Array):void 
		{
			var i : int = 0;
			for (; i < filledTiles.length; i++) {
				var s : Sprite = tiles[filledTiles[i]] as Sprite;
				s.addChild(createRandomLetter());
			}
			
		}
		
	}

}
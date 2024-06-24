extends Node

enum GAME_STATE_TYPE{
	READY_MAIN_UI, ##主介面
	PLAYING_INIT, ##遊戲初始化
	PLAYING_READY, ##戰鬥準備
	PLAYING_FIGHT, ##開始行動
	PLAYING_RESULT, ##遊戲結算 
}

extends BaseStateMachine
class_name GameStateMachine



'''
#進入狀態
func enter(_msg:Dictionary = {}):

#更新狀態->process
func update(delta:float)->void:

#離開狀態
func exit():
'''


func _ready():
	add_state(StateEnum.GAME_STATE_TYPE.READY_MAIN_UI, s_Ready_Main_UI.new(self))
	add_state(StateEnum.GAME_STATE_TYPE.PLAYING_INIT, s_Playing_Init.new(self))
	add_state(StateEnum.GAME_STATE_TYPE.PLAYING_READY, s_Playing_Ready.new(self))
	add_state(StateEnum.GAME_STATE_TYPE.PLAYING_FIGHT, s_Playing_Fight.new(self))
	add_state(StateEnum.GAME_STATE_TYPE.PLAYING_RESULT, s_Playing_Result.new(self))

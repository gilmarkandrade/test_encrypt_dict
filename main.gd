extends Node2D


var Data = {"test":100,"abcd":"test","itens":"d65a4d65","number":0, "dict":{"name":"kayo","id":10}, "boolTest":true}


func _ready():
	Data.nomeMundo = $".".name



func _on_Button_pressed():
	
	print(Data, "=====data======")
	var teste = JSON.print(Data)
	print("======================encripty===============================")
	yield(get_tree().create_timer(1),"timeout")
	var text = AesEnc.encrypt(teste,"dsadasdasdsadsad")
	print(text,"  encripty")
	#var textR = text.get_string_from_ascii ( )
	var textR = text.hex_encode()
	#var textR = text.get_string_from_utf8()

	
	print(textR,"convert in text")
	#print(typeof(textR))
	#JavaScript.eval(str("setDate('",textR,"')"))
	yield(get_tree().create_timer(1),"timeout")
	print("convert string in poolbytearray")
	textR = textR.to_utf8()
	print(textR)
	#var result =JavaScript.eval(str("window.localStorage.getItem(date)"))
	#print(result)
	
	
	
	"""print("======================convert===============================")
	yield(get_tree().create_timer(1),"timeout")
	text = JSON.print(text)
	print(text, "convert")
	print("======================disconvert===============================")
	yield(get_tree().create_timer(1),"timeout")
	text = JSON.parse(text)
	print(text, "disconvert")
	yield(get_tree().create_timer(1),"timeout")"""
	
	
	yield(get_tree().create_timer(1),"timeout")
	print("======================decript===============================")
	var text2 = AesEnc.decrypt(textR,"dsadasdasdsadsad")
	print(text2)
	yield(get_tree().create_timer(1),"timeout")
	print("======================convert===============================")
	
	if text2 !=null:
		
		convert_to_dict(text2)
		
	else: 
		
		print("falhou")
	
	
	
	print("=================================teste2====================================")
	#var teste2 = AES.encrypt_ctr_base64(teste,"dsadasdasdsadsad",text2)
	
func convert_to_dict(body: PoolByteArray) :
	
	var stringResult: String = body.get_string_from_utf8()
	var jsonParseResult: JSONParseResult = JSON.parse(stringResult)
	var userJson = jsonParseResult.result
	print(userJson)
	#print(typeof(userJson))

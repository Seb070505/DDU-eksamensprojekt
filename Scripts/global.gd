extends Node

var musikplade = 0
var penge = 0
var interact = false
var pickUp = false
var interactZone = false
var pickUpZone = false
var interactMedDatterMulig = false
var mulighedForAtTageBussen = false
var busTurOver = false
var iGangMedAtTageBussen = false
var interactMedReceptionistMulig = false
var mulighedForAtTageElevatoren = false
var DokterEtage = false
var medicinSynelig = false
var medicinTaget = false
var tilbageUdenforHospital = false
var chickenSynelig = false
var chicken = 0
var snakketMedDatter = false
var underligVerden = false
var brandStation = false
var snakketMedBrandmand = false
var snakketMedDatter2 = false

var objektiv_musikplade = false
var objektiv_pladeAfspiller = false
var objektiv_datter = false
var objektiv_gaaUdafHoveddoeren = false
var objektiv_tagBussen = false
var objektiv_gaaIndPaaHospitalet = false
var objektiv_snakMedReceptionisten = false
var objektiv_tagElevatoren = false
var objektiv_snakMedDoktor = false
var objektiv_tagDinMedicin = false
var objektiv_tagElevatorenUdAfHospitalet = false
var objektiv_besoegSlagteren = false
var objektiv_snakMedSlagteren = false
var objektiv_tagKylling = false
var objektiv_forladButikken = false
var objektiv_snakMedDatter = false
var objektiv_gaaUdAfHuset = false
var objektiv_gaaIndModByen = false
var objektiv_snakMedBrandmand = false
var objektiv_snakMedDatter2 = false
var spilSlut = false

func _physics_process(delta):
	if objektiv_musikplade == true and objektiv_pladeAfspiller == false:
		save_data("res://data.dat", 1)
		
	elif objektiv_pladeAfspiller == true and objektiv_datter == false:
		save_data("res://data.dat", 2)
		
	elif objektiv_datter == true and objektiv_gaaUdafHoveddoeren == false:
		save_data("res://data.dat", 3)
		
	elif objektiv_gaaUdafHoveddoeren == true and objektiv_tagBussen == false:
		save_data("res://data.dat", 4)
		
	elif objektiv_tagBussen == true and objektiv_gaaIndPaaHospitalet == false:
		save_data("res://data.dat", 5)
		
	elif objektiv_gaaIndPaaHospitalet == true and objektiv_snakMedReceptionisten == false:
		save_data("res://data.dat", 6)
		
	elif objektiv_snakMedReceptionisten == true and objektiv_tagElevatoren == false:
		save_data("res://data.dat", 7)
		
	elif objektiv_tagElevatoren == true and objektiv_snakMedDoktor == false:
		save_data("res://data.dat", 8)
		
	elif objektiv_snakMedDoktor == true and objektiv_tagDinMedicin == false:
		save_data("res://data.dat", 9)
		
	elif objektiv_tagDinMedicin == true and objektiv_tagElevatorenUdAfHospitalet == false:
		save_data("res://data.dat", 10)
		
	elif objektiv_tagElevatorenUdAfHospitalet == true and objektiv_besoegSlagteren == false:
		save_data("res://data.dat", 11)
		
	elif objektiv_besoegSlagteren == true and objektiv_snakMedSlagteren == false:
		save_data("res://data.dat", 12)
		
	elif objektiv_snakMedSlagteren == true and objektiv_tagKylling == false:
		save_data("res://data.dat", 13)
		
	elif objektiv_tagKylling == true and objektiv_forladButikken == false:
		save_data("res://data.dat", 14)
		
	elif objektiv_forladButikken == true and objektiv_snakMedDatter == false:
		save_data("res://data.dat", 15)
		
	elif objektiv_snakMedDatter == true and objektiv_gaaUdAfHuset == false:
		save_data("res://data.dat", 16)
		
	elif objektiv_gaaUdAfHuset == true and objektiv_gaaIndModByen == false:
		save_data("res://data.dat", 17)
		
	elif objektiv_gaaIndModByen == true and objektiv_snakMedBrandmand == false:
		save_data("res://data.dat", 18)
		
	elif objektiv_snakMedBrandmand == true and objektiv_snakMedDatter2 == false:
		save_data("res://data.dat", 19)
		
	elif objektiv_snakMedDatter2 == true and spilSlut == false:
		save_data("res://data.dat", 20)
		
	elif spilSlut == true:
		save_data("res://data.dat", 0)

func save_data(path, data):
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_var(data)
	file.close()

func load_data(path):
	var file = File.new()
	var content
	file.open(path, File.READ)
	content = file.get_var()
	file.close()
	return content


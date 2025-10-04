extends Node3D

var xr_interface: XRInterface

func _ready():
	var is_visionos = OS.get_name() == "visionOS"
	var xr_interface_name = "visionOS" if is_visionos else "Native mobile"
	var interface = XRServer.find_interface(xr_interface_name)
	if interface and interface.initialize():
		var viewport : Viewport = get_viewport()
		viewport.use_xr = true
		if is_visionos:
			viewport.vrs_mode = Viewport.VRS_XR

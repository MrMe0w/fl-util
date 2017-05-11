--[[
	© 2016-2017 TeslaCloud Studios

	See license in LICENSE.txt.
--]]

if (!util.HexToDecimal) then
	AddCSLuaFile("sh_hex.lua")
	include("sh_hex.lua")
end

if (!util.HexToDecimal) then
	ErrorNoHalt("[FL - Util] sh_hex.lua was not found! Cannot use color library without it!\n")

	return
end

local colorMeta = FindMetaTable("Color")

function colorMeta:Darken(amt)
	return Color(
		math.Clamp(self.r - amt, 0, 255),
		math.Clamp(self.g - amt, 0, 255),
		math.Clamp(self.b - amt, 0, 255),
		self.a
	)
end

function colorMeta:Lighten(amt)
	return Color(
		math.Clamp(self.r + amt, 0, 255),
		math.Clamp(self.g + amt, 0, 255),
		math.Clamp(self.b + amt, 0, 255),
		self.a
	)
end

-- A function to convert hexadecimal color to a color structure.
function util.HexToColor(hex)
	if (hex:StartWith("#")) then
		hex = hex:sub(2, hex:len())
	end

	if (hex:len() != 6 and hex:len() != 8) then
		return Color(255, 255, 255)
	end

	local hexColors = {}
	local initLen = hex:len() / 2

	for i = 1, hex:len() / 2 do
		table.insert(hexColors, hex:sub(1, 2))

		if (i != initLen) then
			hex = hex:sub(3, hex:len())
		end
	end

	local color = {}

	for k, v in ipairs(hexColors) do
		table.insert(color, util.HexToDecimal(v))
	end

	return Color(color[1], color[2], color[3], (color[4] or 255))
end

do
	local colors = {
		aliceblue 			= Color(240, 248, 255),
		antiquewhite 		= Color(250, 235, 215),
		aqua 				= Color(0, 255, 255),
		aquamarine 			= Color(127, 255, 212),
		azure		 		= Color(240, 255, 255),
		beige 				= Color(245, 245, 220),
		bisque 				= Color(255, 228, 196),
		black 				= Color(0, 0, 0),
		blanchedalmond 		= Color(255, 235, 205),
		blue 				= Color(0, 0, 255),
		blueviolet 			= Color(138, 43, 226),
		brown 				= Color(165, 42, 42),
		burlywood	 		= Color(222, 184, 135),
		cadetblue 			= Color(95, 158, 160),
		chartreuse 			= Color(127, 255, 0),
		chocolate 			= Color(210, 105, 30),
		coral				= Color(255, 127, 80),
		cornflowerblue 		= Color(100, 149, 237),
		cornsilk 			= Color(255, 248, 220),
		crimson 			= Color(220, 20, 60),
		cyan 				= Color(0, 255, 255),
		darkblue 			= Color(0, 0, 139),
		darkcyan 			= Color(0, 139, 139),
		darkgoldenrod 		= Color(184, 134, 11),
		darkgray 			= Color(169, 169, 169),
		darkgreen 			= Color(0, 100, 0),
		darkgrey 			= Color(169, 169, 169),
		darkkhaki 			= Color(189, 183, 107),
		darkmagenta 		= Color(139, 0, 139),
		darkolivegreen 		= Color(85, 107, 47),
		darkorange 			= Color(255, 140, 0),
		darkorchid 			= Color(153, 50, 204),
		darkred 			= Color(139, 0, 0),
		darksalmon 			= Color(233, 150, 122),
		darkseagreen 		= Color(143, 188, 143),
		darkslateblue 		= Color(72, 61, 139),
		darkslategray 		= Color(47, 79, 79),
		darkslategrey 		= Color(47, 79, 79),
		darkturquoise 		= Color(0, 206, 209),
		darkviolet 			= Color(148, 0, 211),
		deeppink 			= Color(255, 20, 147),
		deepskyblue 		= Color(0, 191, 255),
		dimgray 			= Color(105, 105, 105),
		dimgrey 			= Color(105, 105, 105),
		dodgerblue 			= Color(30, 144, 255),
		firebrick 			= Color(178, 34, 34),
		floralwhite 		= Color(255, 250, 240),
		forestgreen 		= Color(34, 139, 34),
		fuchsia 			= Color(255, 0, 255),
		gainsboro 			= Color(220, 220, 220),
		ghostwhite 			= Color(248, 248, 255),
		gold 				= Color(255, 215, 0),
		goldenrod 			= Color(218, 165, 32),
		gray 				= Color(128, 128, 128),
		grey 				= Color(128, 128, 128),
		green 				= Color(0, 128, 0),
		greenyellow 		= Color(173, 255, 47),
		honeydew 			= Color(240, 255, 240),
		hotpink 			= Color(255, 105, 180),
		indianred 			= Color(205, 92, 92),
		indigo 				= Color(75, 0, 130),
		ivory 				= Color(255, 255, 240),
		khaki 				= Color(240, 230, 140),
		lavender 			= Color(230, 230, 250),
		lavenderblush 		= Color(255, 240, 245),
		lawngreen 			= Color(124, 252, 0),
		lemonchiffon 		= Color(255, 250, 205),
		lightblue 			= Color(173, 216, 230),
		lightcoral 			= Color(240, 128, 128),
		lightcyan 			= Color(224, 255, 255),
		lightgoldenrodyellow = Color(250, 250, 210),
		lightgray 			= Color(211, 211, 211),
		lightgreen 			= Color(144, 238, 144),
		lightgrey 			= Color(211, 211, 211),
		lightpink 			= Color(255, 182, 193),
		lightsalmon 		= Color(255, 160, 122),
		lightseagreen 		= Color(32, 178, 170),
		lightskyblue 		= Color(135, 206, 250),
		lightslategray 		= Color(119, 136, 153),
		lightslategrey 		= Color(119, 136, 153),
		lightsteelblue 		= Color(176, 196, 222),
		lightyellow 		= Color(255, 255, 224),
		lime 				= Color(0, 255, 0),
		limegreen 			= Color(50, 205, 50),
		linen 				= Color(250, 240, 230),
		magenta 			= Color(255, 0, 255),
		maroon 				= Color(128, 0, 0),
		mediumaquamarine	= Color(102, 205, 170),
		mediumblue 			= Color(0, 0, 205),
		mediumorchid 		= Color(186, 85, 211),
		mediumpurple 		= Color(147, 112, 219),
		mediumseagreen 		= Color(60, 179, 113),
		mediumslateblue 	= Color(123, 104, 238),
		mediumspringgreen 	= Color(0, 250, 154),
		mediumturquoise 	= Color(72, 209, 204),
		mediumvioletred 	= Color(199, 21, 133),
		midnightblue 		= Color(25, 25, 112),
		mintcream 			= Color(245, 255, 250),
		mistyrose 			= Color(255, 228, 225),
		moccasin 			= Color(255, 228, 181),
		navajowhite 		= Color(255, 222, 173),
		navy			 	= Color(0, 0, 128),
		oldlace 			= Color(253, 245, 230),
		olive 				= Color(128, 128, 0),
		olivedrab 			= Color(107, 142, 35),
		orange 				= Color(255, 165, 0),
		orangered 			= Color(255, 69, 0),
		orchid 				= Color(218, 112, 214),
		palegoldenrod 		= Color(238, 232, 170),
		palegreen 			= Color(152, 251, 152),
		paleturquoise 		= Color(175, 238, 238),
		palevioletred 		= Color(219, 112, 147),
		papayawhip 			= Color(255, 239, 213),
		peachpuff 			= Color(255, 218, 185),
		peru 				= Color(205, 133, 63),
		pink 				= Color(255, 192, 203),
		plum 				= Color(221, 160, 221),
		powderblue 			= Color(176, 224, 230),
		purple 				= Color(128, 0, 128),
		red 				= Color(255, 0, 0),
		rosybrown 			= Color(188, 143, 143),
		royalblue 			= Color(65, 105, 225),
		saddlebrown 		= Color(139, 69, 19),
		salmon 				= Color(250, 128, 114),
		sandybrown 			= Color(244, 164, 96),
		seagreen 			= Color(46, 139, 87),
		seashell 			= Color(255, 245, 238),
		sienna 				= Color(160, 82, 45),
		silver 				= Color(192, 192, 192),
		skyblue 			= Color(135, 206, 235),
		slateblue 			= Color(106, 90, 205),
		slategray 			= Color(112, 128, 144),
		slategrey 			= Color(112, 128, 144),
		snow 				= Color(255, 250, 250),
		springgreen 		= Color(0, 255, 127),
		steelblue 			= Color(70, 130, 180),
		tan 				= Color(210, 180, 140),
		teal 				= Color(0, 128, 128),
		thistle				= Color(216, 191, 216),
		tomato 				= Color(255, 99, 71),
		turquoise 			= Color(64, 224, 208),
		violet 				= Color(238, 130, 238),
		wheat 				= Color(245, 222, 179),
		white 				= Color(255, 255, 255),
		whitesmoke 			= Color(245, 245, 245),
		yellow 				= Color(255, 255, 0),
		yellowgreen 		= Color(154, 205, 50)
	}

	local oldColor = util.oldColor or Color
	util.oldColor = oldColor

	function Color(r, g, b, a)
		if (isstring(r)) then
			if (r:StartWith("#")) then
				return util.HexToColor(r)
			elseif (colors[r:lower()]) then
				return colors[r:lower()]
			else
				return Color(255, 255, 255)
			end
		else
			return oldColor(r, g, b, a)
		end
	end
end
return Def.ActorFrame{
	Def.Sprite{
		Texture=THEME:GetPathG("","SongFolder.png"),
		SetCommand=function(self,params)
			if params.Color then
				self:diffuse(params.Color)
			end
		end,
	},
	Def.BitmapText{
		Font="_sui generis",
		InitCommand=function (self)
			self:zoom(0.7):halign(0):xy(-130,-7):diffuse(Color.Yellow)
			:shadowlengthy(2):maxwidth(360)
		end,
		SetCommand=function(self,params)
			self:settext( params.Text )
		end,
	},
	Def.BitmapText{
		Font="_sui generis",
		Text="(10 songs)",
		InitCommand=function (self)
			self:zoom(0.5):halign(0):xy(-130,7):diffuse(Color.Yellow)
			:shadowlengthy(2)
		end,
		SetCommand=function(self,params)
			self:settext( ("(%d songs)"):format(#SONGMAN:GetSongsInGroup(params.Text)) )
		end,
	}
}

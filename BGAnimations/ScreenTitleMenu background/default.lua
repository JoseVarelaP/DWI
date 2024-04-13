return Def.ActorFrame {
	Def.Sprite{
		Texture="../logobg",
		InitCommand=function(self) self:Center() end
	},
	Def.BitmapText{
		Font="_sui generis",
		Text="v2.50.00",
		OnCommand=function(self)
			self:xy( SCREEN_RIGHT-4, 8 ):halign(1):zoom(0.575):shadowlength(2):sleep(5):diffusealpha(0)
		end
	},
	Def.BitmapText{
		Font="_sui generis",
		InitCommand=function (self)
			local fmt = THEME:GetString( "ScreenTitleMenu", "%d songs in %d groups, %d courses in %d groups" )
			local text = string.format( fmt, SONGMAN:GetNumSongs(), SONGMAN:GetNumSongGroups(), SONGMAN:GetNumCourses(), SONGMAN:GetNumCourseGroups() )

			if PREFSMAN:GetPreference("UseUnlockSystem") then
				text = text .. string.format(", %d unlocks", UNLOCKMAN:GetNumUnlocks() )
			end
			self:settext( text )
		end,
		OnCommand=function(self)
			self:xy( 4, 8 ):halign(0):zoom(0.575):shadowlength(2):sleep(5):diffusealpha(0)
		end
	},
	Def.BitmapText{
		Font="_sui generis",
		Text="Not for sale.  You must legally own the songs used.",
		OnCommand=function(self)
			self:xy( SCREEN_CENTER_X, SCREEN_BOTTOM-16 ):zoom(0.6):shadowlength(2):diffuse(color("#D7D920"))
		end
	}
}

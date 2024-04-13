return Def.ActorFrame {
	Def.Sprite{
		Texture="_tiledbg/bgtile",
		InitCommand=cmd(FullScreen;);
		OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / (self:GetWidth()*2);
			local h = DISPLAY:GetDisplayHeight() / (self:GetHeight()*2);
			self:customtexturerect(0,0,w,h);
			self:texcoordvelocity(0.5,0.5);
		end;
	},
	Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(color("0,0,0,0.8"))
		end
	},
	Def.BitmapText{
		Font="_sui generis",
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-128);
		OnCommand=function(self)
			self:settext("WARNING");
			self:diffuse(color("#DB4668"));
		end;
	},
	Def.BitmapText{
		Font="_sui generis",
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-55);
		OnCommand=function(self)
			self:settext("If you intend on playing songs from ANY of the original\nBEMANI games, you must legally own the games that the music\ncame from. Please help support BEMANI and buy the games\n and their soundtracks.");
			self:zoom(.56);
		end;
	},
	Def.BitmapText{
		Font="_sui generis",
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+61);
		OnCommand=function(self)
			self:settext("The author of this program expressly forbids the bundling of\nthis program with any copyrighted songs or step-files, or any\nmodification of the program files themselves.");
			self:zoom(.56);
		end;
	},
}
local t = Def.ActorFrame{}

t[#t+1] = Def.Sprite{
    Texture=THEME:GetPathB("ScreenGameplay overlay/_life","frame"),
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+25);
};

return t
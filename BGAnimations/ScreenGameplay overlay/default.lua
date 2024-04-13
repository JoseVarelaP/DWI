local iScorePos = SCREEN_BOTTOM-22;

local function GetScore(pn)
	return STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetScore()
end;

local t = Def.ActorFrame {
	LoadActor( "../norm_stage" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+40);
	};
	LoadActor( "_score frame" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-30;draworder,1);
	};
	LoadActor( "diff" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;draworder,1);
	};
	LoadFont("ScoreDisplayNormal Text")..{
		Text="0";
		InitCommand=cmd(x,SCREEN_LEFT+10;y,iScorePos;horizalign,left;draworder,1;diffuse,color("#3FBEEF"));
		ScoreChangedMessageCommand=function(self,params)
			self:settext( GetScore(PLAYER_1) )
		end;
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
	};

	LoadFont("ScoreDisplayNormal Text")..{
		Text="0";
		InitCommand=cmd(x,SCREEN_RIGHT-10;y,iScorePos;horizalign,right;draworder,1;diffuse,color("#F5D600"));
		ScoreChangedMessageCommand=function(self,params)
			self:settext( GetScore(PLAYER_2) )
		end;
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
	};
};

t[#t+1] = StandardDecorationFromFile("LifeFrame","LifeFrame")..{
	InitCommand=cmd(draworder,1);
};

t[#t+1] = LoadActor("../_stars/openL")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+50;linear,.934;addx,-(SCREEN_WIDTH+215);draworder,30);
};
t[#t+1] = LoadActor("../_stars/openR")..{
	InitCommand=cmd(x,(SCREEN_LEFT-SCREEN_WIDTH/2)-50;linear,.934;addx,SCREEN_WIDTH+216;draworder,30);
};

return t;
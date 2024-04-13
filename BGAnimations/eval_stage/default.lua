local t = LoadActor("stage") .. {
	BeginCommand=function(self) self:playcommand("Update") end,
	CurrentSongChangedMessageCommand=function(self) self:playcommand("Update") end,
	UpdateCommand=function(self)
		self:playcommand("Set", {
			StageToShow = GAMESTATE:GetCurrentStage();
			StageNumber = GAMESTATE:GetCurrentStageIndex();
		})
	end
}

return t
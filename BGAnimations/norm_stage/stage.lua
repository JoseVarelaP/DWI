local stages = Def.ActorFrame {}

local function StageNumberAdded(stageIndex)
	if stageIndex+1 == 1 or stageIndex+1 == 21 or stageIndex+1 == 31 then 
		return stageIndex+1 ..'st'
	elseif stageIndex+1 == 2 or stageIndex+1 == 22 or stageIndex+1 == 32 then 
		return stageIndex+1 ..'nd'
	elseif stageIndex+1 == 3 or stageIndex+1 == 23 or stageIndex+1 == 33 then 
		return stageIndex+1 ..'rd'
	elseif stageIndex+1 > 99 then
		return stageIndex+1
	end

	return stageIndex+1 ..'th'
end

for _, s in ipairs(Stage) do
	if not GAMESTATE:IsEventMode() and PREFSMAN:GetPreference("SongsPerPlay") == GAMESTATE:GetCurrentStageIndex()+1 then
		stages[#stages+1] = Def.Sprite{
			Texture="_stage Stage_final",
			SetCommand=function(self)
				self:visible( GAMESTATE:GetCurrentStage() == "Stage_Final" );
			end;
		}
	elseif (s == 'Stage_Extra1' or s == 'Stage_Extra2' or s == 'Stage_Nonstop' or s == 'Stage_Oni' or s == 'Stage_Endless' or s == 'Stage_Demo') then
		stages[#stages+1] = Def.Sprite{
			Texture="_stage " .. s,
			SetCommand=function(self, params)
				self:visible( params.StageToShow == s );
			end;
		}
	else
		stages[#stages+1] = LoadFont("_stagetext") .. {
			InitCommand=function(self) self:shadowlength(0) end,
			SetCommand=function(self, params)
				self:visible( params.StageToShow == s );
				if params.StageNumber then
					self:settext( StageNumberAdded(params.StageNumber) )
				end
			end;
		}
	end
end

return stages;

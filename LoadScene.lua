
     timer:setPercentage(10) --起始位置（值）
     timer:addTo(self)
     
     local progress = cc.ProgressTo:create(2,100)

 end

function LoadScene:onEnter()

	-- body
end

function LoadScene:onExit()
	-- body
end

return LoadScene 

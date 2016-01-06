

local LoadScene = class("LoadScene", function ( )
	return display.newScene("LoadScene")
end)

function LoadScene:ctor()
	self:UIinit()
end

function LoadScene:UIinit(  )
	--背景
	local bg = display.newSprite("bg1.png")
	local scaleX = display.width/bg:getContentSize().width
	local scaleY = display.height/bg:getContentSize().height
	bg:setScaleX(scaleX)
	bg:setScaleY(scaleY)
	bg:setPosition(display.cx, display.cy)
	self:addChild(bg)

	--进度条
     --条框
         local loadbg = cc.ui.UIImage.new("loadbg1.png") 
          loadbg:setPosition(cc.p(display.cx,display.cy-100))
          loadbg:setAnchorPoint(0.5,0.5)
          loadbg:addTo(self)

     --条
	local timer = cc.ProgressTimer:create(cc.Sprite:create("loading1.png"))
     timer:setPosition(display.cx,display.cy-100)
     timer:setBarChangeRate(cc.p(1,0)) --从左往右(控制方向的)
     timer:setType(display.PROGRESS_TIMER_BAR)
     timer:setMidpoint(cc.p(0,0.5))--基准点（起始位置）
     timer:setPercentage(10) --起始位置（值）
     timer:addTo(self)
     
     local progress = cc.ProgressTo:create(2,100)
     local call = cc.CallFunc:create(function ( )

          local scene = StartScene.new()
          local turn = cc.TransitionPageTurn:create(1, scene, false)
          cc.Director:getInstance():replaceScene(turn)
     end)
     local seq = cc.Sequence:create(progress,call)
     timer:runAction(seq)

     --loading标签
     local lab = cc.ui.UILabel.new ({text = "loading...", size = 40, color = cc.c3b(0, 0, 200)})
	lab:setPosition(display.cx, display.cy)
	lab:setAnchorPoint(0.5,0.5)
	lab:addTo(self)

	  --题目标签
     local lab = cc.ui.UILabel.new ({text = "~ 蜗 蜗 回 家 记 ~", size = 60, color = cc.c3b(66, 111, 20)})
	lab:setPosition(display.cx, display.top-150)
	lab:setAnchorPoint(0.5,0.5)
	lab:addTo(self)

 end

function LoadScene:onEnter()

	-- body
end

function LoadScene:onExit()
	-- body
end

return LoadScene 
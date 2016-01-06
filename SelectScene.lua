local SelectScene = class("SelectScene", function ( ) return display.newScene("SelectScene") end)

function SelectScene:ctor()

	self:init()
	-- body
end
 
 function SelectScene:init()
    --keyPad
	self:setKeypadEnabled(true)
	self:addNodeEventListener(cc.KEYPAD_EVENT , function(event)
		if event.key == "back" then
			cc.Director:getInstance():replaceScene(StartScene.new())
		elseif event.key == "menu" then
			audio.pauseMusic("backmusic.mp3")
			SetLayer.isPlayMusic = false
		end
	end)
	
	--背景
	local bg = display.newSprite("bg1.png")
	bg:setPosition(cc.p(display.cx, display.cy))
	local scaleX = display.width/bg:getContentSize().width
	local scaleY = display.height/bg:getContentSize().height
	bg:setScaleX(scaleX)
	bg:setScaleY(scaleY)
	bg:setPosition(cc.p(display.cx, display.cy))
	self:addChild(bg)

	--返回按钮
	local backbtn = cc.ui.UIPushButton.new({normal = "backarrow.png"}, {scale9 = true})
	backbtn:onButtonClicked(function(event)

		 local tran =cc.TransitionSlideInL:create(2,StartScene.new())
		display.replaceScene(tran)  --:replaceScene(StartScene.new())
	end)
	backbtn:setPosition(cc.p(50, display.top-50))
	self:addChild(backbtn,1)
   
    local anode=display.newNode()
    anode:addTo(self)
    --选择场景
    
    local item1=cc.ui.UIPushButton.new({normal="scene11.png",pressed="scene11.png"},{scale9=true})
                     :onButtonClicked(function (event)
                         print("ToSceneSelect11")
		                 ModifyData.setSceneNumber(1)
		                 local selectChapter = SelectChapterScene.new()
		                 display.replaceScene(selectChapter)
                     end)
                     :pos(-250,0)
                     :addTo(anode)

    local item2=cc.ui.UIPushButton.new({normal="scene22.png",pressed="scene22.png"},{scale9=true})
                     :onButtonClicked(function (event)
                         print("ToSceneSelect22")
		                 ModifyData.setSceneNumber(2)
		                   local selectChapter = SelectChapterScene.new()
		                 display.replaceScene(selectChapter)
                      

                     end)
                     :pos(0,0)
                     :addTo(anode)

    local item3=cc.ui.UIPushButton.new({normal="scene33.png",pressed="scene33.png"},{scale9=true})
                     :onButtonClicked(function (event)
                         print("ToSceneSelect33")
		                 ModifyData.setSceneNumber(3)
		                   local selectChapter = SelectChapterScene.new()
		                 display.replaceScene(selectChapter)
                     end)

                     :pos(250,0)
                     :addTo(anode)

	local to1 = cc.JumpTo:create(5, cc.p(display.cx, display.cy-20), 50, 3)
	anode:pos(display.cx, display.cy)
	anode:runAction(to1)




 end

function SelectScene:onEnter()

	-- body
end
function SelectScene:onExit()
end

return SelectScene

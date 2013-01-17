--****************************************************
--******************��Ϸ�����棨��ʱ��****************

local MainGameScence={}
--local sCon=require()
local winFrame=require("view.base.winFrame")
function MainGameScence.new()
	--����ͼƬ������************************
	display.addSpriteFramesWithFile(s_mainGameScenceIconData,s_mainGameScenceIcon)
	 -- ������������
    local scene = display.newScene("MainGameScence")
	
    -- uilayout ��һ����������������Ļ���ġ����еĽ���Ԫ�ض���ӵ� uilayout ��
    local uilayout = display.newLayer()
		
    -- display.cx, display.cy ����Ļ���ĵ�����
    uilayout:setPosition(display.cx, display.cy)
    scene:addChild(uilayout)
    -- ��ӱ���ͼ
    local bg = display.newSprite(s_mainGameScenceBg)
	uilayout:addChild(bg)
    --
	MainGameScence.movelayer=MainGameScence.movebelLayer()
	display.align(MainGameScence.movelayer, display.BOTTOM_RIGHT, 0, -display.cy)
	uilayout:addChild(MainGameScence.movelayer)
	--
	MainGameScence.btn=lhelper.newMenuItemImage({
	image="actioninfoframe.png",
	imageSelected="actioninfoframeChoose.png",
	x=-display.cx+120,
	y=display.cy-50,
	})
	menu = ui.newMenu({MainGameScence.btn})
	uilayout:addChild(menu)
	--**********************
	
	-------------------------------------------------
	local function btnListener(sender, action)
		if nil ~= sender then
			print("sender is not nil!")
		end
		if CCControlEventTouchDown == action then
			print("click action is CCControlEventTouchDown" .. action)
		elseif CCControlEventTouchDragInside == action then
			print("click action is CCControlEventTouchDragInside" .. action)
		elseif CCControlEventTouchDragOutside == action then
			print("click action is CCControlEventTouchDragOutside" .. action)
		elseif CCControlEventTouchDragEnter == action then
			print("click action is CCControlEventTouchDragEnter" .. action)
		elseif CCControlEventTouchDragExit == action then
			print("click action is CCControlEventTouchDragExit" .. action)
		elseif CCControlEventTouchUpInside == action then
			uilayout:addChild(winFrame.new("test",0,0,300,300))
		elseif CCControlEventTouchUpOutside == action then
			print("click action is CCControlEventTouchUpOutside" .. action)
		elseif CCControlEventTouchCancel == action then
			print("click action is CCControlEventTouchCancel" .. action)
		elseif CCControlEventValueChanged == action then
			print("click action is CCControlEventValueChanged" .. action)
		end
	end
	
	
	local rect = CCRect:new(0,0,0,0)
	local backgroundBtn = CCScale9Sprite:create("resource/tab_normal.png",rect)
	local backgroundHighlightedButton = CCScale9Sprite:create("resource/tab_active.png",rect)
	local tileBtn = CCLabelTTF:create("Button","Marker Felt", 30)
	local controlBtn = CCControlButton:create(tileBtn, backgroundBtn)
	controlBtn:registerLuaListener(btnListener);
	uilayout:addChild(controlBtn)	
	return scene
end
function MainGameScence.actorPeopleBtn()

end
--****************���ƶ���ui��
function MainGameScence.movebelLayer()
	local movlayer=display.newLayer()
	movlayer:setPosition(0, 0)
	MainGameScence.iconBagBtn=ui.newMenuItemImage({
		image="iconbag.png",
		imageSelected="iconbagchoose.png",
		})
	MainGameScence.iconSkillBtn=ui.newMenuItemImage({
		image="iconskill.png",
		imageSelected="iconskillchoose.png",
		})	
	MainGameScence.iconPractiseBtn=ui.newMenuItemImage({
		image="icontask.png",
		imageSelected="icontaskchoose.png",
		})	
	MainGameScence.iconTaskBtn=ui.newMenuItemImage({
		image="icondaily.png",
		imageSelected="icondailychoose.png",

		})
	MainGameScence.iconactivityBtn=ui.newMenuItemImage({
	image="iconactivity.png",
	imageSelected="iconactivitychoose.png",

	})
	local bottomMoveMenu=ui.newMenu({MainGameScence.iconBagBtn,MainGameScence.iconSkillBtn,MainGameScence.iconPractiseBtn,MainGameScence.iconTaskBtn,MainGameScence.iconactivityBtn})
	bottomMoveMenu:alignItemsHorizontally()
	movlayer:addChild(bottomMoveMenu)
	return movlayer
end
return MainGameScence
require "lib.GTSCRIPTS.GTA.list"
imhb = "您已经是皇榜成员\n以下特权已激活:\n战局横幅提示(其他GTVIP用户)\n免疫GTVIP用户脚本攻击\nVIP特有脚本名称显示\n可被选中为随机幸运人\n立即加入皇榜群聊(637302053)"
hbinfo = "加入皇榜可享受以下特权:\n战局横幅提示(其他GTVIP用户)\n免疫其他GTVIP用户的脚本攻击\n立刻加入VIP群聊\n抢先在VIP群聊体验新版本\n若您是卡网经销商,可免费加入GTVIP认证经销商列表\n加入群聊(716431566),联系群主加入皇榜"
admindev = "您是高级管理或者开发者的其中一员"
function checkme()
    local vipme = " GTLua Royal VIP"
    local standard = "   Version: 9.20"
    local name = WIRI_SOCIALCLUB.SC_ACCOUNT_INFO_GET_NICKNAME()
    
    if name == "RhymeBear" then
        return "Strawberry Sister"
    elseif name == "RcktaR" then
        return "    qianzongGol"
    elseif name == "shenshen1314" then
        return "  Cute ShenShen"
    elseif name == "zqxhnb" then
        return "  Huntsman VIP"
    elseif name == "Cheng1073" then 
        return "   Stupid Cheng"
    elseif name == "rudan891018" then 
        return "   rudan 891018"
    elseif name == "An_owQ" then
        return"   An_owQ Baby"
    elseif name == "Shimumu999" then
        return "Karry Handsome"
    elseif name == "KIHPUNG" then
        return " WuHuQiFei VIP"
    elseif name == "GTlxiao" then
        return "  Hu Handsome"
    elseif name == "Nimalegebi-00" then
        return "    OLDDOG VIP"
    elseif name == "tNaovo" then 
        return "Esclusive tNaovo"
    elseif name == "SmallGodGirlo3o" then
        return "SmallGodGirlo3o"
    elseif name == "Twelve___12" then 
        return " Twelve 12 Baby"
    elseif name == "Brook-Hill" then 
        return "Strawberry Sister"
    else
        for _, id in ipairs(spid) do
            if name == id.playerid then
                return vipme
            end
        end
        return standard
    end
end
--定义是不是皇榜的玩家
local name = WIRI_SOCIALCLUB.SC_ACCOUNT_INFO_GET_NICKNAME()
isSpidPlayer = false

for _, id in ipairs(spid) do
    if name == id.playerid then
        isSpidPlayer = true  -- 如果找到了皇榜中的玩家，将标志设置为true
        break  -- 找到一个匹配就可以了，不需要继续搜索
    end
end

if isSpidPlayer then
    loading_frames = {}  -- 清空普通玩家显示的loading_frames内容
else --为普通玩家仍然显示普通内容
    loading_frames = {'', 'G', 'GR', 'GRA', 'GRAN', 'GRAND', 'GRANDT', 'GRANDTO', 'GRANDTOU', 'GRANDTOUR', 'GRANDTOURI', 'GRANDTOURIN', 'GRANDTOURING', 'GRANDTOURINGV', 'GRANDTOURINGVI', 'GRANDTOURINGVIP', 'GRANDTOURINGVIP', 'GRANDTOURING', 'GRAND', '', 'GRANDTOURINGVIP', '', 'GRANDTOURINGVIP', '', 'GRANDTOURINGVIP', '', 'GRANDTOURINGVIP', 'GRANDTOURINGVIP', 'GRANDTOURINGVIP', 'GRANDTOURINGVIP', 'GRANDTOURINGVIP','GRANDTOURINGVIP', 'GRANDTOURINGVIP',}
end

numRepeats = 15
checkmeInterval = 1
count = 0

checkmeResult = "" --空白闪烁
checkmeLength = 0 --闪烁间隙

for _, id in ipairs(spid) do
    if name == id.playerid then
        loading_frames = {}  -- 删除原有值
        checkmeResult = checkme()
        checkmeLength = string.len(checkmeResult)
        break  -- 搜索结束，可以正常显示
    end
end

displayedLength = 0 --每个字符显示的空格

-- 逐个显示字符
for _, id in ipairs(spid) do
    if name == id.playerid then
        for i = 1, numRepeats do
            if displayedLength < checkmeLength then
                displayedLength = displayedLength + 1
                table.insert(loading_frames, checkmeResult:sub(1, displayedLength))
            end
        end
    end 
end

displayedLength2 = 4
for _, id in ipairs(spid) do
    if name == id.playerid then
        local numRepeats = 5
        for i = 1, numRepeats do
            if displayedLength2 < checkmeLength then
                displayedLength2 = displayedLength2 - 5
                table.insert(loading_frames, checkmeResult:sub(1, displayedLength2))
            end
        end
    end 
end

blinkCount = 10  -- 假设闪烁10次

-- 在这两秒钟内闪烁已完成的字符内容
for _, id in ipairs(spid) do
    if name == id.playerid then
        for i = 1, blinkCount do
            if i % 2 == 0 then
                -- 偶数次闪烁，显示空字符
                table.insert(loading_frames, '')
            else
                -- 奇数次闪烁，显示已完成的字符内容
                table.insert(loading_frames, checkmeResult)
            end
        end
    end 
end
--在最后一秒停顿，以让玩家完整的看到内容
for _, id in ipairs(spid) do
    if name == id.playerid then
        for i = 1, 10 do
            table.insert(loading_frames, checkmeResult)
        end
    end
end
--
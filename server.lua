function log(script, logs)
	local dosya = nil
	if fileOpen ( "loglar/"..script..".txt" ) then
		dosya = fileOpen ( "loglar/"..script..".txt" )
		eofdosya = fileGetSize ( dosya )
		fileSetPos ( dosya, eofdosya )
	else
		dosya = fileCreate ( "loglar/"..script..".txt" )
	end
	if not dosya then 
		restartResource(getThisResource())
		return 
	end
	local time = getRealTime()
	local curTime = "[".. time.year+1900 .."-".. time.month+1 .."-"..time.monthday.." "..time.hour..":"..time.minute.."]"
	local str = curTime.." "..logs
	str = str .. "\r\n"
	eofdosya = fileWrite ( dosya, curTime.." "..logs .. "" .. "\n" )
	fileSetPos ( dosya, eofdosya )
	fileClose ( dosya )
end
addEvent("add:log", true)
addEventHandler("add:log", root, log)

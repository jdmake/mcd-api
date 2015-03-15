<!--#include file="./inc/MainClass.asp"-->
<%
	Dim json,rsObj,vname,m_id,m_type,m_name,m_state,m_pic,m_hit,m_actor,m_des,m_topic,m_color,m_addtime,m_publishyear,m_publisharea,m_commend,m_note,m_keyword ,m_digg,m_tread,m_playdata,m_downdata,m_enname,m_datetime,m_director,m_lang,m_score
	vname = CodeConvert(getForm("vname","get"))
	set rsObj = conn.db("select top 1 m_id,m_type,m_name,m_state,m_pic,m_hit,m_actor,m_des,m_topic,m_color,m_addtime,m_publishyear,m_publisharea,m_commend,m_note,m_keyword ,m_digg,m_tread,m_playdata,m_downdata,m_enname,m_datetime,m_director,m_lang,m_score from {pre}data where m_name='"&vname&"'","records1")
	if rsObj.recordcount=0 then
		echo("access denied")
		response.end
	end if
	
	m_id = rsObj("m_id")
	m_type = rsObj("m_type")
	m_name = rsObj("m_name")
	m_state = rsObj("m_state")
	m_pic = rsObj("m_pic")
	m_hit = rsObj("m_hit")
	m_actor = rsObj("m_actor")
	m_des = rsObj("m_des")
	m_topic = rsObj("m_topic")
	m_color = rsObj("m_color")
	m_addtime = rsObj("m_addtime")
	m_publishyear = rsObj("m_publishyear")
	m_publisharea = rsObj("m_publisharea")
	m_commend = rsObj("m_commend")
	m_note = rsObj("m_note")
	m_keyword = rsObj("m_keyword")
	m_digg = rsObj("m_digg")
	m_tread = rsObj("m_tread")
	m_playdata = rsObj("m_playdata")
	m_downdata = rsObj("m_downdata")
	m_enname = rsObj("m_enname")
	m_datetime = rsObj("m_datetime")
	m_director = rsObj("m_director")
	m_lang = rsObj("m_lang")
	m_score = rsObj("m_score")
	rsObj.close:set rsObj = nothing
   
	json = "{""m_id"":"""&m_id&""",""m_name"":"""&m_name&""",""m_pic"":"""&m_pic&""",""m_des"":"""&m_des&""",""m_playdata"":"""&m_playdata&"""}"    
	echo(json)

	
	Function CodeConvert(fileContent)
		dim stm
		set stm=Server.CreateObject("adodb.stream")
		stm.Type=2
		stm.Mode=3
		stm.Charset="GB2312"
		stm.Open
		stm.WriteText fileContent
		stm.Position=0
		stm.Charset="UTF-8"
		CodeConvert = stm.ReadText
		stm.Close
		set stm=nothing
	End Function
%>
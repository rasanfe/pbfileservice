forward
global type w_main from window
end type
type cbx_recursive from checkbox within w_main
end type
type cb_copydirectory from commandbutton within w_main
end type
type cb_destinationdir from commandbutton within w_main
end type
type cb_sourcedir from commandbutton within w_main
end type
type st_destinationdir from statictext within w_main
end type
type st_sourcedir from statictext within w_main
end type
type sle_destinationdir from singlelineedit within w_main
end type
type sle_sourcedir from singlelineedit within w_main
end type
type cb_changefileextensiontotmp from commandbutton within w_main
end type
type cb_endsindirectoryseparator from commandbutton within w_main
end type
type cb_getdirectoryname from commandbutton within w_main
end type
type cb_getfilename from commandbutton within w_main
end type
type cb_getextension from commandbutton within w_main
end type
type p_2 from picture within w_main
end type
type cb_file from commandbutton within w_main
end type
type st_file from statictext within w_main
end type
type sle_file from singlelineedit within w_main
end type
type st_info from statictext within w_main
end type
type sle_result from singlelineedit within w_main
end type
type st_result from statictext within w_main
end type
type st_myversion from statictext within w_main
end type
type st_platform from statictext within w_main
end type
type cb_getfilenamewithoutextension from commandbutton within w_main
end type
type r_2 from rectangle within w_main
end type
end forward

global type w_main from window
integer width = 2363
integer height = 1832
boolean titlebar = true
string title = "PbFileService"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
string icon = "AppIcon!"
boolean center = true
cbx_recursive cbx_recursive
cb_copydirectory cb_copydirectory
cb_destinationdir cb_destinationdir
cb_sourcedir cb_sourcedir
st_destinationdir st_destinationdir
st_sourcedir st_sourcedir
sle_destinationdir sle_destinationdir
sle_sourcedir sle_sourcedir
cb_changefileextensiontotmp cb_changefileextensiontotmp
cb_endsindirectoryseparator cb_endsindirectoryseparator
cb_getdirectoryname cb_getdirectoryname
cb_getfilename cb_getfilename
cb_getextension cb_getextension
p_2 p_2
cb_file cb_file
st_file st_file
sle_file sle_file
st_info st_info
sle_result sle_result
st_result st_result
st_myversion st_myversion
st_platform st_platform
cb_getfilenamewithoutextension cb_getfilenamewithoutextension
r_2 r_2
end type
global w_main w_main

type prototypes
Function long GetFolderDialog(long hwndOwner, string wsDlgTitle, string wsStartPath, ref string wsFolder) Library "getfolderdialog_x64.dll" alias for "GetFolderDialog"
end prototypes

type variables
nvo_fileservice in_file
end variables

forward prototypes
public subroutine wf_version (statictext ast_version, statictext ast_patform)
public function integer wf_getfolder (string as_dlgtitle, ref string as_folder)
end prototypes

public subroutine wf_version (statictext ast_version, statictext ast_patform);String ls_version, ls_platform
environment env
integer rtn

rtn = GetEnvironment(env)

IF rtn <> 1 THEN 
	ls_version = string(year(today()))
	ls_platform="32"
ELSE
	ls_version = "20"+ string(env.pbmajorrevision)+ "." + string(env.pbbuildnumber)
	ls_platform=string(env.ProcessBitness)
END IF

ls_platform += " Bits"

ast_version.text=ls_version
ast_patform.text=ls_platform

end subroutine

public function integer wf_getfolder (string as_dlgtitle, ref string as_folder);/*
Copyright 2020 Davros

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

Constant long MAX_PATH = 260
Constant long GFD_OK = 0
Constant long GFD_ERROR = -1
long ll_hwndOwner, ll_ret
string ls_startPath

ll_hwndOwner = Handle(This)

If as_folder = "" Then
	ls_startPath =gs_dir
Else
	ls_startPath =as_folder
End IF	

If Not DirectoryExists(ls_startPath) Then
	ls_startPath = Space(MAX_PATH)
End If

as_folder = Space(MAX_PATH)

ll_ret = GetFolderDialog(ll_hwndOwner, as_dlgTitle, ls_startPath, REF as_folder)

IF ll_ret=0 Then ll_ret = 1

Return ll_ret
end function

on w_main.create
this.cbx_recursive=create cbx_recursive
this.cb_copydirectory=create cb_copydirectory
this.cb_destinationdir=create cb_destinationdir
this.cb_sourcedir=create cb_sourcedir
this.st_destinationdir=create st_destinationdir
this.st_sourcedir=create st_sourcedir
this.sle_destinationdir=create sle_destinationdir
this.sle_sourcedir=create sle_sourcedir
this.cb_changefileextensiontotmp=create cb_changefileextensiontotmp
this.cb_endsindirectoryseparator=create cb_endsindirectoryseparator
this.cb_getdirectoryname=create cb_getdirectoryname
this.cb_getfilename=create cb_getfilename
this.cb_getextension=create cb_getextension
this.p_2=create p_2
this.cb_file=create cb_file
this.st_file=create st_file
this.sle_file=create sle_file
this.st_info=create st_info
this.sle_result=create sle_result
this.st_result=create st_result
this.st_myversion=create st_myversion
this.st_platform=create st_platform
this.cb_getfilenamewithoutextension=create cb_getfilenamewithoutextension
this.r_2=create r_2
this.Control[]={this.cbx_recursive,&
this.cb_copydirectory,&
this.cb_destinationdir,&
this.cb_sourcedir,&
this.st_destinationdir,&
this.st_sourcedir,&
this.sle_destinationdir,&
this.sle_sourcedir,&
this.cb_changefileextensiontotmp,&
this.cb_endsindirectoryseparator,&
this.cb_getdirectoryname,&
this.cb_getfilename,&
this.cb_getextension,&
this.p_2,&
this.cb_file,&
this.st_file,&
this.sle_file,&
this.st_info,&
this.sle_result,&
this.st_result,&
this.st_myversion,&
this.st_platform,&
this.cb_getfilenamewithoutextension,&
this.r_2}
end on

on w_main.destroy
destroy(this.cbx_recursive)
destroy(this.cb_copydirectory)
destroy(this.cb_destinationdir)
destroy(this.cb_sourcedir)
destroy(this.st_destinationdir)
destroy(this.st_sourcedir)
destroy(this.sle_destinationdir)
destroy(this.sle_sourcedir)
destroy(this.cb_changefileextensiontotmp)
destroy(this.cb_endsindirectoryseparator)
destroy(this.cb_getdirectoryname)
destroy(this.cb_getfilename)
destroy(this.cb_getextension)
destroy(this.p_2)
destroy(this.cb_file)
destroy(this.st_file)
destroy(this.sle_file)
destroy(this.st_info)
destroy(this.sle_result)
destroy(this.st_result)
destroy(this.st_myversion)
destroy(this.st_platform)
destroy(this.cb_getfilenamewithoutextension)
destroy(this.r_2)
end on

event open;wf_version(st_myversion, st_platform)


in_file =  CREATE  nvo_fileservice 
end event

event closequery;Destroy in_file
end event

type cbx_recursive from checkbox within w_main
integer x = 1175
integer y = 1380
integer width = 530
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Copy Subdirectories"
end type

type cb_copydirectory from commandbutton within w_main
integer x = 416
integer y = 1364
integer width = 745
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CopyDirectory"
end type

event clicked;String ls_SourceDir, ls_DestinationDir, ls_searchPattern 
Boolean lb_Recursive
String ls_array[]

ls_SourceDir = sle_SourceDir.Text

If pos(ls_SourceDir, "*")>0 Then
	ls_searchPattern = Mid(ls_SourceDir, LastPos(ls_SourceDir, "\") + 1, Len(ls_SourceDir))
	ls_SourceDir = Mid(ls_SourceDir, 1, LastPos(ls_SourceDir, "\"))
Else
	ls_searchPattern = ""
End if	

ls_DestinationDir = sle_DestinationDir.Text
lb_Recursive = cbx_Recursive.Checked

SetPointer(HourGlass!)
If ls_searchPattern <> "" Then
	in_file.of_copydirectory(ls_SourceDir, ls_DestinationDir, lb_Recursive, ls_searchPattern)
Else
	in_file.of_copydirectory(ls_SourceDir, ls_DestinationDir, lb_Recursive)
End If	
SetPointer(Arrow!)

//Checks the result
If in_file.il_ErrorType < 0 Then
  messagebox("Failed", in_file.is_ErrorText)
  Return
End If






end event

type cb_destinationdir from commandbutton within w_main
integer x = 1989
integer y = 1252
integer width = 174
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;integer li_rtn
string ls_path

ls_path= sle_destinationdir.text

li_rtn=wf_getfolder("Select Destination Directory", REF ls_path)
	
If li_rtn=1 Then
	sle_destinationdir.text=ls_path
End If



end event

type cb_sourcedir from commandbutton within w_main
integer x = 1989
integer y = 1120
integer width = 174
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;integer li_rtn
string ls_path

ls_path= sle_sourcedir.text

li_rtn=wf_getfolder("Select Source Directory", REF ls_path)
	
If li_rtn=1 Then
	sle_sourcedir.text=ls_path
End If


end event

type st_destinationdir from statictext within w_main
integer x = 73
integer y = 1268
integer width = 329
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Destination Dir"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_sourcedir from statictext within w_main
integer x = 110
integer y = 1132
integer width = 279
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Source Dir"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_destinationdir from singlelineedit within w_main
integer x = 416
integer y = 1248
integer width = 1563
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type sle_sourcedir from singlelineedit within w_main
integer x = 416
integer y = 1120
integer width = 1563
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type cb_changefileextensiontotmp from commandbutton within w_main
integer x = 1189
integer y = 928
integer width = 745
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Change File Extension to TMP"
end type

event clicked;String ls_fileName

ls_fileName =in_file.of_changeextension(sle_file.text, ".tmp")

//Checks the result
If in_file.il_ErrorType < 0 Then
  messagebox("Failed", in_file.is_ErrorText)
  Return
End If

If isnull(ls_fileName) Then ls_fileName=""

sle_result.text = ls_fileName


end event

type cb_endsindirectoryseparator from commandbutton within w_main
integer x = 1189
integer y = 820
integer width = 745
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ends in Directory Separator"
end type

event clicked;Boolean lb_result

lb_result =in_file.of_endsindirectoryseparator(sle_file.text)

//Checks the result
If in_file.il_ErrorType < 0 Then
 	messagebox("Failed", in_file.is_ErrorText)
Else
	messagebox("Result", string(lb_result ))
End If


end event

type cb_getdirectoryname from commandbutton within w_main
integer x = 1189
integer y = 708
integer width = 745
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get Directory Name"
end type

event clicked;String ls_DirectoryName

ls_DirectoryName =  in_file.of_getdirectoryname(sle_file.text)

//Checks the result
If in_file.il_ErrorType < 0 Then
  messagebox("Failed", in_file.is_ErrorText)
  Return
End If


If isnull(ls_DirectoryName) Then ls_DirectoryName=""

sle_result.text = ls_DirectoryName


end event

type cb_getfilename from commandbutton within w_main
integer x = 416
integer y = 708
integer width = 745
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get Filename"
end type

event clicked;String ls_fileName

ls_fileName = in_file.of_getfilename(sle_file.text)

//Checks the result
If in_file.il_ErrorType < 0 Then
  messagebox("Failed", in_file.is_ErrorText)
  Return
End If

If isnull(ls_fileName) Then ls_fileName=""

sle_result.text = ls_fileName




end event

type cb_getextension from commandbutton within w_main
integer x = 416
integer y = 920
integer width = 745
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get Extension"
end type

event clicked;String ls_FileExtension

ls_FileExtension = in_file.of_getextension(sle_file.text)

//Checks the result
If in_file.il_ErrorType < 0 Then
  messagebox("Failed", in_file.is_ErrorText)
  Return
End If

If isnull(ls_FileExtension) Then ls_FileExtension=""

sle_result.text = ls_FileExtension



end event

type p_2 from picture within w_main
integer x = 5
integer y = 4
integer width = 1253
integer height = 248
boolean originalsize = true
string picturename = "logo.jpg"
boolean focusrectangle = false
end type

type cb_file from commandbutton within w_main
integer x = 1934
integer y = 344
integer width = 174
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;integer li_rtn
string ls_path, ls_ruta
string  ls_current

ls_ruta=gs_dir
ls_current=GetCurrentDirectory ( )
li_rtn = GetFileOpenName("Archivo a cargar", sle_file.text, ls_path, "*.*", "All Files (*.*), *.*", ls_ruta)
ChangeDirectory ( ls_current )




end event

type st_file from statictext within w_main
integer x = 64
integer y = 364
integer width = 279
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "File"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_file from singlelineedit within w_main
integer x = 361
integer y = 344
integer width = 1563
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type st_info from statictext within w_main
integer x = 1051
integer y = 1672
integer width = 1289
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 553648127
string text = "Copyright © Ramón San Félix Ramón  rsrsystem.soft@gmail.com"
boolean focusrectangle = false
end type

type sle_result from singlelineedit within w_main
integer x = 361
integer y = 488
integer width = 1563
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_result from statictext within w_main
integer x = 64
integer y = 508
integer width = 279
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Result"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_myversion from statictext within w_main
integer x = 1810
integer y = 56
integer width = 489
integer height = 84
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 33521664
string text = "Versión"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_platform from statictext within w_main
integer x = 1810
integer y = 144
integer width = 489
integer height = 84
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 33521664
string text = "Bits"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_getfilenamewithoutextension from commandbutton within w_main
integer x = 416
integer y = 816
integer width = 745
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get Filename Without Extension"
end type

event clicked;String ls_fileName

ls_fileName =  in_file.of_getfilenamewithoutextension(sle_file.text)

//Checks the result
If in_file.il_ErrorType < 0 Then
  messagebox("Failed", in_file.is_ErrorText)
  Return
End If

If isnull(ls_fileName) Then ls_fileName=""

sle_result.text = ls_fileName



end event

type r_2 from rectangle within w_main
long linecolor = 33554432
linestyle linestyle = transparent!
integer linethickness = 4
long fillcolor = 33521664
integer width = 2331
integer height = 260
end type


Attribute VB_Name = "Module"
'------------------------------------------------------------------------------
' モジュール
'------------------------------------------------------------------------------
Option Private Module
Option Explicit

'---------------------------------------------------------------------------
' (概要)
'  １辺のモジュール数を返します。
'---------------------------------------------------------------------------
Public Function GetNumModulesPerSide(ByVal ver As Long) As Long

    GetNumModulesPerSide = 17 + ver * 4
    
End Function


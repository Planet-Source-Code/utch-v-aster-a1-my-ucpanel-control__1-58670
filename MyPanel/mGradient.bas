Attribute VB_Name = "mGradient"
'   02/01/2005  Carles P.V. / Light Templer

' ===  For best (compareable) results: Please compile to  ===
' ===  an .EXE with advanced optimizations switched on!    ===

Option Explicit



' *************************************
' *            CONSTANTS              *
' *************************************
Private Const API_DIB_RGB_COLORS As Long = 0



' *************************************
' *        TYPES                      *
' *************************************
Public Type tpAPI_RECT                  ' NEVER ever use 'Left' or 'Right' as names in a udt!
    lLeft       As Long                 ' You run into trouble with the VB build-in functions for
    lTop        As Long                 ' string/variant handling (Left() and Right(). And this
    lRight      As Long                 ' strange effects and error messages are really hard to debug ... ;(
    lBottom     As Long
End Type

Private Type tpBITMAPINFOHEADER
    biSize          As Long
    biWidth         As Long
    biHeight        As Long
    biPlanes        As Integer
    biBitCount      As Integer
    biCompression   As Long
    biSizeImage     As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed       As Long
    biClrImportant  As Long
End Type


' *************************************
' *        API DECLARES               *
' *************************************
Private Declare Function API_StretchDIBits Lib "gdi32" Alias "StretchDIBits" _
        (ByVal hdc As Long, _
         ByVal x As Long, _
         ByVal y As Long, _
         ByVal dx As Long, _
         ByVal dy As Long, _
         ByVal SrcX As Long, _
         ByVal SrcY As Long, _
         ByVal wSrcWidth As Long, _
         ByVal wSrcHeight As Long, _
         lpBits As Any, _
         lpBitsInfo As tpBITMAPINFOHEADER, _
         ByVal wUsage As Long, _
         ByVal dwRop As Long) As Long
'
'
'


Public Sub DrawTopDownGradient(hdc As Long, rc As tpAPI_RECT, ByVal lRGBColorFrom As Long, ByVal lRGBColorTo As Long)
    
    Dim uBIH            As tpBITMAPINFOHEADER
    Dim lBits()         As Long
    Dim lColor          As Long
    
    Dim x               As Long
    Dim y               As Long
    Dim xEnd            As Long
    Dim yEnd            As Long
    Dim ScanlineWidth   As Long
    Dim yOffset         As Long
    
    Dim R               As Long
    Dim G               As Long
    Dim B               As Long
    Dim end_R           As Long
    Dim end_G           As Long
    Dim end_B           As Long
    Dim dR              As Long
    Dim dG              As Long
    Dim dB              As Long
    
    
    ' Split a RGB long value into components - FROM gradient color
    lRGBColorFrom = lRGBColorFrom And &HFFFFFF                      ' "SplitRGB"  by www.Abstractvb.com
    R = lRGBColorFrom Mod &H100&                                    ' Should be the fastest way in pur VB
    lRGBColorFrom = lRGBColorFrom \ &H100&                          ' See test on VBSpeed (http://www.xbeat.net/vbspeed/)
    G = lRGBColorFrom Mod &H100&                                    ' Btw: API solution with RTLMoveMem is slower ... ;)
    lRGBColorFrom = lRGBColorFrom \ &H100&
    B = lRGBColorFrom Mod &H100&
    
    ' Split a RGB long value into components - TO gradient color
    lRGBColorTo = lRGBColorTo And &HFFFFFF
    end_R = lRGBColorTo Mod &H100&
    lRGBColorTo = lRGBColorTo \ &H100&
    end_G = lRGBColorTo Mod &H100&
    lRGBColorTo = lRGBColorTo \ &H100&
    end_B = lRGBColorTo Mod &H100&
    
    
    '-- Loops bounds
    xEnd = rc.lRight - rc.lLeft
    yEnd = rc.lBottom - rc.lTop
    
    ' Check:  Top lower than Bottom ?
    If yEnd < 1 Then
    
        Exit Sub
    End If
    
    '-- Scanline width
    ScanlineWidth = xEnd + 1
    yOffset = -ScanlineWidth
    
    '-- Initialize array size
    ReDim lBits((xEnd + 1) * (yEnd + 1) - 1) As Long
       
    '-- Get color distances
    dR = end_R - R
    dG = end_G - G
    dB = end_B - B
       
    '-- Gradient loop over rectangle
    For y = 0 To yEnd
        
        '-- Calculate color and *y* offset
        lColor = B + (dB * y) \ yEnd + 256 * (G + (dG * y) \ yEnd) + 65536 * (R + (dR * y) \ yEnd)
        
        yOffset = yOffset + ScanlineWidth
        
        '-- *Fill* line
        For x = yOffset To xEnd + yOffset
            lBits(x) = lColor
        Next x
        
    Next y
    
    '-- Prepare bitmap info structure
    With uBIH
        .biSize = Len(uBIH)
        .biBitCount = 32
        .biPlanes = 1
        .biWidth = xEnd + 1
        .biHeight = -yEnd + 1
    End With
    
    '-- Finaly, paint *bits* onto given DC
    API_StretchDIBits hdc, _
            rc.lLeft, rc.lTop, _
            xEnd, yEnd, _
            0, 0, _
            xEnd, yEnd, _
            lBits(0), _
            uBIH, _
            API_DIB_RGB_COLORS, _
            vbSrcCopy
            
End Sub


' #*#




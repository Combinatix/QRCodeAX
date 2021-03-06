# QRCodeAX
## Simple QR Code generator for MS Office (Access, Excel)
QRCodeAX is an ActiveX Object for generating QR Codes in Windows Enviroment.
It is based on yas78/QRCodeLibVBA.

## Installation:
Main file is **QRCodeAX.ocx**. Place it anywhere to your system drive and then run `regsvr32.exe QRCodeAX.ocx` from the command prompt as an administrator.
Based on your system, the file should normally live in `Windows\System32 directory`, (on 64bit system in `Windows\sysWOW64`), but it does not really matter.

That's it. Now the examples should work.

## Placing QRCodeAX into Excel or Access files
If you want to place the QRCode into your Excel sheet / app, click *Developer tab > Insert > More Controls*, then choose QRCodeAX from the list and the draw the object on the sheet. See the ExcelExample.xlsm

In MS Access, enter the Design view, on the Controls tab click *More > ActiveX Controls* and choose QRCodeAX from the list. You can bind the Control Source directly to the data field so you don't have to use VBA or Macros at all. Unfortunately, the continuous forms does not support this kind of ActiveX Control, which is really shame.


*A Google translated README.md from yas78/QRCodeLibVBA follows:*

## QRCodeLibVBA
QRCodeLibVBA is a QR code generation library written in Excel VBA.
Generate model 2 code symbols based on JIS X 0510.

### Feature
- It corresponds to numbers, alphanumeric characters, 8 bit bytes, and kanji mode
- Can create split QR code
- Can be saved to 1 bpp or 24 bpp BMP file (DIB)
- It can be obtained as 1 bpp or 24 bpp IPicture object
- Image coloring (foreground color / background color) can be specified
- Character code in 8 bit byte mode can be specified


### Quick start
Please refer to QRCodeLib.xlam in 32bit version Excel.


### How to use
#### Example 1. Indicates the minimum code of the QR code consisting of a single symbol (not a split QR code).

```vbnet
Public Sub Example()
    Dim sbls As Symbols
    Set sbls = CreateSymbols()
    sbls.AppendString "012345abcdefg"

    Dim pict As stdole.IPicture
    Set pict = sbls(0).Get24bppImage()
    
End Sub
```

#### Example 2. Specify the error correction level
Create a Symbols object by setting the value of the ErrorCorrectionLevel enumeration to the argument of the CreateSymbols function.

```vbnet
Dim sbls As Symbols
Set sbls = CreateSymbols(ErrorCorrectionLevel.H)
```

#### Example 3. Specify upper limit of model number
Create a Symbols object by setting arguments of the CreateSymbols function.
```vbnet
Dim sbls As Symbols
Set sbls = CreateSymbols(maxVer:=10)
```

#### Example 4. Specify the character code to use in 8-bit byte mode
Create a Symbols object by setting arguments of the CreateSymbols function.
```vbnet
Dim sbls As Symbols
Set sbls = CreateSymbols(byteModeCharsetName:="utf-8")
```

#### Example 5. Create divided QR code
Create a Symbols object by setting arguments of the CreateSymbols function. If you do not specify the upper limit of the model number, it will be split up to model number 40 as the upper limit.
```vbnet
Dim sbls As Symbols
Set sbls = CreateSymbols(allowStructuredAppend:=True)
```

An example of dividing when exceeding model number 1 and acquiring IP picture object of each QR code is shown below.

```vbnet
Dim sbls As Symbols
Set sbls = CreateSymbols(maxVer:=1, allowStructuredAppend:=True)
sbls.AppendString "abcdefghijklmnopqrstuvwxyz"

Dim pict As stdole.IPicture
Dim sbl As Symbol

For Each sbl In sbls
    Set pict = sbl.Get24bppImage()
Next
```

#### Example 6. Save to BMP file
Use the Save1bppDIB, or Save 24bppDIB method of the Symbol class.

```vbnet
Dim sbls As Symbols
Set sbls = CreateSymbols()
sbls.AppendString "012345abcdefg"

sbls(0).Save1bppDIB "D:\qrcode1bpp1.bmp"
sbls(0).Save1bppDIB "D:\qrcode1bpp2.bmp", 10 ' 10 pixels per module
sbls(0).Save24bppDIB "D:\qrcode24bpp1.bmp"
sbls(0).Save24bppDIB "D:\qrcode24bpp2.bmp", 10 ' 10 pixels per module
```

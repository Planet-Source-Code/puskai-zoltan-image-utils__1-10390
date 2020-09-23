VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6420
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12390
   LinkTopic       =   "Form1"
   ScaleHeight     =   6420
   ScaleWidth      =   12390
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command6 
      Caption         =   "Get Desktop"
      Height          =   495
      Left            =   3720
      TabIndex        =   6
      Top             =   5640
      Width           =   1575
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Convert jpg to bmp"
      Height          =   495
      Left            =   2040
      TabIndex        =   5
      Top             =   5640
      Width           =   1575
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Convert bmp to jpg"
      Height          =   495
      Left            =   360
      TabIndex        =   4
      Top             =   5640
      Width           =   1575
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Grayscale"
      Height          =   495
      Left            =   3720
      TabIndex        =   3
      Top             =   5040
      Width           =   1575
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Rotate right"
      Height          =   495
      Left            =   2040
      TabIndex        =   2
      Top             =   5040
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Rotate left"
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   5040
      Width           =   1575
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      Height          =   4815
      Left            =   6240
      ScaleHeight     =   4755
      ScaleWidth      =   5955
      TabIndex        =   0
      Top             =   120
      Width           =   6015
   End
   Begin VB.Image Image1 
      Height          =   4800
      Left            =   120
      Top             =   120
      Width           =   6000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GrayScale Lib "ImageUtils.dll" (ByVal strInputFile As String, ByVal strOutputFile As String, ByVal blnEnableOverWrite As Boolean) As Integer
Private Declare Function getDesktop Lib "ImageUtils.dll" (ByVal strFileName As String, ByVal blnEnableOverWrite As Boolean, ByVal nWidth As Integer, ByVal nHeight As Integer, ByVal blnJpeg As Boolean, ByVal JPGCompressQuality As Integer) As Integer
Private Declare Function ConvertBMPtoJPG Lib "ImageUtils.dll" (ByVal strInputFile As String, ByVal strOutputFile As String, ByVal blnEnableOverWrite As Boolean, ByVal JPGCompressQuality As Integer, ByVal blnKeepBMP As Boolean) As Integer
Private Declare Function ConvertJPGtoBMP Lib "ImageUtils.dll" (ByVal strInputFile As String, ByVal strOutputFile As String, ByVal blnEnableOverWrite As Boolean, ByVal blnKeepJPG As Boolean) As Integer
Private Declare Function RotateRight Lib "ImageUtils.dll" (ByVal strInputFile As String, ByVal strOutputFile As String, ByVal blnEnableOverWrite As Boolean) As Integer
Private Declare Function RotateLeft Lib "ImageUtils.dll" (ByVal strInputFile As String, ByVal strOutputFile As String, ByVal blnEnableOverWrite As Boolean) As Integer
'Returne values
Private Const OK = 0
Private Const InputFileMissing = -1
Private Const OutputFileAlreadyExists = -2


Dim strSource As String
Dim strSource2 As String
Dim strDestination As String

Private Sub Command1_Click()
Dim retval As Integer
    retval = RotateLeft(strSource, strDestination, True)
    Image1.Picture = LoadPicture(strSource)
    Picture1.Picture = LoadPicture(strDestination)
End Sub

Private Sub Command2_Click()
Dim retval As Integer
    retval = RotateRight(strSource, strDestination, True)
    Image1.Picture = LoadPicture(strSource)
    Picture1.Picture = LoadPicture(strDestination)
End Sub

Private Sub Command3_Click()
Dim retval As Integer
    retval = GrayScale(strSource, strDestination, True)
    Image1.Picture = LoadPicture(strSource)
    Picture1.Picture = LoadPicture(strDestination)
End Sub

Private Sub Command4_Click()
Dim retval As Integer
    retval = ConvertBMPtoJPG(strSource2, strDestination, True, 100, True)
    Image1.Picture = LoadPicture(strSource2)
    Picture1.Picture = LoadPicture(strDestination)
End Sub

Private Sub Command5_Click()
Dim retval As Integer
    retval = ConvertJPGtoBMP(strSource, strDestination, True, True)
    Image1.Picture = LoadPicture(strSource)
    Picture1.Picture = LoadPicture(strDestination)
End Sub

Private Sub Command6_Click()
Dim retval As Integer
    retval = getDesktop(strDestination, True, 400, 320, True, 100)
    Image1.Picture = LoadPicture(strSource)
    Picture1.Picture = LoadPicture(strDestination)
End Sub

Private Sub Form_Load()
    strSource = App.Path & "\BMW.jpg"
    strSource2 = App.Path & "\BMW2.bmp"
    strDestination = App.Path & "\Destination.jpg"
    Image1.Picture = LoadPicture(strSource)
End Sub

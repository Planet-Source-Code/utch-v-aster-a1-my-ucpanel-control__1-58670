VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H00E0E0E0&
   Caption         =   "ucPanel Example"
   ClientHeight    =   3555
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7290
   LinkTopic       =   "Form1"
   ScaleHeight     =   3555
   ScaleWidth      =   7290
   StartUpPosition =   3  'Windows Default
   Begin Project1.ucPanel ucPanel1 
      Height          =   1395
      Left            =   210
      TabIndex        =   0
      Top             =   180
      Width           =   2640
      _ExtentX        =   4657
      _ExtentY        =   2461
      ForeColor       =   8421504
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderColor     =   8421504
      Caption         =   "Warning!!"
      ColorBottom     =   14408667
      Picture         =   "frmMain.frx":0000
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Your computer is about to explode. Please step back and take cover."
         Height          =   705
         Left            =   330
         TabIndex        =   2
         Top             =   450
         Width           =   2025
      End
   End
   Begin Project1.ucPanel ucPanel2 
      Height          =   1755
      Left            =   3300
      TabIndex        =   1
      Top             =   180
      Width           =   3750
      _ExtentX        =   6615
      _ExtentY        =   3096
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderColor     =   8421504
      Caption         =   "Please Login"
      Picture         =   "frmMain.frx":059A
      Begin VB.CommandButton Command1 
         Caption         =   "Login"
         Height          =   375
         Left            =   2370
         TabIndex        =   7
         Top             =   1260
         Width           =   1035
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1290
         TabIndex        =   4
         Top             =   870
         Width           =   2115
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   1290
         TabIndex        =   3
         Top             =   510
         Width           =   2115
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Password:"
         Height          =   195
         Left            =   450
         TabIndex        =   6
         Top             =   900
         Width           =   735
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Username:"
         Height          =   195
         Left            =   420
         TabIndex        =   5
         Top             =   540
         Width           =   765
      End
   End
   Begin Project1.ucPanel ucPanel3 
      Height          =   1365
      Left            =   210
      TabIndex        =   8
      Top             =   1860
      Width           =   2640
      _ExtentX        =   4657
      _ExtentY        =   2408
      ForeColor       =   128
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderColor     =   128
      Caption         =   "User Search"
      ColorBottom     =   12648447
      Begin VB.CommandButton Command2 
         Caption         =   "Search"
         Height          =   375
         Left            =   1290
         TabIndex        =   10
         Top             =   810
         Width           =   1035
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   210
         TabIndex        =   9
         Top             =   420
         Width           =   2115
      End
   End
   Begin Project1.ucPanel ucPanel4 
      Height          =   1005
      Left            =   3300
      TabIndex        =   11
      Top             =   2220
      Width           =   3750
      _ExtentX        =   6615
      _ExtentY        =   1773
      ForeColor       =   16384
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderColor     =   32768
      Caption         =   "Battery Information"
      ColorBottom     =   12648384
      Begin VB.Image Image1 
         Height          =   630
         Left            =   300
         Picture         =   "frmMain.frx":0B34
         Top             =   330
         Width           =   3240
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

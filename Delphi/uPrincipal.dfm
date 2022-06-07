object Form24: TForm24
  Left = 0
  Top = 0
  Caption = 'Plana Sistemas | VaiComprando DEMO'
  ClientHeight = 435
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 275
    Top = 3
    Width = 45
    Height = 13
    Caption = 'Resquest'
  end
  object Label2: TLabel
    Left = 570
    Top = 3
    Width = 47
    Height = 13
    Caption = 'Response'
  end
  object Label3: TLabel
    Left = 8
    Top = 3
    Width = 29
    Height = 13
    Caption = 'Token'
  end
  object Label4: TLabel
    Left = 8
    Top = 43
    Width = 146
    Height = 13
    Caption = 'CNPJ: *OBS somente numeros'
  end
  object mmoResponse: TMemo
    Left = 570
    Top = 22
    Width = 273
    Height = 406
    TabOrder = 0
  end
  object mmoRequest: TMemo
    Left = 275
    Top = 21
    Width = 273
    Height = 406
    TabOrder = 1
  end
  object grpCategoria: TGroupBox
    Left = 8
    Top = 89
    Width = 241
    Height = 64
    Caption = ' Categorias '
    TabOrder = 2
    object btnGetCategorias: TButton
      Left = 123
      Top = 24
      Width = 99
      Height = 25
      Caption = 'GetCategorias'
      TabOrder = 0
      OnClick = btnGetCategoriasClick
    end
    object btnPostCategorias: TButton
      Left = 18
      Top = 24
      Width = 99
      Height = 25
      Caption = 'PostCategorias'
      TabOrder = 1
      OnClick = btnPostCategoriasClick
    end
  end
  object edtToken: TEdit
    Left = 8
    Top = 22
    Width = 241
    Height = 21
    TabOrder = 3
  end
  object edtCNPJ: TEdit
    Left = 8
    Top = 62
    Width = 241
    Height = 21
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 159
    Width = 241
    Height = 66
    Caption = 'Produtos'
    TabOrder = 5
    object btnGetProdutos: TButton
      Left = 123
      Top = 24
      Width = 99
      Height = 25
      Caption = 'GetProdutos'
      TabOrder = 0
      OnClick = btnGetProdutosClick
    end
    object btnPostProdutos: TButton
      Left = 18
      Top = 24
      Width = 99
      Height = 25
      Caption = 'PostProdutos'
      TabOrder = 1
      OnClick = btnPostProdutosClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 231
    Width = 241
    Height = 66
    Caption = 'Pedido'
    TabOrder = 6
    object btnGetPedidos: TButton
      Left = 18
      Top = 21
      Width = 99
      Height = 25
      Caption = 'GetPedidos'
      TabOrder = 0
      OnClick = btnGetPedidosClick
    end
    object btnPutPedido: TButton
      Left = 123
      Top = 21
      Width = 99
      Height = 25
      Caption = 'PutPedido'
      TabOrder = 1
      OnClick = btnPutPedidoClick
    end
  end
end

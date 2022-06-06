{
 Dependências
 https://github.com/viniciussanchez/RESTRequest4Delphi

}

unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, RESTRequest4D;

type
  TForm24 = class(TForm)
    btnGetCategorias: TButton;
    mmoResponse: TMemo;
    mmoRequest: TMemo;
    grpCategoria: TGroupBox;
    btnPostCategorias: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtToken: TEdit;
    Label3: TLabel;
    edtCNPJ: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    btnGetProdutos: TButton;
    btnPostProdutos: TButton;
    GroupBox2: TGroupBox;
    btnGetPedidos: TButton;
    btnPutPedido: TButton;
    procedure btnGetCategoriasClick(Sender: TObject);
    procedure btnPostCategoriasClick(Sender: TObject);
    procedure btnPostProdutosClick(Sender: TObject);
    procedure btnGetProdutosClick(Sender: TObject);
    procedure btnPutPedidoClick(Sender: TObject);
    procedure btnGetPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;

implementation

{$R *.dfm}


procedure TForm24.btnGetCategoriasClick(Sender: TObject);
var
  LResponse: IResponse;
begin
  try
    LResponse := TRequest.New.BaseURL('http://api.vaicomprando.com.br/categorias/' + edtCNPJ.Text)
    .AddHeader('X-Token', edtToken.Text)
      .Accept('application/json').Get;
    if LResponse.StatusCode = 200 then
      mmoResponse.Text := LResponse.Content;
  except
    on E: Exception do
    begin
      mmoResponse.Text := LResponse.Content;
    end;
  end;

end;

procedure TForm24.btnPostCategoriasClick(Sender: TObject);
var
  json : string;
  LResponse: IResponse;
begin
 json := '{'+
           '"id": null,'+
           '"nome": "Mercearia",'+
           '"visible": "1",'+
           '"status": "1"'+
          '}';

  mmoRequest.Text := json;
  try
     LResponse := TRequest.New.BaseURL('http://api.vaicomprando.com.br/produtos/' + edtCNPJ.Text)
      .AddHeader('X-Token', edtToken.Text)
        .Accept('application/json')
          .AddBody(json).Post;
    if LResponse.StatusCode = 200 then
      mmoResponse.Text := LResponse.Content;
  except
    on E: Exception do
    begin
      mmoResponse.Text := LResponse.Content;
    end;
  end;

end;



procedure TForm24.btnGetProdutosClick(Sender: TObject);
var
  LResponse: IResponse;
begin
  try
    LResponse := TRequest.New.BaseURL('http://api.vaicomprando.com.br/produtos/' + edtCNPJ.Text)
    .AddHeader('X-Token', edtToken.Text)
      .Accept('application/json').Get;
    if LResponse.StatusCode = 200 then
      mmoResponse.Text := LResponse.Content;
  except
    on E: Exception do
    begin
      mmoResponse.Text := LResponse.Content;
    end;
  end;

end;


procedure TForm24.btnPostProdutosClick(Sender: TObject);
var
  json : string;
  LResponse: IResponse;
begin
    json := '['+
             '{'+
               '"rel_categorias_id": "752",'+ //"rel_categorias_id": id da categoria  retornado no cadastro da categoria| Integer
               '"ref": "REF-139",'+ //Codigo do produto no sistema integrador | String
               '"nome": "AÇÚCAR CONFEITEIRO SNOW SUGAR 1KG",'+  //Nome do produto | String
               '"descricao": "",'+ //Descrição do produto | String
               '"valor": 120.00,'+ //Valor do produto | Float
               '"oferta": "1",'+   //Produto em oferta | Boolean 0 ou 1
               '"valor_promocional": 100.99,'+ // Valor Promocional do produto | Float
               '"variacao": "null",'+
               '"visible": "1",'+    //Produto visivel  | Boolean 0 ou 1
               '"status": "1"'+  //Status do produto | Boolean 0 ou 1
             '}'+
            ']';
  mmoRequest.Text := json;
  try
     LResponse := TRequest.New.BaseURL('http://api.vaicomprando.com.br/produtos/' + edtCNPJ.Text)
      .AddHeader('X-Token', edtToken.Text)
        .Accept('application/json')
          .AddBody(json).Post;
    if LResponse.StatusCode = 200 then
      mmoResponse.Text := LResponse.Content;
  except
    on E: Exception do
    begin
      mmoResponse.Text := LResponse.Content;
    end;
  end;
end;

procedure TForm24.btnGetPedidosClick(Sender: TObject);
var
  LResponse: IResponse;
begin
    {
      "status": Status do pedido | Integer
      1 : Pendente
    }
  try
     mmoRequest.Text := '{"status":"1"}';
     LResponse := TRequest.New.BaseURL('http://api.vaicomprando.com.br/pedidos/' + edtCNPJ.Text)
      .AddHeader('X-Token', edtToken.Text)
        .Accept('application/json')
          .AddParam('status','1').Get;
    if LResponse.StatusCode = 200 then
      mmoResponse.Text := LResponse.Content;
  except
    on E: Exception do
    begin
      mmoResponse.Text := LResponse.Content;
    end;
  end;
end;

procedure TForm24.btnPutPedidoClick(Sender: TObject);
var
  LResponse: IResponse;
  id_pedido : string;
begin
    {
      "status": Status do pedido | Integer
      1 : Pendente
      2 : Concluído
      3 : Cancelado
    }
  try
     id_pedido := '13013';
     mmoRequest.Text := '{"status":2}';

     LResponse := TRequest.New.BaseURL('https://api.vaicomprando.com.br/pedidos/'+edtCNPJ.Text+'/'+id_pedido)
      .AddHeader('X-Token', edtToken.Text)
        .ContentType('application/json')
          .AddBody('{"status":2}').Put;

    if LResponse.StatusCode = 200 then
      mmoResponse.Text := 'Sucesso';
  except
    on E: Exception do
    begin
      mmoResponse.Text := LResponse.Content;
    end;
  end;
end;

end.


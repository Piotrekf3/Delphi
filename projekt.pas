unit projekt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Mask;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Button1: TButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    var row: Integer;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  StringGrid1.Cells[1,row+1]:=MaskEdit1.Text;
  StringGrid1.Cells[2,row+1]:=MaskEdit2.Text;
  INC(row);
end;

procedure TForm1.Button2Click(Sender: TObject);  //obliczanie
{$N+,E-}
type vector  = array [0..20] of Extended;
     vector1 = array [1..18] of Extended;
     vector2 = array [2..19] of Extended;
var i, n, st : Integer;
    xx       : Extended;
    x, f     : vector;
{$I NSPLVAL.PAS}
begin
  n:=strtoint(Edit1.Text);
  xx:=strtofloat(edit3.Text);
  for i := 1 to n+1 do
  begin
      x[i-1]:=strtofloat(StringGrid1.Cells[1,i]);
      f[i-1]:=strtofloat(StringGrid1.Cells[2,i]);

  end;
  edit2.Text:=floattostr(naturalsplinevalue(n,x,f,xx,st));
end;

procedure TForm1.Edit1Change(Sender: TObject);
  var i:Integer;
begin
        try
        begin
          StringGrid1.RowCount:=strtoint(Edit1.Text)+2;
            for i := 0 to StringGrid1.RowCount+1 do
              StringGrid1.Cells[0,i+1]:=inttostr(i);
        end;
        except
          StringGrid1.RowCount:=2;
        end;
end;

procedure TForm1.FormCreate(Sender: TObject);
  var i:Integer;
begin
  row:=0;
  StringGrid1.Cells[1,0]:='x';
  StringGrid1.Cells[2,0]:='f';
  for i := 0 to 5 do
     StringGrid1.Cells[0,i+1]:=inttostr(i);
end;
end.

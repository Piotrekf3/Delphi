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
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  StringGrid1.Cells[1,row]:=MaskEdit1.Text;
  StringGrid1.Cells[2,row]:=MaskEdit2.Text;
  INC(row);
end;

procedure TForm1.Edit1Change(Sender: TObject);
  var i:Integer;
begin
        try
        begin
          StringGrid1.RowCount:=strtoint(Edit1.Text)+1;
            for i := 1 to StringGrid1.RowCount+1 do
              StringGrid1.Cells[0,i]:=inttostr(i);
        end;
        except
          StringGrid1.RowCount:=2;
        end;
        //inc(StringGrid1.RowCount);
end;

procedure TForm1.FormCreate(Sender: TObject);
  var i:Integer;
begin
  row:=1;
  StringGrid1.Cells[1,0]:='x';
  StringGrid1.Cells[2,0]:='f';
  for i := 1 to 6 do
     StringGrid1.Cells[0,i]:=inttostr(i);
end;

end.

unit projekt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Mask, IntervalArithmetic32and64,
  Vcl.ExtCtrls,NSPLVAL_INTERVAL;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    StringGrid2: TStringGrid;
    RadioGroup1: TRadioGroup;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);  //obliczanie
{$N+,E-}
type vector  = array [0..20] of Extended;
     vector1 = array [1..18] of Extended;
     vector2 = array [2..19] of Extended;
     matrix  = array [0..3, 0..19] of Extended;

var i, j, n, st : Integer;
    xx, temp : Extended;
    x, f     : vector;
    a        : matrix;

{$I NSPLVAL.PAS}
{$I NSPLCNS.PAS}
begin
  n:=strtoint(Edit1.Text);
  xx:=strtofloat(Edit3.Text);

  for i := 1 to n+1 do
  begin
      x[i-1]:=strtofloat(StringGrid1.Cells[1,i]);
      f[i-1]:=strtofloat(StringGrid1.Cells[2,i]);

  end;

  temp:=naturalsplinevalue(n,x,f,xx,st);
  if st=0 then
  Edit2.Text:=floattostr(temp)
  else
  Edit2.Text:='st='+inttostr(st);
  
  naturalsplinecoeffns(n,x,f,a,st);
  for i := 1 to n do
      for j := 1 to 4 do
      begin
          StringGrid2.Cells[j,i]:=floattostr(a[j-1,i-1]);
          //StringGrid2.Cells[j,i]:='0';
      end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
  var i:Integer;
begin
        try
        begin
          StringGrid1.RowCount:=strtoint(Edit1.Text)+2;
          StringGrid2.RowCount:=strtoint(Edit1.Text)+1;
            for i := 0 to StringGrid1.RowCount+1 do
            begin
              StringGrid1.Cells[0,i+1]:=inttostr(i);
              StringGrid2.Cells[0,i+1]:=inttostr(i);
            end;
        end;
        except
          StringGrid1.RowCount:=2;
          StringGrid2.RowCount:=2;
        end;
end;

procedure TForm1.FormCreate(Sender: TObject);
  var i:Integer;
begin
  row:=0;
  StringGrid1.Cells[1,0]:='x';
  StringGrid1.Cells[2,0]:='f';
  for i := 0 to 5 do
  begin
     StringGrid1.Cells[0,i+1]:=inttostr(i);
     StringGrid2.Cells[0,i+1]:=inttostr(i);
  end;

     StringGrid2.Cells[1,0]:='x0';
     StringGrid2.Cells[2,0]:='x1';
     StringGrid2.Cells[3,0]:='x2';
     StringGrid2.Cells[4,0]:='x3';
end;
end.

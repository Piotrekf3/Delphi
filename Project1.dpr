program Project1;

uses
  Vcl.Forms,
  projekt in 'projekt.pas' {Form1},
  NSPLVAL_INTERVAL in 'NSPLVAL_INTERVAL.pas',
  NSPLCNS_INTERVAL in 'NSPLCNS_INTERVAL.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
